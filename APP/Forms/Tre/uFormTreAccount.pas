{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormTreAccount                    }
{               Форма "Счет Казначейства"               }
{                                                       }
{        Дата изменения: 28.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTreAccount;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls,
  // odac
  Data.DB, DBAccess, Ora, MemDS, OraSmart, OraCall,
  // ehlib
  DBCtrlsEh, DBLookupEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, GridsEh, DBAxisGridsEh, EhLibVCL,
  // my
  uConst,
  uConductor,
  uConductorOverAll,
  uFrameTitle;

{ TFormTreAccount }

type
  TFormTreAccount = class(TForm)
    fAccount: TDBEditEh;
    fAccountTypeId: TDBLookupComboboxEh;
    fAccountSubtypeId: TDBLookupComboboxEh;
    fCurrencyId: TDBLookupComboboxEh;
    fName: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    GridL: TDBGridEh;
    GridR: TDBGridEh;
    tACCOUNTS: TOraTable;
    OraSession: TOraSession;
    dsACCOUNTS: TOraDataSource;
    atbGridL: TActionToolBar;
    atbGridR: TActionToolBar;
    ActionManager: TActionManager;
    ActionGridLAppend: TAction;
    ActionGridLDelete: TAction;
    ActionGridRAppend: TAction;
    ActionGridRDelete: TAction;
    tACCOUNTS_USERS: TOraTable;
    tACCOUNTS_COMM_OPER: TOraTable;
    dsACCOUNTS_COMM_OPER: TOraDataSource;
    dsACCOUNTS_USERS: TOraDataSource;
    flTopLevelAccount: TDBEditEh;
    pCheck: TPanel;
    fSignActivity: TDBCheckBoxEh;
    fSignExchangeDifference: TDBCheckBoxEh;
    fSignStatement: TDBCheckBoxEh;
    tACCOUNTSACCOUNT_ID: TFloatField;
    tACCOUNTSACCOUNT: TFloatField;
    tACCOUNTSNAME: TStringField;
    tACCOUNTSACCOUNT_TYPE_ID: TFloatField;
    tACCOUNTSACCOUNT_SUBTYPE_ID: TFloatField;
    tACCOUNTSCURRENCY_ID: TIntegerField;
    tACCOUNTSTOP_LEVEL_ACCOUNT: TFloatField;
    tACCOUNTSSIGN_ACTIVITY: TIntegerField;
    tACCOUNTSSIGN_EXCHANGE_DIFFERENCE: TIntegerField;
    tACCOUNTSSIGN_STATEMENT: TIntegerField;
    tACCOUNTS_USERSACCOUNT_ID: TFloatField;
    tACCOUNTS_USERSUSER_ID: TFloatField;
    tACCOUNTS_COMM_OPERACCOUNT_ID: TFloatField;
    tACCOUNTS_COMM_OPERCOR_ID: TFloatField;
    FrameTitle: TFrameTitle;
    tACCOUNTS_USERSSIGN_ACTIVITY: TIntegerField;
    tACCOUNTS_COMM_OPERSIGN_ACTIVITY: TIntegerField;
    fTopLevelAccount: TDBLookupComboboxEh;
    tACCOUNTSL_TOP_LEVEL_ACCOUNT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ActionGridLAppendExecute(Sender: TObject);
    procedure ActionGridLDeleteExecute(Sender: TObject);
    procedure ActionGridRAppendExecute(Sender: TObject);
    procedure ActionGridRDeleteExecute(Sender: TObject);
    procedure dsACCOUNTSStateChange(Sender: TObject);
    procedure dsACCOUNTS_USERSStateChange(Sender: TObject);
    procedure dsACCOUNTS_COMM_OPERStateChange(Sender: TObject);
    procedure FrameTitleActionRecPostExecute(Sender: TObject);
    procedure FrameTitleActionRecEditExecute(Sender: TObject);
    procedure FrameTitleActionRecCancelExecute(Sender: TObject);
  private
    { Private declarations }

    cMaster  : TConductorOverAll;                                               // ACCOUNTS
    cDetailL : TConductor;                                                      // ACCOUNTS_USERS
    cDetailR : TConductor;                                                      // ACCOUNTS_COMM_OPER

    procedure WMDBPost(var Message: TMessage); message WM_DB_POST;              // сохранение в БД

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  // my
  uDataModuleRay,
  uDataModuleRBI,
  uDataModuleTrade,
  uDataModuleTre,
  uDataModuleImages,
  uTypes,
  uUser,
  uRegForms,
  uFormQuickSearch;

{ TFormTreAccount }

procedure TFormTreAccount.WMDBPost(var Message: TMessage);
begin
  FrameTitle.ActionRecPost.Execute;
end;

procedure TFormTreAccount.FormCreate(Sender: TObject);
begin

  // подключаемся к схеме Tre
  DataModuleRay.SetSession(OraSession, 'tre', 'tre', User.ID);

  // master. контуктор ввода ACCOUNTS
  cMaster := TConductorOverAll.Create(Self,
                                      tACCOUNTS,
                                      dsACCOUNTS,
                                      RegForms.LastStart.Param,
                                      FrameTitle.lTitle);

  // detail. кто управляет дебетом счета ACCOUNTS_USERS
  cDetailL := TConductor.Create(tAccounts_users, dsACCOUNTS_USERS, 'mode=read');

  // detail. счет для тов. операций отдела ACCOUNTS_COMM_OPER
  cDetailR := TConductor.Create(tACCOUNTS_COMM_OPER,
                                dsACCOUNTS_COMM_OPER,
                                'mode=read');

  // задаем свойства для гл. таблицы-ввода
  cMaster.TitleField := 'account';

end;

procedure TFormTreAccount.FrameTitleActionRecPostExecute(Sender: TObject);
begin

  try
    cMaster.ApplyUpdates;
    cDetailL.ApplyUpdates;
    cDetailR.ApplyUpdates;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      FrameTitle.ActionRecEdit.Execute;
    end;
  end;

end;

procedure TFormTreAccount.FrameTitleActionRecEditExecute(Sender: TObject);
begin

  cMaster.Edit;

  if not tACCOUNTS_USERS.IsEmpty then
    cDetailL.Edit;

  if not tACCOUNTS_COMM_OPER.IsEmpty then
    cDetailR.Edit;

end;


procedure TFormTreAccount.FrameTitleActionRecCancelExecute(Sender: TObject);
begin

  cMaster.CancelUpdates;
  cDetailL.CancelUpdates;
  cDetailR.CancelUpdates;

  // актуальность кнопок удаления
  dsACCOUNTS_USERS.OnStateChange(Self);
  dsACCOUNTS_COMM_OPER.OnStateChange(Self);

end;

procedure TFormTreAccount.dsACCOUNTSStateChange(Sender: TObject);
begin

  case dsACCOUNTS.DataSet.State of

    dsBrowse :
      begin
        FrameTitle.ActionRecPost.Enabled   := False;
        FrameTitle.ActionRecEdit.Enabled   := True;
        FrameTitle.ActionRecCancel.Enabled := False;
        ActionGridLAppend.Enabled          := False;
        ActionGridRAppend.Enabled          := False;
      end;

    dsInsert, dsEdit :
      begin
        FrameTitle.ActionRecPost.Enabled   := True;
        FrameTitle.ActionRecEdit.Enabled   := False;
        FrameTitle.ActionRecCancel.Enabled := IfThen(dsACCOUNTS.DataSet.State = dsEdit, 'True', 'False').ToBoolean;
        ActionGridLAppend.Enabled          := True;
        ActionGridRAppend.Enabled          := True;
      end;

  end;

end;

procedure TFormTreAccount.dsACCOUNTS_USERSStateChange(Sender: TObject);
begin

  if     (dsACCOUNTS.State in [dsInsert, dsEdit])
     and not tACCOUNTS_USERS.IsEmpty
  then
    ActionGridLDelete.Enabled := True
  else
    ActionGridLDelete.Enabled := False;

end;

procedure TFormTreAccount.dsACCOUNTS_COMM_OPERStateChange(Sender: TObject);
begin

  if     (dsACCOUNTS.State in [dsInsert, dsEdit])
     and not tACCOUNTS_COMM_OPER.IsEmpty
  then
    ActionGridRDelete.Enabled := True
  else
    ActionGridRDelete.Enabled := False;

end;

procedure TFormTreAccount.ActionGridLAppendExecute(Sender: TObject);
var
  SQL       : string;
  KeyValues : TRayKeyValues;
  i         : integer;
begin

  SQL := 'SELECT u.user_id,' + #10
       + '       u.login' + #10
       + '  FROM USERS u' + #10
       + ' WHERE u.sign_activity = -1'
       + ' ORDER BY u.login';

  if ExecQuickSearch(KeyValues,
                     'Пользователи системы',
                     SQL,
                     nil,
                     0,
                     cMaster.Editing,
                     True)
  then
  begin
    tACCOUNTS_USERS.DisableControls;
    //
    for i := 0 to High(KeyValues) do
    begin
      cDetailL.Append;
      tACCOUNTS_USERS.FieldValues['user_id'] := KeyValues[i].Key;
    end;
    //
    tACCOUNTS_USERS.EnableControls;
  end;

  GridL.SetFocus;

end;

procedure TFormTreAccount.ActionGridRAppendExecute(Sender: TObject);
var
  SQL       : string;
  KeyValues : TRayKeyValues;
  i         : integer;
begin

  SQL := 'SELECT c.cor_id,' + #10
       + '       c.fname' + #10
       + '  FROM TRADE.COR c' + #10
       + ' WHERE c.cor_type_id = 12' + #10
       + '   AND c.sign_activity = -1' + #10
       + ' ORDER BY c.fname';

  if ExecQuickSearch(KeyValues,
                     'Отделы',
                     SQL,
                     nil,
                     0,
                     cMaster.Editing,
                     True)
  then
  begin
    tACCOUNTS_COMM_OPER.DisableControls;
    //
    for i := 0 to High(KeyValues) do
    begin
      cDetailR.Append;
      tACCOUNTS_COMM_OPER.FieldValues['cor_id'] := KeyValues[i].Key;
    end;
    //
    tACCOUNTS_COMM_OPER.EnableControls;
  end;

  GridR.SetFocus;

end;

procedure TFormTreAccount.ActionGridLDeleteExecute(Sender: TObject);
begin

  tACCOUNTS_USERS.Delete;

  ActionGridLDelete.Enabled := not tACCOUNTS_USERS.IsEmpty;

end;

procedure TFormTreAccount.ActionGridRDeleteExecute(Sender: TObject);
begin

  tACCOUNTS_COMM_OPER.Delete;

  ActionGridRDelete.Enabled := not tACCOUNTS_COMM_OPER.IsEmpty;

end;

end.

