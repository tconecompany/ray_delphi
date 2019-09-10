{*******************************************************}
{                                                       }
{                     Repository                        }
{                                                       }
{                    TFormMainMConf                     }
{                  Конструктор модулей                  }
{                                                       }
{        Дата изменения: 01.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormMainMConf;

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

{ TFormMainRepConf }

type
  TFormMainMConf = class(TForm)
    XMLMemoStyler: TAdvXMLMemoStyler;
    ActionList: TActionList;
    ActionPost: TAction;
    ActionCancel: TAction;
    ActionAppend: TAction;
    ActionExit: TAction;
    ActionSaveToFile: TAction;
    ActionOpenFile: TAction;
    tMODULE: TOraTable;
    dsMODULE: TOraDataSource;
    pLeft: TPanel;
    pMain: TPanel;
    pBottom: TPanel;
    bPost: TBitBtn;
    bOpenFile: TBitBtn;
    bSaveToFile: TBitBtn;
    Memo: TAdvMemo;
    ToolBar: TToolBar;
    tbReflesh: TToolButton;
    tbDelete: TToolButton;
    tbExit: TToolButton;
    ToolButton3: TToolButton;
    tbAppend: TToolButton;
    ToolButton5: TToolButton;
    ActionDelete: TAction;
    ActionReflesh: TAction;
    ListBox: TDBLookupListBox;
    tMODULEMODULE_ID: TFloatField;
    tMODULESIGNATURE: TStringField;
    tMODULESIGNATURE_SHORT: TStringField;
    tMODULEICO: TStringField;
    tMODULEXML_CONF: TOraXMLField;
    tMODULESIGN_ACTIVITY: TIntegerField;
    BitBtn1: TBitBtn;
    ActionDemo: TAction;
    Splitter1: TSplitter;
    pTop: TPanel;
    lXMLConf: TLabel;
    fModuleID: TDBEditEh;
    fSignature: TDBEditEh;
    fSignatureShort: TDBEditEh;
    fSignActivity: TDBCheckBoxEh;
    fIco: TDBEditEh;
    qMODULE: TOraQuery;
    dsQMODULE: TOraDataSource;
    qMODULEMODULE_ID: TFloatField;
    qMODULEMODULE_VAL: TStringField;
    Label1: TLabel;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionAppendExecute(Sender: TObject);
    procedure ActionPostExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

    procedure Init(ModuleID: integer);

  public
    { Public declarations }
  end;

var
  FormMainMConf: TFormMainMConf;

implementation

{$R *.dfm}

uses
  // my
  uDataModuleRay,
  uDataModuleImages,
  uUser,
  uFormDebug;

{ TFormMainMConf }

procedure TFormMainMConf.FormCreate(Sender: TObject);
var
  StringList: TStringList;
begin

  DataModuleRay.ActivateDataSets();

  //
  qMODULE.Active := True;
  tMODULE.Active := True;

  //
  if FileExists('mconf.dat') then
  begin
    StringList := TStringList.Create;
    StringList.LoadFromFile('mconf.dat');
    ListBox.KeyValue := StringList.Values['module_id'].ToInteger;
    Init(StringList.Values['module_id'].ToInteger);
    StringList.Free;
  end
  else
    Init(tMODULE.FieldValues['module_id']);

end;

procedure TFormMainMConf.FormDestroy(Sender: TObject);
var
  StringList: TStringList;
begin

  StringList := TStringList.Create;
  StringList.Add('module_id=' + string(fModuleID.Value));
  StringList.SaveToFile('mconf.dat');
  StringList.Free;

end;

procedure TFormMainMConf.Init(ModuleID: integer);
begin

  tMODULE.Cancel;
  tMODULE.Filter := 'module_id = ' + ModuleID.ToString;
  tMODULE.Edit;

  Memo.Lines.Text := TOraXMLField(tMODULE.FieldByName('xml_conf')).AsString;

end;

procedure TFormMainMConf.ActionAppendExecute(Sender: TObject);
begin

  tMODULE.Append;

  Memo.Lines.Clear;

end;

procedure TFormMainMConf.ActionRefleshExecute(Sender: TObject);
begin
  qMODULE.Refresh;
end;

procedure TFormMainMConf.ActionOpenFileExecute(Sender: TObject);
var
  s: string;
begin

  if PromptForFileName(s, 'XML файл|*.xml', 'xml', '', '') then
    Memo.Lines.LoadFromFile(s);

end;

procedure TFormMainMConf.ActionSaveToFileExecute(Sender: TObject);
var
  s: string;
begin

  s := Format('# %s %s', [fModuleID.Text, fSignature.Text]);

  s := StringReplace(s, '"', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, ':', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, '\', '_', [rfReplaceAll, rfIgnoreCase]);
  s := StringReplace(s, '/', '_', [rfReplaceAll, rfIgnoreCase]);

  if PromptForFileName(s, 'XML файл|*.xml', 'xml', '', '', True) then
    Memo.Lines.SaveToFile(s);

end;

procedure TFormMainMConf.dsREPOSITORYDataChange(Sender: TObject;
  Field: TField);
begin

  ActionPost.Enabled   := True;
  ActionCancel.Enabled := True;

end;

procedure TFormMainMConf.ListBoxDblClick(Sender: TObject);
begin
  Init(qMODULE.FieldValues['module_id']);
end;

procedure TFormMainMConf.MemoChange(Sender: TObject);
begin
  ActionPost.Enabled := True;
end;

procedure TFormMainMConf.ActionPostExecute(Sender: TObject);
begin

  TOraXMLField(tMODULE.FieldByName('xml_conf')).AsString := Memo.Lines.Text;

  try
    tMODULE.Post;
    tMODULE.Edit;
  except
    on E:Exception do
    begin
      tMODULE.Edit;
      raise Exception.Create(E.Message);
    end;
  end;

  ActionPost.Enabled := False;

end;

procedure TFormMainMConf.ActionCancelExecute(Sender: TObject);
begin

  tMODULE.Cancel;
  tMODULE.Edit;

  ActionCancel.Enabled := False;

end;

procedure TFormMainMConf.ActionDeleteExecute(Sender: TObject);
begin

  if MessageDlg('Удалить модуль # ' + qMODULE.FieldByName('module_id').AsString + '?',
                mtWarning, [mbYes, mbNo],
                0) = mrYes
  then
    qMODULE.Delete;

end;

procedure TFormMainMConf.ActionDemoExecute(Sender: TObject);
var
  StringList: TStringList;
begin

  StringList := TStringList.Create;
  StringList.LoadFromFile('patterns\mconf_demo.xml');

  ShowDebug(StringList.Text, 'Демо', 'XML конфигурация', 1100, 700);

  StringList.Free;

end;

procedure TFormMainMConf.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMainMConf.fModuleIDEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  ws: WideString;
begin

  ws := User.LoadModuleConf(tMODULE.FieldByName('module_id').AsInteger);

  ShowDebug(ws, 'Модуль', 'XML конфигурация', 1100, 700);

end;

end.
