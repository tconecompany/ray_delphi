{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TDataModuleRay                    }
{           Корневая сессия соединения к схеме Ray      }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleRay;

interface

uses
  // sys
  System.SysUtils, System.Classes,
  // odac
  Data.DB, Ora, MemDS, DBAccess, OraSmart, OraCall;

{ TDataModuleRay }

type
  TDataModuleRay = class(TDataModule)
    OraSession: TOraSession;
    tUSERS: TOraTable;
    tUSERSUSER_ID: TFloatField;
    tUSERSLOGIN: TStringField;
    tUSERSKEY_ID: TFloatField;
    tUSERSCORR_ID: TFloatField;
    tUSERSPASSWORD: TStringField;
    tUSERSDATE_REG: TDateTimeField;
    tUSERSXML_SETTINGS: TOraXMLField;
    tUSERSSIGN_ACTIVITY: TIntegerField;
    tUSERSXML_PERIOD: TOraXMLField;
    tMODULE: TOraTable;
    dsMODULE: TOraDataSource;
    tACTION: TOraTable;
    dsACTION: TOraDataSource;
    tMODULEMODULE_ID: TFloatField;
    tMODULESIGNATURE: TStringField;
    tMODULESIGNATURE_SHORT: TStringField;
    tMODULEICO: TStringField;
    tMODULEXML_CONF: TOraXMLField;
    tMODULESIGN_ACTIVITY: TIntegerField;
    tACTIONACTION_ID: TFloatField;
    tACTIONSIGNATURE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure ActivateDataSets;

    procedure SetSession(AOraSession : TOraSession;                             // установка новой сесии
                         ASchema     : string;                                  // схема бд
                         APassword   : string;                                  // пароль схемы
                         AUserID     : integer);                                // для регистрации пользователя на момент сессии

  end;

var
  DataModuleRay: TDataModuleRay;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  // odac
  OraPackage,
  // my
  uParams;

{ TDataModule_ }

procedure TDataModuleRay.DataModuleCreate(Sender: TObject);
begin
  SetSession(OraSession, 'ray', 'ray', 1);
end;

procedure TDataModuleRay.ActivateDataSets;
begin

  tACTION.Active := True;
  tMODULE.Active := True;
  tUSERS.Active  := True;

end;

procedure TDataModuleRay.SetSession(AOraSession : TOraSession;
                                    ASchema     : string;
                                    APassword   : string;
                                    AUserID     : integer);
var
  Package: TOraPackage;
begin

  // 1 режим соединения
  if  Params.ConnectDefault = 'direct' then
  begin
    AOraSession.Options.Direct := True;
    AOraSession.Server         := Params.DirectServer;
  end
  else if Params.ConnectDefault = 'client' then
  begin
    AOraSession.Options.Direct := False;
    AOraSession.Server         := Params.ClientServer;
    AOraSession.HomeName       := Params.ClientHome;
  end;

  // 2 аудентификация
  AOraSession.Username := ASchema;
  AOraSession.Password := APassword;
  AOraSession.Schema   := ASchema;

  // 3 соединяемся
  AOraSession.Connect;

  // 4 идентификация пользователя в схеме
  Package := TOraPackage.Create(nil);
  Package.Session := AOraSession;
  Package.PackageName := 'RAY.COMMON';

  Package.ExecProcEx('SetUserID', ['IN_ID', AUserID]);

end;

initialization
  DataModuleRay := TDataModuleRay.Create(nil);

end.

