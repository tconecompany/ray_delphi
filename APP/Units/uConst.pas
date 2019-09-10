{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                         uConst                        }
{                Набор глобальных констант              }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConst;

interface

uses
  Winapi.Messages;

// Группа констант
const
  // message
  WM_AFTER_CREATE   = WM_USER + 100;                                            // сообщения для автозапуска
  WM_MAIN_MDI_CHILD = WM_USER + 101;                                            // сообщения для работы с дочерними формамы для главной (закрытие, подписи...)
  WM_FORM_PRINT     = WM_USER + 102;                                            // печать формы
  WM_DB_POST        = WM_USER + 103;                                            // команда post для форм редактирования документов

  // константы подобраных цветов
  COLOR_BLACK           = $0011181B;                                            // черный
  COLOR_RED             = $000000D4;                                            // красный
  COLOR_BLUE            = $00B24A32;                                            // синий
  COLOR_GREEN           = $0025BC3C;                                            // зеленый
  COLOR_YELLOW          = $000091F0;                                            // желтый
  COLOR_GREY            = $00A4A0A0;                                            // серый
  COLOR_GRID_SECTION    = $00E2B48D;                                            // цвет секции древа-грида
  COLOR_GRID_SUBSECTION = $00F1D9C5;                                            // цвет подсекции древа-грида
  COLOR_TRADE           = $00FF9428;                                            // цвет линии для модуля Trade
  COLOR_ACC             = $00141414;                                            // цвет линии для модуля Acc
  COLOR_FIN             = $0078AC1C;                                            // цвет линии для модуля Fin
  COLOR_CASHBOX         = $009AD5FF;                                            // цвет линии для модуля CB
  COLOR_TRE             = $006DDBFD;                                            // цвет линии для модуля Tre
  COLOR_BUDG            = $00983E7F;                                            // цвет линии для модуля TRE
  COLOR_PROD            = $00983E7F;                                            // цвет линии для модуля Prod
  COLOR_ADMIN           = $00D893BA;                                            // цвет линии для модуля Adm

  // LongDayNames - переписка старой стандартного массива
  LongDayNames: array[0..7] of PChar = (
    '',
    'воскресенье',
    'понедельник',
    'вторник',
    'среда',
    'четверг',
    'пятница',
    'суббота');

  // LongMonthNames - переписка старой стандартного массива
  LongMonthNames: array[0..12] of PChar = (
    '', 'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август',
    'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь');

  // ShortMonthNames - переписка старой стандартного массива
  ShortMonthNames: array[0..12] of PChar = (
    '', 'Янв.', 'Фев.', 'Мар.', 'Апр.', 'Май', 'Июн.', 'Июл.', 'Авг.',
    'Сен.', 'Окт.', 'Ноя.', 'Дек.');

function StrToColor(Color: string; Def: integer=COLOR_BLACK): integer;       // получить номер цвета по имени константы

implementation

uses
  System.SysUtils;

{ GetColorConst }

function StrToColor(Color: string; Def: integer=COLOR_BLACK): integer;
begin
  if      SameText(Color, 'BLACK')         then Result := COLOR_BLACK
  else if SameText(Color, 'RED')           then Result := COLOR_RED
  else if SameText(Color, 'BLUE')          then Result := COLOR_BLUE
  else if SameText(Color, 'GREEN')         then Result := COLOR_GREEN
  else if SameText(Color, 'YELLOW')        then Result := COLOR_YELLOW
  else if SameText(Color, 'GREY')          then Result := COLOR_GREY
  else if SameText(Color, 'COLOR_TRADE')   then Result := COLOR_TRADE
  else if SameText(Color, 'COLOR_ACC')     then Result := COLOR_ACC
  else if SameText(Color, 'COLOR_FIN')     then Result := COLOR_FIN
  else if SameText(Color, 'COLOR_CASHBOX') then Result := COLOR_CASHBOX
  else if SameText(Color, 'COLOR_TRE')     then Result := COLOR_TRE
  else if SameText(Color, 'COLOR_BUDG')    then Result := COLOR_BUDG
  else if SameText(Color, 'COLOR_PROD')    then Result := COLOR_PROD
  else if SameText(Color, 'COLOR_ADMIN')   then Result := COLOR_ADMIN
  else
    Result := Def;
end;

end.

