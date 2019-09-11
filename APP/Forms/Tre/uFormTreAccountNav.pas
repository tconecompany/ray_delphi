{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                   TFormTreAccountNav                  }
{        Навигационная форма Казначейских счетов        }
{                                                       }
{        Дата изменения: 02.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTreAccountNav;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  // odac
  Data.DB, MemDS, DBAccess, Ora, OraSmart;

type
  TFormTreAccountNav = class(TForm)
    Panel: TPanel;
    bOK: TButton;
    bCancel: TButton;
    ListBox: TListBox;
    tACCOUNTS: TOraTable;
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
    tACCOUNTSTREE_PARENT_ID: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure PanelClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure ListBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
  private

    { Private declarations }

    aEnabled: array[0..2] of boolean;                                           // автивность строк списка

  public

    { Public declarations }

  end;

implementation

{$R *.dfm}

uses
  // my
  uDataModuleRay,
  uStrUtilsExt,
  uRegForms,
  uRepository;

procedure TFormTreAccountNav.FormCreate(Sender: TObject);
begin

  tACCOUNTS.Filter   := 'account_id = ' + GetValues(RegForms.LastLaunch.Param, 'pAccountID');
  tACCOUNTS.Filtered := True;

  ListBox.ItemIndex := 0;

  aEnabled[0] := True;
  aEnabled[1] := StrToBool(tACCOUNTS.FieldByName('sign_statement').AsString);
  aEnabled[2] := False;

end;

procedure TFormTreAccountNav.ListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin

  with (Control as TListBox).Canvas do begin
    if not aEnabled[Index] then
      Font.Color := clSilver;
    FillRect(Rect);
    TextOut(Rect.Left + 2, Rect.Top, (Control as TListBox).Items[Index])
  end;

end;

procedure TFormTreAccountNav.bOKClick(Sender: TObject);
var
  s: string;
begin

  if not aEnabled[ListBox.ItemIndex] then Exit;

  s := Format('pAccountID=%s;pAccount=%s;pAccountName=%s',
         [GetValues(RegForms.LastLaunch.Param, 'pAccountID'),
          tACCOUNTS.FieldByName('account').AsString,
          tACCOUNTS.FieldByName('name').AsString]);

  case ListBox.ItemIndex of
    0 : Repository.Exec(5013, s);
    1 : Repository.Exec(5014, s);
    2 : ;
  end;

  ModalResult := mrOk;

end;

procedure TFormTreAccountNav.PanelClick(Sender: TObject);
begin
  //ShowMessage(RegForms.LastStart.Param + ';pAccount=^account;pAccountName=^account_name');
end;

end.

