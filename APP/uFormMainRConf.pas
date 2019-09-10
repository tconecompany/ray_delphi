{*******************************************************}
{                                                       }
{                     Repository                        }
{                                                       }
{                     TFormMainRConf                    }
{                  Конструктор репозитория              }
{                                                       }
{        Дата изменения: 01.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormMainRConf;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Actions, Vcl.ActnList, Vcl.Mask, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.DBCtrls,
  // odac
  Data.DB, DBAccess, Ora, MemDS, OraSmart,
  // ehlib
  DBCtrlsEh, DBGridEh, DBLookupEh,
  // tms
  AdvMemo, Advmxml;

{ TFormMainRConf }

type
  TFormMainRConf = class(TForm)
    XMLMemoStyler: TAdvXMLMemoStyler;
    ActionList: TActionList;
    ActionPost: TAction;
    ActionCancel: TAction;
    ActionAppend: TAction;
    ActionExit: TAction;
    ActionSaveToFile: TAction;
    ActionOpenFile: TAction;
    tMasterMODULE: TOraTable;
    tREPOSITORY: TOraTable;
    dsREPOSITORY: TOraDataSource;
    dsMasterMODULE: TOraDataSource;
    pLeft: TPanel;
    pMain: TPanel;
    pTop: TPanel;
    lXMLConf: TLabel;
    fRepositoryID: TDBEditEh;
    fSignature: TDBEditEh;
    fParam: TDBEditEh;
    fSignActivity: TDBCheckBoxEh;
    fDescribe: TDBEditEh;
    fSignOneCopy: TDBCheckBoxEh;
    fModuleID: TDBLookupComboboxEh;
    fActionID: TDBLookupComboboxEh;
    pBottom: TPanel;
    bPost: TBitBtn;
    bCancel: TBitBtn;
    bOpenFile: TBitBtn;
    bSaveToFile: TBitBtn;
    Memo: TAdvMemo;
    ToolBar: TToolBar;
    tbReflesh: TToolButton;
    tbDelete: TToolButton;
    tbExit: TToolButton;
    ToolButton3: TToolButton;
    lcModule: TDBLookupComboboxEh;
    tbAppend: TToolButton;
    ToolButton5: TToolButton;
    ActionDelete: TAction;
    ActionReflesh: TAction;
    ListBox: TDBLookupListBox;
    qDetailREPOSITORY: TOraQuery;
    dsDetailREPOSITORY: TOraDataSource;
    qDetailREPOSITORYREPOSITORY_ID: TFloatField;
    qDetailREPOSITORYMODULE_ID: TFloatField;
    qDetailREPOSITORYREPOSITORY_VAL: TStringField;
    tMasterMODULEMODULE_ID: TFloatField;
    tMasterMODULESIGNATURE: TStringField;
    tMasterMODULESIGNATURE_SHORT: TStringField;
    tMasterMODULEICO: TStringField;
    tMasterMODULEXML_CONF: TOraXMLField;
    tMasterMODULESIGN_ACTIVITY: TIntegerField;
    BitBtn1: TBitBtn;
    ActionDemo: TAction;
    tREPOSITORYREPOSITORY_ID: TFloatField;
    tREPOSITORYACTION_ID: TFloatField;
    tREPOSITORYSIGNATURE: TStringField;
    tREPOSITORYMODULE_ID: TFloatField;
    tREPOSITORYDESCRIBE: TStringField;
    tREPOSITORYSIGN_ONE_COPY: TIntegerField;
    tREPOSITORYXML_CONF: TOraXMLField;
    tREPOSITORYSIGN_ACTIVITY: TIntegerField;
    tREPOSITORYPARAM: TStringField;
    Splitter1: TSplitter;
    Label1: TLabel;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionAppendExecute(Sender: TObject);
    procedure ActionPostExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcModuleChange(Sender: TObject);
    procedure ListBoxDblClick(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure dsREPOSITORYDataChange(Sender: TObject; Field: TField);
    procedure ActionRefleshExecute(Sender: TObject);
    procedure ActionSaveToFileExecute(Sender: TObject);
    procedure ActionOpenFileExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionDemoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fModuleIDEditButtons0Click(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }

    procedure Init(RepositoryID: integer);

  public
    { Public declarations }
  end;

var
  FormMainRConf: TFormMainRConf;

implementation

{$R *.dfm}

uses
  // my
  uDataModuleRay,
  uDataModuleImages,
  uUser,
  uFormDebug;

{ TFormMainRConf }

procedure TFormMainRConf.FormCreate(Sender: TObject);
var
  StringList: TStringList;
begin

  DataModuleRay.ActivateDataSets();

  //
  tMasterMODULE.Active     := True;
  qDetailREPOSITORY.Active := True;
  tREPOSITORY.Active       := True;

  //
  if FileExists('rconf.dat') then
  begin
    StringList := TStringList.Create;
    StringList.LoadFromFile('rconf.dat');
    lcModule.Value := StringList.Values['module_id'].ToInteger;
    ListBox.KeyValue := StringList.Values['repository_id'].ToInteger;
    Init(StringList.Values['repository_id'].ToInteger);
    StringList.Free;
  end
  else
    Init(qDetailREPOSITORY.FieldValues['repository_id']);

end;

procedure TFormMainRConf.FormDestroy(Sender: TObject);
var
  StringList: TStringList;
begin

  StringList := TStringList.Create;
  StringList.Add('module_id=' + string(fModuleID.Value));
  StringList.Add('repository_id=' + fRepositoryID.Text);
  StringList.SaveToFile('rconf.dat');
  StringList.Free;

end;

procedure TFormMainRConf.Init(RepositoryID: integer);
begin

  tREPOSITORY.Cancel;
  tREPOSITORY.Filter := 'repository_id = ' + RepositoRyID.ToString;
  tREPOSITORY.Edit;

  Memo.Lines.Text := TOraXMLField(tREPOSITORY.FieldByName('xml_conf')).AsString;

end;

procedure TFormMainRConf.ActionAppendExecute(Sender: TObject);
begin

  tREPOSITORY.Append;

  Memo.Lines.Clear;

end;

procedure TFormMainRConf.ActionRefleshExecute(Sender: TObject);
begin
  qDetailREPOSITORY.Refresh;
end;

procedure TFormMainRConf.ActionOpenFileExecute(Sender: TObject);
var
  s: string;
begin

  if PromptForFileName(s, 'XML файл|*.xml', 'xml', '', '') then
    Memo.Lines.LoadFromFile(s);

end;

procedure TFormMainRConf.ActionSaveToFileExecute(Sender: TObject);
var
  s: string;
begin

  s := Format('# %s %s. %s', [fRepositoryID.Text, fModuleID.Text, fDescribe.Text]);

  s := StringReplace(s, '"', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, ':', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, '\', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, '/', '_', [rfReplaceAll, rfIgnoreCase]);

  if PromptForFileName(s, 'XML файл|*.xml', 'xml', '', '', True) then
    Memo.Lines.SaveToFile(s);

end;

procedure TFormMainRConf.dsREPOSITORYDataChange(Sender: TObject;
  Field: TField);
begin

  ActionPost.Enabled   := True;
  ActionCancel.Enabled := True;

end;

procedure TFormMainRConf.lcModuleChange(Sender: TObject);
begin

  if Self.Visible then
  begin
    ListBox.SetFocus;
    ListBox.KeyValue := qDetailREPOSITORY.FieldValues['repository_id'];
  end;

end;

procedure TFormMainRConf.ListBoxDblClick(Sender: TObject);
begin
  Init(qDetailREPOSITORY.FieldValues['repository_id']);
end;

procedure TFormMainRConf.MemoChange(Sender: TObject);
begin
  ActionPost.Enabled := True;
end;

procedure TFormMainRConf.ActionPostExecute(Sender: TObject);
begin

  TOraXMLField(tREPOSITORY.FieldByName('xml_conf')).AsString := Memo.Lines.Text;

  try
    tREPOSITORY.Post;
    tREPOSITORY.Edit;
  except
    on E:Exception do
    begin
      tREPOSITORY.Edit;
      raise Exception.Create(E.Message);
    end;
  end;

  ActionPost.Enabled := False;

end;

procedure TFormMainRConf.ActionCancelExecute(Sender: TObject);
begin

  tREPOSITORY.Cancel;
  tREPOSITORY.Edit;

  ActionCancel.Enabled := False;

end;

procedure TFormMainRConf.ActionDeleteExecute(Sender: TObject);
begin

  if MessageDlg('Удалить репозиторий # ' + qDetailREPOSITORY.FieldByName('repository_id').AsString + '?',
                mtWarning, [mbYes, mbNo],
                0) = mrYes
  then
    qDetailREPOSITORY.Delete;

end;

procedure TFormMainRConf.ActionDemoExecute(Sender: TObject);
var
  StringList: TStringList;
begin

  StringList := TStringList.Create;
  StringList.LoadFromFile('patterns\rconf_demo.xml');

  ShowDebug(StringList.Text, 'Демо', 'XML конфигурация', 1100, 700);

  StringList.Free;

end;

procedure TFormMainRConf.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMainRConf.fModuleIDEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  ws: WideString;
begin

  ws := User.LoadModuleConf(tREPOSITORY.FieldByName('module_id').AsInteger);

  ShowDebug(ws, 'Модуль', 'XML конфигурация', 1100, 700);

end;

end.
