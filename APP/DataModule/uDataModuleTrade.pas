{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                   TDataModuleTrade                    }
{                                                       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleTrade;

interface

uses
  // sys
  System.SysUtils, System.Classes,
  // odac
  Data.DB, MemDS, DBAccess, Ora, OraSmart;

type
  TDataModuleTrade = class(TDataModule)
    tDICT_STATUS: TOraTable;
    qCOR_TYPE_ID_12: TOraQuery;
  private

    { Private declarations }

  public

    { Public declarations }

    procedure ActivateDataSets;

  end;

var
  DataModuleTrade: TDataModuleTrade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDataModuleRay;

{$R *.dfm}

{ TDataModuleTrade }

procedure TDataModuleTrade.ActivateDataSets;
begin

  tDICT_STATUS.Active    := True;
  qCOR_TYPE_ID_12.Active := True;

end;

initialization
  DataModuleTrade := TDataModuleTrade.Create(nil);

end.
