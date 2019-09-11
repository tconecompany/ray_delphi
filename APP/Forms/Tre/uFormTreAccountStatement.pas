{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                TFormTreAccountStatement               }
{                    Выписка по счету                   }
{                                                       }
{        Дата изменения: 03.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTreAccountStatement;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  System.Actions, Vcl.ActnList, Vcl.ToolWin,
  // ehlib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  DBCtrlsEh, DBLookupEh,
  // odac
  Data.DB, DBAccess, Ora, MemDS, OraSmart;

{ TFormTreAccountStatement }

type
  TFormTreAccountStatement = class(TForm)
    Panel1: TPanel;
    DBText1: TDBText;
    lCurrency: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    Label4: TLabel;
    Label5: TLabel;
    DBText3: TDBText;
    Label7: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList: TActionList;
    ActionRefresh: TAction;
    ActionExpExcel: TAction;
    fAccount: TDBLookupComboboxEh;
    fAccountName: TDBText;
    qUSER_ACCOUNTS: TOraQuery;
    dsUSER_ACCOUNTS: TOraDataSource;
    qUSER_ACCOUNTSACCOUNT: TFloatField;
    qUSER_ACCOUNTSACCOUNT_NAME: TStringField;
    qUSER_ACCOUNTSCURRENCY: TStringField;
    TabControl1: TTabControl;
    Grid: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure fAccountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExpExcelExecute(Sender: TObject);
    procedure fAccountCloseUp(Sender: TObject; Accept: Boolean);
  private

    { Private declarations }

    procedure InitGrid;

  public

    { Public declarations }

  end;

implementation

{$R *.dfm}

uses
  // my
  uConst,
  uTypes,
  uStrUtilsExt,
  uDataModuleRay,
  uDataModuleRBI,
  uDataModuleImages,
  uUser,
  uRegForms,
  uFormQuickSearch;

{ TFormAccountStatement }

procedure TFormTreAccountStatement.FormCreate(Sender: TObject);
begin

  qUSER_ACCOUNTS.Active := True;
  qUSER_ACCOUNTS.ParamByName('pUserID').AsInteger := User.ID;

  fAccount.Value := StrToIntDef(GetValues(RegForms.LastLaunch.Param, 'pAccount'),
                                qUSER_ACCOUNTS.FieldByName('account').AsInteger);

  fAccount.SelectAll;

  InitGrid();

end;

procedure TFormTreAccountStatement.InitGrid;
begin

  Caption := 'Выписка по счету ' + fAccount.Text;

  Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2); // подписываем вкладку

  Showmessage('exec');

end;

procedure TFormTreAccountStatement.fAccountCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  InitGrid();
end;

procedure TFormTreAccountStatement.fAccountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then InitGrid();
end;

procedure TFormTreAccountStatement.ActionRefreshExecute(Sender: TObject);
begin
  InitGrid();
end;

procedure TFormTreAccountStatement.ActionExpExcelExecute(Sender: TObject);
begin
//
end;


end.

