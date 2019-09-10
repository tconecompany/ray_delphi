{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TDataModuleTre                     }
{                                                       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleTre;

interface

uses
  // sys
  System.SysUtils, System.Classes,
  // odac
  Data.DB, DBAccess, Ora, MemDS, OraSmart;

{ TDataModuleTre }

type
  TDataModuleTre = class(TDataModule)
    tDICT_ACCOUNT_TYPE: TOraTable;
    tDICT_ACCOUNT_SUBTYPE: TOraTable;
    tDICT_ACCOUNT_TYPEACCOUNT_TYPE_ID: TFloatField;
    tDICT_ACCOUNT_TYPENAME: TStringField;
    tDICT_ACCOUNT_SUBTYPEACCOUNT_SUBTYPE_ID: TFloatField;
    tDICT_ACCOUNT_SUBTYPENAME: TStringField;
    tDICT_ACCOUNT_SUBTYPESNAME: TStringField;
    tDICT_ACCOUNT_SUBTYPEACCOUNT_TYPE_ID: TFloatField;
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
    dsDICT_ACCOUNT_TYPE: TOraDataSource;
    dsDICT_ACCOUNT_SUBTYPE: TOraDataSource;
    dsACCOUNTS: TOraDataSource;
    tDICT_BUDG_PAY_TYPE: TOraTable;
    dsDICT_BUDG_PAY_TYPE: TOraDataSource;
    tDICT_BUDG_PAY_TYPEBUDG_PAY_TYPE_ID: TFloatField;
    tDICT_BUDG_PAY_TYPENAME: TStringField;
  private
    { Private declarations }

  public

    { Public declarations }

    procedure ActivateDataSets;

  end;

var
  DataModuleTre: TDataModuleTre;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDataModuleRay;

{$R *.dfm}

{ TDataModuleTre }

procedure TDataModuleTre.ActivateDataSets;
begin

  tACCOUNTS.Active             := True;
  tDICT_ACCOUNT_TYPE.Active    := True;
  tDICT_ACCOUNT_SUBTYPE.Active := True;
  tDICT_BUDG_PAY_TYPE.Active   := True;

end;

initialization
  DataModuleTre := TDataModuleTre.Create(nil);

end.
