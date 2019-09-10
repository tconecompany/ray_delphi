{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                      TFrameCUUser                     }
{   Фрейм идентификации создания/изменения документов   }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFrameCUUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, Vcl.DBCtrls;

type
  TFrameCUUser = class(TFrame)
    lCreateUserID: TLabel;
    lUpdateUserID: TLabel;
    fCreateUserID: TDBEditEh;
    fUpdateUserID: TDBEditEh;
    fCreateUserDate: TDBText;
    fUpdateUserDate: TDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
