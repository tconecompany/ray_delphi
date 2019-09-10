{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TFormList                       }
{                     ����� ������                      }
{                                                       }
{        ���� ���������: 23.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormList;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Forms, System.Actions, Vcl.ActnList, Vcl.Dialogs,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.Menus,
  // odac
  Data.DB, DBAccess, Ora, MemDS, OraCall,
  // ehLib
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhGrouping, DBGridEhToolCtrls,
  DynVarsEh, ToolCtrlsEh, PrnDbgEh, DBCtrlsEh,
  MemTableDataEh, DataDriverEh, MemTableEh,
  // my
  uTypes,
  uConst,
  uRegForms,
  uRepository;

{ TFormList }

type
  TFormList = class(TForm)
    Grid: TDBGridEh;
    Query: TOraQuery;
    PrintDBGridEh: TPrintDBGridEh;
    pGridTitle: TPanel;
    pGridTop: TPanel;
    atbRight: TActionToolBar;
    atbLeft: TActionToolBar;
    ActionManager: TActionManager;
    ActionGridWidth: TAction;
    ActionRecNew: TAction;
    ActionRecDelete: TAction;
    ActionRefresh: TAction;
    ActionFormPick: TAction;
    ActionExp: TAction;
    ActionSetFilter: TAction;
    ActionRecReading: TAction;
    ActionDebug: TAction;
    ActionActions: TAction;
    dbeFilter: TDBEditEh;
    OraSession: TOraSession;
    pmGrid: TPopupMenu;
    miCopy: TMenuItem;
    miFreeSelection: TMenuItem;
    miSelectRow: TMenuItem;
    N4: TMenuItem;
    miSelectEverything: TMenuItem;
    ActionPopupCopy: TAction;
    ActionPopupSelectEverything: TAction;
    ActionPopupSelectRow: TAction;
    ActionPopupFreeSelection: TAction;
    ActionRecPost: TAction;
    pmExp: TPopupMenu;
    miExpToExcel: TMenuItem;
    miExpToCSV: TMenuItem;
    miExpToHTML: TMenuItem;
    miExpToXML: TMenuItem;
    ActionPopupExpToExcel: TAction;
    ActionPopupExpToCSV: TAction;
    ActionPopupExpToHTML: TAction;
    ActionPopupExpToXML: TAction;
    N3: TMenuItem;
    ActionPopupCopyInExcel: TAction;
    miCopyInExcel: TMenuItem;
    MemTable: TMemTableEh;
    dsMemTable: TDataSource;
    DataSetDriver: TDataSetDriverEh;
    N5: TMenuItem;
    Action�ollapseNodes: TAction;
    ActionExpandNodes: TAction;
    miExpandNodes: TMenuItem;
    mi�ollapseNodes: TMenuItem;
    ActionExpExcel: TAction;
    miExpToRTF: TMenuItem;
    ActionExpToRTF: TAction;
    ActionFetchAll: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionRowEditExecute(Sender: TObject);
    procedure ActionRecDeleteExecute(Sender: TObject);
    procedure ActionFormPickExecute(Sender: TObject);
    procedure ActionExpExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionSetFilterExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionRecReadingExecute(Sender: TObject);
    procedure dbeFilterChange(Sender: TObject);
    procedure dbeFilterEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbeFilterEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure dbeFilterEditButtons2Click(Sender: TObject; var Handled: Boolean);
    procedure dbeFilterEditButtons3Click(Sender: TObject; var Handled: Boolean);
    procedure dbeFilterEnter(Sender: TObject);
    procedure dbeFilterExit(Sender: TObject);
    procedure ActionGridWidthExecute(Sender: TObject);
    procedure GridCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure ActionActionsExecute(Sender: TObject);
    procedure ActionRecNewExecute(Sender: TObject);
    procedure ActionPopupSelectRowExecute(Sender: TObject);
    procedure ActionPopupFreeSelectionExecute(Sender: TObject);
    procedure ActionPopupSelectEverythingExecute(Sender: TObject);
    procedure ActionPopupCopyExecute(Sender: TObject);
    procedure ActionRecPostExecute(Sender: TObject);
    procedure dsMemTableStateChange(Sender: TObject);
    procedure MemTableAfterOpen(DataSet: TDataSet);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure Action�ollapseNodesExecute(Sender: TObject);
    procedure ActionPopupCopyInExcelExecute(Sender: TObject);
    procedure ActionExpandNodesExecute(Sender: TObject);
    procedure ActionPopupExpToExcelExecute(Sender: TObject);
    procedure ActionExpExcelExecute(Sender: TObject);
    procedure ActionPopupExpToCSVExecute(Sender: TObject);
    procedure ActionPopupExpToHTMLExecute(Sender: TObject);
    procedure ActionExpToRTFExecute(Sender: TObject);
    procedure ActionFetchAllExecute(Sender: TObject);
  private
    { Private declarations }

    Start               : TStart;                                               // ��������� ���������� ������� � RegForms
    ModuleSignature     : string;
    RepositorySignature : string;
    RepositoryParam     : string;
    RepositoryDescribe  : string;
    LookupOptions       : TDynParams;                                           // ������������� ��������� ����������� (�����, ��������-sql, ���. ����� ������)
    RecConf             : TRecConf;
    PRecPick_           : PRecPick;                                             // ������ �� ����. �������

    procedure WMAfterCreate(var Message: TMessage); message WM_AFTER_CREATE;    // ���������
    procedure WMFormPrint(var Message: TMessage); message WM_FORM_PRINT;        // ������

    procedure GridColumnWidth(Mode: integer);                                   // ������������� ������ �������

    procedure RefreshTitle;

    procedure GetCellParams(Sender: TObject; EditMode: Boolean;                 // ������������� ... ��������
      Params: TColCellParamsEh);

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  Math,
  // EhLib
  EhLibMTE,
  DBGridEhImpExp,
  PrViewEh,
  Printers,
  // oxml
  OXmlPDOM,
  OXmlUtils,
  // my
  uDataModuleRay,
  uDataModuleImages,
  uUser,
  uEnvVariables,
  uStrUtilsExt,
  uAssembly,
  uFormPick,
  uFormReading,
  uFormDebug;

{ TFormList }

procedure TFormList.WMAfterCreate(var Message: TMessage);
begin

  if  not LookupOptionsConnect(Query, LookupOptions)
      or ((PRecPick_ <> nil) and PRecPick_^.Checked)
  then
    ActionFormPick.Execute
  else
    Query.Open; // Query.MoveBy(OraQuery1.FetchRows)

  RefreshTitle(); // ��������� ���������, ������� ...

end;

procedure TFormList.WMFormPrint(var Message: TMessage);
begin
  ShowMessage('FormList WMFormPrint');
end;

procedure TFormList.FormCreate(Sender: TObject);
var
  dpForm : TDynParams;
  i, j   : integer;
begin

  // ��������� ��������� �������
  Start               := RegForms.LastStart;          // ��������� ������ (��� ���. ����� ����� ����������� ����� ��������)
  ModuleSignature     := User.ActiveModule.Signature; // �������� ������ ������� �������� ������������
  RepositorySignature := Repository.Signature;        // ��������� �����������
  RepositoryParam     := Repository.Param;            // �������� �����������
  RepositoryDescribe  := Repository.Describe;         // ����������� ��������
  RecConf             := Repository.RecConf;          // ������������!

  // ����������� ���������� ����������� � ������������
  LookupOptions := Copy(RecConf.LookupOptions);

  // ����� ���������� �����
  dpForm := StrToDynParams(Start.Param);

  // ��������� �������� ������ ���������� �����������
  for i := 0 to High(LookupOptions) do
    if Length(LookupOptions[i].DefaultExpression) > 0  then
      // %���_��������� - �������� �����
      if LookupOptions[i].DefaultExpression[1] = '%' then
      begin // �� ������� ��� ���� !
        for j := 0 to High(dpForm) do
          if SameText(LookupOptions[i].Name, dpForm[j].Name) then
          begin
            LookupOptions[i].Value             := dpForm[j].Value;
            LookupOptions[i].DefaultExpression := string(dpForm[j].Value);
            Break;
          end
      end
      // {���_���������} - ��������� ����������
      else if LookupOptions[i].DefaultExpression[1] = '{' then
        LookupOptions[i].Value := EnvVariables.ParamByName(LookupOptions[i].DefaultExpression)
      else
        LookupOptions[i].Value := LookupOptions[i].DefaultExpression;

  // ������� � ������
  Finalize(dpForm);

  // ��������� ������� ���������������� sql � ����������� odac
  Query.SQL.Text := RecConf.SQL;

  // �����
  if Length(Repository.RecConf.Pick.Items) > 0 then
  begin
    New(PRecPick_);
    PRecPick_^ := Repository.RecConf.Pick;
    ActionFormPick.Enabled := True; // �������� �����������
  end;

  // �������������� ����� �� �����
  if RecConf.Grid.RowLines then
    Grid.Options := Grid.Options + [dgRowLines];

  // ������ ������ � �����
  if not RecConf.Grid.EvenRow then
    Grid.EvenRowColor := clWindow;

  // �������������� ����������� ���� � ������������ ���� ������
  if Length(RecConf.Grid.FieldsStrings) > 0 then
  begin
    Grid.Columns.Add; // �������������� ������� (���������� EhLib ����� ���������� ������� ������ ������-��)
    //
    for i := 0 to High(RecConf.Grid.FieldsStrings) do
    begin
      if (Grid.Columns.Count - 1) < i then
        Grid.Columns.Add;
      Grid.Columns[i].FieldName       := AnsiUpperCase(RecConf.Grid.FieldsStrings[i]);
      Grid.Columns[i].AutoFitColWidth := False;
    end;

    // ������� �������
    for i := 0 to High(RecConf.Grid.TitleParams) do
      Grid.FieldColumns[RecConf.Grid.TitleParams[i].Name].Title.Caption := RecConf.Grid.TitleParams[i].Value;

    GridColumnWidth(1); // ������������� ������ ������� �� ������������
  end;

  // ����� �������� (��������� �����)
  ActionRecNew.Enabled := IfThen(RecConf.Action.RecNewSignature <> '', 'True', 'False').ToBoolean;

  // ��������� ������ � ����� ��������� ������ �� ���������
  ActionPopupSelectRow.Execute;

  // ������� ������
  DataModuleRay.SetSession(OraSession,
                           RecConf.SessionShema,
                           RecConf.SessionPassword,
                           User.ID);

  // ��������� ����� �������� WM_AFTER_CREATE ���������� � �������� ����

end;

procedure TFormList.GridColumnWidth(Mode: integer);
var
  i: integer;
begin

  // 1 - �� ������������
  if     (Mode = 1)
     and (High(RecConf.Grid.WidthParams) > 0)
     and (Grid.Columns.Count > 1)
  then
    for i := 0 to High(RecConf.Grid.WidthParams) do
      if RecConf.Grid.WidthParams[i].Value > 0 then
      begin
        Grid.FieldColumns[RecConf.Grid.WidthParams[i].Name].Width := RecConf.Grid.WidthParams[i].Value * 7;
        Grid.FieldColumns[RecConf.Grid.WidthParams[i].Name].AutoFitColWidth := False;
      end
      else if RecConf.Grid.WidthParams[i].Value = 0 then
      begin
        Grid.FieldColumns[RecConf.Grid.WidthParams[i].Name].Width := 7;
        Grid.FieldColumns[RecConf.Grid.WidthParams[i].Name].AutoFitColWidth := True;
        Grid.AutoFitColWidths := True;
      end;

end;

procedure TFormList.RefreshTitle;
begin

  // ��������� �������
  pGridTitle.Caption := ReplaceDynParamValuesInStr(LookupOptions, RecConf.FormCaption);

  // ��������� �����
  Caption := pGridTitle.Caption;

  // + ��������� ��������� �� �������� MDITabSet ������� �����
  if FormStyle = fsMDIChild then
    Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2);

