{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    uNumberInWords                     }
{                    ����� ��������                     }
{                                                       }
{        ���� ���������: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uNumberInWords;

interface

{ TLang }
type
  TLang = (lRU_GRN, lUA_GRN, lRU_RUB, lRU_EURO, lRU_USD);

{ NumberInWords }

function NumberInWords(Value: double; Lang: TLang=lRU_GRN): string;

implementation

uses
 SysUtils,
 Classes;

{ NumberInWords }

function NumberInWords(Value: double; Lang: TLang=lRU_GRN): string;
type
  TDigLevel = (dlNone, dlThousand, dlMillion, dlBillion);
var
  sList : TStringList;
  s     : string;
  i     : integer;
  i64   : int64;

const
  LANG_RU_GRN: array[0..9] of PChar = (
    'One=����;���;���;������;����;�����;����;������;������;����;���;����',
    'Ten=������;�����������;����������;����������;������������;����������;�����������;����������;������������;������������',
    'Twen=��������;��������;�����;���������;����������;���������;�����������;���������',
    'Hndr=���;������;������;���������;�������;��������;�������;���������;���������',
    'Thou=������;������;�����',
    'Mill=�������;��������;���������',
    'Bill=��������;���������;����������',
    'Thrill=��������;���������;����������',
    'Currency=������;������;�������',
    'Penny=�������;�������;������');

const
  LANG_RU_RUB: array[0..9] of PChar = (
    'One=����;���;���;������;����;�����;����;������;������;����;���;����',
    'Ten=������;�����������;����������;����������;������������;����������;�����������;����������;������������;������������',
    'Twen=��������;��������;�����;���������;����������;���������;�����������;���������',
    'Hndr=���;������;������;���������;�������;��������;�������;���������;���������',
    'Thou=������;������;�����',
    'Mill=�������;��������;���������',
    'Bill=��������;���������;����������',
    'Thrill=��������;���������;����������',
    'Currency=�����;�����;������',
    'Penny=�������;�������;������');

const
  LANG_RU_EURO: array[0..9] of PChar = (
    'One=����;���;���;������;����;�����;����;������;������;����;���;����',
    'Ten=������;�����������;����������;����������;������������;����������;�����������;����������;������������;������������',
    'Twen=��������;��������;�����;���������;����������;���������;�����������;���������',
    'Hndr=���;������;������;���������;�������;��������;�������;���������;���������',
    'Thou=������;������;�����',
    'Mill=�������;��������;���������',
    'Bill=��������;���������;����������',
    'Thrill=��������;���������;����������',
    'Currency=����;����;����',
    'Penny=����;�����;������');

const
  LANG_RU_USD: array[0..9] of PChar = (
    'One=����;���;���;������;����;�����;����;������;������;����;���;����',
    'Ten=������;�����������;����������;����������;������������;����������;�����������;����������;������������;������������',
    'Twen=��������;��������;�����;���������;����������;���������;�����������;���������',
    'Hndr=���;������;������;���������;�������;��������;�������;���������;���������',
    'Thou=������;������;�����',
    'Mill=�������;��������;���������',
    'Bill=��������;���������;����������',
    'Thrill=��������;���������;����������',
    'Currency=������;�������;��������',
    'Penny=����;�����;������');

const
  LANG_UA_GRN: array[0..9] of PChar = (
    'One=����;���;���;������;����;�i���;�i�;�i�i�;������;����;��i;����',
    'Ten=������;����������;����������;����������;������������;����������;�i���������;�i��������;�i�i��������;������������',
    'Twen=��������;��������;�����;��������;�i�������;�i������;�i�i������;���������',
    'Hndr=���;��i��i;������;���������;������;�i�����;�i����;�i�i����;��������',
    'Thou=������;�����i;�����',
    'Mill=�i�����;�i������;�i�����i�',
    'Bill=�i�����;�i������;�i�����i�',
    'Currency=������;�����i;�������',
    'CurrencyMale=0',
    'Penny=���i���;���i���;���i���');

  //
  function GetValue(Name: string; Count: Integer): string;
  var
    s         : string;
    i, p1, p2 : integer;
  begin
    s := sList.Values[Name];
    if Length(s) > 0 then
    begin
      i := 1;
      p1 := Pos(';', s);
      while (i < Count) and (p1 > 0) do
      begin
        s := Copy(s, p1 + 1, 255);
        p1 := Pos(';', s);
        Inc(i);
      end;
      if i = Count then
      begin
        p2 := Pos(';', s);
        if p2 > 0 then s := Copy(S, 1, p2 - 1);
        s := Concat(Trim(s), ' ');
      end
      else
        s := EmptyStr;
    end;
    Result := s;
  end;

  //
  function NumToStr(Num: Cardinal; DigLevel: TDigLevel): string;
  const
    DigLevelNames: array[TDigLevel] of PChar = ('', 'Thou', 'Mill', 'Bill');
  var
    Male: Boolean;
  begin
    case DigLevel of
      dlThousand           : Male := False;
      dlMillion, dlBillion : Male := True;
    end;
    if (Num = 0) and (DigLevel <> dlNone) then
    begin
      Result := EmptyStr;
      Exit;
    end;
    Result := GetValue('Hndr', Num div 100);
    Num := Num mod 100;
    if Num >= 20 then
    begin
      Result := Result + GetValue('Twen', Num div 10 - 1);
      Num := Num mod 10;
    end;
    if Num >= 10 then
      Result := Result + GetValue('Ten', Num - 10 + 1)
    else
    begin
      if     (Num in [1, 2])
         and not Male
      then
        Result := Result + GetValue('One', Num + 10 - 1)
      else
        Result := Result + GetValue('One', Num);
    end;
    if DigLevel = dlNone then // ��������� ������
      case Num of
        1    : Result := Result + GetValue('Currency', 1);
        2..4 : Result := Result + GetValue('Currency', 2);
        else
          Result := Result + GetValue('Currency', 3);
      end
    else // ��� �������
      case Num of
        1    : Result := Result + GetValue(DigLevelNames[DigLevel], 1);
        2..4 : Result := Result + GetValue(DigLevelNames[DigLevel], 2);
        else
          Result := Result + GetValue(DigLevelNames[DigLevel], 3);
      end;
  end;

begin

  if Value < 0 then
    raise Exception.Create('������� "NumberInWords" �� �������� � �������������� �������');
  sList := TStringList.Create;

  for i := 0 to 9 do
    case Lang of
      lRU_GRN  : sList.Add(LANG_RU_GRN[i]);
      lUA_GRN  : sList.Add(LANG_UA_GRN[i]);
      lRU_RUB  : sList.Add(LANG_RU_RUB[i]);
      lRU_EURO : sList.Add(LANG_RU_EURO[i]);
      lRU_USD  : sList.Add(LANG_RU_USD[i]);
    end;

  i64 := Trunc(Value);

  if i64 = 0 then s := GetValue('One', 12)
  else
  begin
    s   := NumToStr(Trunc(i64 / 1E+9), dlBillion);
    i64 := i64 mod Trunc(1E+9);
    s   := s + NumToStr(Trunc(i64 / 1E+6), dlMillion);
    i64 := i64 mod Trunc(1E+6);
    s   := s + NumToStr(Trunc(i64 / 1E+3), dlThousand);
    i64 := i64 mod 1000;
  end;

  s := s + NumToStr(i64, dlNone); // ������ ��������

  // ���������� �������
  if Length(Trim(GetValue('Penny', 1))) > 0  then
  begin
    i64 := Round((Value - Trunc(Value)) * 100);
    s := Trim(s) + ',' + ' ' + FormatFloat('00 ', i64);
    if i64 > 20 then i64 := i64 mod 10;
    case i64 of
      1    : s := s + GetValue('Penny', 1);
      2..4 : s := s + GetValue('Penny', 2);
      else
        s := s + GetValue('Penny', 3);
    end;
  end;

  Result := Trim(Concat(AnsiUpperCase(Copy(s, 1, 1)), Copy(s, 2, 255)));

  sList.Free;

end;

end.
