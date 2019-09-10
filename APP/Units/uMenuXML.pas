{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TMenuXML                        }
{      Динамическое меню на основе конфигурации XML     }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uMenuXML;

interface

uses
  // sys
  Vcl.ExtCtrls,
  Vcl.Menus,
  ActnList,
  Controls;

{ TMenuXML }

type
  TMenuXML = class
  private

    FMainMenu          : TMainMenu;
    FControlBar        : TControlBar;
    FImageList         : TImageList;
    FAction            : TAction;
    FCaption           : string;
    FToolBarLineColor  : string;
    FFormPeriod        : string;
    FAutoStartID       : integer;
    FFixMainMenuCount  : integer;                                               // количество штатных/статических пунктов меню
    FFixImageListCount : integer;                                               // количество штатных/статических иконок для меню
    FTag               : integer;

    procedure InsertMenu(Index   : integer;                                     // вставка главного пункта меню
                         ID      : integer;
                         Caption : string);

    procedure InsertSubMenu(Index,                                              // индекс вставки
                            Level,                                              // уровень вложености
                            Count   : integer;                                  // количество для под-уровня
                            ID      : integer;                                  // ид записывается в Tag
                            Caption : string;                                   // заголовок подменю
                            Ico     : string);                                  // путь к иконке. добавляется в список иконок
  public

    constructor Create(AMainMenu   : TMainMenu;
                       AControlBar : TControlBar;
                       AImageList  : TImageList;
                       AAction     : TAction);

    procedure Build(AXMLConf: WideString);                                      // построить меню по xml-конфигурации

    function FindImageIndexInMenu(ID: integer; Default: integer = -1): integer; // узнает ImageIndex в пунка меню по его ID
    function FindLaunchMenu(ID: integer): string;                               // путь запуска меню (для информации)

    property Caption: string read FCaption;                                     // заголовок формы
    property ToolBarLineColor: string read FToolBarLineColor;                   // цвет линии над панелью инстрементов
    property FormPeriod: string read FFormPeriod;                               // сигнатура формы отчетного периода
    property AutoStartID: integer read FAutoStartID;                            // автозапуск репозитория
    property Tag: integer read FTag write FTag;                                 // Tag

  end;

var
  MenuXML: TMenuXML;

implementation

uses
  // sys
  System.SysUtils,
  Vcl.ComCtrls,
  Graphics,
  // oxml
  OXmlPDOM,
  // my
  uStrUtilsExt;

{ TMenuXML }

constructor TMenuXML.Create(AMainMenu   : TMainMenu;
                            AControlBar : TControlBar;
                            AImageList  : TImageList;
                            AAction     : TAction);
begin
  FMainMenu          := AMainMenu;
  FControlBar        := AControlBar;
  FImageList         := AImageList;
  FAction            := AAction;
  FFixMainMenuCount  := AMainMenu.Items.Count;
  FFixImageListCount := AImageList.Count;
end;

procedure TMenuXML.Build(AXMLConf: WideString);
var
  xXML       : IXMLDocument;
  xNode      : PXMLNode;
  xNodeList  : IXMLNodeList;
  ToolBar    : TToolBar;
  ToolButton : TToolButton;
  i          : integer;