end;

procedure TFormList.GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
begin

  if MemTable.FieldByName(RecConf.TreeList.RefParentFieldName).AsInteger = 0 then
  begin
    MemTable.TreeList.DefaultNodeExpanded := RecConf.TreeList.DefaultNodeExpanded;
    Params.Background := COLOR_GRID_SUBSECTION;
    Params.Font.Style := [fsBold];
  end;

end;

procedure TFormList.QueryAfterOpen(DataSet: TDataSet);
begin
  MemTable.Open;
end;

procedure TFormList.MemTableAfterOpen(DataSet: TDataSet);
var
  i, j: integer;
begin

  // ����������� ������ 1 ��� ��� �������� ������ ������
  if MemTable.Tag = 1 then Exit;

  // ��������� ������������� ��� ���� �� ���������
  for i := 0 to MemTable.Fields.Count - 1 do
    MemTable.Fields[i].ReadOnly := True;

  // ������������ ���� ������ ����� (���� �� ������� � ������������ �� ����������� � run-time)
  if Length(RecConf.Grid.FieldsStrings) = 0 then
  begin

    Grid.Columns.Clear;

    for i := 0 to MemTable.Fields.Count - 1 do
    begin
      Grid.Columns.Add;
      Grid.Columns[i].FieldName := MemTable.Fields[i].FieldName;
    end;

    // ������� �������
    for i := 0 to High(RecConf.Grid.TitleParams) do
      Grid.FieldColumns[RecConf.Grid.TitleParams[i].Name].Title.Caption := RecConf.Grid.TitleParams[i].Value;

    // ������ �����
    GridColumnWidth(1);

  end;

  // ������� � ������ read/edit
  if Length(RecConf.Edit.FieldsStrings) > 0 then
  begin
    MemTable.ReadOnly   := False; // ��������� ������������� �������
    //Query.KeyFields   := RecConf.Edit.KeyFields;
    //Query.KeySequence := RecConf.Edit.KeySequence;
    dsMemTable.AutoEdit := True;
    // ��������� �������������� �����
    for i := 0 to MemTable.Fields.Count - 1 do
      for j := 0 to High(RecConf.Edit.FieldsStrings) do
        if SameText(MemTable.Fields[i].FieldName, RecConf.Edit.FieldsStrings[j]) then
        begin
          MemTable.Fields[i].ReadOnly := False;
          Break;
        end;
    // ��������� ������ � ��������� ���������
    ActionPopupFreeSelection.Execute;
    ActionRecNew.Enabled := True; // ����������� "����� ������". ��������� ��������� ���� ���� ��� ������
  end;

  // ������������� ��� �����
  for i := 0 to High(RecConf.Grid.CheckBoxesStrings) do
  begin
    Grid.FieldColumns[RecConf.Grid.CheckBoxesStrings[i]].KeyList.Add('-1;1;True');
    Grid.FieldColumns[RecConf.Grid.CheckBoxesStrings[i]].KeyList.Add('0;0;False');
    Grid.FieldColumns[RecConf.Grid.CheckBoxesStrings[i]].Checkboxes := True;
  end;

  // ������ ����� ��� �����
  for i := 0 to High(RecConf.Grid.FontWidthStrings) do
    Grid.FieldColumns[RecConf.Grid.FontWidthStrings[i]].Font.Style := [fsBold];

  // ����� ������ ��� �����
  for i := 0 to High(RecConf.Grid.FontColorParams) do
    Grid.FieldColumns[RecConf.Grid.FontColorParams[i].Name].Font.Color :=
      StrToColor(RecConf.Grid.FontColorParams[i].Value, Grid.FieldColumns[RecConf.Grid.FontColorParams[i].Name].Font.Color);

  // ��������� ����
  for i := 0 to High(RecConf.Grid.InVisibleStrings) do
    Grid.FieldColumns[RecConf.Grid.InVisibleStrings[i]].Visible := False;

  // ��������� �������
  for i := 0 to Grid.VisibleColumns.Count - 1 do
    Grid.VisibleColumns[i].Title.Caption := Format('%s|%d', [Grid.VisibleColumns[i].Title.Caption, i + 1]);

  // ������ ������
  if RecConf.TreeList.KeyFieldName <> '' then
  begin
    MemTable.TreeList.DefaultNodeExpanded := RecConf.TreeList.DefaultNodeExpanded;
    MemTable.TreeList.KeyFieldName        := RecConf.TreeList.KeyFieldName;
    MemTable.TreeList.RefParentFieldName  := RecConf.TreeList.RefParentFieldName;
    MemTable.TreeList.Active              := True;
    // ���� ����� ��� �������� �����
    for i := 0 to MemTable.Fields.Count - 1 do
      Grid.Columns[i].OnGetCellParams := GetCellParams;
    //
    ActionExpandNodes.Enabled   := True;
    Action�ollapseNodes.Enabled := True;
  end;

  //
  MemTable.Tag := 1;

