{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TEnvVariables                     }
{        Переменные среды (Environment Variables)       }
{                                                       }
{        Дата изменения: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uEnvVariables;

interface

{ TEnvVariables }

type
  TEnvVariables = class
  public
    function ParamByName(ParamName: string): string;
  end;

var
  EnvVariables: TEnvVariables;

implementation

uses
  // sys
  System.SysUtils,
  System.StrUtils,
  DateUtils,
  // my
  uStrUtilsExt,
  uConst,
  uUser;

{ TEnvVariables }

function TEnvVariables.ParamByName(ParamName: string): string;
var
  DateTime              : TDateTime;
  MyHour, MyMin, MySec,
  myMili                : Word;
begin

  Result := ''; // что то не очищается

  //DateSeparator := '.';
  DecodeTime(Now, myHour, myMin, mySec, myMili);

  (*
    ПЕРЕМЕННЫЕ ПОЛЬЗОВАТЕЛЯ USER
      {UserID}                              - ид пользователя системы;
      {UserLogin}                           - логин пользователя;
      {UserDateBeg}                         - Current date;
      {UserDateEnd}                         - Current date ± number of days;
  *)

  if      SameText(ParamName, '{UserID}') then
    Result := User.ID.ToString
  else if SameText(ParamName, '{UserLogin}') then
    Result := User.Login
  else if SameText(ParamName, '{UserDateBeg}') then
    Result := DateToStr(User.Period.DateBeg)
  else if SameText(ParamName, '{UserDateEnd}') then
    Result := DateToStr(User.Period.DateEnd);

  (*
    ПЕРЕМЕННЫЕ СВЯЗАНЫЕ С ДАТОЙ
      {Date}                                   - Current date;
      {DateIncDays(-7)}                        - Current date ± number of days;
      {DateTime}                               - Current date & time;
      {DateTimeToFormat({Date}, "yyyy-mm-dd")} - Returns formatted date and time in specified format;    { TODO : допилить. прикольно выйдет!!! }
      {Day}                                    - Current day;
      {DayOfTheYear({Date})}                   - Returns the day of the year of specified or current date;
      {DayOfWeek}                              - Current day of week;
      {DayOfWeekNo}                            - Current day of week number;
      {FirstDay}                               - Return first day current months
      {FirstDayIncMD(-1,1)}                    - Return first day month ± number of days
      {Hours}                                  - Current hours;
      {IncDays(-1)}                            - Current day ± number of days;
      {IncMonths(-1)}                          - Current month ± number of months);
      {IncYears(-1)}                           - Current year ± number of years;
      {LastDay}                                - Return last day current months;
      {LastDayIncM(-1)}                        - Return last day ± number of months;
      {Minutes}                                - Current minutes;
      {MonthName}                              - Current month name;
      {MonthNo}                                - Current month number;
      {Seconds}                                - Current seconds;
      {ShortDayOfWeek}                         - Current day of week short name;
      {ShortMonthName}                         - Current day of week short name;
      {ShortYear}                              - Two-digits current year;
      {ShortYearIncDays(-1)}                   - Two-digits current year ± number of days;
      {Time}                                   - Current time;
      {WeekOfTheYear({Date})}                  - Returns the week of the year of specified or current date;
      {Year}                                   - Current year;
      {YearIncDays(-1)}                        - Current year ± number of days;

  *)

  if      SameText(ParamName, '{Date}') then
    Result := DateToStr(Date)
  else if SameText(Copy(ParamName, 1, 13), '{DateIncDays(') then
    Result := DateToStr(Date + ExtractTemplateData('()', ParamName).ToInteger)
  else if SameText(ParamName, '{DateTime}') then
    Result := FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)
 else if SameText(Copy(ParamName, 1, 18), '{DateTimeToFormat(') then
  begin
    DateTime := StrToDate(ParamByName(Format('{%s}', [ExtractTemplateData('{}', ParamName, 2)])));
    Result   := FormatDateTime(LowerCase(ExtractTemplateData('""', ParamName)), DateTime);
  end
  else if SameText(ParamName, '{Day}') then
    Result := FormatDateTime('dd', Now) //IntToStr(DayOf(Date))
  else if SameText(ParamName, '{DayOfTheYear({Date})}') then
    Result := IntToStr(DayOfTheYear(Date))
  else if SameText(ParamName, '{DayOfWeek}') then
    Result := LongDayNames[DayOfWeek(Date)]
  else if SameText(ParamName, '{DayOfWeekNo}') then
    Result := LPad(IntToStr(DayOfWeek(Date)), 2, '0')
  else if SameText(ParamName, '{FirstDay}') then
    Result := DateToStr(EnCodeDate(YearOf(Date), MonthOf(Date), 1))
  else if SameText(Copy(ParamName, 1, 15), '{FirstDayIncMD(') then
  begin
    DateTime := EnCodeDate(YearOf(Date), MonthOf(Date), 1);
    Result   := DateToStr(IncMonth(DateTime, ExtractTemplateData('(,', ParamName).ToInteger) + ExtractTemplateData(',)', ParamName).ToInteger)
  end
  else if SameText(ParamName, '{Hours}') then
    Result := IntToStr(myHour)
  else if SameText(Copy(ParamName, 1, 9), '{IncDays(') then
    Result := LPad(IntToStr(DayOf(Date) + ExtractTemplateData('()', ParamName).ToInteger), 2, '0')
  else if SameText(Copy(ParamName, 1, 11), '{IncMonths(') then
    Result := LPad(IntToStr(MonthOf(Date) + ExtractTemplateData('()', ParamName).ToInteger), 2, '0')
  else if SameText(Copy(ParamName, 1, 10), '{IncYears(') then
    Result := IntToStr(YearOf(Date) + ExtractTemplateData('()', ParamName).ToInteger)
  else if SameText(ParamName, '{LastDay}') then
    Result := DateToStr(EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Date)))
  else if SameText(Copy(ParamName, 1, 13), '{LastDayIncM(') then
  begin
    DateTime := EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Date));
    Result   := DateToStr(IncMonth(DateTime, ExtractTemplateData('()', ParamName).ToInteger))
  end
  else if SameText(ParamName, '{Minutes}') then
    Result := LPad(IntToStr(myMin), 2 , '0')
  else if SameText(ParamName, '{MonthName}') then
    Result := LongMonthNames[MonthOf(Date)]
  else if SameText(ParamName, '{MonthNo}') then
    Result := LPad(IntToStr(MonthOf(Date)), 2, '0')
  else if SameText(ParamName, '{Seconds}') then
    Result := IntToStr(mySec)
  else if SameText(ParamName, '{ShortDayOfWeek}') then
    Result := FormatDateTime('ddd', Now)
  else if SameText(ParamName, '{ShortMonthName}') then
    Result := ShortMonthNames[MonthOf(Date)]
  else if SameText(ParamName, '{ShortYear}') then
    Result := Copy(IntToStr(YearOf(Date)), 3, 2)
  else if SameText(Copy(ParamName, 1, 18), '{ShortYearIncDays(') then
    Result := Copy(IntToStr(YearOf(Date - ExtractTemplateData('()', ParamName).ToInteger)), 3, 2)
  else if SameText(ParamName, '{Time}') then
    Result := FormatDateTime('hh:nn:ss', Now)
  else if SameText(ParamName, '{WeekOfTheYear({Date})}') then
    Result := IntToStr(WeekOfTheYear(Date))
  else if SameText(ParamName, '{Year}') then
    Result := IntToStr(YearOf(Date))
  else if SameText(Copy(ParamName, 1, 13), '{YearIncDays(') then
    Result := IntToStr(YearOf(Date - ExtractTemplateData('()', ParamName).ToInteger));

  // если нет результата возвращаем исходное значение
  if Result = '' then
    Result := ParamName;

end;

initialization
  EnvVariables := TEnvVariables.Create;

finalization
  EnvVariables.Free;

end.

