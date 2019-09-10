{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     uStrUtilsExt                      }
{     Доп. набор подпрограмм для работы со строками     }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uStrUtilsExt;

interface

uses
  // sys
  System.Classes,
  // my
  uTypes;

{ строковые }

function Trim(Str: string; Char: char): string; overload;                       // усекает пробелы или символ с двух сторон
function LTrim(Str: string; Char: char): string;                                // ... с левой стороны
function RTrim(Str: string; Char: char): string;                                // ... с правой стороны
function LPad(Str: string; Count: integer; Char: char = ' '): string;           // добавляет символы слева
function RPad(Str: string; Count: integer; Char: char = ' '): string;           // добавляет символы справа
function DeleteChar(Str: string; Char: char): string;                           // удаляет символ в строке полностю
function InitCap(Str: string): string;                                          // слова начинаются с заглавной
function NumF(Num: extended; Aaccuracy: byte=0): string;                        // форматируемое число
function StrToCutOff(Str: string; Num: integer): string;                        // обрезает строку по Num символов с допиской ...
function NVL(Str1, Str2: string): string;                                       // нивеляция для строк (подобие Oracle)

function ExtractTemplateData(Template : string;                                 // извлекает подстроку по шаблону в строке. например строка=Дата(10) задаем ExtractData('()', 'Дата(10)') результат будет равен 10
                             Str      : string;                                 // входная строка
                             Offset   : integer = 1): string;                   // начиная с позиции

{ обработка параметров }

function StrToDynStrings(Str: string; Delimiter: char = ';'): TDynStrings;      // разбивает строку с разделителем ";" на элементы строкового массива
function StrToDynParams(Str: string; Delimiter: char = ';'): TDynParams;        // для определения параметров из строки
function DynParamsToStr(Values: TDynParams; Delimiter: char = ';'): string;     // масив параметров в строку с разделителем
function DynStringsToStr(Strings: TDynStrings; Delimiter : char = ';'): string; // конвертирует масив строк в строку з разделителем Char

function VariableStringsToDynParams(Str: string): TDynParams;                   // извлекает из строки пользовательские параметры (:Param1...:ParamN)
function ReplaceDynParamValuesInStr(Values: TDynParams; Str: string): string;   // заменяем значения дин. парметров в строке вида "Формирование платежных документов по счету :pAccount :pAccountName"

function GetValues(Str,                                                         // извлекает значение параметра с сеперативной строки
                   Names     : string;
                   Delimiter : string = ';';
                   DefValue  : string = ''): string;

function GetDynValues(DynParams : TDynParams;                                   // извлекает значение параметра с дин. списка параметров
                      Names     : string;
                      Delimiter : string = ';'): string;

implementation

uses
  // sys
  System.SysUtils,
  System.StrUtils,
  Data.DB;

{ Trim }

function Trim(Str: string; Char: char): string;
begin
  Result := LTrim(Str, Char);
  Result := RTrim(Result, Char);
end;

{ LTrim }

function LTrim(Str: string; Char: char): string;
var
  i: integer;
begin

  Result := Str;

  i := 1;

  while     (i <= Length(Result))
        and (Result <> '')
  do
    if Result[1] = Char then
      Delete(Result, i, 1)
    else
      Break;

end;

{ RTrim }

function RTrim(Str: string; Char: char): string;
var
  i: integer;
begin

  Result := Str;

  i := Length(Str);

  while     (i <= Length(Result))
        and (Result <> '')
  do
    if Result[i] = Char then
    begin
      Delete(Result, i, 1);
      Dec(i);
    end
    else
      Break;

end;

{ LPad }

function LPad(Str: string; Count: integer; Char: char = ' '): string;
begin
  Result := StringOfChar(Char, Count - Length(Str)) + Str;
end;

{ RPad }

function RPad(Str: string; Count: integer; Char: char = ' '): string;
begin
  Result := Str + StringOfChar(Char, Count - Length(Str));
end;

{ DeleteChar }

function DeleteChar(Str: string; Char: char): string;
var
  i: integer;
begin

  Result := Str;

  i := 1;

  while     (i <= Length(Result))
        and (Result <> '')
  do
  begin

    if Result[i] = Char then
    begin
      Delete(Result, i, 1);
      Dec(i);
      Continue;
    end;

    Inc(i);

  end;

end;

{ InitCap }

function InitCap(Str: string): string;
var
  i: integer;
begin

  for i := 1 to Length(Str) do
    if    (i = 1)
       or (Str[i -1] in [' ', ',', '.'])
    then
      Str[i] := AnsiUpperCase(Str[i])[1];

  Result := Str;

end;

{ NumF }

function NumF(Num: extended; Aaccuracy: byte=0): string;
var
  FormatSettings: TFormatSettings;
begin
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ' ';
  Result := FloatToStrF(Num, ffCurrency, 12, Aaccuracy, FormatSettings);
