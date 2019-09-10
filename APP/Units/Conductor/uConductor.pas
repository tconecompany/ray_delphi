{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                      TConductor                       }
{     ��������� ����� � ������ ������� �� � �������     }
{                                                       }
{        ���� ���������: 09.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConductor;

interface

uses
  // odac
  Ora,
  OraSmart,
  // my
  uTypes;

{ TRayConductorMode ������ ���������� }
type
  TRayConductorMode = (cmAppend, cmRead, cmEdit);

{ TConductor }
type
  TConductor = class
    private

      FParams     : TDynParams;                                                 // ������ �������� - �����; ������ � ����� ���� �� �� ����������

      FMode       : TRayConductorMode;
      FAutoCommit : boolean;
      FEditing    : boolean;

      function GetParamMode: TRayConductorMode;
      function GetEditing: boolean;

    public

      FTable      : TOraTable;
      FDataSource : TOraDataSource;

      constructor Create(ATable      : TOraTable;                               // ������� �������
                         ADataSource : TOraDataSource;                          // �������
                         Param       : string);

      procedure Append; virtual;                                                // ��������
      procedure Read; virtual;
      procedure Edit; virtual;                                                  // ��������� � ����� ��������������
      procedure CancelUpdates;                                                  // �������� ����
      procedure ApplyUpdates;                                                   // �������� � ��

      property ParamMode: TRayConductorMode read GetParamMode;                  // ����� �� ���������� ���������
      property Mode: TRayConductorMode read FMode;                              // ������� ����� (������, �������, ��������������, ...)
      property AutoCommit: boolean write FAutoCommit;                           // ������������� ���������
      property Editing: boolean read GetEditing;                                // ��������� � ������ �������������� (��� �������)

  end;

{ StrToConductorMode }

function StrToConductorMode(Str: string): TRayConductorMode;

implementation

uses
  // my
  System.SysUtils,
  uStrUtilsExt;

{ StrToConductorMode }

function StrToConductorMode(Str: string): TRayConductorMode;
begin

  if SameText(Str, 'append') then
    Result := cmAppend
  else if SameText(Str, 'edit') then
    Result := cmEdit
  else
    Result := cmRead;

end;

{ TConductorBase }

constructor TConductor.Create(ATable      : TOraTable;
                              ADataSource : TOraDataSource;
                              Param       : string);
var
  i: integer;
begin

  if Param = '' then
    raise Exception.Create('�������� ��� ���������� �� �����!');

  // ��������� ��������
  FTable      := ATable;
  FDataSource := ADataSource;
  FParams     := StrToDynParams(Param);

  // ������������ ��������
  FTable.CachedUpdates := True;

  // ��������� �������
  FTable.Open;

  // �������� ����-������ �� ���������� (�������� �������� mode � ����� �������)
  for i := 0 to High(FParams) do
    if not SameText(FParams[i].Name, 'mode') then
      FTable.Filter := FTable.Filter + FParams[i].Name + '=' + FParams[i].Value + ' AND';

  // ������� ��������� AND
  if FTable.Filter <> '' then
  begin
    FTable.Filter   := Copy(FTable.Filter, 1, Length(FTable.Filter) - 4);
    FTable.Filtered := True;
  end;

  // ����� ������ ����������
  case ParamMode of
    cmAppend : Append;
    cmRead   : Read;
    cmEdit   : Edit;
  end;

end;

function TConductor.GetParamMode: TRayConductorMode;
begin
  Result := StrToConductorMode(GetDynValues(FParams, 'mode'))
end;

function TConductor.GetEditing: boolean;
begin

  if FMode in [cmEdit, cmAppend] then
    Result := True
  else
    Result := False;

end;

procedure TConductor.Append;
begin

  FTable.Append;
  FDataSource.AutoEdit := True;
  FMode := cmAppend;

end;


procedure TConductor.Read;
begin

  FDataSource.AutoEdit := False;
  FMode := cmRead;

end;

procedure TConductor.Edit;
begin

  FTable.Edit;
  FDataSource.AutoEdit := True;
  FMode := cmEdit;

end;

procedure TConductor.CancelUpdates;
begin

  FTable.CancelUpdates;

  Read();

end;

procedure TConductor.ApplyUpdates;
begin

  try
    FTable.ApplyUpdates;
    FTable.CommitUpdates;
    Read();
  except
    on E:Exception do
    begin
      Edit();
      raise Exception.Create(E.Message);
    end;
  end;

end;

end.

