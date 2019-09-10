{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TConductorTrade                    }
{     Кондуктор ввода и чтения записей БД в таблице     }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConductorTrade;

interface

uses
  // sys
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ActnList,
  // odac
  Ora,
  OraSmart,
  // my
  uTypes,
  uConductor;

// TConductorTrade
type
  TConductorTrade = class(TConductor)
    private
      FDocTypeID     : integer;
      FDirectEdit    : boolean;
      FBlockPast     : boolean;
      FStatusControl : boolean;

      procedure SetDocTypeID(ADocTypeID: integer);

    public

      property DocTypeID: integer read FDocTypeID write SetDocTypeID;           // установить тип документа

  end;

implementation

uses
  // sys
  SysUtils,
  Vcl.Graphics,
  // my
  uStrUtilsExt,
  uConst;

{ TConductorTrade }

procedure TConductorTrade.SetDocTypeID(ADocTypeID: integer);
begin
//
end;

end.

