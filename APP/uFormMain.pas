{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TFormMain                       }
{                     ������� �����                     }
{                                                       }
{        ���� ���������: 13.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormMain;

interface

uses
  // sys
  System.SysUtils, System.Variants, Winapi.Windows, Winapi.Messages,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ToolWin, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Contnrs,
  Vcl.ActnMan, Vcl.StdCtrls, Vcl.AppEvnts, Vcl.Mask,
  // ehlib
  DBCtrlsEh,
  // tms
  AdvTabSet,
  AdvAlertWindow,
  // my
  uConst,
  uRegForms;

// TFormMain
type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    ActionList: TActionList;
    miMain: TMenuItem;
    miService: TMenuItem;
    miHelp: TMenuItem;
    miPeriod: TMenuItem;
    miCloseAll: TMenuItem;
    N7: TMenuItem;
    miSettings: TMenuItem;
    N9: TMenuItem;
    miClose: TMenuItem;
    miCalc: TMenuItem;
    miChangePass: TMenuItem;
    miWebStore: TMenuItem;
    N15: TMenuItem;
    miAbout: TMenuItem;
    miClosePage: TMenuItem;
    ImageList: TImageList;
    ActionExecRep: TAction;
    ActionPeriod: TAction;
    ActionCloseAll: TAction;
    ActionSetting: TAction;
    ActionExit: TAction;
    ActionCalc: TAction;
    ActionChangePass: TAction;
    ActionEShop: TAction;
    ActionAbout: TAction;
    ActionLock: TAction;
    miLock: TMenuItem;
    StatusBar: TStatusBar;
    pToolBarLineColor: TPanel;
    ActionMessage: TAction;
    miMessage: TMenuItem;
    ControlBar: TControlBar;
    tbMain: TToolBar;
    tbLock: TToolButton;
    tbRepPeriod: TToolButton;
    ApplicationEvents: TApplicationEvents;
    ActionChildsHorizontal: TAction;
    ActionChildsVertical: TAction;
    ActionChildsCascade: TAction;
    tbCloseWindow: TToolButton;
    ActionClose: TAction;
    MDITabSet: TAdvMDITabSet;
    miWindow: TMenuItem;
    miTileHorizontal: TMenuItem;
    miTileVertical: TMenuItem;
    miTileCascade: TMenuItem;
    ActionWindowMinimisize: TAction;
    miMinimisizeChilds: TMenuItem;
    N6: TMenuItem;
    miMaximisizeChilds: TMenuItem;
    ActionWindowMaximisize: TAction;
    ActionChildsArrangeAll: TAction;
    miArrangeAll: TMenuItem;
    TrayIcon: TTrayIcon;
    AlertWindow: TAdvAlertWindow;
    N1: TMenuItem;
    miPrint: TMenuItem;
    ActionPrint: TAction;
    ImageListTS: TImageList;
    PopupMenuTI: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    ActionFormShow: TAction;
    N4: TMenuItem;
    ToolButton2: TToolButton;
    miGo: TMenuItem;
    ActioniSwitchInterface: TAction;
    tbPrint: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    N5: TMenuItem;
    miUserManual: TMenuItem;
    ActionUserManual: TAction;
    N8: TMenuItem;
    miSaveLayout: TMenuItem;
    miLoadLayout: TMenuItem;
    ActionSaveLayout: TAction;
    ActionLoadLayout: TAction;
    tbMessage: TToolButton;
    tbCalc: TToolButton;
    ToolButton6: TToolButton;
    N10: TMenuItem;
    miOpenTheHouseFolder: TMenuItem;
    ActionOpenTheHouseFolder: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionExecRepExecute(Sender: TObject);
    procedure ActionCloseAllExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionCalcExecute(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure ActionChangePassExecute(Sender: TObject);
    procedure ActionPeriodExecute(Sender: TObject);
    procedure ActionLockExecute(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure StatusBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatusBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ActionSettingExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionChildsHorizontalExecute(Sender: TObject);
    procedure ActionChildsVerticalExecute(Sender: TObject);
    procedure ActionChildsCascadeExecute(Sender: TObject);
    procedure ActionWindowMinimisizeExecute(Sender: TObject);
    procedure ActionWindowMaximisizeExecute(Sender: TObject);
    procedure ActionChildsArrangeAllExecute(Sender: TObject);
    procedure miWindowClick(Sender: TObject);
    procedure ActionEShopExecute(Sender: TObject);
    procedure ActionMessageExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionFormShowExecute(Sender: TObject);
    procedure ActioniSwitchInterfaceExecute(Sender: TObject);
    procedure miGoClick(Sender: TObject);
    procedure ActionSaveLayoutExecute(Sender: TObject);
    procedure ActionLoadLayoutExecute(Sender: TObject);
    procedure ActionOpenTheHouseFolderExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    procedure WMAfterCreate(var Message: TMessage); message WM_AFTER_CREATE;    // ���������
    procedure WMMainMDIChild(var Message: TMessage); message WM_MAIN_MDI_CHILD; // ����������� ������� ��� ��������/�������� �������� �����

    procedure SwitchInterface(ModuleID: integer);                               // ����������� ���������������� ���������
    procedure LayoutOpen(Launches: TDynLaunches);                               // ��������� �����
    procedure MenuVisible(ID: integer; Logical: boolean);                       // ������ �������/��������� ����� ���� �� ���� c������ Tag
    procedure MenuEnabled(ID: integer; Logical: boolean);                       // ������ ��������/���������� ����� ���� �� ���� c������ Tag
    procedure MenuWindowSubMenuOnClick(Sender: TObject);                        // ���� �� ���� ���� ������� � MDITabSet
    procedure MenuWindowSubMenuEnabled(Logical: boolean);                       // ������������� ���������� ���� ������� ���� ����
    procedure ShowBalloonHint(Title: string; Hint: string; Second: integer);    // ���������� ��������� � ��������� ����

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  // my
  uParams,
  uInit,
  uUser,
  uMenuXML,
  uTypes,
  uStrUtilsExt,
  uRepository,
  uFormSplash,
  uFormChangePass,
  uFormUserSettings,
  uFormUnLock,
  uFormLayout;

{ TFormMain }

procedure TFormMain.WMAfterCreate(var Message: TMessage);
begin

  // ���������� ������ �������� ������
  ActionPeriod.Enabled := IfThen(MenuXML.FormPeriod <> '', 'True', 'False').ToBoolean;

  // �������� ������
  if not User.PeriodChecked then
    ActionPeriod.Execute;

  // ���������� � ���� �������� ������ ������������
  if MenuXML.AutoStartID > 0 then
    Repository.Exec(MenuXML.AutoStartID);

  // ���������������� ���������. ��������� ������
  if     (Length(User.Settings.Logical) > 0)
     and User.Settings.Logical[1]
  then
    LayoutOpen(LayoutByID); // ���������� ��������� ����� ������������

end;

procedure TFormMain.WMMainMDIChild(var Message: TMessage);
var
  i: integer;
begin

  // MDI ���� �� �������
  if MDIChildCount = 0 then Exit;

  // ������������ ��������� �� lParam
  case Message.lParam of

    // �������� ����� ���������. ������ �� ����� � MDITabSet
    0 :
      begin
        // ������ � xml-����
        i := MenuXML.FindImageIndexInMenu(Message.WParam);
        //
        if i > 0 then
          ImageList.GetIcon(i, FormMain.ActiveMDIChild.Icon)
        else if FormMain.ActiveMDIChild.Icon.Empty then
          ImageList.GetIcon(2, FormMain.ActiveMDIChild.Icon);

        // �������� ������ � ����������� ��������� (��� ��� �������� ����� ����������)
        ImageListTS.AddIcon(FormMain.ActiveMDIChild.Icon);

        // ������������� ������ � ����� �������
        MDITabSet.AddTab(FormMain.ActiveMDIChild);
        MDITabSet.AdvTab[MDITabSet.TabIndex].Caption    := StrToCutOff(FormMain.ActiveMDIChild.Caption, 30);
        MDITabSet.AdvTab[MDITabSet.TabIndex].ImageIndex := ImageListTS.Count - 1;

        // �������� ������ ��������
        MenuWindowSubMenuEnabled(True);
        //
        Exit;
      end;

    // �������� ����� ���������. ���������� ������ ��������
    1 : if MDIChildCount = 1 then
        begin
          MenuWindowSubMenuEnabled(False);
          ImageListTS.Clear; // ������ ������
        end
        else
        begin
          ImageListTS.Delete(MDITabSet.TabIndex);
          // �������� �������� ������ (��������� ������� ����������)
          for i := MDITabSet.TabIndex to MDITabSet.AdvTabCount - 2 do
            MDITabSet.AdvTab[i + 1].ImageIndex := i;
        end;

    // ��������� ��������� ��������� ��������� ���� (� �������)
    2 :
      begin
        MDITabSet.AdvTab[MDITabSet.TabIndex].Caption := StrToCutOff(FormMain.ActiveMDIChild.Caption, 30);
        ImageListTS.ReplaceIcon(MDITabSet.TabIndex, FormMain.ActiveMDIChild.Icon);
      end;

  end;

end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ���������������� ���������. ���������� ������
  {if     (Length(User.Settings.Logical) > 0)
    and User.Settings.Logical[0]   }
  //ActionSaveMaket.Execute;
  //Showmessage('777');
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  SubMenuItem : TMenuItem;
  Icon        : TIcon;
  i           : integer;
begin

  // ������ ������������ ���� "������� ���������"
  if Length(User.AvailableModule) > 1 then
  begin
    Icon := TIcon.Create;
    //
    for i := 0 to High(User.AvailableModule) do
    begin
      SubMenuItem         := TMenuItem.Create(miGo);
      SubMenuItem.Tag     := User.AvailableModule[i].ID;
      SubMenuItem.Caption := User.AvailableModule[i].Signature;
      SubMenuItem.OnClick := ActioniSwitchInterface.OnExecute;
      // ������
      if FileExists(User.AvailableModule[i].Ico) then
      begin
        Icon.LoadFromFile(User.AvailableModule[i].Ico);
        ImageList.AddIcon(Icon);
        SubMenuItem.ImageIndex := ImageList.Count - 1;
      end
      else
        SubMenuItem.ImageIndex := 0;
      // ������������ ���������
      miGo.Add(SubMenuItem);
    end;
    // ���������� ���� ������ ����������������� ����������
    miGo.Enabled := True;
    Icon.Free;
  end;

  // ������������ ���� ��� ������ � xml-������������
  MenuXML := TMenuXML.Create(MainMenu, ControlBar, ImageList, ActionExecRep);

  // ����������� ��������� ������������
  SwitchInterface(User.ModuleID);

  // ���������
  PostMessage(Handle, WM_AFTER_CREATE, 0, 0);

end;

procedure TFormMain.LayoutOpen(Launches: TDynLaunches);
var
  i: integer;
begin

  // ������������� ������������
  if     (FormMain.MDIChildCount > 0)
     and (MessageBox(Handle,
                     PChar('���������� ������� ����� �������. ����������?'),
                     PChar('��������������'),
                     MB_ICONQUESTION or MB_YESNO) = mrNo)
  then
    Exit;

  // ��������� ��� ������ �������� �������
  ActionCloseAll.Execute;

  for i := 0 to High(Launches) do
  begin
    if Launches[i].ID > 0 then
      Repository.Exec(Launches[i].ID, Launches[i].Param)
    else
      RegForms.ShowChild(Launches[i].Signature, Launches[i].ID, Launches[i].Param);
    //
    Application.ProcessMessages;
  end;

end;

procedure TFormMain.SwitchInterface(ModuleID: integer);
var
  iPosition: integer;
begin

  User.ModuleID := ModuleID;

  // ������ ���� �� ������������
  MenuXML.Build(User.ModuleXMLConf);

  // ��������� �������� ������ ���� �� �����
  ActionPeriod.Enabled := IfThen(MenuXML.FormPeriod <> '', 'True', 'False').ToBoolean;

  // �������� ������� ������� ��� �������� �������� (��������� ����)
  if FormMain.MDIChildCount = 0 then
    iPosition := MainMenu.Items.Count - 1
  else
    iPosition := MainMenu.Items.Count;

  //
  ModifyMenu(MainMenu.Handle,
             iPosition,
             mf_ByPosition or mf_Popup or mf_Help,
             miGo.Handle,
             PChar('�������'));

  // �������������� ������� ����
  DrawMenuBar(FormMain.Handle);

  // ������ ����������
  if FileExists(User.ActiveModule.Ico) then
    Application.Icon.LoadFromFile(User.ActiveModule.Ico);

  // ��������� ������� �����
  Caption := Format('%s - Ray "%s"', [MenuXML.Caption, Init.ParamByName('COMPANY')]);;

  // ���� ����� ��� ������� �����������
  pToolBarLineColor.Color := StrToColor(MenuXML.ToolBarLineColor, COLOR_TRADE);

  // ���������
  StatusBar.Repaint;

end;

procedure TFormMain.MenuVisible(ID: integer; Logical: boolean);
var
  i: integer;
begin

  // ����
  for i := 0 to MainMenu.ComponentCount - 1 do
    if TMenuItem(MainMenu.Components[i]).Tag = ID then
      TMenuItem(MainMenu.Components[i]).Visible := Logical;

  // ������ ������������
  for i := 0 to ControlBar.ComponentCount - 1 do
    if     (ControlBar.Components[i] is TToolButton)
       and (TToolButton(ControlBar.Components[i]).Tag = ID)
       and (TToolButton(ControlBar.Components[i]).Style <> tbsSeparator)
    then
      TToolButton(ControlBar.Components[i]).Enabled := Logical;

end;

procedure TFormMain.MenuEnabled(ID: integer; Logical: boolean);
var
  i: integer;
begin

  // ����
  for i := 0 to MainMenu.ComponentCount - 1 do
    if TMenuItem(MainMenu.Components[i]).Tag = ID then
      TMenuItem(MainMenu.Components[i]).Enabled := Logical;

  // ������ ������������
  for i := 0 to ControlBar.ComponentCount - 1 do
    if     (ControlBar.Components[i] is TToolButton)
       and (TToolButton(ControlBar.Components[i]).Tag = ID)
       and (TToolButton(ControlBar.Components[i]).Style <> tbsSeparator)
    then
      TToolButton(ControlBar.Components[i]).Enabled := Logical;

end;

procedure TFormMain.ActionExecRepExecute(Sender: TObject);
begin
  Repository.Exec(TMainMenu(Sender As TObject).Tag);
end;

procedure TFormMain.ActioniSwitchInterfaceExecute(Sender: TObject);
begin
  SwitchInterface(TMainMenu(Sender As TObject).Tag);
end;

procedure TFormMain.ActionFormShowExecute(Sender: TObject);
begin

  Application.Restore;

  SetForegroundWindow(FormMain.Handle);

end;

procedure TFormMain.ActionLockExecute(Sender: TObject);
begin
  ShowUnLock();
end;

procedure TFormMain.ActionPeriodExecute(Sender: TObject);
begin

  RegForms.ShowModal(MenuXML.FormPeriod);

  StatusBar.Repaint;

end;

procedure TFormMain.ActionCloseExecute(Sender: TObject);
begin
  FormMain.ActiveMDIChild.Close;
end;

procedure TFormMain.ActionPrintExecute(Sender: TObject);
begin
  FormMain.ActiveMDIChild.Perform(WM_FORM_PRINT, 0, 0);
end;

procedure TFormMain.ActionSettingExecute(Sender: TObject);
begin
  ShowUserSettings();
end;

procedure TFormMain.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.ActionMessageExecute(Sender: TObject);
begin

  ShowBalloonHint('��������� ���������',
                  '����� ���������',
                  10);

end;

procedure TFormMain.ActionOpenTheHouseFolderExecute(Sender: TObject);
begin
  RegForms.Execute(User.Settings.WorkFolder);
end;

procedure TFormMain.ActionCalcExecute(Sender: TObject); var i: integer;
begin
  RegForms.Execute('calc.exe');
end;

procedure TFormMain.ActionChangePassExecute(Sender: TObject);
begin
  ShowChangePass();
end;

procedure TFormMain.ActionChildsCascadeExecute(Sender: TObject);
begin
  FormMain.Cascade;
end;

procedure TFormMain.ActionChildsHorizontalExecute(Sender: TObject);
begin
  FormMain.TileMode := tbHorizontal;
  FormMain.Tile;
end;

procedure TFormMain.ActionChildsVerticalExecute(Sender: TObject);
begin
  FormMain.TileMode := tbVertical;
  FormMain.Tile;
end;

procedure TFormMain.ActionChildsArrangeAllExecute(Sender: TObject);
begin
  FormMain.ArrangeIcons;
end;

procedure TFormMain.ActionSaveLayoutExecute(Sender: TObject);
begin
  ShowLayoutSave();
end;

procedure TFormMain.ActionLoadLayoutExecute(Sender: TObject);
var
  ID: integer;
begin

  ShowLayoutLoad(ID);

  if ID > 0 then
    LayoutOpen(LayoutByID(ID));

end;

procedure TFormMain.ActionWindowMinimisizeExecute(Sender: TObject);
var
  i: integer;
begin
  // FormMain.Perform(WM_SYSCOMMAND, SC_MINIMIZE, 0);
  for i := 0 to FormMain.MDIChildCount - 1 do
    FormMain.MDIChildren[i].WindowState := wsMinimized;
end;

procedure TFormMain.ActionWindowMaximisizeExecute(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to FormMain.MDIChildCount - 1 do
    FormMain.MDIChildren[i].WindowState := wsMaximized;
end;

procedure TFormMain.ActionCloseAllExecute(Sender: TObject);
var
  i: integer;
begin

  for i := 0 to FormMain.MDIChildCount - 1 do
  begin
    FormMain.MDIChildren[i].Close;  // { TODO : ������ }
    Application.ProcessMessages;
  end;

  // ������ ����������� ��� ������� ���� ����
  MenuWindowSubMenuEnabled(False);

end;

procedure TFormMain.ActionEShopExecute(Sender: TObject);
begin
  RegForms.Execute(Init.ParamByName('URL_E_SHOP'));
end;

procedure TFormMain.ActionAboutExecute(Sender: TObject);
begin
  ShowSplash();
end;

procedure TFormMain.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  Bitmap : TBitmap;
  s1, s2 : string;
begin

  Bitmap := TBitmap.Create;
  Bitmap.Transparent := True;

  with StatusBar do
  begin

    Canvas.Font.Style := StatusBar.Font.Style;

    // ������������, ����
    if Panel = Panels[0] then
    begin
      s1 := Format('%s', [User.Login]);
      s2 := Format('%s', [User.Key.Signature]);
      // ������������
      Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'img\user.bmp');
      Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      Canvas.TextOut(Rect.Left + 21, Rect.Top, s1);
      // ����
      Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'img\key.bmp');
      Canvas.Draw(Rect.Left + 31 + Canvas.TextWidth(s1), Rect.Top, Bitmap);
      Canvas.TextOut(Rect.Left  + 52 + Canvas.TextWidth(s1), Rect.Top, s2);
    end;

    // �������� ������
    if     (Panel = Panels[1])
       and ActionPeriod.Enabled
    then
    begin
      Canvas.Font.Style:=[fsBold];
      Canvas.Font.Color := COLOR_RED;
      Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'img\overtime.bmp');
      Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      Canvas.TextOut(Rect.Left + 21,
                     Rect.Top,
                     Format('�������� ������ : %s - %s',
                            [DateToStr(User.Period.DateBeg),
                             DateToStr(User.Period.DateEnd)]));
    end;

    // ���������
    if     (Panel = Panels[2])
       and (User.StorageID > 0)
    then
    begin
      Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'img\sheets.bmp');
      Canvas.Draw(Rect.Left, Rect.Top, Bitmap);
      Canvas.TextOut(Rect.Left + 21, Rect.Top, Format('%s', ['����� ���������']));
    end;

    // ������
    if (Panel = Panels[3]) then
    begin
      s1 := Format('������ : %s', [Params.Version]);
      Canvas.TextOut(Width - Canvas.TextWidth(s1), Rect.Top, s1);
    end;

  end;

