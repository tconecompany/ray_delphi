{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TDataModuleRBI                    }
{                                                       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleRBI;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Ora, MemDS, OraSmart;

{ TDataModuleRBI}

type
  TDataModuleRBI = class(TDataModule)
    tDICT_CURRENCY: TOraTable;
    tDICT_CURRENCYCURRENCY_ID: TIntegerField;
    tDICT_CURRENCYCURRENCY: TStringField;
    tDICT_CURRENCYNAME: TStringField;
    tDICT_CURRENCYSIGN: TStringField;
    dsDICT_CURRENCY: TOraDataSource;
  private

    { Private declarations }

  public

    { Public declarations }

    procedure ActivateDataSets;

  end;

var
  DataModuleRBI: TDataModuleRBI;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDataModuleRay;

{$R *.dfm}

{ TDataModuleRBI }

procedure TDataModuleRBI.ActivateDataSets;
begin

  tDICT_CURRENCY.Active := True;

end;

initialization
  DataModuleRBI := TDataModuleRBI.Create(nil);

end.
