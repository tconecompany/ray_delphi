{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TMenuXML                        }
{      ������������ ���� �� ������ ������������ XML     }
{                                                       }
{        ���� ���������: 02.08.2019 (Build 1.0.01)      }
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
    FFixMainMenuCount  : integer;                                               // ���������� �������/����������� ������� ����
    FFixImageListCount : integer;                                               // ���������� �������/����������� ������ ��� ����
    FTag               : integer;

    procedure InsertMenu(Index   : integer;                                     // ������� �������� ������ ����
                         ID      : integer;
                         Caption : string);

    procedure InsertSubMenu(Index,                                              // ������ �������
                            Level,                                              // ������� ����������
                            Count   : integer;                                  // ���������� ��� ���-������
                            ID      : integer;                                  // �� ������������ � Tag
                            Caption : string;                                   // ��������� �������
                            Ico     : string);                                  // ���� � ������. ����������� � ������ ������
  public

    constructor Create(AMainMenu   : TMainMenu;
                       AControlBar : TControlBar;
                       AImageList  : TImageList;
                       AAction     : TAction);

    procedure Build(AXMLConf: WideString);                                      // ��������� ���� �� xml-������������

    function FindImageIndexInMenu(ID: integer; Default: integer = -1): integer; // ������ ImageIndex � ����� ���� �� ��� ID
    function FindLaunchMenu(ID: integer): string;                               // ���� ������� ���� (��� ����������)

    property Caption: string read FCaption;                                     // ��������� �����
    property ToolBarLineColor: string read FToolBarLineColor;                   // ���� ����� ��� ������� ������������
    property FormPeriod: string read FFormPeriod;                               // ��������� ����� ��������� �������
    property AutoStartID: integer read FAutoStartID;                            // ���������� �����������
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

  // ������� ���������� ����
  while FMainMenu.Items.Count > FFixMainMenuCount do
    FMainMenu.Items[1].Destroy;

  // ������� ���������� ������ ������������ ToolBar �� ������� Tag > 0 (���������������� id)
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

  // ������� ���������� ������
  while FImageList.Count > FFixImageListCount do
    FImageList.Delete(FImageList.Count - 1);

  // ===========================================================================

  // ������ ������������ ����
  xXML := CreateXMLDoc;
  xXML.LoadFromXML(AXMLConf);

  xNode := xXML.DocumentElement;

  try FCaption          := xNode.SelectNode('form').GetAttribute('caption'); except FCaption := ''; end;
  try FToolBarLineColor := xNode.SelectNode('form').GetAttributeDef('toolbar_line_color', ''); except FToolBarLineColor := ''; end;
  try FFormPeriod       := xNode.SelectNode('form_period').GetAttributeDef('signature', ''); except FFormPeriod := ''; end;
  try FAutoStartID      := xNode.SelectNode('autostart').GetAttribute('id').ToInteger; except FAutoStartID := 0; end;

  // controlbar
  xNodeList := xXML.DocumentElement.SelectNodes('/root/controlbar/toolbar');

  // ������� �������� � ��������� ����� � ������ (������)
  i := xNodeList.Count - 1;

  while i >= 0 do
  begin
    xNode := xNodeList.Nodes[i].LastChild;
    // ������� ����� �������� � ��������
    if xNode <> nil then
    begin
      ToolBar := TToolBar.Create(FControlBar);
      FControlBar.InsertControl(ToolBar);
      ToolBar.Align  := alNone;
      ToolBar.Images := FImageList;
      ToolBar.Tag    := xNodeList.Nodes[i].GetAttributeDef('id', '1').ToInteger;
      ToolBar.Left   := 218;  { TODO : �������� ������� ������ ����. ������� }
      ToolBar.Width  := 0;
      // ������ toolbutton
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
        // ��������� ��������
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

  i := 1; // ��� ������� ����� ���� �������

  while (xNode <> nil) do
  begin
    // ������� ������ ����
    if     (xNode.NodeLevel - 2 = 1)
       and (xNode.NodeName <> '') // �������� xml ����������
    then
    begin
      InsertMenu(i,
                 StrToIntDef(xNode.GetAttribute('id'), -1), // -1 ��������� ���������� ����
                 xNode.GetAttribute('caption'));
      Inc(i);
    end;
    // ������� ������� �������� ������
    if     (xNode.NodeLevel - 2 > 1)
       and (xNode.NodeName <> '') // �������� xml ����������
    then
      InsertSubMenu(i - 1,
                    xNode.NodeLevel - 3,
                    xNode.ChildCount,
                    StrToIntDef(xNode.GetAttribute('id'), -1), // -1 ��������� ���������� �������
                    xNode.GetAttribute('caption'),
                    xNode.GetAttribute('ico'));
    //
    xNode := xNode.NextNodeInTree;
  end;

  // ��������� ������ � ������� ��������� ������ ������ ������������ � ����
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
    // ������� �����
    if TMenuItem(FMainMenu.Components[i]).Parent.Caption = '' then
    begin
      sParent  := TMenuItem(FMainMenu.Components[i]).Caption;
      sCurrent := '';
      Continue;
    end;
    // ��������� ��������� ����������� ��������
    if     (TMenuItem(FMainMenu.Components[i]).Count > 0)
       and (TMenuItem(FMainMenu.Components[i]).Parent.Caption = sParent)
    then
    begin
      sCurrent := TMenuItem(FMainMenu.Components[i]).Caption + '\';
      Continue;
    end;
    // ������ � ��������� �������
    if TMenuItem(FMainMenu.Components[i]).Count > 0 then
    begin
      sCurrent := sCurrent + TMenuItem(FMainMenu.Components[i]).Caption + '\';
      Continue;
    end;
    // �������� ������� ���� ������� � ������������. ��� ��� �������� ������ tag
    if     (TMenuItem(FMainMenu.Components[i]).Count = 0)
       and (TMenuItem(FMainMenu.Components[i]).Parent.Caption = sParent)
    then
      sCurrent := '';
    // ����������� ID � ������ �������. ������ ������ ���� ! ! !
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

  // ��������� � ������� �������
  if FileExists(Ico) then
  begin
    Icon := TIcon.Create;
    Icon.LoadFromFile(ExtractFilePath(ParamStr(0)) + Ico);
    FImageList.AddIcon(Icon);
    SubMenuItem.ImageIndex := FImageList.Count - 1;
    Icon.Free;
  end;

  // ��������� ��������
  if     (ID <> 0)
     and (Count = 0)
  then
    SubMenuItem.OnClick := FAction.OnExecute
  else if (ID = 0) then
    SubMenuItem.Enabled := False;

  MenuItem.Insert(MenuItem.Count, SubMenuItem);

end;

end.
