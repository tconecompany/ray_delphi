{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFormRayUser                      }
{          Выпадающая форма для елементов списков       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormRayUser;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,
  // odac
  Ora, OraSmart, Data.DB, MemDS, DBAccess,
  // ehlib
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh;

type
  TFormRayUser = class(TForm)
    Button1: TButton;
    tMain: TOraTable;
    DBGridEh1: TDBGridEh;
    dsMain: TOraDataSource;
    procedure dsMainDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRayUser: TFormRayUser;

implementation

{$R *.dfm}

uses
  uDataModuleRay,
  uRegForms;

procedure TFormRayUser.dsMainDataChange(Sender: TObject; Field: TField);
begin

  if    tMain.Modified       // пользователь трунул данные
     or tMain.UpdatesPending // кешированые изменились тоже
  then
  begin
    //RegForms.SetMarkChange(Self); // ставим маркер
  end;

end;

end.
