{*******************************************************}
{                                                       }
{                       Keymaker                        }
{                                                       }
{                   TFormMainKeymaker                   }
{                     Главная форма                     }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormMainKeymaker;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, System.ImageList, Vcl.AppEvnts,
  // odac
  Ora, OraPackage, Data.DB, MemDS, DBAccess, DBCtrlsEh,
  // ehlib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  MemTableDataEh, MemTableEh,
  // tms
  Advmxml, AdvMemo,
  // my
  uTypes;

// PKeyInfo
type
  PKeyInfo = ^TKeyInfo;
  TKeyInfo =  record
    GroupID     : integer;
    KGSignature : string;
    ID          : integer;
    Signature   : string;
    Enabled     : boolean;
    CountKeys   : integer;
  end;

type
  TFormMainKeymaker = class(TForm)
    StatusBar: TStatusBar;
    pLeft: TPanel;
    TreeView: TTreeView;
    Label1: TLabel;
    ToolBar: TToolBar;
    tbKeyNew: TToolButton;
    tbKeyDelete: TToolButton;
    tbKeyValidate: TToolButton;
    tbGroupAdd: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ActionList: TActionList;
    ImageList: TImageList;
    ActionKeyNew: TAction;
    ActionTreeItemDelete: TAction;
    ActionKeyCheck: TAction;
    ActionGroupNew: TAction;
    tbKeysValidate: TToolButton;
    ActionKeysCheck: TAction;
    ToolButton10: TToolButton;
    ActionExpanded: TAction;
    ActionUnExpanded: TAction;
    eFindText: TDBEditEh;
    Query: TOraQuery;
    tbReflesh: TToolButton;
    ActionReflesh: TAction;
    Package: TOraPackage;
    pmTreeView: TPopupMenu;
    miExpTrue: TMenuItem;
    miReExpFalse: TMenuItem;
    N3: TMenuItem;
    miRename: TMenuItem;
    miDelete: TMenuItem;
    ToolButton11: TToolButton;
    tbExit: TToolButton;
    ActionClose: TAction;
    Splitter1: TSplitter;
    miBlock: TMenuItem;
    pmGridSectionAdd: TPopupMenu;
    miSectionAdd: TMenuItem;
    miSubSectionAdd: TMenuItem;
    miSubSectionItemAdd: TMenuItem;
    pCont: TPanel;
    pBottom: TPanel;
    bSaveToDB: TBitBtn;
    bGridDeleteSelected: TBitBtn;
    bReflesh: TBitBtn;
    bGridSectionAdd: TButton;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    ActionGridDeleteSelected: TAction;
    ActionSaveToDB: TAction;
    pmGrid: TPopupMenu;
    miRowFullExpand: TMenuItem;
    miRowFullCollapse: TMenuItem;
    ActionGridCheckColumn: TAction;
    ApplicationEvents: TApplicationEvents;
    Grid: TDBGridEh;
    dsMemTable: TDataSource;
    Memo: TAdvMemo;
    AdvXMLMemoStyler: TAdvXMLMemoStyler;
    MemTable: TMemTableEh;
    pmGridCol: TPopupMenu;
    miColCheck: TMenuItem;
    miColUnCheck: TMenuItem;
    N1: TMenuItem;
    miSelectAllSubSecItem: TMenuItem;
    miRowUnCheck: TMenuItem;
    N2: TMenuItem;
    miRowCheck: TMenuItem;
    ToolButton1: TToolButton;
    ActionKeySaveAs: TAction;
    procedure ActionTreeItemDeleteExecute(Sender: TObject);
    procedure ActionKeyCheckExecute(Sender: TObject);
    procedure ActionKeysCheckExecute(Sender: TObject);
    procedure ActionGroupNewExecute(Sender: TObject);
    procedure ActionExpandedExecute(Sender: TObject);
    procedure ActionRefleshExecute(Sender: TObject);
    procedure ActionKeyNewExecute(Sender: TObject);
    procedure TreeViewDblClick(Sender: TObject);
    procedure ActionUnExpandedExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eFindTextEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eFindTextChange(Sender: TObject);
    procedure miExpTrueClick(Sender: TObject);
    procedure miReExpFalseClick(Sender: TObject);
    procedure miRenameClick(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure bGridSectionAddClick(Sender: TObject);
    procedure miSectionAddClick(Sender: TObject);
    procedure miSubSectionAddClick(Sender: TObject);
    procedure miSubSectionItemAddClick(Sender: TObject);
    procedure ActionGridDeleteSelectedExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure miRowCheckClick(Sender: TObject);
    procedure ActionGridCheckColumnExecute(Sender: TObject);
    procedure ActionSaveToDBExecute(Sender: TObject);
    procedure GridColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure GridCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure miColCheckClick(Sender: TObject);
    procedure miCheckSelRowsClick(Sender: TObject);
    procedure dsMemTableDataChange(Sender: TObject; Field: TField);
    procedure miSelectAllSubSecItemClick(Sender: TObject);
    procedure bRefleshClick(Sender: TObject);
    procedure ActionKeySaveAsExecute(Sender: TObject);
  private
    { Private declarations }

    FSession  : TOraSession;
    FPKeyInfo : PKeyInfo;                                                       // ссылка на ветку дерева
    FXMLConf  : WideString;                                                     // xml конфигурация ключа
    FModify   : boolean;                                                        // ключ редадктировался и не сохранен

    procedure TreeItemAdd(Group: TKeyInfo);                                     //
    procedure TreeItemAddChild(Key: TKeyInfo);
    procedure GridInit(APKeyInfo: PKeyInfo);                                    // инициализация таблицы

    procedure GridSectionAdd(Describe,
                             Signature     : string;                            // добавить новую секцию в таблицу
                             var SectionID : integer);

    procedure GridSubSectionAdd(SectionID        : integer;                     // добавить новую подсекцию в таблицу
                                Describe,
                                Signature        : string;
                                ID               : integer;
                                Access           : TDynBooleans;
                                var SubSectionID : integer);

    procedure GridSubSectionItemAdd(SectionID,                                  //добавить новый Итем в таблицу
                                    SubSectionID : integer;
                                    Describe,
                                    Signature    : string;
                                    ID           : integer;
                                    Access       : TDynBooleans);

    function GridToXMLConf: WideString;                                         // конвертация таблицы в конфигурацию ключа

  public
    { Public declarations }
  end;

var
  FormMainKeymaker: TFormMainKeymaker;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  // odac
  OraObjects,
  // oxml
  OXmlPDOM,
  OXmlUtils,
  //my
  uDataModuleRay,
  uConst,
  uFormSectionAdd;

{ TFormMainKeymaker }

procedure TFormMainKeymaker.FormCreate(Sender: TObject);
begin

  FSession := DataModuleRay.OraSession;

  ActionReflesh.Execute;

  New(FPKeyInfo);
  FPKeyInfo.ID := 0;

end;

procedure TFormMainKeymaker.TreeItemAdd(Group: TKeyInfo);
var
  TreeNode : TTreeNode;
  _pGroup  : PKeyInfo;
  s        : string;
begin

  s := Format('%s (%d)', [Group.KGSignature, Group.CountKeys]);

  TreeNode := TreeView.Items.Add(TreeView.Items.GetFirstNode, s);
  TreeNode.ImageIndex         := 8;
  TreeNode.SelectedIndex      := 8;
  TreeNode.ExpandedImageIndex := 9;
  TreeNode.Selected           := True;

  _pGroup := New(PKeyInfo);

  // перебиваем в дин. память
  _pGroup.GroupID     := Group.GroupID;
  _pGroup.KGSignature := Group.KGSignature;
  _pGroup.CountKeys   := Group.CountKeys;

  TreeNode.Data := _pGroup;

end;

procedure TFormMainKeymaker.TreeItemAddChild(Key: TKeyInfo);
var
  TreeNode  : TTreeNode;
  _pKeyInfo : PKeyInfo;
begin

  if Key.Signature = '' then Exit;

  case TreeView.Selected.Level of
    0 : TreeNode := TreeView.Items.AddChild(TreeView.Selected, Key.Signature);
    1 : TreeNode := TreeView.Items.AddChild(TreeView.Selected.Parent, Key.Signature);
  end;

  TreeNode.ImageIndex := 10;
  TreeNode.SelectedIndex := 10;

  //TreeNode.Enabled := not Key.Block; // засерить иконкой

  _pKeyInfo := New(PKeyInfo);

  // перебиваем в дин. память
  _pKeyInfo.GroupID     := Key.GroupID;
  _pKeyInfo.KGSignature := Key.KGSignature;
  _pKeyInfo.ID          := Key.ID;
  _pKeyInfo.Signature   := Key.Signature;
  _pKeyInfo.Enabled     := Key.Enabled;

  TreeNode.Data := _pKeyInfo;

end;

procedure TFormMainKeymaker.GridInit(APKeyInfo: PKeyInfo);
var
  qOper             : TOraQuery;
  xXML              : IXMLDocument;
  xNode             : PXMLNode;
  iSecID, iSubSecID, i : integer;
begin

  FPKeyInfo := APKeyInfo;
  FModify   := False;

  // усекаем пред. данные Grid
  MemTable.EmptyTable;

  Caption := Format('%s - %s', [Copy(Caption, 1, Pos('-', Caption) - 2), FPKeyInfo.Signature]);

  qOper := TOraQuery.Create(nil);
  qOper.Session := FSession;

  // считывам конфигурацию ключа с БД
  qOper.SQL.Text := 'SELECT k.xml_conf' + #10
                  + '  FROM KEY k' + #10
                  + ' WHERE k.key_id = :pKeyID';

  qOper.ParamByName('pKeyID').AsInteger := FPKeyInfo.ID;

  try
    qOper.Open;
    FXMLConf := qOper.FieldByName('xml_conf').AsWideString;
  finally
    qOper.Free;
  end;

  //
  xXML := OXmlPDOM.CreateXMLDoc;
  xXML.LoadFromXML(FXMLConf);

  //
  xNode := xXML.DocumentElement;

  try
    MemTable.DisableControls;
    MemTable.RecordsView.MemTableData.RecordsList.BeginUpdate;
    //
    while xNode <> nil do
    begin
      if xNode.NodeName = 'section' then
        GridSectionAdd(xNode.GetAttribute('describe'), xNode.GetAttribute('signature'), iSecID)
      else if xNode.NodeName = 'subsection' then
        GridSubSectionAdd(iSecID,
                          xNode.GetAttribute('describe'),
                          xNode.ParentNode.GetAttribute('signature'),
                          xNode.GetAttribute('id').ToInteger,
                          [xNode.GetAttributeDef('access', 'False').ToBoolean,
                           xNode.GetAttributeDef('disabled', 'False').ToBoolean,
                           xNode.GetAttributeDef('ban', 'False').ToBoolean,
                           xNode.GetAttributeDef('insert', 'False').ToBoolean,
                           xNode.GetAttributeDef('update', 'False').ToBoolean,
                           xNode.GetAttributeDef('delete', 'False').ToBoolean,
                           xNode.GetAttributeDef('validity', 'False').ToBoolean],
                           iSubSecID)
      else if xNode.NodeName = 'item' then
      begin
        GridSubSectionItemAdd(iSecID,
                              iSubSecID,
                              xNode.GetAttribute('describe'),
                              xNode.GetAttribute('signature'),
                              xNode.GetAttribute('id').ToInteger,
                              [xNode.GetAttributeDef('access', 'False').ToBoolean,
                               xNode.GetAttributeDef('disabled', 'False').ToBoolean,
                               xNode.GetAttributeDef('ban', 'False').ToBoolean,
                               xNode.GetAttributeDef('insert', 'False').ToBoolean,
                               xNode.GetAttributeDef('update', 'False').ToBoolean,
                               xNode.GetAttributeDef('delete', 'False').ToBoolean,
                               xNode.GetAttributeDef('validity', 'False').ToBoolean])
      end;
      //
      xNode := xNode.NextNodeInTree;
    end;
    //
  finally
    MemTable.RecordsView.MemTableData.RecordsList.EndUpdate;
    MemTable.EnableControls;
  end;

end;

procedure TFormMainKeymaker.GridSectionAdd(Describe,
                                           Signature     : string;
                                           var SectionID : integer);
var
  Rec: TMemoryRecordEh;
begin

  Rec := MemTable.RecordsView.NewRecord;
  Rec.Value[0, dvvValueEh]  := Describe;
  Rec.Value[1, dvvValueEh]  := AnsiUpperCase(Signature);
  Rec.Value[10, dvvValueEh] := MemTable.AutoIncrement.CurValue;
  Rec.Value[11, dvvValueEh] := 0;
  Rec.Value[12, dvvValueEh] := MemTable.AutoIncrement.CurValue;

  // out parameter
  SectionID := MemTable.AutoIncrement.CurValue;

  MemTable.RecordsView.AddRecord(Rec);

end;

procedure TFormMainKeymaker.GridSubSectionAdd(SectionID        : integer;
                                              Describe,
                                              Signature        : string;
                                              ID               : integer;
                                              Access           : TDynBooleans;
                                              var SubSectionID : integer);
var
  Rec: TMemoryRecordEh;
begin

  Rec := MemTable.RecordsView.NewRecord;
  Rec.Value[0, dvvValueEh]  := Describe;
  Rec.Value[1, dvvValueEh]  := AnsiUpperCase(Signature);
  Rec.Value[2, dvvValueEh]  := ID;
  Rec.Value[3, dvvValueEh]  := Access[0];
  Rec.Value[4, dvvValueEh]  := Access[1];
  Rec.Value[5, dvvValueEh]  := Access[2];
  Rec.Value[6, dvvValueEh]  := Access[3];
  Rec.Value[7, dvvValueEh]  := Access[4];
  Rec.Value[8, dvvValueEh]  := Access[5];
  Rec.Value[9, dvvValueEh]  := Access[6];
  Rec.Value[10, dvvValueEh] := MemTable.AutoIncrement.CurValue;
  Rec.Value[11, dvvValueEh] := SectionID;
  Rec.Value[12, dvvValueEh] := SectionID;
  Rec.Value[13, dvvValueEh] := MemTable.AutoIncrement.CurValue;

  // out parameter
  SubSectionID := MemTable.AutoIncrement.CurValue;

  MemTable.RecordsView.AddRecord(Rec);

end;

procedure TFormMainKeymaker.GridSubSectionItemAdd(SectionID,
                                                  SubSectionID : integer;
                                                  Describe,
                                                  Signature    : string;
                                                  ID           : integer;
                                                  Access       : TDynBooleans);
var
  Rec: TMemoryRecordEh;
begin

  Rec := MemTable.RecordsView.NewRecord;
  Rec.Value[0, dvvValueEh]  := Describe;
  Rec.Value[1, dvvValueEh]  := AnsiUpperCase(Signature);
  Rec.Value[2, dvvValueEh]  := ID;
  Rec.Value[3, dvvValueEh]  := Access[0];
  Rec.Value[4, dvvValueEh]  := Access[1];
  Rec.Value[5, dvvValueEh]  := Access[2];
  Rec.Value[6, dvvValueEh]  := Access[3];
  Rec.Value[7, dvvValueEh]  := Access[4];
  Rec.Value[8, dvvValueEh]  := Access[5];
  Rec.Value[9, dvvValueEh]  := Access[6];
  Rec.Value[10, dvvValueEh] := MemTable.AutoIncrement.CurValue;
  Rec.Value[11, dvvValueEh] := SubSectionID;
  Rec.Value[12, dvvValueEh] := SectionID;
  Rec.Value[13, dvvValueEh] := SubSectionID;

  MemTable.RecordsView.AddRecord(Rec);

end;

function TFormMainKeymaker.GridToXMLConf: WideString;
var
  xXML         : IXMLDocument;
  xNodeRoot,
  xNodeSec,
  xNodeSubSec,
  xNodeItem    : PXMLNode;
  i            : integer;
begin

  xXML := OXmlPDOM.CreateXMLDoc;
  xXML.WriterSettings.IndentType := itIndent;
  xXML.AddChild('root');

  xNodeRoot := xXML.DocumentElement;
  xNodeRoot.AddAttribute('id', FPKeyInfo.ID.ToString);

  // запускаем цыкл по дереву
  MemTable.TreeList.FullExpand;
  MemTable.First;

  while not MemTable.Eof do
  begin

    if MemTable.TreeNodeLevel = 1 then
    begin
      xNodeSec := xNodeRoot.AddChild('section');
      xNodeSec.SetAttribute('describe', MemTable.FieldByName('MemTableDescribe').AsString);
      xNodeSec.SetAttribute('signature', MemTable.FieldByName('MemTableSignature').AsString);
      MemTable.Next;
      Continue;
    end
    else if MemTable.TreeNodeLevel = 2 then
    begin
      xNodeSubSec := xNodeSec.AddChild('subsection');
      xNodeItem   := xNodeSubSec; // псевдо item для разстановки атрибутов
    end
    else if MemTable.TreeNodeLevel = 3 then
      xNodeItem := xNodeSubSec.AddChild('item');

    xNodeItem.SetAttribute('describe', MemTable.FieldByName('MemTableDescribe').AsString);
    xNodeItem.SetAttribute('signature', MemTable.FieldByName('MemTableSignature').AsString);
    xNodeItem.SetAttribute('id', MemTable.FieldByName('MemTableID').AsString);

    if MemTable.FieldByName('MemTableAccess').AsBoolean then
      xNodeItem.SetAttribute('access', MemTable.FieldByName('MemTableAccess').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableDisabled').AsBoolean then
      xNodeItem.SetAttribute('disabled', MemTable.FieldByName('MemTableDisabled').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableBan').AsBoolean then
      xNodeItem.SetAttribute('ban', MemTable.FieldByName('MemTableBan').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableInsert').AsBoolean then
      xNodeItem.SetAttribute('insert', MemTable.FieldByName('MemTableInsert').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableUpdate').AsBoolean then
      xNodeItem.SetAttribute('update', MemTable.FieldByName('MemTableUpdate').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableDelete').AsBoolean then
      xNodeItem.SetAttribute('delete', MemTable.FieldByName('MemTableDelete').AsBoolean.ToString);

    if MemTable.FieldByName('MemTableValidity').AsBoolean then
      xNodeItem.SetAttribute('validity', MemTable.FieldByName('MemTableValidity').AsBoolean.ToString);

    MemTable.Next;

  end;

  MemTable.First;

  //
  Result := xXML.XML;

end;

procedure TFormMainKeymaker.ActionGroupNewExecute(Sender: TObject);
var
  TreeNode : TTreeNode;
  KeyInfo  : TKeyInfo;
begin

  if     InputQuery('Создание группы ключей', 'Сигнатура', KeyInfo.KGSignature)
     and (KeyInfo.KGSignature <> '')
  then
  begin
    //
    FSession.SQL.Text := 'INSERT INTO KEY_GROUP(signature)' + #10
                       + '     VALUES(:pSignature)' + #10
                       + '  RETURNING key_group_id INTO :pKeyGroupID';

    FSession.ParamByName('pSignature').ParamType  := ptInput;
    FSession.ParamByName('pSignature').DataType   := ftString;
    FSession.ParamByName('pSignature').Value      := KeyInfo.KGSignature;
    FSession.ParamByName('pKeyGroupID').ParamType := ptOutput;
    FSession.ParamByName('pKeyGroupID').DataType  := ftInteger;
    FSession.SQL.Execute;

    // перебиваем в структуру
    KeyInfo.GroupID   := FSession.ParamByName('pKeyGroupID').AsInteger;
    KeyInfo.ID        := 0;
    KeyInfo.Signature := '';
    KeyInfo.Enabled   := False;
    KeyInfo.CountKeys := 0;

    // создаем в дереве
    TreeItemAdd(KeyInfo);

    // увеличить счеткик родителя на еденицу
  end;

end;

procedure TFormMainKeymaker.ActionKeyNewExecute(Sender: TObject);
var
  KeyInfo: TKeyInfo;
begin

  if     InputQuery('Создание ключа', 'Сигнатура', KeyInfo.Signature)
     and (KeyInfo.Signature <> '')
  then
  begin

    FSession.SQL.Text := 'INSERT INTO KEY(signature, key_group_id)' + #10
                       + '     VALUES(:pSignature, :pKeyGroupID)' + #10
                       + '  RETURNING key_id INTO :pKeyID';

    FSession.ParamByName('pSignature').ParamType   := ptInput;
    FSession.ParamByName('pSignature').DataType    := ftString;
    FSession.ParamByName('pSignature').Value       := KeyInfo.Signature;
    FSession.ParamByName('pKeyGroupsID').ParamType := ptInput;
    FSession.ParamByName('pKeyGroupsID').DataType  := ftInteger;
    FSession.ParamByName('pKeyGroupsID').Value     := PKeyInfo(TreeView.Selected.Data).GroupID;
    FSession.ParamByName('pKeyID').ParamType       := ptOutput;
    FSession.ParamByName('pKeyID').DataType        := ftInteger;
    FSession.SQL.Execute;

    // перебиваем в структуру
    KeyInfo.GroupID     := PKeyInfo(TreeView.Selected.Data).GroupID;
    KeyInfo.KGSignature := PKeyInfo(TreeView.Selected.Data).KGSignature;
    KeyInfo.ID          := FSession.ParamByName('pKeyID').AsInteger;
    KeyInfo.Enabled     := False;

    // создаем в дереве
    TreeItemAddChild(KeyInfo);

    // увеличить счеткик родителя на еденицу

  end;

end;

procedure TFormMainKeymaker.ActionKeySaveAsExecute(Sender: TObject);
var
  KeyInfo: TKeyInfo;
begin

  if     InputQuery('Сохранть ключ как', 'Сигнатура', KeyInfo.Signature)
     and (KeyInfo.Signature <> '')
  then
  begin
    FSession.SQL.Text := 'INSERT INTO KEY(signature, key_group_id)' + #10
                       + '     VALUES(:pSignature, :pKeyGroupID)' + #10
                       + '  RETURNING key_id INTO :pKeyID';

    FSession.ParamByName('pSignature').ParamType  := ptInput;
    FSession.ParamByName('pSignature').DataType   := ftString;
    FSession.ParamByName('pSignature').Value      := KeyInfo.Signature;
    FSession.ParamByName('pKeyGroupID').ParamType := ptInput;
    FSession.ParamByName('pKeyGroupID').DataType  := ftInteger;
    FSession.ParamByName('pKeyGroupID').Value     := PKeyInfo(TreeView.Selected.Data).GroupID;
    FSession.ParamByName('pKeyID').ParamType      := ptOutput;
    FSession.ParamByName('pKeyID').DataType       := ftInteger;
    FSession.SQL.Execute;

    // перебиваем в структуру
    KeyInfo.GroupID     := PKeyInfo(TreeView.Selected.Data).GroupID;
    KeyInfo.KGSignature := PKeyInfo(TreeView.Selected.Data).KGSignature;
    KeyInfo.ID          := FSession.ParamByName('pKeyID').AsInteger;
    KeyInfo.Enabled     := False;

    // создаем в дереве
    TreeItemAddChild(KeyInfo);

    // увеличить счеткик родителя на еденицу

  end;

end;

procedure TFormMainKeymaker.ActionTreeItemDeleteExecute(Sender: TObject);
begin

  if (TreeView.Selected = nil) then Exit;

  case TreeView.Selected.Level of

    // группа
    0 :
    begin
      //
      if PKeyInfo(TreeView.Selected.Data).GroupID = 1 then
        raise Exception.Create('Невозможно удалить группу ключей "Общая"');
      //
      if MessageBox(Handle,
                    PChar('Удалить группу ключей "' + PKeyInfo(TreeView.Selected.Data).KGSignature + '"?'),
                    PChar('Предупреждение'),
                    MB_ICONWARNING or MB_OKCANCEL) = mrOk
      then
      begin
        // удаляем с БД
        FSession.ExecSQLEx('DELETE KEY_GROUP kg WHERE kg.key_group_id = :pGroupID',
                           ['pGroupID', PKeyInfo(TreeView.Selected.Data).GroupID]);
        // удаляем с девева
        TreeView.Items.Delete(TreeView.Selected);
        // уменшить счетчик родителя на еденицу
      end
      else
        Beep;
      //
    end;

    // ключ
    1 :
    if MessageBox(Handle,
                  PChar('Удалить ключ "' + PKeyInfo(TreeView.Selected.Data).Signature + '"?'),
                  PChar('Предупреждение'),
                  MB_ICONWARNING or MB_OKCANCEL) = mrOk
    then
    begin
      //
      FSession.ExecSQLEx('DELETE KEY k WHERE k.key_id = :pKeyID',
                         ['pKeyID', PKeyInfo(TreeView.Selected.Data).ID]);
      //
      TreeView.Items.Delete(TreeView.Selected);
    end;

  end;

end;

procedure TFormMainKeymaker.ActionGridCheckColumnExecute(Sender: TObject);
var
  i, j : integer;
  b    : boolean;
begin

  {Grid.BeginUpdate;

  if        (Sender as TAction).ActionComponent.Name = 'miColCheck' then
      b := True
    else if (Sender as TAction).ActionComponent.Name = 'miColUnCheck' then
      b := False;

  i := GridFind(Grid.Cellby['tcSection', Grid.SelectedRow].Text, tcSection.Index);

  for j := i + 1 to Grid.RowCount - 1 do
    if  (Grid.CellBy['tcSubSection', j].Text = Grid.Cellby['tcSubSection', Grid.SelectedRow].Text) then
      (Grid.Row[j] as INxCellsRow).Cells[Grid.SelectedCol].AsBoolean := b;

  Grid.EndUpdate; }
end;

procedure TFormMainKeymaker.ActionGridDeleteSelectedExecute(Sender: TObject);
var
  iSec: integer;
begin

  MemTable.DisableControls;

  case MemTable.TreeNodeLevel of
    // удаляем раздел
    1 :
    begin
      iSec := MemTable.FieldByName('MemTableTreeSectionID').AsInteger;
      MemTable.TreeNodeExpanded := True;
      while not MemTable.Eof do
      begin
        if MemTable.FieldByName('MemTableTreeSectionID').AsInteger = iSec
        then
        begin
          MemTable.Delete;
          Continue;
        end;
        MemTable.Next;
      end;
    end;
    // удаляем подраздел
    2 :
    begin
      iSec := MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger;
      MemTable.TreeNodeExpanded := True;
      while not MemTable.Eof do
      begin
        if MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger = iSec
        then
        begin
          MemTable.Delete;
          Continue;
        end;
        MemTable.Next;
      end;
    end;
    // удаляем item
    3 : MemTable.Delete;
  end;

  MemTable.EnableControls;

end;

procedure TFormMainKeymaker.ActionRefleshExecute(Sender: TObject);
var
  KeyInfo: TKeyInfo;
begin

  TreeView.Items.Clear;
  TreeView.Items.BeginUpdate;

  Query.Open;

  // читаем с БД и делаем дерево
  while not Query.Eof do
  begin
    // перебиваем в структуру
    KeyInfo.GroupID     := Query.FieldByName('key_group_id').AsInteger;
    KeyInfo.KGSignature := Query.FieldByName('kg_signature').AsString;;
    KeyInfo.ID          := Query.FieldByName('key_id').AsInteger;
    KeyInfo.Signature   := Query.FieldByName('signature').AsString;
    KeyInfo.Enabled     := StrToBoolDef(Query.FieldByName('sign_activity').AsString, False);
    KeyInfo.CountKeys   := Query.FieldByName('count_keys').AsInteger;
    // строим новую ветку
    if Query.FieldByName('rank_key_group_id').AsInteger = 1 then
      TreeItemAdd(KeyInfo);
    // строим новый узел
    TreeItemAddChild(KeyInfo);
    //
    Query.Next;
  end;

  Query.Close;

  TreeView.Items.EndUpdate;
  TreeView.Items.GetFirstNode.Selected := True;

end;

procedure TFormMainKeymaker.ActionSaveToDBExecute(Sender: TObject);
var
  qOper  : TOraQuery;
  OraXML : TOraXML;
begin

  // создаем id ключа
  if    (FPKeyInfo.ID = 0)
     and ActionKeyNew.Execute()
  then
    FPKeyInfo := PKeyInfo(TreeView.Selected.GetLastChild.Data);

  // сохраняем в БД. пользователь не отменил
  if FPKeyInfo.ID <> 0 then
  begin

    qOper := TOraQuery.Create(nil);
    qOper.Session := FSession;

    FXMLConf := GridToXMLConf();

    OraXML := TOraXML.Create(nil);
    OraXML.OCISvcCtx := FSession.OCISvcCtx;
    OraXML.AsString  := FXMLConf;

    qOper.SQL.Text := 'UPDATE KEY k' + #10
                    + '   SET k.xml_conf = :pXMLConf' + #10
                    + ' WHERE k.key_id = :pKeyID';

    qOper.ParamByName('pKeyID').AsInteger := FPKeyInfo.ID;
    qOper.ParamByName('pXMLConf').AsXML := OraXML;
    qOper.Execute;

  end;

  ActionSaveToDB.Enabled := False;

end;

procedure TFormMainKeymaker.ActionKeyCheckExecute(Sender: TObject);
begin
  Caption := PKeyInfo(TreeView.Selected.Data).KGSignature;
end;

procedure TFormMainKeymaker.ActionKeysCheckExecute(Sender: TObject);
begin
//
end;

procedure TFormMainKeymaker.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMainKeymaker.ActionExpandedExecute(Sender: TObject);
begin
//
end;

procedure TFormMainKeymaker.ActionUnExpandedExecute(Sender: TObject);
begin
//
end;


procedure TFormMainKeymaker.TreeViewDblClick(Sender: TObject);
begin

  if     (TreeView.Selected <> nil)
     and (TreeView.Selected.Level = 1)
  then
    GridInit(PKeyInfo(TreeView.Selected.Data));

end;

procedure TFormMainKeymaker.eFindTextChange(Sender: TObject);
begin
  eFindText.EditButtons[0].Visible := ifThen(Length(eFindText.Text) > 0, 'True', 'False').ToBoolean;
end;

procedure TFormMainKeymaker.eFindTextEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  eFindText.Text := '';
end;

procedure TFormMainKeymaker.miRenameClick(Sender: TObject);
var
  KeyInfo   : TKeyInfo;
  _pKeyInfo : PKeyInfo;
begin

  _pKeyInfo := TreeView.Selected.Data;

  if    (TreeView.Selected = nil)
     or (    (TreeView.Selected.Level = 0)
         and (_pKeyInfo.GroupID = 1) ) // група общая не переименовывается
  then
  begin
    Beep;
    Exit;
  end;

  KeyInfo.KGSignature := _pKeyInfo.KGSignature;
  KeyInfo.Signature   := _pKeyInfo.Signature;

  // перемеинование группы/ключа
  if     (TreeView.Selected.Level = 0)
     and InputQuery('Переименование группы', 'Введите Сигнатуру', KeyInfo.KGSignature)
     and (KeyInfo.KGSignature <> '')
  then
  begin
    // бд
    FSession.ExecSQLEx('UPDATE KEY_GROUP kg SET kg.signature = :pSignature WHERE kg.key_group_id = :pGroupID',
                       ['pGroupID', _pKeyInfo.GroupID, 'pSignature', KeyInfo.KGSignature]);
    // дерево
    TreeView.Selected.Text := KeyInfo.KGSignature;
    _pKeyInfo.KGSignature  := KeyInfo.KGSignature;
  end
  else if     (TreeView.Selected.Level = 1)
          and InputQuery('Переименование ключа', 'Введите Сигнатуру', KeyInfo.Signature)
          and (KeyInfo.Signature <> '')
  then
  begin
    // бд
    FSession.ExecSQLEx('UPDATE KEY k SET k.signature = :pSignature WHERE k.key_id = :pKeyID',
                       ['pKeyID', _pKeyInfo.ID, 'pSignature', KeyInfo.Signature]);
    // дерево
    TreeView.Selected.Text := KeyInfo.Signature;
    _pKeyInfo.Signature := KeyInfo.Signature;
  end;

  //
  TreeView.Selected.Data := _pKeyInfo;

end;

procedure TFormMainKeymaker.miRowCheckClick(Sender: TObject);
var
  i: integer;
begin

  {Grid.BeginUpdate;

  for i := 0 to Grid.RowCount - 1 do
    if Grid.Selected[i] then
      (Grid.Row[i] as INxCellsRow).Cells[cbcAccess.Index].AsBoolean := True;

  Grid.EndUpdate;

end;

procedure TFormMain.miRowUnCheckClick(Sender: TObject);
var
  i: integer;
begin

  Grid.BeginUpdate;

  for i := 0 to Grid.RowCount - 1 do
    if Grid.Selected[i] then
      (Grid.Row[i] as INxCellsRow).Cells[cbcAccess.Index].AsBoolean := False;

  Grid.EndUpdate;
     }
end;

procedure TFormMainKeymaker.miExpTrueClick(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to TreeView.Items.Count - 1 do
    TreeView.Items.Item[i].Expanded := True;
end;

procedure TFormMainKeymaker.miReExpFalseClick(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to TreeView.Items.Count - 1 do
    TreeView.Items.Item[i].Expanded := False;
end;

procedure TFormMainKeymaker.N1Click(Sender: TObject);
begin
  MemTable.TreeList.FullExpand;
end;

procedure TFormMainKeymaker.N2Click(Sender: TObject);
begin
  MemTable.TreeList.FullCollapse;
end;

procedure TFormMainKeymaker.PageControlChange(Sender: TObject);
begin

  case PageControl.ActivePageIndex of
    0 : ActionGridDeleteSelected.Enabled := True;
    1 : begin
          Memo.Lines.Text := GridToXMLConf();
          ActionGridDeleteSelected.Enabled := False;
        end;
    2 : ActionGridDeleteSelected.Enabled := False;
  end;

  bGridSectionAdd.Enabled := ActionGridDeleteSelected.Enabled;

end;

procedure TFormMainKeymaker.miSectionAddClick(Sender: TObject);
var
  aStr : array of string;
  iSec : integer;
begin

  SetLength(aStr, 2);

  aStr[0] := '0';
  aStr[1] := '1';

  if InputQuery('Новый Раздел', ['Название', 'Сигнатура'], aStr) then
  begin
    MemTable.DisableControls;
    MemTable.RecordsView.MemTableData.RecordsList.BeginUpdate;

    GridSectionAdd(aStr[0], aStr[1], iSec);

    MemTable.RecordsView.MemTableData.RecordsList.EndUpdate;
    MemTable.EnableControls;
  end;

  Finalize(aStr);

end;

procedure TFormMainKeymaker.miSelectAllSubSecItemClick(Sender: TObject);
begin

  MemTable.DisableControls;
  MemTable.Locate('MemTableTreeSubSectionID', MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger, []);
  MemTable.Next;

  try
    while not MemTable.Eof do
    begin
      if MemTable.FieldByName('MemTableTreeParentID').AsInteger =
         MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger
      then
        Grid.SelectedRows.CurrentRowSelected := True
      else
        Break;
      MemTable.Next;
    end;
   finally
     //MemTable.First;
     MemTable.EnableControls;
   end;

end;

procedure TFormMainKeymaker.miSubSectionAddClick(Sender: TObject);
var
  aStr    : array of string;
  iSubSec : integer;
begin

  SetLength(aStr, 3);

  aStr[0] := '0';
  aStr[1] := '1';
  aStr[2] := '2';

  if InputQuery('Новый Подраздел', ['Название', 'Сигнатура', 'ID'], aStr) then
  begin
    MemTable.DisableControls;
    MemTable.RecordsView.MemTableData.RecordsList.BeginUpdate;

    GridSubSectionAdd(MemTable.FieldByName('MemTableTreeSectionID').AsInteger,
                      aStr[0],
                      aStr[1],
                      aStr[2].ToInteger,
                      [False, False, False, False, False, False, False],
                      iSubSec);

    MemTable.RecordsView.MemTableData.RecordsList.EndUpdate;
    MemTable.EnableControls;
  end;

  Finalize(aStr);

end;

procedure TFormMainKeymaker.miSubSectionItemAddClick(Sender: TObject);
var
  aStr: array of string;
begin

  SetLength(aStr, 3);

  aStr[0] := '0';
  aStr[1] := '1';
  aStr[2] := '2';

  if InputQuery('Новый Item', ['Название', 'Сигнатура', 'ID'], aStr) then
  begin
    MemTable.RecordsView.MemTableData.RecordsList.BeginUpdate;

    GridSubSectionItemAdd(MemTable.FieldByName('MemTableTreeSectionID').AsInteger,
                          MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger,
                          aStr[0],
                          aStr[1],
                          aStr[2].ToInteger,
                          [False, False, False, False, False, False, False]);

    MemTable.RecordsView.MemTableData.RecordsList.EndUpdate;
    MemTable.EnableControls;
  end;

  Finalize(aStr);

end;

procedure TFormMainKeymaker.bGridSectionAddClick(Sender: TObject);
var
  FormSectionAdd       : TFormSectionAdd;
  pRecModule_          : PRecModule;
  xXML                 : IXMLDocument;
  xNode                : PXMLNode;
  i, iSecID, iSubSecID : integer;
begin

  FormSectionAdd := TFormSectionAdd.Create(Self);
  FormSectionAdd.ShowModal;

  try

    if FormSectionAdd.ModalResult = mrCancel then
      Exit;

    Screen.Cursor := crHourGlass;
    Grid.Cursor := crHourGlass;

    MemTable.DisableControls;
    MemTable.RecordsView.MemTableData.RecordsList.BeginUpdate; // прямая запись в буфер обходя "замедляющие методы TDAtaSet'a"

    //
    case FormSectionAdd.PolyPager.ActivePageIndex of

      // GUI
      0 : begin

            pRecModule_ := PRecModule(FormSectionAdd.lbGUI.Items.Objects[FormSectionAdd.lbGUI.ItemIndex]);

            // раздел
            iSecID := MemTable.Lookup('MemTableSignature', 'GUI', 'MemTableTreeID');

            // возможно пользователь уже создал какие-то разделы ранние...
            if iSecID = 0 then
              GridSectionAdd('Графический интерфейс пользователя', 'GUI', iSecID);

            // подраздел
            GridSubSectionAdd(iSecID,
                              PRecModule_.Signature,
                              PRecModule_.SignatureShort,
                              PRecModule_.ModuleID,
                              [False, False, False, False, False, False, False],
                              iSubSecID);

            xXML := OXmlPDOM.CreateXMLDoc;
            xXML.LoadFromXML(PRecModule_.XMLConf);

            // items
            xNode := xXML.DocumentElement;

            //
            while xNode <> nil do
            begin
              if xNode.GetAttributeDef('id', 'False').ToBoolean then
                GridSubSectionItemAdd(iSecID,
                                      iSubSecID,
                                      xNode.GetAttributeDef('caption', xNode.NodeName),
                                      xNode.NodeName,
                                      xNode.GetAttribute('id').ToInteger,
                                      [False, False, False, False, False, False, False]);
              //
              xNode := xNode.NextNodeInTree;
            end;

          end;

      // Forms
      1 : begin


          end;

    end;

  finally
    FormSectionAdd.Release;
    MemTable.RecordsView.MemTableData.RecordsList.EndUpdate;
    MemTable.EnableControls;
    Screen.Cursor := crDefault;
    Grid.Cursor := crDefault;
  end;

end;

procedure TFormMainKeymaker.bRefleshClick(Sender: TObject);
begin
  MemTable.TreeNodeExpanded := True;
end;

procedure TFormMainKeymaker.dsMemTableDataChange(Sender: TObject; Field: TField);
begin
  ActionSaveToDB.Enabled := True;
end;

procedure TFormMainKeymaker.GridCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
var
  vSec, vSubSec: variant;
begin
  //
  vSec := MemTable.Lookup('MemTableTreeSectionID',
                          MemTable.FieldByName('MemTableTreeSectionID').AsInteger,
                          'MemTableSignature');
  //
  vSubSec := MemTable.Lookup('MemTableTreeSubSectionID',
                             MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger,
                             'MemTableSignature');
  //
  Self.Grid.FindFieldColumn('MemTableDescribe').Footer.Value :=
    Format('%s\%s\%s  ID=%s',
           [vSec,
            vSubSec,
            MemTable.FieldByName('MemTableSignature').AsString,
            MemTable.FieldByName('MemTableID').AsString]);
end;

procedure TFormMainKeymaker.GridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  pmGridCol.Tag := Column.Index;
  pmGridCol.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFormMainKeymaker.miColCheckClick(Sender: TObject);
var
  i: integer;
  b: boolean;
begin

  if (Sender as TMenuItem).Name = 'miColCheck' then
    b := True
  else
    b := False;

  MemTable.DisableControls;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    MemTable.Bookmark := Grid.SelectedRows[i];
    MemTable.Edit;
    MemTable.Fields[pmGridCol.Tag].Value := b;
    MemTable.Post;
  end;

  MemTable.EnableControls;

end;

procedure TFormMainKeymaker.miCheckSelRowsClick(Sender: TObject);
var
  i: integer;
  b: boolean;
begin

  //Caption := (Sender as TMenuItem).Name;

  if (Sender as TMenuItem).Name = 'miRowCheck' then
    b := True
  else
    b := False;

  MemTable.DisableControls;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    MemTable.Bookmark := Grid.SelectedRows[i];
    MemTable.Edit;
    MemTable.FieldByName('MemTableAccess').Value   := b;
    MemTable.FieldByName('MemTableDisabled').Value := b;
    MemTable.FieldByName('MemTableBan').Value      := b;
    MemTable.FieldByName('MemTableInsert').Value   := b;
    MemTable.FieldByName('MemTableUpdate').Value   := b;
    MemTable.FieldByName('MemTableDelete').Value   := b;
    MemTable.Post;
  end;

  MemTable.EnableControls;

end;

procedure TFormMainKeymaker.GridColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin

  // section
  if MemTable.FieldByName('MemTableTreeID').AsInteger = MemTable.FieldByName('MemTableTreeSectionID').AsInteger then
  begin
    Params.Background := COLOR_GRID_SECTION;
    Params.Font.Style := [fsBold];
  end;

  // subsection
  if MemTable.FieldByName('MemTableTreeID').AsInteger = MemTable.FieldByName('MemTableTreeSubSectionID').AsInteger then
    Params.Background := COLOR_GRID_SUBSECTION;

end;

end.
