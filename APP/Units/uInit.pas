{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                         TInit                         }
{         Модуль инициализации параметров с БД          }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uInit;

interface

uses
  // my
  uTypes;

{ TInit }

type
  TInit = class
  private
    FItems : TDynParams;
    FTag   : integer;

    constructor Create;
    function GetCount: integer;

  public

    function ParamByName(ParamName: string): string;                            // возвращает имя параметра по имени

    property Count: integer read GetCount;                                      // количество параметров
    property Tag: integer read FTag write FTag;                                 // Tag

  end;

var
  Init: TInit;

implementation

uses
  // sys
  System.SysUtils,
  // odac
  Ora,
  // my
  uDataModuleRay;

{ TInit }

constructor TInit.Create;
var
  qOper : TOraQuery;
  i     : integer;
begin

  //
  qOper := TOraQuery.Create(nil);
  qOper.Session  := DataModuleRay.OraSession;
  qOper.SQL.Text := 'SELECT i.* FROM INIT i' ;

  i := 0;

  try

    qOper.Open;

    if qOper.IsEmpty then
      raise Exception.Create('Параметры таблицы инициализации "RAY.INIT" не заданы');

    while not qOper.Eof do
    begin

      SetLength(FItems, i + 1);

      FItems[i].Name     := qOper.Fields.FieldByName('name').AsString;
      FItems[i].Value    := qOper.Fields.FieldByName('value').AsString;

      Inc(i);

      qOper.Next;

    end;

  finally

    qOper.Close;
    qOper.Free;

  end;

end;

function TInit.GetCount: integer;
begin
  Result := Length(FItems);
end;

function TInit.ParamByName(ParamName: string): string;
var
  i : integer;
begin

  for i := 0 to Count - 1 do
    if SameText(FItems[i].Name, ParamName) then
    begin
      Result := FItems[i].Value;
      Break;
    end;

  if Result = '' then
    raise Exception.Create('Параметр "' + ParamName + '" не найден');

end;

initialization
  Init := TInit.Create;

finalization
  Init.Free;

end.
