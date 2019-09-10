{*******************************************************}
{                                                       }
{                       Ray 1.0                         }
{                                                       }
{                       TTRDoc                          }
{                      Документ                         }
{                                                       }
{        Дата изменения: 20.07.2019 (Build 1.0.01)      }
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
    FtDOC           : TOraTable;                                                // ссылка на таблицу Документа
    FParamDocID     : integer;
    FParamDocTypeID : integer;
    DocTypeName     : string;                                                   // названия типа документа
    function GetNumberGeneration: integer;
    procedure SetParamDocTypeID(TypeID: integer);
  public

    property ParamDocID: integer read FParamDocID;                              // параметр ид документа. считывается с RegForms
    property ParamDocTypeID: integer read FParamDocTypeID                       // параметр ид типа документа. считывается с RegForms
                                     write SetParamDocTypeID;
    property NumberGeneration: integer read GetNumberGeneration;                // генерация нового номера документа по типу

    constructor Create(AtDOC: TOraTable; Params: string);

    procedure New;                                                              // создания нового документа
    procedure Read;                                                             // чтение документа по ParamDocID
    procedure Edit;                                                             // перевести документ в режим редактирования
    procedure Save(UserID: integer);                                            // сохранить документ
    procedure SaveEd(UserID: integer);                                          // сохранить документ и перевести в режим редактирования

    function GetTitle(NumDoc  : integer;                                        // формирует названия документа по типу
                      DateDoc : TDateTime;
                      Marker  : boolean): string;
    //procedure Acc;                                                            // учет документа
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

  // начальные параметры документа
  FParamDocID    := GetValues(Params, 'doc_id', '0').ToInteger;
  ParamDocTypeID := GetValues(Params, 'doc_type_id', '0').ToInteger;

end;

procedure TTRDoc.SetParamDocTypeID(TypeID: integer);
var
  qOper: TOraQuery;
begin

  FParamDocTypeID := TypeID;

  // название типа документа по параметру
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

  // включаем фильтр
  FtDOC.Filter := 'doc_id = ' + ParamDocID.ToString;

  // пересохраняем в параметр
  ParamDocTypeID := FtDOC.FieldByName('doc_type_id').AsInteger;

  // режим редактирования при 0 статусе
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

  // генерируем номер документа по его типу на момент сохранения
  if FtDOC.FieldByName('num_doc').AsInteger = 0 then
  begin
    FtDOC.FieldByName('num_doc').AsInteger        := NumberGeneration;
    FtDOC.FieldByName('create_user_id').AsInteger := UserID;
    FtDOC.FieldByName('create_date').AsDateTime   := Now;
    // подписываем вкладку на форме
    Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2);
  end
  else // обновление
  begin
    FtDOC.FieldByName('update_user_id').AsInteger := UserID;
    FtDOC.FieldByName('update_date').AsDateTime   := Now;
  end;

  // сохраняем в бд
  FtDOC.Post;

end;

procedure TTRDoc.SaveEd(UserID: integer);
begin
  // сохраняем
  Save(UserID);
  // переводим в режим редактирования при 0 статусе
  Edit();
end;

function TTRDoc.GetNumberGeneration: integer;
begin

  // генерация номеров документов
  Result := Random(7777);

end;

function TTRDoc.GetTitle(NumDoc  : integer;
                         DateDoc : TDateTime;
                         Marker  : boolean): string;
begin

  // номер документа
  if NumDoc = 0 then
    Result := '(создается)'
  else
    Result := NumDoc.ToString;

  Result := Format('%s № %s от %s', [DocTypeName, Result, DateToStr(DateDoc)]);

  if Marker then Result := Result + ' *';

end;

end.