end;

procedure TFormList.ActionFormPickExecute(Sender: TObject);
var
  i : integer;
  s : string;

  // ������� ����������� order by c sql
  function TrimOrderBy(ASQL: string): string;
  var
    p: integer;
  begin
    p := Pos('ORDER BY', AnsiUpperCase(ASQL));
    if p > 0 then
      Result := Trim(Copy(ASQL, 1, p - 1)) + sLineBreak
    else
      Result := Trim(ASQL) + sLineBreak;
  end;

  // ���������� ����������� order by c sql
  function ToFindOrderBy(ASQL: string):string;
  var
    p: integer;
  begin
    p := Pos('ORDER BY', AnsiUpperCase(ASQL));
    if p > 0 then
      Result := Trim(Copy(ASQL, p)) + sLineBreak;
  end;

begin

  // ��������� ����������������� sql �� ������ achmenttement �����, ��� ��������� �������

  // ���. ����� ������
  if not ExecPick(OraSession, PRecPick_, LookupOptions) then
    Exit;

  // achmenttement (��������). �������� ���� � ������ ������
  for i:= 0 to High(LookupOptions) do
    if LookupOptions[i].Achmenttement <> '' then
      s := s + LookupOptions[i].Achmenttement + sLineBreak;

  // �������� ���������
  if s <> '' then
  begin
    // ����������� where �����������. ������������ ���������� ������
    if Pos('WHERE', AnsiUpperCase(RecConf.SQL)) = 0 then
    begin
      s := 'WHERE ' + s;
      s := StringReplace(s, 'WHERE AND', 'WHERE', [rfReplaceAll, rfIgnoreCase]);
      s := StringReplace(s, 'WHERE OR', 'WHERE', [rfReplaceAll, rfIgnoreCase]);
    end;
    // ��������� ������ �� ����������
    Query.SQL.Text := Format('%s%s%s',
                             [TrimOrderBy(RecConf.SQL) + sLineBreak,
                              s,
                              ToFindOrderBy(RecConf.SQL)]);
  end
  else
    Query.SQL.Text := RecConf.SQL;

  // ��������� ���������
  LookupOptionsConnect(Query, LookupOptions);

  // ��������� ���������, ������� ...
  RefreshTitle();

  // ��������� ������
  try
    Query.Open;
    MemTable.Refresh; // !{ TODO : ���������� ������ �� ������������ ���������! }
  except
    on E: Exception do // ���-�� ����� �� ���. ������������� ���������� Oracle
    begin
      ActionFormPick.Enabled := IfThen(PRecPick_ <> nil, 'True', 'False').ToBoolean; // ���� ����������� ������������ ����� ����� (�������� � ���������� ����)
      raise Exception.Create(E.Message);
    end;
  end;