end;

{ StrToCutOff }

function StrToCutOff(Str: string; Num: integer): string;
begin
  if Length(Str) > Num then
    Result := Copy(Str, 1, Num - 3) +  '...'
  else
    Result := Str;
end;

{ NVL }

function NVL(Str1, Str2: string): string;
begin

  if Str1 <> '' then
    Result := Str1
  Else
    Result := Str2;

end;

{ ExtractTemplateData }

function ExtractTemplateData(Template : string;
                             Str      : string;
                             Offset   : integer = 1): string;
var
  p1, p2: integer;
begin

  p1 := PosEx(Template[1], Str, Offset);
  p2 := PosEx(Template[2], Str, p1 + 1);

  Result := Trim(Copy(Str, p1 + 1, p2 - p1 - 1));

end;

{ StrToDynStrings }

function StrToDynStrings(Str: string; Delimiter: char = ';'): TDynStrings;
var
  i, p1, p2: integer;
begin

  if Str = '' then Exit;

  Str := Str + Delimiter;

  p1 := 1;
  p2 := Pos(Delimiter, Str);

  i := 0;

  repeat
    SetLength(Result, i + 1);
    Result[i] := Copy(Str, p1, p2 - p1);
    p1 := p2 + 1;
    p2 := PosEx(Delimiter, Str, p1 + 1);
    Inc(i)
  until p2 = 0;

end;

{ StrToDynParams }

function StrToDynParams(Str: string; Delimiter: char = ';'): TDynParams;
var
  i, p1, p2: integer;
begin

  if Str = '' then Exit;

  Str := Delimiter + RTrim(Str, Delimiter);

  p1 := Pos(Delimiter, Str);

  i := 0;

  while p1 > 0 do
  begin
    p2 := PosEx('=', Str, p1 + 1);
    SetLength(Result, i + 1);
    Result[i].Name  := Copy(Str, p1 + 1, p2 - p1 - 1);
    Result[i].Value := GetValues(Str, Result[i].Name);
    Result[i].Type_ := ftString;
    Result[i].Size  := 255;
    p1 := PosEx(Delimiter, Str, p1 + 1);
    Inc(i)
  end;

end;

{ DynParamsToStr }

function DynParamsToStr(Values: TDynParams; Delimiter: char = ';'): string;
var
  i: integer;
begin

  for i := 0 to High(Values) do
    Result := Result + Values[i].Name + '=' + Values[i].Value + Delimiter;

  Result := RTrim(Result, Delimiter);

end;

{ DynStringsToStr }

function DynStringsToStr(Strings: TDynStrings; Delimiter : char = ';'): string;
var
  i: integer;
begin

  Result := '';

  for i := 0 to High(Strings) do
    Result := Result + Strings[i] + Delimiter;

  Result := RTrim(Result, Delimiter);

end;

{ VariableStringsToDynParams }

function VariableStringsToDynParams(Str: string): TDynParams;
var
  i, p1, p2, iCount: integer;
begin

  iCount := 0;

  // прощитуем количество параметров по символу ":"
  for i := 1 to Length(Str) do
    if Str[i] = ':' then
      Inc(iCount);

  if iCount = 0 then Exit;

  SetLength(Result, iCount);

  p1 := 0;

  Str := Str + ' ';

  for i := 1 to iCount do
  begin
    p1 := PosEx(':', Str, p1 + 1);
    p2 := PosEx(' ', Str, p1 + 1);
    Result[i - 1].Name  := Trim(Copy(Str, p1 + 1, p2 - p1 - 1));
  end;

end;

{ ReplaceDynParamValuesInStr }

function ReplaceDynParamValuesInStr(Values: TDynParams; Str: string): string;
var
  i: integer;
begin

  Result := Str;

  for i := 0 to High(Values) do
    Result := StringReplace(Result,
                            '%' + Values[i].Name + '%',
                            Values[i].Value,
                            [rfReplaceAll, rfIgnoreCase]);

end;

{ GetValues }

function GetValues(Str,
                   Names     : string;
                   Delimiter : string = ';';
                   DefValue  : string = ''): string;
var
  p1, p2: integer;
begin

  p1 := Pos(Names + '=', Str);

  if p1 > 0 then
  begin
    p1 := PosEx('=', Str, p1);
    p2 := PosEx(';', Str + ';', p1);
    Result := Copy(Str, p1 + 1, (p2 - p1 - 1));
  end
  else
    Result := DefValue;

end;

{ GetDynValues }

function GetDynValues(DynParams : TDynParams;
                      Names     : string;
                      Delimiter : string = ';'): string;
var
  i: integer;
begin

  Result:= '';

  for i := 0 to High(DynParams) do
    if SameText(DynParams[i].Name, Names) then
    begin
      Result := DynParams[i].Value;
      Break;
    end;

end;

end.