end;

procedure TFormMain.StatusBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  if not (Button = mbLeft) then Exit;

  with StatusBar do
  begin
    if      ActionPeriod.Enabled
       and (X > Panels[0].Width)
       and (X < Panels[0].Width + Panels[1].Width)
    then
      ActionPeriod.Execute
    else if     (X > Panels[0].Width + Panels[1].Width + Panels[2].Width)
            and (X < Panels[0].Width + Panels[1].Width + Panels[2].Width + Panels[3].Width)
    then
      ActionMessage.Execute;
  end;

end;

procedure TFormMain.StatusBarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

  with StatusBar do
  begin
    if     ActionPeriod.Enabled
       and (X > Panels[0].Width)
       and (X < Panels[0].Width + Panels[1].Width)
    then
      Cursor := crHandPoint
    else
      Cursor := crDefault;
  end;

end;

procedure TFormMain.MenuWindowSubMenuOnClick(Sender: TObject);
begin
  MDITabSet.TabIndex := TMenuItem(Sender).Tag;
end;

procedure TFormMain.MenuWindowSubMenuEnabled(Logical: boolean);
begin

  MDITabSet.Visible              := Logical;
  ActionPrint.Enabled            := Logical;
  ActionChildsCascade.Enabled    := Logical;
  ActionChildsHorizontal.Enabled := Logical;
  ActionChildsVertical.Enabled   := Logical;
  ActionChildsArrangeAll.Enabled := Logical;
  ActionSaveLayout.Enabled       := Logical;
  ActionCloseAll.Enabled         := Logical;
  ActionWindowMinimisize.Enabled := Logical;
  ActionWindowMaximisize.Enabled := Logical;
  ActionClose.Enabled            := Logical;
  ActionCloseAll.Enabled         := Logical;

