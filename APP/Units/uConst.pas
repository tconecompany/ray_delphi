{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                         uConst                        }
{                ����� ���������� ��������              }
{                                                       }
{        ���� ���������: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConst;

interface

uses
  Winapi.Messages;

// ������ ��������
const
  // message
  WM_AFTER_CREATE   = WM_USER + 100;                                            // ��������� ��� �����������
  WM_MAIN_MDI_CHILD = WM_USER + 101;                                            // ��������� ��� ������ � ��������� ������� ��� ������� (��������, �������...)
  WM_FORM_PRINT     = WM_USER + 102;                                            // ������ �����
  WM_DB_POST        = WM_USER + 103;                                            // ������� post ��� ���� �������������� ����������

  // ��������� ���������� ������
  COLOR_BLACK           = $0011181B;                                            // ������
  COLOR_RED             = $000000D4;                                            // �������
  COLOR_BLUE            = $00B24A32;                                            // �����
  COLOR_GREEN           = $0025BC3C;                                            // �������
  COLOR_YELLOW          = $000091F0;                                            // ������
  COLOR_GREY            = $00A4A0A0;                                            // �����
  COLOR_GRID_SECTION    = $00E2B48D;                                            // ���� ������ �����-�����
  COLOR_GRID_SUBSECTION = $00F1D9C5;                                            // ���� ��������� �����-�����
  COLOR_TRADE           = $00FF9428;                                            // ���� ����� ��� ������ Trade
  COLOR_ACC             = $00141414;                                            // ���� ����� ��� ������ Acc
  COLOR_FIN             = $0078AC1C;                                            // ���� ����� ��� ������ Fin
  COLOR_CASHBOX         = $009AD5FF;                                            // ���� ����� ��� ������ CB
  COLOR_TRE             = $006DDBFD;                                            // ���� ����� ��� ������ Tre
  COLOR_BUDG            = $00983E7F;                                            // ���� ����� ��� ������ TRE
  COLOR_PROD            = $00983E7F;                                            // ���� ����� ��� ������ Prod
  COLOR_ADMIN           = $00D893BA;                                            // ���� ����� ��� ������ Adm

  // LongDayNames - ��������� ������ ������������ �������
  LongDayNames: array[0..7] of PChar = (
    '',
    '�����������',
    '�����������',
    '�������',
    '�����',
    '�������',
    '�������',
    '�������');

  // LongMonthNames - ��������� ������ ������������ �������
  LongMonthNames: array[0..12] of PChar = (
    '', '������', '�������', '����', '������', '���', '����', '����', '������',
    '��������', '�������', '������', '�������');

  // ShortMonthNames - ��������� ������ ������������ �������
  ShortMonthNames: array[0..12] of PChar = (
    '', '���.', '���.', '���.', '���.', '���', '���.', '���.', '���.',
    '���.', '���.', '���.', '���.');

function StrToColor(Color: string; Def: integer=COLOR_BLACK): integer;       // �������� ����� ����� �� ����� ���������

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

