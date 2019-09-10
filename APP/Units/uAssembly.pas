{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       uAssembly                       }
{                   Сборка подпрограмм                  }
{                                                       }
{        Дата изменения: 02.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uAssembly;

interface

uses
  // odac
  Ora, Data.DB,
  // my
  uTypes;

{ LookupOptionsConnect }

function LookupOptionsConnect(AQuery: TOraQuery;                                // связывает параметры-подстановки с sql; истина если все параметры установились
  ALookupOptions: TDynParams): boolean;

implementation

uses
  //
  SysUtils,
  System.Variants,
  // my
  uStrUtilsExt;

{ LookupOptionsConnect }

function LookupOptionsConnect(AQuery: TOraQuery; ALookupOptions: TDynParams): boolean;
var
  dpSQL : TDynParams;
  i, j  : integer;
begin

  Result := True;

  dpSQL := VariableStringsToDynParams(AQuery.SQL.Text);

  for i := 0 to High(dpSQL) do
    for j := 0 to High(ALookupOptions) do
      if SameText(dpSQL[i].Name, ALookupOptions[j].Name) then
      begin
        // косяк. пустое значение. при автостарте сработает вызов отбора
        if VarIsEmpty(ALookupOptions[j].Value) then
        begin
          Result := False;
          Break;
        end;
        //
        case ALookupOptions[i].Type_ of
          ftString  : AQuery.ParamByName(dpSQL[i].Name).AsString  := ALookupOptions[j].Value;
          ftInteger : AQuery.ParamByName(dpSQL[i].Name).AsInteger := ALookupOptions[j].Value;
          ftBoolean : AQuery.ParamByName(dpSQL[i].Name).AsBoolean := ALookupOptions[j].Value;
          ftDate    : AQuery.ParamByName(dpSQL[i].Name).AsDate    := StrToDate(string(ALookupOptions[j].Value));
        end;
      end;

end;

end.