end;

procedure TFormList.ActionPopupSelectRowExecute(Sender: TObject);
begin

  Grid.Options := Grid.Options + [dgRowSelect] - [dgEditing];

  miSelectRow.Default     := True;
  miSelectRow.Checked     := True;
  miFreeSelection.Default := False;
  miFreeSelection.Checked := False;

end;

procedure TFormList.ActionPopupFreeSelectionExecute(Sender: TObject);
begin

  Grid.Options := Grid.Options - [dgRowSelect];

  if not Query.ReadOnly then
  begin
    Grid.AllowedOperations := Grid.AllowedOperations + [alopUpdateEh];
    Grid.Options           := Grid.Options + [dgEditing];
  end;

  miSelectRow.Default     := False;
  miSelectRow.Checked     := False;
  miFreeSelection.Default := True;
  miFreeSelection.Checked := True;

end;

procedure TFormList.ActionPopupSelectEverythingExecute(Sender: TObject);
begin
  Grid.Selection.SelectAll;
end;

procedure TFormList.ActionPopupCopyExecute(Sender: TObject);
begin
  DBGridEh_DoCopyAction(Grid, False);
end;

procedure TFormList.ActionPopupCopyInExcelExecute(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS,
                           Grid,
                           User.Settings.WorkFolder + FormatDateTime('yyyymmddhhnnss', Now),
                           False);
