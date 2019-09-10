{*******************************************************}
{                                                       }
{                       Ray 1.0                         }
{                                                       }
{                     TFormUnLock                       }
{                Блокировка/Разб. сеанса                }
{                                                       }
{        Дата изменения: 20.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormUnLock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Forms,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Controls, System.Classes;

{ TFormUnLock }

type
  TFormUnLock = class(TForm)
    Label1: TLabel;
    ePass: TEdit;
    bOK: TButton;
    Image1: TImage;
    procedure bOKClick(Sender: TObject);
    procedure ePassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ ShowUnLock }

procedure ShowUnLock;

implementation

uses
  uUser;

{$R *.dfm}

{ ShowUnLock }

procedure ShowUnLock;
var
  FormUnLock: TFormUnLock;
begin

  FormUnLock := TFormUnLock.Create(Application);
  FormUnLock.ShowModal;
  FormUnLock.Release;

end;

{ TFormUnLock }

procedure TFormUnLock.bOKClick(Sender: TObject);
begin
  if User.Password = ePass.Text then
  begin
    Self.Tag := 1;
    Close;
  end
  else
    Beep;
end;

procedure TFormUnLock.ePassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then bOK.Click;
end;

procedure TFormUnLock.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Self.Tag = 0 then
    CanClose := False;
end;

end.
