{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormTreBudgPay                    }
{           Бюджетная классификация платежей            }
{                                                       }
{        Дата изменения: 03.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTreBudgPay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameTitle, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan,
  // odac
  OraCall, Data.DB, DBAccess, Ora, MemDS, OraSmart,
  // ehlib
  DBGridEh, DBLookupEh, DBCtrlsEh,
  // my
  uConst,
  uConductorOverAll;

{ TFormTreBudgPay }

type
  TFormTreBudgPay = class(TForm)
    FrameTitle: TFrameTitle;
    pCheck: TPanel;
    fSignActivity: TDBCheckBoxEh;
    fName: TDBEditEh;
    ActionManager: TActionManager;
    fBudgPayTypeID: TDBLookupComboboxEh;
    tDICT_BUDG_PAY: TOraTable;
    dsDICT_BUDG_PAY: TOraDataSource;
    OraSession: TOraSession;
    tDICT_BUDG_PAYBUDG_PAY_ID: TFloatField;
    tDICT_BUDG_PAYBUDG_PAY_TYPE_ID: TFloatField;
    tDICT_BUDG_PAYNAME: TStringField;
    tDICT_BUDG_PAYSIGN_ACTIVITY: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FrameTitleActionRecPostExecute(Sender: TObject);
    procedure FrameTitleActionRecEditExecute(Sender: TObject);
    procedure FrameTitleActionRecCancelExecute(Sender: TObject);
    procedure dsDICT_BUDG_PAYStateChange(Sender: TObject);
  private
    { Private declarations }

    cMaster: TConductorOverAll;                                                 // DICT_BUDG_PAY

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
  uDataModuleTre,
  uDataModuleImages,
  uRegForms,
  uUser;

{ TFormTreBudgPay }

procedure TFormTreBudgPay.WMDBPost(var Message: TMessage);
begin
  FrameTitle.ActionRecPost.Execute;
end;

procedure TFormTreBudgPay.FormCreate(Sender: TObject);
begin

  // подключаемся к схеме Tre
  DataModuleRay.SetSession(OraSession, 'tre', 'tre', User.ID);

  // master. контуктор ввода DICT_BUDG_PAY
  cMaster := TConductorOverAll.Create(Self,
                                      tDICT_BUDG_PAY,
                                      dsDICT_BUDG_PAY,
                                      RegForms.LastLaunch.Param,
                                      FrameTitle.lTitle);

  // задаем свойства для гл. таблицы-ввода
  cMaster.TitleField  := 'name';
  cMaster.TitlePrefix := '"';

end;

procedure TFormTreBudgPay.FrameTitleActionRecPostExecute(Sender: TObject);
begin

  try
    cMaster.ApplyUpdates;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      FrameTitle.ActionRecEdit.Execute;
    end;
  end;

end;

procedure TFormTreBudgPay.FrameTitleActionRecEditExecute(Sender: TObject);
begin
  cMaster.Edit;
end;

procedure TFormTreBudgPay.FrameTitleActionRecCancelExecute(Sender: TObject);
begin
  cMaster.CancelUpdates;
end;

procedure TFormTreBudgPay.dsDICT_BUDG_PAYStateChange(Sender: TObject);
begin

  case dsDICT_BUDG_PAY.DataSet.State of

    dsBrowse :
      begin
        FrameTitle.ActionRecPost.Enabled   := False;
        FrameTitle.ActionRecEdit.Enabled   := True;
        FrameTitle.ActionRecCancel.Enabled := False;
      end;

    dsInsert, dsEdit :
      begin
        FrameTitle.ActionRecPost.Enabled   := True;
        FrameTitle.ActionRecEdit.Enabled   := False;
        FrameTitle.ActionRecCancel.Enabled := IfThen(dsDICT_BUDG_PAY.DataSet.State = dsEdit, 'True', 'False').ToBoolean;
      end;

  end;

end;

end.