end;

procedure TFormList.ActionExpandNodesExecute(Sender: TObject);
begin
  MemTable.TreeList.FullExpand;
end;

procedure TFormList.Action�ollapseNodesExecute(Sender: TObject);
begin
  MemTable.TreeList.FullCollapse;
end;

procedure TFormList.ActionGridWidthExecute(Sender: TObject);
begin
//
end;

procedure TFormList.ActionRowEditExecute(Sender: TObject);
begin
//
end;

procedure TFormList.ActionRecNewExecute(Sender: TObject);
var
  i, j: integer;
begin

  // 1. �������� ������ � �����
  if     (Length(RecConf.Edit.FieldsStrings) > 0)
     and not ActionPopupFreeSelection.Checked
  then
  begin
    ActionPopupFreeSelection.Execute; // ��������� ���� � ����� ��������������
    MemTable.Append;
    // �������� �� ���������
    for i := 0 to MemTable.Fields.Count - 1 do
      for j := 0 to High(RecConf.Edit.DefaultExpressionParams) do
        if     not MemTable.Fields[i].ReadOnly
           and SameText(MemTable.Fields[i].FieldName, RecConf.Edit.DefaultExpressionParams[j].Name)
        then
        begin
          MemTable.Fields[i].Value := RecConf.Edit.DefaultExpressionParams[j].Value;
          Break;
        end;
  end;

  // 2. �������� � ����� ����� �� ���������
  if RecConf.Action.RecNewSignature <> '' then
    case RecConf.Action.RecNewShowMode of
      smChild : RegForms.ShowChild(RecConf.Action.RecNewSignature, 0, RecConf.Action.RecNewParams);
      smModal : RegForms.ShowModal(RecConf.Action.RecNewSignature, 0, RecConf.Action.RecNewParams);
    end

