{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TFormPick                       }
{               ������������ ����� �������              }
{                                                       }
{        ���� ���������: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormPick;

interface

uses
  // sys
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ExtActns, Vcl.ActnList,
  // ehlib
  EhLibVCL, GridsEh, DBAxisGridsEh, DBVertGridsEh, ToolCtrlsEh, DynVarsEh,
  MemTableDataEh, MemTableEh,
  // odac
  Ora, Data.DB,
  //
  uTypes;

{ TFormPick }

type
  TFormPick = class(TForm)
    VGrid: TDBVertGridEh;
    StatusBar: TStatusBar;
    Panel: TPanel;
    bOK: TButton;
    bCancel: TButton;
    bReset: TButton;
    MemTable: TMemTableEh;
    ActionList: TActionList;
    ActionExecute: TAction;
    ActionReset: TAction;
    dsMemTable: TDataSource;
    procedure VGridRowEnter(Sender: TObject);
    procedure ActionResetExecute(Sender: TObject);
    procedure ActionExecuteExecute(Sender: TObject);

  private
    { Private declarations }

    FPRecPick      : PRecPick;
    FLookupOptions : TDynParams;                                                // ��������� ������� ����������� � ������. ������������ �� FLookupOptions
    FParams        : TDynParams;

    constructor Create(ASession       : TOraSession;
                       APRecPick      : PRecPick;
                       ALookupOptions : TDynParams);

    procedure VGridRowsEditButtonsClick(Sender: TObject; var Handled: Boolean);

  public
    { Public declarations }
  end;

{ ExecPick }

function ExecPick(ASession       : TOraSession;                                 // ��������� � �������������� ���. ����� ������
                  APRecPick      : PRecPick;
                  ALookupOptions : TDynParams): boolean;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  System.Math,
  // my
  uDataModuleRay,
  uConst,
  uStrUtilsExt,
  uEnvVariables,
  uAssembly,
  uFormQuickSearch;

{ ExecPick }

function ExecPick(ASession       : TOraSession;
                  APRecPick      : PRecPick;
                  ALookupOptions : TDynParams): boolean;
var
  FormPick : TFormPick;
  i, j     : integer;
begin

  FormPick := TFormPick.Create(ASession, APRecPick, ALookupOptions);
  FormPick.ShowModal;

  if FormPick.ModalResult = mrOk then
  begin
    for i := 0 to High(ALookupOptions) do
      for j := 0 to High(FormPick.FParams) do
        if SameText(ALookupOptions[i].Name, FormPick.FParams[j].Name) then
          ALookupOptions[i] := FormPick.FParams[j];
    //
    Result := True;
  end
  else
    Result := False;

 FormPick.Release;

 end;

{ TFormPick }

constructor TFormPick.Create(ASession       : TOraSession;
                             APRecPick      : PRecPick;
                             ALookupOptions : TDynParams);
var
  Query       : TOraQuery; // ������ ��� sql_item
  ftFieldType : TFieldType;
  i, j        : integer;
  BitMap      : TBitMap;
begin

  inherited Create(nil);

  Query := TOraQuery.Create(nil);
  Query.Session := ASession;

  FPRecPick      := APRecPick;
  FLookupOptions := ALookupOptions;

  // ��������� ������� ���������� � ������ �� ���������� ��������� FPRecPick^.Items
  SetLength(FParams, Length(FPRecPick^.Items));

  for i := 0 to High(FPRecPick^.Items) do
    for j := 0 to High(ALookupOptions) do
      if SameText(FPRecPick^.Items[i].LookupItemID, ALookupOptions[j].Name) then
      begin
        // �������� �������� �������
        FParams[i] := ALookupOptions[j];
        // ��������� ��������� ���� � ����������� �������
        MemTable.FieldDefs.Add(FParams[i].Name, FParams[i].Type_, FParams[i].Size);
        // ������������ ����, ������� ������ ����/������ � ����������
        VGrid.Rows.Add;
        VGrid.Rows.Items[i].FieldName           := FParams[i].Name;
        VGrid.Rows.Items[i].RowLabel.Caption    := FPRecPick^.Items[i].Caption;
        VGrid.Rows.Items[i].RowLabel.Font.Color := StrToColor(APRecPick^.Items[i].Color, VGrid.Rows.Items[i].RowLabel.Font.Color);
        VGrid.Rows.Items[i].Font.Color          := VGrid.Rows.Items[i].RowLabel.Font.Color;
        // ������ ����� ��� ���� ����� �����
        if     (FParams[i].Type_ = ftInteger)
           and SameText(FPRecPick^.Items[i].Control, 'edit')
        then
          VGrid.Rows.Items[i].Font.Style := [fsBold];
        // ��������� � ���������� ������ pick-������ � sql
        if SameText(FPRecPick^.Items[i].Control, 'pick') then
        begin
          VGrid.Rows.Items[i].DropDownRows := 20;
          if FPRecPick^.Items[i].SQLUnitID = '' then
          begin
            VGrid.Rows.Items[i].KeyList.Text    := ReplaceStr(FPRecPick^.Items[i].Keys, ';', sLineBreak);
            VGrid.Rows.Items[i].PickList.Text   := ReplaceStr(FPRecPick^.Items[i].Items, ';', sLineBreak);
            VGrid.Rows.Items[i].DblClickNextVal := True;
          end
          else
          begin
            Query.SQL.Text := FPRecPick^.Items[i].SQLUnit;
            LookupOptionsConnect(Query, ALookupOptions);
            Query.Open;
            while not Query.Eof do
            begin
              VGrid.Rows.Items[i].KeyList.Add(Query.Fields[0].AsString);
              VGrid.Rows.Items[i].PickList.Add(Query.Fields[1].AsString);
              VGrid.Rows.Items[i].DblClickNextVal := True;
              Query.Next;
            end;
            Query.Close;
          end
        end
        // ���������� FormQuickSearch
        else if SameText(FPRecPick^.Items[i].Control, 'FormQuickSearch') then
        begin
          BitMap := TBitMap.Create;
          BitMap.LoadFromFile('img\search9.bmp');
          VGrid.Rows.Items[i].AutoDropDown := False; // ��������� ���������� ����������� ��� ����� ��������� ����
          VGrid.Rows.Items[i].EditButton.DefaultAction := False;
          VGrid.Rows.Items[i].EditButtons.Add;
          VGrid.Rows.Items[i].EditButtons.Items[0].Style   := ebsGlyphEh;
          VGrid.Rows.Items[i].EditButtons.Items[0].Glyph   := BitMap;
          VGrid.Rows.Items[i].EditButtons.Items[0].OnClick := VGridRowsEditButtonsClick;
          BitMap.Free;
        end;
        //
        Break;
      end;

  // ������ ������, ������ �������
  VGrid.LabelColWidth := FPRecPick^.WidthKey;
  Self.Height := 100 + Max(VGrid.RowCount + 1, 1) * 18;     { TODO : ��������� ����� ��� }
  Self.Width  := FPRecPick^.WidthKey + FPRecPick^.WidthValue;
  //Self.Width := Self.Width + 250;

  // ������ �������
  Self.Caption := FPRecPick^.Caption;

  StatusBar.Panels[0].Text := FPRecPick^.Items[0].Hint;

  // ������� ��������� ����������� ������� � ���������
  MemTable.CreateDataSet;
  MemTable.Open;

  // �������� ��-���������
  ActionReset.Execute;

end;

procedure TFormPick.VGridRowsEditButtonsClick(Sender: TObject;
  var Handled: Boolean);
var
  KeyValues: TRayKeyValues;

  function KeysToText(KeyValues: TRayKeyValues): string;
  var
    i: integer;
  begin
    for i := 0 to High(KeyValues) do
      Result := Result + string(KeyValues[i].Key) + ',';
    //
    Result := RTrim(Result, ',');
  end;

begin

  if ExecQuickSearch(KeyValues,
                     FPRecPick^.Items[VGrid.Row].Caption,
                     FPRecPick^.Items[VGrid.Row].SQLUnit,
                     nil,
                     MemTable.Fields[VGrid.Row].Value,
                     True,
                     FPRecPick^.Items[VGrid.Row].MultiSelect,
                     600,
                     400)
  then
    case FPRecPick^.Items[VGrid.Row].MultiSelect of
      True  : MemTable.Fields[VGrid.Row].Value := KeysToText(KeyValues); // ��������������� ��������� ������ � ������ � ������������ ","
      False : MemTable.Fields[VGrid.Row].Value := KeyValues[0].Key;
    end;

end;

procedure TFormPick.ActionExecuteExecute(Sender: TObject);
var
  i : integer;
  s : string;
begin

  for i := 0 to High(FParams) do
  begin
    // ��� ������. ������� Achmenttement � ����������
    if MemTable.Fields[i].Value = Null then
    begin
      FParams[i].Achmenttement := '';
      Continue;
    end;
    // ����� ��������
    FParams[i].Value := MemTable.Fields[i].AsString;
    // �������� (the attachment) IN, EXISTS, ��������� ...
    if Pos('IN(', DeleteChar(AnsiUpperCase(FPRecPick^.Items[i].Condition), ' '), 1) > 0 then
    begin
      s := DeleteChar(MemTable.Fields[i].AsString, ' ');
      s := StringReplace(s, ',', ''', ''', [rfReplaceAll]);
      s := '''' + s + '''';
      FParams[i].Achmenttement :=
        StringReplace(FPRecPick^.Items[i].Condition,
                      ':' + FPRecPick^.Items[i].LookupItemID,
                      s,
                      [rfReplaceAll]);
    end
    else if Pos('EXISTS(', DeleteChar(AnsiUpperCase(FPRecPick^.Items[i].Condition), ' '), 1) > 0 then
      FParams[i].Achmenttement :=
        Copy(FPRecPick^.Items[i].Condition, 1, 4) +
          StringReplace(DeleteChar(Copy(FPRecPick^.Items[i].Condition, 5), ' '),
                        'EXISTS(:' + FPRecPick^.Items[i].LookupItemID + ')',
                        FPRecPick^.Items[i].SQLUnit,  { TODO : �������� exists, in ��������� }
                        [rfReplaceAll])
    else
      FParams[i].Achmenttement := FPRecPick^.Items[i].Condition;
  end;

end;

procedure TFormPick.ActionResetExecute(Sender: TObject);
var
  i, j: integer;
begin

  // ��������� �.�. �������� ������ �������
  try
    MemTable.Cancel;
    MemTable.Insert;
    //
    for i := 0 to High(FLookupOptions) do
    begin
      for j := 0 to High(FParams) do
        if     SameText(FLookupOptions[i].Name, FParams[j].Name)
           and not VarIsEmpty(FLookupOptions[i].Value)
        then
        begin
          MemTable.Fields[j].Value := FLookupOptions[i].Value;
          Break;
        end;
      // Achmenttement
      FParams[i].Achmenttement := '';
    end;
  except
  end;

  // ������� �����-����� �� ������ ��������
  if Self.Visible then
    MemTable.Fields[0].FocusControl;

end;

procedure TFormPick.VGridRowEnter(Sender: TObject);
begin
  if VGrid.Row >= 0 then
    StatusBar.Panels[0].Text := FPRecPick^.Items[VGrid.Row].Hint;
end;

end.
