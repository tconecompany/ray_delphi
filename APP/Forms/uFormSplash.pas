{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                      TFormSplash                      }
{                     Форма заставка                    }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.StdCtrls;

{ TFormSplash }

type
  TFormSplash = class(TForm)
    Image: TImage;
    lStatus: TLabel;
    procedure ImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Status(Caption: string);
  end;

{ ShowSplash }

procedure ShowSplash;

implementation

{$R *.dfm}

{ ShowSplash }

procedure ShowSplash;
var
  FormSplash: TFormSplash;
begin
  FormSplash := TFormSplash.Create(Application);
  FormSplash.ShowModal;
  FormSplash.Release;
end;

{ TFormSplash }

procedure TFormSplash.Status(Caption: string);
begin

  lStatus.Caption := Caption;

  Repaint;

end;

procedure TFormSplash.ImageClick(Sender: TObject);
begin
  Close;
end;

end.
