{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                        uTypes                         }
{           Полный набор преопределенных типов          }
{                                                       }
{        Дата изменения: 21.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uTypes;

interface

uses
  // sys
  Data.DB;

{ TRayParam }

type
  TRayParam = record
    Name              : string;                                                 // имя параметра
    Type_             : TFieldType;                                             // тип параметра
    Value             : Variant;                                                // значение параметра
    Size              : word;                                                   // размер строки
    DefaultExpression : string;                                                 // значение по-умолчанию
    Achmenttement     : string;                                                 // вложение
  end;

{ TRayKeyValue }

type
  TRayKeyValue = record
    Key   : variant;
    Value : variant;
  end;

{ Динамические }

type
  TDynStrings   = array of string;                                              // динамический масив строк
  TDynNumbers   = array of integer;                                             // динамический масив чисел
  TDynBooleans  = array of boolean;                                             // динамический масив булевых значений
  TDynParams    = array of TRayParam;                                           // динамический масив параметров
  TRayKeyValues = array of TRayKeyValue;                                        // динамический масив параметров

{ TRayShowMode режими открытия формы }

type
  TRayShowMode = (smChild, smModal);

{ TRecPickItem }

type
  TRecPickItem = record
    Caption      : string;                                                      // подпись переменной в талблице
    LookupItemID : string;                                                      // имя переменной
    Control      : string;                                                      // тип контроля (числа, списки, дата ...)
    Condition    : string;                                                      // условие в выражении sql
    Keys         : string;                                                      // ключи для фиксированых списков
    Items        : string;                                                      // подпись для фиксированых списков
    SQLUnitID    : string;
    SQLUnit      : string;
    MultiSelect  : boolean;                                                     // мульти-выбор
    Color        : string;                                                      // цвет строки
    Hint         : string;                                                      // подсказка для статусбара
  end;

{ TRecPick }

type
  PRecPick = ^TRecPick;
  TRecPick = record
    Caption    : string;                                                        // заголовок формы отбора
    WidthKey   : integer;                                                       // ширина названия колонки переменных
    WidthValue : integer;                                                       // ширина значений колонки переменных
    Checked    : boolean;                                                       // автостарт отбора при создании формы списка
    Items      : array of TRecPickItem;                                         // колекция переменных
  end;

// TPopupMessageKind система сообщений
//type
//  TPopupMessageKind = (pmkGeneral, pmkPriority);

function StrToFieldType(Str: string): TFieldType;                               // конвертирование строковых типов отбора в DB
function FieldTypeToStr(FieldType: TFieldType): string;                         // ... обратная

function StrToShowMode(Str: string): TRayShowMode;

implementation

uses
  // sys
  System.SysUtils;

{ StrToFieldType }

function StrToFieldType(Str: string): TFieldType;
begin

  if      SameText(Str, 'integer') then
    Result := ftInteger
  else if SameText(Str,'boolean') then
    Result := ftBoolean
  else if SameText(Str, 'date') then
    Result := ftDate
  else
    Result := ftString;

end;

{ FieldTypeToStr }

function FieldTypeToStr(FieldType: TFieldType): string;
begin

  case FieldType of
    ftString  : Result := 'string';
    ftInteger : Result := 'integer';
    ftBoolean : Result := 'boolean';
    ftDate    : Result := 'date';
  end;

end;

{ StrToFormShowMode }

function StrToShowMode(Str: string): TRayShowMode;
begin

  if      SameText(Str, 'child') then
    Result := smChild
  else if SameText(Str, 'modal') then
    Result := smModal;

end;

end.

