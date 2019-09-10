{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormChangePass                    }
{              Смена пароля пользователя                }
{                                                       }
{        Дата изменения: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormChangePass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

{ TFormChangePass }

type
  TFormChangePass = class(TForm)
    bOK: TButton;
    bCancel: TButton;
    leOldPass: TLabeledEdit;
    leNewPass: TLabeledEdit;
    leRePass: TLabeledEdit;
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ ShowChangePass }

procedure ShowChangePass;

implementation

{$R *.dfm}

uses
  uUser;

{ ShowChangePass }

procedure ShowChangePass;
var
  FormChangePass: TFormChangePass;
begin

  FormChangePass := TFormChangePass.Create(Application);
  FormChangePass.ShowModal;

  if FormChangePass.ModalResult = mrOk then
    MessageDlg('Пароль успешно изменен', mtInformation, [mbOK], 0);

  FormChangePass.Release;

end;

{ TFormChangePass }

procedure TFormChangePass.bOKClick(Sender: TObject);
begin
  if User.ChangePass([leOldPass.Text, leNewPass.Text, leRePass.Text]) then
    ModalResult := mrOk;
end;

end.
