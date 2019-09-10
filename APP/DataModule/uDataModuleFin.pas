{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TDataModuleFin                    }
{                                                       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleFin;

interface

uses
  System.SysUtils, System.Classes;

type
  TDataModuleFin = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleFin: TDataModuleFin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDataModuleRay;

{$R *.dfm}

initialization
  DataModuleFin := TDataModuleFin.Create(nil);

end.
