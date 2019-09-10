{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                  TFormTradeRozetkaXML                 }
{ ‘ормирование xml-прайса дл€ интернет магазина –озетка }
{                                                       }
{        ƒата изменени€: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTradeRozetkaXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  // odac
  Data.DB, MemDS, DBAccess, Ora, OraSmart,
  // EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh,
  // tms
  HTMLabel,
  // my
  uTypes,
  uStrUtilsExt;

{ TFormTradeRozetkaXML }

type
  TFormTradeRozetkaXML = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Grid1: TDBGridEh;
    Grid2: TDBGridEh;
    StatusBar: TStatusBar;
    dsROZETKA_XML_CATEGORY: TOraDataSource;
    tROZETKA_XML_CATEGORY: TOraTable;
    tROZETKA_XML_CATEGORYID: TFloatField;
    tROZETKA_XML_CATEGORYNAME: TStringField;
    tROZETKA_XML_CATEGORYGROUP_ID_SEP: TStringField;
    dsROZETKA_XML_DESC: TOraDataSource;
    tROZETKA_XML_DESC: TOraTable;
    hlGridFind: THTMLabel;
    tROZETKA_XML_DESCVENDOR_CODE: TFloatField;
    tROZETKA_XML_DESCFEATURE_DESC_NEW: TMemoField;
    tROZETKA_XML_DESCCHECKED: TFloatField;
    tROZETKA_XML_DESCQNT: TFloatField;
    hlCheckWebImage: THTMLabel;
    IdHTTP: TIdHTTP;
    ActionManager: TActionManager;
    ActionToolBar1: TActionToolBar;
    ActionClose: TAction;
    ActionOpen: TAction;
    ActionExec: TAction;
    procedure hlGridFindAnchorClick(Sender: TObject; Anchor: string);
    procedure hlCheckWebImageAnchorClick(Sender: TObject; Anchor: string);
    procedure FormCreate(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionExecExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
  private
    { Private declarations }
    FileName : string;
    Params   : TDynStrings;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  // odac
  OraClasses,
  OraPackage,
  // native excel
  nExcel,
  // ehlib
  DBGridEhFindDlgs,
  // my
  uDataModuleRay,
  uDataModuleImages,
  uRegForms,
  uFormDebug;

const
  JML_WS_URL = 'https://tconecompany.ucoz.net/';

{ TFormTradeRozetkaXML }

procedure TFormTradeRozetkaXML.FormCreate(Sender: TObject);
begin
  hlCheckWebImage.HTMLText.Text :=
    '<A href="a1">ѕроверить наличие изображений на хостинге ' + JML_WS_URL +  '</A>';
end;

procedure TFormTradeRozetkaXML.ActionCloseExecute(Sender: TObject);
begin
  ActionClose.Tag := 1;
  Close;
end;

procedure TFormTradeRozetkaXML.ActionOpenExecute(Sender: TObject);
var
  SQL : TOraSQL;
  XLS : IXLSWorkbook;
  i   : integer;
  w   : WideString;
begin

  if not PromptForFileName(FileName, ' нига Excel|*.xlsx', 'xlsx', '', '', False) then
     Exit;

  // считываем артикула с книги в строку параметров. передавать будем через поле CLOB
  XLS := TXLSWorkbook.Create;
  XLS.Open(FileName);

  i := 0;

  repeat
    Application.ProcessMessages;
    SetLength(Params, i + 1);
    Params[i] := VarToStr(XLS.Sheets[1].Cells[i + 1, 1].Value);
    Inc(i);
  until VarToStr(XLS.Sheets[1].Cells[i + 1, 1].Value) = '';

  //
  SQL := TOraSQL.Create(nil);
  SQL.Session := DataModuleRay.OraSession;

  try
    // вставл€ем артикула в временную таблицу
    for i := 0 to High(Params) do
    begin
      SQL.SQL.Text := 'INSERT INTO TEMP(name) VALUES(:pVendorCode)';
      SQL.Params.ParamByName('pVendorCode').AsInteger := Params[i].ToInteger;
      SQL.Execute;
    end;
  finally
    SQL.Free;
  end;

  // дописываем новые описани€ правки копирайтерского
  DataModuleRay.OraSession.ExecSQL(
    'INSERT INTO TRADE.ROZETKA_XML_DESC(vendor_code, feature_desc_new)' + ^M +
    '  SELECT t.name,' + ^M +
    '         TRADE.COMBO_TRADE.GetGoodsFeature(t.name, 34) feature_description' + ^M +
    '    FROM (SELECT TO_NUMBER(t.name) name FROM RAY.TEMP t' + ^M +
    '           MINUS' + ^M +
    '          SELECT srxd.vendor_code FROM TRADE.ROZETKA_XML_DESC srxd) t');

  // обновл€ем остатки
  DataModuleRay.OraSession.ExecSQL(
    'UPDATE TRADE.ROZETKA_XML_DESC srxd' + ^M +
    '   SET srxd.qnt = (SELECT SUM(r.qnt) qnt FROM TEXTIL.REST r WHERE r.art_id = srxd.vendor_code)');

  // примен€ем фильтр дл€ таблыцы ROZETKA_XML_DESC по артикулам
  w := DynStringsToStr(Params, ',');

  //
  tROZETKA_XML_CATEGORY.Open;
  tROZETKA_XML_DESC.Open;

  XLS.Close;

  //
  StatusBar.Panels[0].Text := FileName;
  hlCheckWebImage.Enabled := True;

  ActionExec.Enabled := True;

end;

procedure TFormTradeRozetkaXML.ActionExecExecute(Sender: TObject);
var
  StoredProc : TOraStoredProc;
  wStr, XML  : WideString;
  s          : string;
  Strings    : TStringList;
begin

  StatusBar.Panels[0].Text := 'ќбработка...';
  ActionExec.Enabled := False;
  ActionOpen.Enabled := True;

  wStr := DynStringsToStr(Params, ',');;

  StoredProc := TOraStoredProc.Create(nil);

  Strings := TStringList.Create;

  Application.ProcessMessages;

  try
    StoredProc.Session := DataModuleRay.OraSession;
    StoredProc.Options.TemporaryLobUpdate := True;
    StoredProc.StoredProcName := 'TRADE.DEV_TRADE.RozetkaXML';
    StoredProc.Prepare;
    StoredProc.ParamByName('in_ArtsId').AsWideString := wStr;
    StoredProc.Execute;
    // сохран€ем результат в диалоге
    s := Format('tc goods - %s ', [FormatDateTime('dd.mm.yyyy', Now)]);
    Strings.Text := StoredProc.ParamByName('OUT_CLOB').AsWideString;
    if PromptForFileName(s, 'XML|*.xml', 'xml', '', '', True) then
      Strings.SaveToFile(s, TEncoding.UTF8);
  finally
    FreeAndNil(StoredProc);
    StatusBar.Panels[0].Text := FileName;
  end;

end;

procedure TFormTradeRozetkaXML.hlGridFindAnchorClick(Sender: TObject;
  Anchor: string);
begin
  if Anchor = 'a1' then
    ExecuteDBGridEhFindDialogProc(Grid2, '',' ', nil, Grid2.IsFindDialogShowAsModal);
end;

procedure TFormTradeRozetkaXML.hlCheckWebImageAnchorClick(Sender: TObject;
  Anchor: string);
var
  StringList : TStringList;
  i, j       : integer;
  b          : boolean;
  s          : string;
begin

  if Anchor <> 'a1' then Exit;

  ActionOpen.Enabled := False;
  ActionExec.Enabled := False;
  hlCheckWebImage.Enabled := False;
  hlCheckWebImage.URLColor := clGray;

  // цыкл проверки
  try

    try
      IdHTTP.Head(JML_WS_URL); // возможна ошибка. сменитс€ протокол автоматически
    except
    end;

    try
      IdHTTP.Head(JML_WS_URL); // контрольна€ перепроверка
    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;

    StringList := TStringList.Create;

    b := True;

    for i := 0 to High(Params) do
    begin

      for j := 1 to 3 do
      begin
        Application.ProcessMessages;
        s := Format('%s%d/%s_%d.jpg', [JML_WS_URL, j, Params[i], j]);
        StatusBar.Panels[0].Text := s;
        try
          IdHTTP.Head(s);
        except
          StringList.Add(s);
          b := False;
        end;
      end;

      if ActionClose.Tag = 1 then Break;

    end;

  finally
    ActionOpen.Enabled := True;
    ActionExec.Enabled := True;
    hlCheckWebImage.Enabled := True;
    hlCheckWebImage.URLColor := clHotLight;
    StatusBar.Panels[0].Text := '';
  end;

  // показуем результат проверки
  if b then
    ShowMessage('ѕроверка завершена! ¬се изображени€ на месте')
  else
    ShowDebug('ѕроверка хостинга изображений',
              '—писок отсутвующих изображений',
              StringList.Text);

  StringList.Free;

end;

end.