end;

procedure TFormList.ActionRecDeleteExecute(Sender: TObject);
var
  i, j: integer;
begin

  if MessageBox(Application.Handle,
                PChar('������� ��������� ������ (' + Max(Grid.SelectedRows.Count, 1).ToString + ' ��.)?'),
                PChar('�������������'),
                MB_ICONWARNING or MB_YESNO) = mrYes
  then
  begin
    Grid.SelectedRows.CurrentRowSelected := True; // ���� ��������� � edit-������ �������� �������������
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      MemTable.Bookmark := Grid.SelectedRows[i];
      for j := 0 to High(RecConf.Action.RecDeleteItems) do
        OraSession.ExecSQLEx(Format('DELETE %s WHERE %s=:p%s',
                                    [RecConf.Action.RecDeleteItems[j].Table,
                                     RecConf.Action.RecDeleteItems[j].PrimaryKey,
                                     RecConf.Action.RecDeleteItems[j].PrimaryKey]),
                             ['p' + RecConf.Action.RecDeleteItems[j].PrimaryKey, // ��������� �����������
                              MemTable.FieldValues[RecConf.Action.RecDeleteItems[j].PrimaryKey]]);
    end;
    ActionRefresh.Execute;
  end;

end;

procedure TFormList.ActionFetchAllExecute(Sender: TObject);
begin
  //
end;

procedure TFormList.ActionRefreshExecute(Sender: TObject);
begin

  Grid.SelectedRows.Clear;
  MemTable.Refresh;

end;

procedure TFormList.ActionPopupExpToExcelExecute(Sender: TObject);
var
  s: string;
begin

  s := pGridTitle.Caption;

  if PromptForFileName(s, '����� Excel|*.xlsx', 'xlsx', '', '', True) then
    SaveDBGridEhToExportFile(TDBGridEhExportAsXlsx, Grid, s, True);

end;

procedure TFormList.ActionExpToRTFExecute(Sender: TObject);
var
  s: string;
begin

  s := pGridTitle.Caption;

  if PromptForFileName(s, 'RTF �����|*.rtf', 'rtf', '', '', True) then
    SaveDBGridEhToExportFile(TDBGridEhExportAsRTF, Grid, s, True);

end;

procedure TFormList.ActionPopupExpToCSVExecute(Sender: TObject);
var
  s: string;
begin

  s := pGridTitle.Caption;

  if PromptForFileName(s, '���� CSV|*.csv', 'csv', '', '', True) then
    SaveDBGridEhToExportFile(TDBGridEhExportAsCSV, Grid, s, True);

end;

procedure TFormList.ActionPopupExpToHTMLExecute(Sender: TObject);
var
  s: string;
begin

  s := pGridTitle.Caption;

  if PromptForFileName(s, 'HTML ��������|*.html', 'html', '', '', True) then
    SaveDBGridEhToExportFile(TDBGridEhExportAsHTML, Grid, s, True);

end;

procedure TFormList.ActionExpExcelExecute(Sender: TObject);
begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS,
                           Grid,
                           User.Settings.WorkFolder + FormatDateTime('yyyymmddhhnnss', Now),
                           True);
end;

procedure TFormList.ActionExpExecute(Sender: TObject);
begin

  { TODO : ������� �������� ������ ��� ������� }

  //ShowMessage(Self.Top.ToString);

  pmExp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

end;

procedure TFormList.ActionPrintExecute(Sender: TObject);
begin

  PrinterPreview.Orientation := poLandscape;
  PrintDBGridEh.Title.Add('��� �������');
  PrintDBGridEh.Preview;

end;

procedure TFormList.ActionSetFilterExecute(Sender: TObject);
begin

  if not dbeFilter.Visible then
  begin
    dbeFilter.Visible := True;
    dbeFilter.SetFocus;
  end
  else
  begin
    Grid.SearchPanel.CancelSearchFilter;
    dbeFilter.Text    := '';
    dbeFilter.Visible := False;
    Grid.SetFocus;
  end;

