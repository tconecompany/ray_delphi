{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                        uTypes                         }
{           ������ ����� ��������������� �����          }
{                                                       }
{        ���� ���������: 21.08.2019 (Build 1.0.01)      }
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
    Name              : string;                                                 // ��� ���������
    Type_             : TFieldType;                                             // ��� ���������
    Value             : Variant;                                                // �������� ���������
    Size              : word;                                                   // ������ ������
    DefaultExpression : string;                                                 // �������� ��-���������
    Achmenttement     : string;                                                 // ��������
  end;

{ TRayKeyValue }

type
  TRayKeyValue = record
    Key   : variant;
    Value : variant;
  end;

{ ������������ }

type
  TDynStrings   = array of string;                                              // ������������ ����� �����
  TDynNumbers   = array of integer;                                             // ������������ ����� �����
  TDynBooleans  = array of boolean;                                             // ������������ ����� ������� ��������
  TDynParams    = array of TRayParam;                                           // ������������ ����� ����������
  TRayKeyValues = array of TRayKeyValue;                                        // ������������ ����� ����������

{ TRayShowMode ������ �������� ����� }

type
  TRayShowMode = (smChild, smModal);

{ TRecPickItem }

type
  TRecPickItem = record
    Caption      : string;                                                      // ������� ���������� � ��������
    LookupItemID : string;                                                      // ��� ����������
    Control      : string;                                                      // ��� �������� (�����, ������, ���� ...)
    Condition    : string;                                                      // ������� � ��������� sql
    Keys         : string;                                                      // ����� ��� ������������ �������
    Items        : string;                                                      // ������� ��� ������������ �������
    SQLUnitID    : string;
    SQLUnit      : string;
    MultiSelect  : boolean;                                                     // ������-�����
    Color        : string;                                                      // ���� ������
    Hint         : string;                                                      // ��������� ��� ����������
  end;

{ TRecPick }

type
  PRecPick = ^TRecPick;
  TRecPick = record
    Caption    : string;                                                        // ��������� ����� ������
    WidthKey   : integer;                                                       // ������ �������� ������� ����������
    WidthValue : integer;                                                       // ������ �������� ������� ����������
    Checked    : boolean;                                                       // ��������� ������ ��� �������� ����� ������
    Items      : array of TRecPickItem;                                         // �������� ����������
  end;

// TPopupMessageKind ������� ���������
//type
//  TPopupMessageKind = (pmkGeneral, pmkPriority);

function StrToFieldType(Str: string): TFieldType;                               // ��������������� ��������� ����� ������ � DB
function FieldTypeToStr(FieldType: TFieldType): string;                         // ... ��������

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

