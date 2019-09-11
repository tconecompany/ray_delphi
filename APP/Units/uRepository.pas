{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                      TRepository                      }
{                  ����������� ��������                 }
{                                                       }
{        ���� ���������: 11.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uRepository;

interface

uses
  // odac
  Ora,
  // oxml
  OXmlPDOM,
  // my
  uTypes,
  uRegForms;

{ TRecEdit }

type
  TRecEdit = record
    KeyFields               : string;
    KeySequence             : string;                                           // ����������������� ������ ���� �������� �������� � Oracle
    FieldsStrings           : TDynStrings;                                      // ���� �������������� �������� ������ Edit
    DefaultExpressionParams : TDynParams;
  end;

{ TRecGrid }

type
  TRecGrid = record
    RowLines          : boolean;                                                // ���������� �������������� �����
    EvenRow           : boolean;                                                // ������ ������ � �����
    FieldsStrings     : TDynStrings;                                            // �������� ����/�������
    TitleParams       : TDynParams;                                             // ������� �����
    WidthParams       : TDynParams;                                             // ������ �����
    CheckBoxesStrings : TDynStrings;                                            // ���� �������
    FontWidthStrings  : TDynStrings;                                            // ������� ����� ��� �����
    FontColorParams   : TDynParams;                                             // ���� ������ ����
    InVisibleStrings  : TDynStrings;                                            // ������ ���� �� �����
  end;

{ TRecReadingItem }

type
  TRecReadingItem = record
    Caption   : string;                                                         // ���������
    Signature : string;                                                         // ��������� ������
    ID        : integer;                                                        // ��
    Params    : TDynParams;                                                     // ��������� (����������������)
    ShowMode  : TRayShowMode;                                                   // ����� ��������
  end;

{ TDynRecReadingItem }

type
  TDynRecReadingItem = array of TRecReadingItem;

{ TRecReading }
type
  TRecReading = record
    Caption : string;
    Width   : integer;
    Height  : integer;
    Items   : TDynRecReadingItem;
  end;

{ TRecDeleteItem }

type
  TRecDeleteItem = record
    Table      : string;
    PrimaryKey : variant;
  end;

{ TRecAction }

type
  TRecAction = record
    RecNewSignature : string;                                                   // �� ����������� �������� ���������� ���� 0 �� ��������� �� ������ append
    RecNewShowMode  : TRayShowMode;                                             // ����� ��������
    RecNewParams    : string;                                                   // ��������� ��������
    RecReading      : TRecReading;                                              // ��������� �������� ����� ��� ������ ������
    RecDeleteItems  : array of TRecDeleteItem;                                  // �������� ������ �� ��������
  end;

{ TTreeList}
type
  TTreeList = record
    DefaultNodeExpanded : boolean;                                              // �������� ���� ������
    KeyFieldName        : string;                                               // ���� ���� ������ ������
    RefParentFieldName  : string;                                               // �������� ���� �������� � ������
  end;

{ TRecConf (������������) }

type
  TRecConf = record
    XML                        : WideString;                                    // xml-������������
    SessionShema               : string;                                        // ����� ������ �� ��������� ���������� (���������������)
    SessionPassword            : string;                                        // ������ ������������
    LookupOptions              : TDynParams;                                    // ��������� ����������� %�������� �����, {����������}, [����]
    FormCaption                : string;                                        // ��������� �����/�������
    FormCaptionParams          : TDynParams;                                    // ������������ ���������������� ��������� ��� ������������ ���������
    SQL                        : string;                                        // ������� sql
    Pick                       : TRecPick;                                      // �����
    Edit                       : TRecEdit;                                      // ����� ��������������
    Grid                       : TRecGrid;                                      // ��������� �����
    Action                     : TRecAction;                                    // ��������
    TreeList                   : TTreeList;                                     // ����������� ���������� �� ����� ������
    Debug                      : string;                                        // ��� �������
  end;

{ TRepository }

type
  TRepository = class
  private

    FQuery       : TOraQuery;
    FXML         : IXMLDocument;
    FID          : integer;
    FActionID    : integer;
    FSignature   : string;
    FParam       : string;
    FModuleID    : integer;
    FDescribe    : string;
    FSignOneCopy : boolean;
    FXMLConf     : WideString;

    constructor Create;

    procedure SetID(AID: integer);

    function GetRecConf: TRecConf;

  public

    procedure Exec(ID: integer; Param: string='');                              // ��������� �����������
    procedure ExecModal(ID: integer; Param: string='');                         // ��������� ����������� ������������� � ��������� ������

    property ID: integer read FID write SetID;                                  // id ����������� ��� ����������
    property Signature: string read FSignature;
    property Param: string read FParam;
    property Describe: string read FDescribe;
    property RecConf: TRecConf read GetRecConf;                                 // ������������ (������� xml ��������)

  end;

var
  Repository: TRepository;

implementation

uses
  // sys
  System.SysUtils,
  Vcl.Forms,
  // oxml
  OXmlUtils,
  // my
  uDataModuleRay,
  uStrUtilsExt,
  uEnvVariables;

{ TRepository }

constructor TRepository.Create;
begin

  FQuery := TOraQuery.Create(nil);
  FQuery.Session := DataModuleRay.OraSession;

  FXML := OXmlPDOM.CreateXMLDoc;

end;

procedure TRepository.SetID(AID: integer);
begin

  FID := AID;

  // ��������� ����������� � ��
  FQuery.SQL.Text := 'SELECT r.*' + #10
                   + '  FROM REPOSITORY r' + #10
                   + ' WHERE r.repository_id = :pRepositoryID';

  FQuery.ParamByName('pRepositoryID').AsInteger := AID;

  try

    FQuery.Open;

    if FQuery.IsEmpty then
      raise Exception.Create(Format('����������� "%d" �� ������', [AID]));

    if not Boolean(FQuery.FieldValues['sign_activity']) then
      raise Exception.Create(Format('����������� #%d ����������', [AID]));

    FActionID    := FQuery.Fields.FieldByName('action_id').AsInteger;
    FSignature   := FQuery.Fields.FieldByName('signature').AsString;
    FParam       := FQuery.Fields.FieldByName('param').AsString;
    FModuleID    := FQuery.Fields.FieldByName('module_id').AsInteger;
    FDescribe    := FQuery.Fields.FieldByName('describe').AsString;;
    FSignOneCopy := FQuery.FieldValues['sign_one_copy'];
    FXMLConf     := FQuery.Fields.FieldByName('xml_conf').AsWideString;

  finally
    FQuery.Close;
    FXML.Clear(True);
  end;

end;

function TRepository.GetRecConf: TRecConf;
var
  xNodeList    : IXMLNodeList;
  xNode        : PXMLNode;
  RecConfEmpty : TRecConf;
  i            : integer;

  // ���� sql_unit �� id
  function ToFindSQLUnitByID(AID: string): WideString;
  var
    lxNode     : PXMLNode;
    lxNodeList : IXMLNodeList;
  begin
    lxNodeList := FXML.DocumentElement.SelectNodes('/root/sql_unit');
    lxNode     := lxNodeList.GetFirst;
    while (lxNode <> nil) do
    begin
      if lxNode.GetAttributeDef('id', '') = AID then
      begin
        Result := Trim(lxNode.Text);
        Break;
      end;
      lxNodeList.GetNext(lxNode);
    end;
  end;

begin

  // ������� ��� ���� ������ ������������
  Result := RecConfEmpty;

  // ��� ������������ - ����������
  if        (FXMLConf = '')
     or not (FActionID in [1, 2])
  then
    Exit;

try

  // ��������� xml-������������
  FXML.LoadFromXML(FXMLConf);
  FXML.WriterSettings.IndentType := itIndent;

  xNode := FXML.DocumentElement;

  // ������������ ��������
  try

    // xml
    Result.XML := FXML.XML;

    // session
    Result.SessionShema    := xNode.SelectNode('session').GetAttribute('shema');
    Result.SessionPassword := xNode.SelectNode('session').GetAttribute('password');

    // lookup_options (��������������)
    try
      xNodeList := FXML.DocumentElement.SelectNodes('/root/lookup_options/item');
      xNode := xNodeList.GetFirst;
      SetLength(Result.LookupOptions, xNodeList.Count);
      //
      while xNode <> nil do
      begin
        Result.LookupOptions[xNodeList.IndexOf(xNode)].Name              := xNode.GetAttribute('name');
        Result.LookupOptions[xNodeList.IndexOf(xNode)].Type_             := StrToFieldType(xNode.GetAttribute('type'));
        Result.LookupOptions[xNodeList.IndexOf(xNode)].Size              := xNode.GetAttributeDef('size', '0').ToInteger;
        Result.LookupOptions[xNodeList.IndexOf(xNode)].DefaultExpression := xNode.GetAttributeDef('default_expression', '');
        // ������� �� ����������� ��� �����
        if     SameText(xNode.GetAttribute('type'), 'string')
           and (xNode.GetAttributeDef('size', '0').ToInteger = 0)
        then
          Result.LookupOptions[xNodeList.IndexOf(xNode)].Size := 255;
        //
        xNodeList.GetNext(xNode);
      end;
    finally
      xNode := FXML.DocumentElement;
    end;

    // form
    Result.FormCaption       := xNode.SelectNode('form').GetAttribute('caption');
    Result.FormCaptionParams := StrToDynParams(Result.FormCaption);

    // sql
    Result.SQL := xNode.SelectNode('sql').Text;

  except
    raise Exception.Create('������ XML-������������. �������� �������� "session, form, sql"');
  end;

  // pick (��������������)
  try
    with Result, Result.Pick do
    begin
      Pick.Caption    := xNode.SelectNode('pick').GetAttributeDef('caption', '�����');
      Pick.WidthKey   := xNode.SelectNode('pick').GetAttributeDef('width_key', '100').ToInteger;
      Pick.WidthValue := xNode.SelectNode('pick').GetAttributeDef('width_value', '300').ToInteger;
      Pick.Checked    := xNode.SelectNode('pick').GetAttributeDef('�hecked', 'False').ToBoolean;
      //
      xNodeList := FXML.DocumentElement.SelectNodes('/root/pick/item');
      xNode := xNodeList.GetFirst;
      //
      SetLength(Pick.Items, xNodeList.Count);
      //
      while xNode <> nil do
      begin
        Items[xNodeList.IndexOf(xNode)].Caption      := xNode.GetAttribute('caption');
        Items[xNodeList.IndexOf(xNode)].LookupItemID := xNode.GetAttribute('lookup_item_id');
        Items[xNodeList.IndexOf(xNode)].Control      := xNode.GetAttributeDef('control', 'edit');
        Items[xNodeList.IndexOf(xNode)].Condition    := xNode.GetAttribute('condition');
        //
        if xNode.GetAttributeDef('sql_unit_id', '') <> '' then
        begin
          Items[xNodeList.IndexOf(xNode)].SQLUnitID := xNode.GetAttribute('sql_unit_id');
          Items[xNodeList.IndexOf(xNode)].SQLUnit   := ToFindSQLUnitByID(Items[xNodeList.IndexOf(xNode)].SQLUnitID);
        end;
        //
        Items[xNodeList.IndexOf(xNode)].Keys        := xNode.GetAttributeDef('keys', '');
        Items[xNodeList.IndexOf(xNode)].Items       := xNode.GetAttributeDef('items', '');
        Items[xNodeList.IndexOf(xNode)].Color       := xNode.GetAttributeDef('color', '');
        Items[xNodeList.IndexOf(xNode)].MultiSelect := StrToBool(xNode.GetAttributeDef('multi_select', 'False'));
        Items[xNodeList.IndexOf(xNode)].Hint        := xNode.GetAttributeDef('hint', '');;
        //
        xNodeList.GetNext(xNode);
      end;
      //
      xNode := FXML.DocumentElement;
    end;
  except
  end;

  // edit (��������������)
  try Result.Edit.KeyFields               := xNode.SelectNode('edit').GetAttribute('key_fields'); except end;
  try Result.Edit.KeySequence             := xNode.SelectNode('edit').GetAttribute('key_sequence'); except end;
  try Result.Edit.FieldsStrings           := StrToDynStrings(xNode.SelectNode('edit/fields').Text); except end;
  try Result.Edit.DefaultExpressionParams := StrToDynParams(xNode.SelectNode('edit/default_expression').Text); except end;

  // ��������� DefaultExpression �� ������� ���������� � �������� �������. ����������� � �������� Value
  for i := 0 to High(Result.Edit.DefaultExpressionParams) do
  begin
    Result.Edit.DefaultExpressionParams[i].DefaultExpression := Result.Edit.DefaultExpressionParams[i].Value;
    //
    if Pos('{', Result.Edit.DefaultExpressionParams[i].DefaultExpression) > 0 then
      Result.Edit.DefaultExpressionParams[i].Value := EnvVariables.ParamByName(Result.Edit.DefaultExpressionParams[i].DefaultExpression)
  end;

  // grid (��������������)
  try Result.Grid.RowLines          := xNode.SelectNode('grid').GetAttribute('row_lines').ToBoolean; except Result.Grid.RowLines := False; end;
  try Result.Grid.EvenRow           := xNode.SelectNode('grid').GetAttribute('even_row').ToBoolean; except Result.Grid.EvenRow := True; end;
  try Result.Grid.FieldsStrings     := StrToDynStrings(xNode.SelectNode('grid/field').Text); except end;
  try Result.Grid.TitleParams       := StrToDynParams(xNode.SelectNode('grid/title').Text); except end;
  try Result.Grid.WidthParams       := StrToDynParams(xNode.SelectNode('grid/width').Text); except end;
  try Result.Grid.CheckBoxesStrings := StrToDynStrings(xNode.SelectNode('grid/checkoxes').Text); except end;
  try Result.Grid.FontWidthStrings  := StrToDynStrings(xNode.SelectNode('grid/font_width').Text); except end;
  try Result.Grid.FontColorParams   := StrToDynParams(xNode.SelectNode('grid/font_color').Text); except end;
  try Result.Grid.InvisibleStrings  := StrToDynStrings(xNode.SelectNode('grid/invisible').Text); except end;

  // action rec_new (��������������)
  try Result.Action.RecNewSignature := xNode.SelectNode('action/rec_new').GetAttribute('signature'); except end;
  try Result.Action.RecNewShowMode  := StrToShowMode(xNode.SelectNode('action/rec_new').GetAttribute('show_mode')); except Result.Action.RecNewShowMode := smChild; end;
  try Result.Action.RecNewParams    := xNode.SelectNode('action/rec_new').Text; except end;

  // action rec_reading (��������������)
  try
    with Result.Action.RecReading do
    begin
      Caption := xNode.SelectNode('action/rec_reading').GetAttributeDef('caption', '���������');
      Width   := xNode.SelectNode('action/rec_reading').GetAttributeDef('width', '300').ToInteger;
      Height  := xNode.SelectNode('action/rec_reading').GetAttributeDef('height', '170').ToInteger;
      //
      xNodeList := FXML.DocumentElement.SelectNodes('action/rec_reading/item');
      xNode := xNodeList.GetFirst;
      //
      SetLength(Items, xNodeList.Count);
      //
      while xNode <> nil do
      begin
        Items[xNodeList.IndexOf(xNode)].Caption   := xNode.GetAttributeDef('caption', '');
        Items[xNodeList.IndexOf(xNode)].Signature := xNode.GetAttributeDef('signature', '');
        Items[xNodeList.IndexOf(xNode)].ID        := xNode.GetAttributeDef('id', '0').ToInteger;
        Items[xNodeList.IndexOf(xNode)].Params    := StrToDynParams(xNode.Text);
        Items[xNodeList.IndexOf(xNode)].ShowMode  := StrToShowMode(xNode.GetAttributeDef('show_mode', 'child'));
        //
        xNodeList.GetNext(xNode);
      end;
      //
      xNode := FXML.DocumentElement;
    end;
  except
  end;

  // action rec_delete (��������������)
  try
    xNodeList := FXML.DocumentElement.SelectNodes('/root/action/rec_delete/item');
    xNode := xNodeList.GetFirst;
    //
    SetLength(Result.Action.RecDeleteItems, xNodeList.Count);
    //
    while xNode <> nil do
    begin
      Result.Action.RecDeleteItems[xNodeList.IndexOf(xNode)].Table      := xNode.GetAttribute('table');
      Result.Action.RecDeleteItems[xNodeList.IndexOf(xNode)].PrimaryKey := xNode.GetAttribute('primary_key');
      //
      xNodeList.GetNext(xNode);
    end;
  finally
    xNode := FXML.DocumentElement;
  end;

  // tree_list (��������������)
  try Result.TreeList.DefaultNodeExpanded := xNode.SelectNode('tree_list').GetAttribute('default_node_expanded').ToBoolean; except Result.TreeList.DefaultNodeExpanded := False; end;
  try Result.TreeList.KeyFieldName        := xNode.SelectNode('tree_list').GetAttribute('key_field_name'); except end;
  try Result.TreeList.RefParentFieldName  := xNode.SelectNode('tree_list').GetAttribute('ref_parent_field_name'); except end;

  FXML.Clear(True);

except
  on E: Exception do
    raise Exception.Create(E.Message);
end;

end;

procedure TRepository.Exec(ID: integer; Param: string);
var
  i: integer;
begin

  {
    ������ �������� ������� RAY.ACTIONS:
      1	- ������� ����� � �������� ������;
      2 - ������� ����� � ��������� ������;
      3	- ��������� ������� ��������� (������� �����������);
      4 - ��������� �������� ��������� Oracle;
  }

  try

    Self.ID := ID;

    // ��������� �������� ��������� ActionID
    case FActionID of

      1 : begin
            // ��������� �������� FSignOneCopy (���� ��������� �������)
            if FSignOneCopy then
              for i := 0 to Screen.FormCount - 1 do
                if Screen.Forms[i].Tag = ID then
                begin
                  Screen.Forms[i].SetFocus;
                  Exit;
                end;
            //
            RegForms.ShowChild(Repository.FSignature, ID, NVL(Param, FParam));
          end;

      2 : RegForms.ShowModal(Repository.FSignature, ID, NVL(Param, FParam));
      3 : RegForms.Execute(Repository.FSignature);
      4 : ; { TODO : ��������� �������� ��������� }
    end;

  except
    on E: Exception do raise Exception.Create(E.Message);
  end;

end;

procedure TRepository.ExecModal(ID: integer; Param: string);
begin

  Self.ID := ID;

  RegForms.ShowModal(Repository.FSignature, ID, NVL(Param, FParam));

end;

initialization
  Repository := TRepository.Create;

finalization
  Repository.Free;

end.