end;

procedure TFormList.ActionRecReadingExecute(Sender: TObject);
var
  RecReading : TRecReading;
  i, j       : integer;
begin

  // �������� � ��������� ���������� ���. ���������
  RecReading       := RecConf.Action.RecReading;
  RecReading.Items := Copy(RecConf.Action.RecReading.Items);

  for i := 0 to High(RecConf.Action.RecReading.Items) do
    RecReading.Items[i].Params := Copy(RecConf.Action.RecReading.Items[i].Params);

  // ���������. ��� ���� ��������� ��� ���� ������� �������������� �����
  if    (Length(RecReading.Items) = 0)
     or (dgEditing in Self.Grid.Options)
  then
    Exit;

  // ���������� � ������������ ���������
  for i := 0 to High(RecReading.Items) do
    for j := 0 to High(RecReading.Items[i].Params) do
      if     (Length(RecReading.Items[i].Params[j].Value) > 0)
         and (string(RecReading.Items[i].Params[j].Value)[1] = '^')
      then
        RecReading.Items[i].Params[j].Value :=
          MemTable.FieldByName(Copy(RecReading.Items[i].Params[j].Value, 2, Length(RecReading.Items[i].Params[j].Value) - 1)).asString;

  // 1. ���� �� ������ �� �������� ����. ����� ���������
  if     (Length(RecReading.Items) = 1)
     and (RecReading.Items[0].Params[0].Value <> '')
  then
    case RecReading.Items[0].ShowMode of
      smChild : RegForms.ShowChild(RecReading.Items[0].Signature, 0, DynParamsToStr(RecReading.Items[0].Params));
      smModal : RegForms.ShowModal(RecReading.Items[0].Signature, 0, DynParamsToStr(RecReading.Items[0].Params));
    end;

  // 2. ������ ������ �����. ������� ������������ �������
  if Length(RecConf.Action.RecReading.Items) > 1 then
    ExecReading(RecReading);

end;

procedure TFormList.ActionDebugExecute(Sender: TObject);
var
  StringList : TStringList;
  i          : integer;
begin

  StringList := TStringList.Create;
  StringList.Add(Format(RPad('����� ������������', 25) + ': %s', [FormatDateTime('dd.mm.yyyy hh:nn:ss', Now)]));
  StringList.Add(RPad('������������', 25) + ': ' + User.Login);
  StringList.Add(RPad('���� �������', 25) + ': ' + User.Key.Signature);
  StringList.Add(RPad('������', 25) + ': ' + ModuleSignature);
  StringList.Add(Format(RPad('�������� ������', 25) + ': %s - %s', [DateToStr(User.Period.DateBeg), DateToStr(User.Period.DateBeg)]));
  StringList.Add(RPad('���� �������', 25) + ': ' + Start.LaunchMenu);
  StringList.Add(RPad('�����������, #', 25) + ': ' + Self.Tag.ToString);
  StringList.Add(RPad('�����������, ���������', 25) + ': ' + RepositorySignature);
  StringList.Add(RPad('�����������, ��������', 25) + ': ' + RepositoryParam);
  StringList.Add(RPad('�����������, ��������', 25) + ': ' + RepositoryDescribe);
  StringList.Add(RPad('�����, ���', 25) + ': ' + Self.Name);
  StringList.Add(RPad('�����, ��������', 25) + ': ' + Start.Param);
  StringList.Add('');

  // LookupOptions
  StringList.Add(StringOfChar('=', 100));
  StringList.Add('��������� �����������' + sLineBreak);

  for i := 0 to High(LookupOptions) do
    StringList.Add(Format('  Name = %s; Type = %s; Value = %s; Size = %s; DefaultExpression = %s; Achmenttement = %s',
                          [LookupOptions[i].Name,
                           FieldTypeToStr(LookupOptions[i].Type_),
                           string(LookupOptions[i].Value),
                           LookupOptions[i].Size.ToString,
                           LookupOptions[i].DefaultExpression,
                           LookupOptions[i].Achmenttement]));

  StringList.Add('');

  // SQL
  StringList.Add(StringOfChar('=', 100));
  StringList.Add('SQL');
  StringList.Add(Query.SQL.Text);

  // XMLConf
  StringList.Add(StringOfChar('=', 100));
  StringList.Add('XML ������������' + sLineBreak);
  StringList.Add(RecConf.XML);

  ShowDebug(StringList.Text, '���������� ����������', '���', 950, 750);

  StringList.Free;

