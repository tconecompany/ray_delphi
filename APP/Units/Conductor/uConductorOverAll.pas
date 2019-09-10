{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                   TConductorOverAll                   }
{     ��������� ����� � ������ ������� �� � �������     }
{                                                       }
{        ���� ���������: 05.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConductorOverAll;

interface

uses
  // sys
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  // odac
  Ora,
  OraSmart,
  // my
  uConductor,
  uTypes;

{ TConductorOverAll }

type
  TConductorOverAll = class(TConductor)
    private

      FForm            : TForm;
      FTitleLabel      : TLabel;
      FTitleCapInitial : string;
      FTitleField      : string;
      FTitlePrefix     : char;
      FDateOfOperField : string;
      FMarkerDateTitle : boolean;

      procedure SetTitleField(TitleField: string);
      procedure SetTitlePrefix(TitlePrefix: char);

    public

      constructor Create(AForm       : TForm;                                   // ����� �����
                         ATable      : TOraTable;                               // �������
                         ADataSource : TOraDataSource;                          // �������
                         Param       : string;                                  // ��������� �����
                         ATitle      : TLabel);                                 // ��������� �����

      procedure RefleshTitle;                                                   // �������� ���������

      procedure Append; override;                                               // ��������
      procedure Read; override;
      procedure Edit; override;                                                 // ��������� � ����� ��������������

      property TitleField: string write SetTitleField;                          // ��� ���� �����/����/������������� ������
      property TitlePrefix: char write SetTitlePrefix;                          //
      property MarkerDateTitle: boolean write FMarkerDateTitle;                 // �������� ���� � ���������
      property DateOfOperField: string write FDateOfOperField;                  // ��� ���� ������� �������� �� ���� ���������/��������

  end;

implementation

uses
  // sys
  SysUtils,
  Vcl.Graphics,
  // my
  uStrUtilsExt,
  uConst;

{ TConductorOverAll }

constructor TConductorOverAll.Create(AForm       : TForm;
                                     ATable      : TOraTable;
                                     ADataSource : TOraDataSource;
                                     Param       : string;
                                     ATitle      : TLabel);
begin

  FForm            := AForm;
  FTitleLabel      := ATitle;
  FTitleCapInitial := ATitle.Caption;
  FTitlePrefix     := '�';
  MarkerDateTitle  := False;

  inherited Create(ATable, ADataSource, Param);

end;

procedure TConductorOverAll.RefleshTitle;
var
  s: string;
begin

  s := FTitleCapInitial;

  // ������ ������ * ��� �������������� ��� ��������
  if Editing then
    s := '*' + s;

  // ���������� �����
  if     (Mode <> cmAppend)
     and (FTitleField <> '')
  then
    case FTitlePrefix of
      '�' : s := s + ' � ' + FTable.FieldByName(FTitleField).AsString;
      '"' : s := s + ' "' + FTable.FieldByName(FTitleField).AsString + '"';
    end;

  // ���������� ����
  if FMarkerDateTitle then
    if FDateOfOperField <> '' then
      s := FTitleCapInitial  + ' �� ' + FTable.FieldByName(FDateOfOperField).AsString
    else
      s := FTitleCapInitial  + ' �� ' + DateToStr(Date);

  // ���������� ��������� "���������/�������������"
  case Mode of
    cmAppend : s := s + ' (���������)';
    cmEdit   : s := s + ' (�������������)';
  end;

  //
  FForm.Caption       := s;
  FTitleLabel.Caption := s;

  // ����������� ������� �� ����� � ������ ������
  Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2);

end;

procedure TConductorOverAll.Append;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_new.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.Read;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_read.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.Edit;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_edit.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.SetTitleField(TitleField: string);
begin

  FTitleField := TitleField;

  RefleshTitle();

end;


procedure TConductorOverAll.SetTitlePrefix(TitlePrefix: char);
begin

  FTitlePrefix := TitlePrefix;

  RefleshTitle();

end;

end.