begin

  // очищаем предыдущее меню
  while FMainMenu.Items.Count > FFixMainMenuCount do
    FMainMenu.Items[1].Destroy;

  // очищаем предыдущие панели инструментов ToolBar по свойтву Tag > 0 (пользовательские id)
  i := 0;

  while i < FControlBar.ComponentCount - 1 do
  begin
    if     (FControlBar.Components[i] is TToolBar)
       and (TToolBar(FControlBar.Components[i]).Tag > 0)
    then
    begin
      FControlBar.Components[i].Destroy;
      Continue;
    end;
    Inc(i);
  end;

  // очищаем предыдущие иконки
  while FImageList.Count > FFixImageListCount do
    FImageList.Delete(FImageList.Count - 1);

  // ===========================================================================

  // строим динамическое меню
  xXML := CreateXMLDoc;
  xXML.LoadFromXML(AXMLConf);

  xNode := xXML.DocumentElement;

  try FCaption          := xNode.SelectNode('form').GetAttribute('caption'); except FCaption := ''; end;
  try FToolBarLineColor := xNode.SelectNode('form').GetAttributeDef('toolbar_line_color', ''); except FToolBarLineColor := ''; end;
  try FFormPeriod       := xNode.SelectNode('form_period').GetAttributeDef('signature', ''); except FFormPeriod := ''; end;
  try FAutoStartID      := xNode.SelectNode('autostart').GetAttribute('id').ToInteger; except FAutoStartID := 0; end;

  // controlbar
  xNodeList := xXML.DocumentElement.SelectNodes('/root/controlbar/toolbar');

  // создаем панельки с последней ветки к первой (реверс)
  i := xNodeList.Count - 1;

  while i >= 0 do
  begin
    xNode := xNodeList.Nodes[i].LastChild;
    // создаем новую панельку с кнопками
    if xNode <> nil then
    begin
      ToolBar := TToolBar.Create(FControlBar);
      FControlBar.InsertControl(ToolBar);
      ToolBar.Align  := alNone;
      ToolBar.Images := FImageList;
      ToolBar.Tag    := xNodeList.Nodes[i].GetAttributeDef('id', '1').ToInteger;
      ToolBar.Left   := 218;  { TODO : написать просчет ширины стат. панелек }
      ToolBar.Width  := 0;
      // кнопки toolbutton
      while xNode <> nil do
      begin
        ToolButton := TToolButton.Create(FControlBar);
        if SameText(xNode.GetAttributeDef('style', 'button'), 'separator') then
        begin
          ToolButton.Style := tbsSeparator;
          ToolButton.Width := 8;
        end;
        ToolBar.Width := ToolBar.Width + ToolButton.Width;
        ToolBar.InsertControl(ToolButton);
        ToolButton.Tag := xNode.GetAttributeDef('id', '0').ToInteger;
        // назначаем действие
        if ToolButton.Tag <> 0 then
          ToolButton.OnClick := FAction.OnExecute
        else
          ToolButton.Enabled := False;
        //
        xNodeList.Nodes[i].GetPreviousChild(xNode);
      end;
    end;
    Dec(i);
  end;

  // menus
  xNode := xXML.DocumentElement.SelectNode('menus');

  i := 1; // шаг вставки после меню Главная

  while (xNode <> nil) do
  begin
    // вставка нового меню
    if     (xNode.NodeLevel - 2 = 1)
       and (xNode.NodeName <> '') // отсекаем xml коментарии
    then
    begin
      InsertMenu(i,
                 StrToIntDef(xNode.GetAttribute('id'), -1), // -1 разрешаем активность меню
                 xNode.GetAttribute('caption'));
      Inc(i);
    end;
    // вставка подменю согласно уровню
    if     (xNode.NodeLevel - 2 > 1)
       and (xNode.NodeName <> '') // отсекаем xml коментарии
    then
      InsertSubMenu(i - 1,
                    xNode.NodeLevel - 3,
                    xNode.ChildCount,
                    StrToIntDef(xNode.GetAttribute('id'), -1), // -1 разрешаем активность подменю
                    xNode.GetAttribute('caption'),
                    xNode.GetAttribute('ico'));
    //
    xNode := xNode.NextNodeInTree;
  end;

  // связываем иконку и скрытую подсказку кнопок панели инструментов с меню
  for i := 0 to FControlBar.ComponentCount - 1 do
    if      (FControlBar.Components[i] is TToolButton)
        and (TToolButton(FControlBar.Components[i]).Style <> tbsSeparator)
    then
    begin
      // ImageIndex
      TToolButton(FControlBar.Components[i]).ImageIndex :=
        FindImageIndexInMenu(TToolButton(FControlBar.Components[i]).Tag, 1);
      // Hint
      TToolButton(FControlBar.Components[i]).Hint :=
        FindLaunchMenu(TToolButton(FControlBar.Components[i]).Tag);
    end;