end;

procedure TFormList.GridCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
begin

  if     (Cell.Y >= 1)       // ����� ���������
     and (Button = mbLeft)   // ����� ������ �����
     and (ssDouble in Shift) // ������� �������
  then
    ActionRecReading.Execute();

end;

procedure TFormList.dbeFilterChange(Sender: TObject);
begin

  Grid.SearchPanel.SearchingText := dbeFilter.Text;
  Grid.SearchPanel.RestartFind;
  //dbeFilter.EditButtons[0].Visible := IfThen(Length(dbeFilter.Text) = 0, 'False', 'True').toBoolean;
  //sbFilterKey1.Enabled := dbeFilter.EditButtons[0].Visible;
end;

procedure TFormList.dbeFilterEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  Grid.SearchPanel.ApplySearchFilter;
end;

procedure TFormList.dbeFilterEditButtons1Click(Sender: TObject;
  var Handled: Boolean);
begin
  Grid.SearchPanel.FindPrev;
end;

procedure TFormList.dbeFilterEditButtons2Click(Sender: TObject;
  var Handled: Boolean);
begin
  Grid.SearchPanel.FindNext;
end;

procedure TFormList.dbeFilterEditButtons3Click(Sender: TObject;
  var Handled: Boolean);
begin

  Grid.SearchPanel.CancelSearchFilter;

  dbeFilter.Text := '';

end;

procedure TFormList.dbeFilterEnter(Sender: TObject);
begin
  Grid.SearchPanel.Active := True;
end;

procedure TFormList.dbeFilterExit(Sender: TObject);
begin
  Grid.SearchPanel.Active := False;
end;

procedure TFormList.dsMemTableStateChange(Sender: TObject);
begin

  { dsInactive, dsBrowse, dsEdit, dsInsert, dsSetKey,
    dsCalcFields, dsFilter, dsNewValue, dsOldValue, dsCurValue, dsBlockRead,
    dsInternalCalc, dsOpening }
 {
  if dsQuery.DataSet.State = dsInactive then showmessage('dsInactive');
  if dsQuery.DataSet.State = dsBrowse then showmessage('dsBrowse');
  if dsQuery.DataSet.State = dsEdit    then showmessage('dsEdit');
  if dsQuery.DataSet.State = dsSetKey    then showmessage('dsSetKey');
  if dsQuery.DataSet.State = dsCalcFields   then showmessage('dsCalcFields');
  if dsQuery.DataSet.State = dsFilter   then showmessage('dsFilter');
  if dsQuery.DataSet.State = dsNewValue then showmessage('dsNewValue');
  if dsQuery.DataSet.State = dsCurValue then showmessage('dsCurValue');
  if dsQuery.DataSet.State = dsOldValue then showmessage('dsOldValue');
  if dsQuery.DataSet.State = dsInternalCalc then showmessage('dsInternalCalc');
  if dsQuery.DataSet.State = dsOpening then showmessage('dsOpening');       }

  if Query.IsEmpty then
  begin
    ActionRecDelete.Enabled       := False;
    ActionRecPost.Enabled         := False;
    ActionRefresh.Enabled         := False;
    ActionPopupExpToExcel.Enabled := False;
    ActionPopupExpToCSV.Enabled   := False;
    ActionPopupExpToHTML.Enabled  := False;
    ActionExp.Enabled             := False;
    ActionSetFilter.Enabled       := False;
    Exit;
  end;

  case dsMemTable.DataSet.State of

    dsBrowse :
      begin
        ActionRecDelete.Enabled       := IfThen(Length(RecConf.Action.RecDeleteItems) > 0, 'True', 'False').ToBoolean;
        ActionRecPost.Enabled         := False;
        ActionRefresh.Enabled         := True;
        ActionPopupExpToExcel.Enabled := True;
        ActionPopupExpToCSV.Enabled   := True;
        ActionPopupExpToHTML.Enabled  := True;
        ActionExp.Enabled             := True;
        ActionSetFilter.Enabled       := True;
      end;

    dsInsert, dsEdit :
      begin
        ActionRecDelete.Enabled := False;
        ActionRecPost.Enabled   := True;
        ActionExp.Enabled       := False;
      end;

  end;

end;

procedure TFormList.ActionRecPostExecute(Sender: TObject);
begin

  MemTable.Post;
  ActionRecPost.Enabled := False;

end;

procedure TFormList.ActionActionsExecute(Sender: TObject);
begin
  // �������� ����� ��� ��������
end;

end.

