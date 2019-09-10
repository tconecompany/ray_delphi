{*******************************************************}
{                                                       }
{                       Ray 1.0                         }
{                                                       }
{                       TTRDoc                          }
{                      ��������                         }
{                                                       }
{        ���� ���������: 20.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}


unit uTradeDoc;

interface

uses
  // odac
  OraSmart, Ora;

// TTRDoc
type
  TTRDoc = class
  private
    FtDOC           : TOraTable;                                                // ������ �� ������� ���������
    FParamDocID     : integer;
    FParamDocTypeID : integer;
    DocTypeName     : string;                                                   // �������� ���� ���������
    function GetNumberGeneration: integer;
    procedure SetParamDocTypeID(TypeID: integer);
  public

    property ParamDocID: integer read FParamDocID;                              // �������� �� ���������. ����������� � RegForms
    property ParamDocTypeID: integer read FParamDocTypeID                       // �������� �� ���� ���������. ����������� � RegForms
                                     write SetParamDocTypeID;
    property NumberGeneration: integer read GetNumberGeneration;                // ��������� ������ ������ ��������� �� ����

    constructor Create(AtDOC: TOraTable; Params: string);

    procedure New;                                                              // �������� ������ ���������
    procedure Read;                                                             // ������ ��������� �� ParamDocID
    procedure Edit;                                                             // ��������� �������� � ����� ��������������
    procedure Save(UserID: integer);                                            // ��������� ��������
    procedure SaveEd(UserID: integer);                                          // ��������� �������� � ��������� � ����� ��������������

    function GetTitle(NumDoc  : integer;                                        // ��������� �������� ��������� �� ����
                      DateDoc : TDateTime;
                      Marker  : boolean): string;
    //procedure Acc;                                                            // ���� ���������
  end;

implementation

uses
  // sys
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  DateUtils,
  // my
  uDataModuleRay,
  uStrUtilsExt,
  uConst;

{ TTRDoc }

constructor TTRDoc.Create(AtDOC: TOraTable; Params: string);
begin

  FtDOC := AtDOC;

  // ��������� ��������� ���������
  FParamDocID    := GetValues(Params, 'doc_id', '0').ToInteger;
  ParamDocTypeID := GetValues(Params, 'doc_type_id', '0').ToInteger;

end;

procedure TTRDoc.SetParamDocTypeID(TypeID: integer);
var
  qOper: TOraQuery;
begin

  FParamDocTypeID := TypeID;

  // �������� ���� ��������� �� ���������
  qOper := TOraQuery.Create(nil);
  qOper.Session := DataModuleRay.OraSession;

  try

    qOper.SQL.Text := 'SELECT ddt.name FROM TRADE.DICT_DOC_TYPE ddt WHERE ddt.doc_type_id = :pDocTypeID';
    qOper.ParamByName('pDocTypeID').AsInteger := TypeID;
    qOper.Open;

    DocTypeName := qOper.FieldByName('name').AsString;

  finally
    qOper.Close;
    FreeAndNil(qOper);
  end;

end;

procedure TTRDoc.New;
begin
  FtDOC.DisableControls;
  FtDOC.Append;
  FtDOC.FieldByName('doc_type_id').AsInteger := ParamDocTypeID;
  FtDOC.EnableControls;
end;

procedure TTRDoc.Read;
begin

  FtDOC.DisableControls;

  // �������� ������
  FtDOC.Filter := 'doc_id = ' + ParamDocID.ToString;

  // ������������� � ��������
  ParamDocTypeID := FtDOC.FieldByName('doc_type_id').AsInteger;

  // ����� �������������� ��� 0 �������
  Edit();

  FtDOC.EnableControls;

end;

procedure TTRDoc.Edit;
begin
  if FtDOC.FieldByName('status_id').AsInteger = 0 then
    FtDOC.Edit;
end;

procedure TTRDoc.Save(UserID: integer);
begin

  // ���������� ����� ��������� �� ��� ���� �� ������ ����������
  if FtDOC.FieldByName('num_doc').AsInteger = 0 then
  begin
    FtDOC.FieldByName('num_doc').AsInteger        := NumberGeneration;
    FtDOC.FieldByName('create_user_id').AsInteger := UserID;
    FtDOC.FieldByName('create_date').AsDateTime   := Now;
    // ����������� ������� �� �����
    Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2);
  end
  else // ����������
  begin
    FtDOC.FieldByName('update_user_id').AsInteger := UserID;
    FtDOC.FieldByName('update_date').AsDateTime   := Now;
  end;

  // ��������� � ��
  FtDOC.Post;

end;

procedure TTRDoc.SaveEd(UserID: integer);
begin
  // ���������
  Save(UserID);
  // ��������� � ����� �������������� ��� 0 �������
  Edit();
end;

function TTRDoc.GetNumberGeneration: integer;
begin

  // ��������� ������� ����������
  Result := Random(7777);

end;

function TTRDoc.GetTitle(NumDoc  : integer;
                         DateDoc : TDateTime;
                         Marker  : boolean): string;
begin

  // ����� ���������
  if NumDoc = 0 then
    Result := '(���������)'
  else
    Result := NumDoc.ToString;

  Result := Format('%s � %s �� %s', [DocTypeName, Result, DateToStr(DateDoc)]);

  if Marker then Result := Result + ' *';

end;

end.