end;

function TMenuXML.FindImageIndexInMenu(ID: integer;
  Default: integer = -1): integer;
var
  i: integer;
begin

  Result := Default;

  if ID = 0 then Exit;

  for i := 0 to FMainMenu.ComponentCount - 1 do
    if     (TMenuItem(FMainMenu.Components[i]).Tag = ID)
       and (TMenuItem(FMainMenu.Components[i]).ImageIndex > 0)
    then
    begin
      Result := TMenuItem(FMainMenu.Components[i]).ImageIndex;
      Break;
    end;

end;

function TMenuXML.FindLaunchMenu(ID: integer): string;
var
  i        : integer;
  sParent,
  sCurrent : string;
begin

  for i := 1 to FMainMenu.ComponentCount - 1 do
  begin
    // главный пункт
    if TMenuItem(FMainMenu.Components[i]).Parent.Caption = '' then
    begin
      sParent  := TMenuItem(FMainMenu.Components[i]).Caption;
      sCurrent := '';
      Continue;
    end;
    // сохраняем навигацию последующих разделов
    if     (TMenuItem(FMainMenu.Components[i]).Count > 0)
       and (TMenuItem(FMainMenu.Components[i]).Parent.Caption = sParent)
    then
    begin
      sCurrent := TMenuItem(FMainMenu.Components[i]).Caption + '\';
      Continue;
    end;
    // входим в вложенное подменю
    if TMenuItem(FMainMenu.Components[i]).Count > 0 then
    begin
      sCurrent := sCurrent + TMenuItem(FMainMenu.Components[i]).Caption + '\';
      Continue;
    end;
    // затераем текущей путь подменю в развитлениях. нет там искомого номера tag
    if     (TMenuItem(FMainMenu.Components[i]).Count = 0)
       and (TMenuItem(FMainMenu.Components[i]).Parent.Caption = sParent)
    then
      sCurrent := '';
    // определился ID в пункте подменю. строим полный путь ! ! !
    if TMenuItem(FMainMenu.Components[i]).Tag = ID then
    begin
      Result := sParent + '\' + sCurrent + TMenuItem(FMainMenu.Components[i]).Caption;
      Break;
    end;
  end;

end;

procedure TMenuXML.InsertMenu(Index: integer; ID: integer; Caption: string);
var
  MenuItem: TMenuItem;
begin

  MenuItem := TMenuItem.Create(FMainMenu);
  MenuItem.Tag     := ID;
  MenuItem.Caption := Caption;

  FMainMenu.Items.Insert(Index, MenuItem);

end;

procedure TMenuXML.InsertSubMenu(Index,
                                 Level,
                                 Count   : integer;
                                 ID      : integer;
                                 Caption : string;
                                 Ico     : string);
var
  MenuItem    : TMenuItem;
  SubMenuItem : TMenuItem;
  Icon        : TIcon;
  i           : integer;
begin

  MenuItem := FMainMenu.Items[Index];

  if Level > 1 then
    for i := 2 to Level do
      MenuItem := MenuItem.Items[MenuItem.Count - 1];

  SubMenuItem            := TMenuItem.Create(FMainMenu);
  SubMenuItem.Tag        := ID;
  SubMenuItem.Caption    := Caption;
  SubMenuItem.ImageIndex := 0;

  // связываем с внешней иконкой
  if FileExists(Ico) then
  begin
    Icon := TIcon.Create;
    Icon.LoadFromFile(ExtractFilePath(ParamStr(0)) + Ico);
    FImageList.AddIcon(Icon);
    SubMenuItem.ImageIndex := FImageList.Count - 1;
    Icon.Free;
  end;

  // назначаем действие
  if     (ID <> 0)
     and (Count = 0)
  then
    SubMenuItem.OnClick := FAction.OnExecute
  else if (ID = 0) then
    SubMenuItem.Enabled := False;

  MenuItem.Insert(MenuItem.Count, SubMenuItem);

end;

end.