end;

procedure TFormMain.ShowBalloonHint(Title, Hint: string; Second: integer);
begin

  { TODO : dev }
  TrayIcon.BalloonTitle   := Title;
  TrayIcon.BalloonHint    := Hint;
  TrayIcon.BalloonTimeout := Second * 1000;
  TrayIcon.ShowBalloonHint;

end;

procedure TFormMain.miGoClick(Sender: TObject);
var
  i: integer;
begin

  for i := 0 to miGo.Count - 1 do
    if miGo.Items[i].Tag = User.ActiveModule.ID then
      miGo.Items[i].Enabled := False
    else
      miGo.Items[i].Enabled := True;

end;

procedure TFormMain.miWindowClick(Sender: TObject);
var
  SubMenuItem : TMenuItem;
  i           : integer;
begin

  // ������� ������ ������
  while miWindow.Count > 11 do
    miWindow.Delete(11);

  if MDITabSet.AdvTabCount = 0 then Exit;

  // �����������
  SubMenuItem         := TMenuItem.Create(miWindow);
  SubMenuItem.Caption := '-';
  SubMenuItem.Tag     := 0;
  miWindow.Add(SubMenuItem);

  // ����� �������
  for i := 0 to MDITabSet.AdvTabCount - 1 do
  begin
    SubMenuItem         := TMenuItem.Create(miWindow);
    SubMenuItem.Caption := MDITabSet.AdvTab[i].Caption;
    SubMenuItem.Checked := IfThen(MDITabSet.TabIndex = i, 'True', 'False').ToBoolean;;
    SubMenuItem.Tag     := i;
    SubMenuItem.OnClick := MenuWindowSubMenuOnClick;
    miWindow.Add(SubMenuItem);
  end;

end;

end.
