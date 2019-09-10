{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFormQuickSearch                  }
{                  Форма быстрого поиска                }
{                                                       }
{        Дата изменения: 29.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormQuickSearch;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  // odac
  Data.DB, DBAccess, Ora,  MemDS,
  // ehlib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh,
  // my
  uTypes;

{ TFormQuickSearch }
type
  TFormQuickSearch = class(TForm)
    Panel: TPanel;
    bOK: TButton;
    bCancel: TButton;
    Grid: TDBGridEh;
    Query: TOraQuery;
    dsQuery: TOraDataSource;
    PopupMenu: TPopupMenu;
    miSelectAll: TMenuItem;
    miRemoveSelection: TMenuItem;
    procedure GridDblClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure miRemoveSelectionClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }

    FKeyValues: TRayKeyValues;

    constructor Create(Caption     : string;
                       SQL         : string;
                       Params      : TOraParams;
                       DefKeyValue : variant;
                       MultiSelect : boolean;
                       Width       : integer;
                       Heigth      : integer);

  public
    { Public declarations }
  end;

{ ExecQuickSearch }

function ExecQuickSearch(var Values  : TRayKeyValues;                           // результат выбора
                         Caption     : string;                                  // заголовок формы
                         SQL         : string;                                  // набор данных
                         Params      : TOraParams;
                         DefKeyValue : variant;                                 // текущий ключ, для выдиления
                         Selected    : boolean = True;                          // возвратить результат выбора
                         MultiSelect : boolean = False;                         // разрешить мульти-выбор
                         Width       : integer = 520;                           // ширина формы
                         Heigth      : integer = 350): boolean;                 // высота формы

implementation

{$R *.dfm}

uses
  uDataModuleRay;

{ ExecQuickSearch }

function ExecQuickSearch(var Values  : TRayKeyValues;
                         Caption     : string;
                         SQL         : string;
                         Params      : TOraParams;
                         DefKeyValue : variant;
                         Selected    : boolean = True;
                         MultiSelect : boolean = False;
                         Width       : integer = 520;
                         Heigth      : integer = 350): boolean;
var
  FormQuickSearch: TFormQuickSearch;
begin

  Result := False;

  FormQuickSearch := TFormQuickSearch.Create(Caption,
                                             SQL,
                                             Params,
                                             DefKeyValue,
                                             MultiSelect,
                                             Width,
                                             Heigth);
  FormQuickSearch.ShowModal;

  if     Selected
     and (FormQuickSearch.ModalResult = mrOk)
  then
  begin
    Values := FormQuickSearch.FKeyValues;
    Result := True;
  end;

  FormQuickSearch.Release;

end;

{ TFormQuickSearch }

constructor TFormQuickSearch.Create(Caption     : string;
                                    SQL         : string;
                                    Params      : TOraParams;
                                    DefKeyValue : variant;
                                    MultiSelect : boolean;
                                    Width       : integer;
                                    Heigth      : integer);
begin

  inherited Create(nil);

  Self.Caption := Caption;
  Self.Width   := Width;
  Self.Height  := Heigth;

  Query.SQL.Text := SQL;

  if Params <> nil then
    Query.Params := Params;

  Query.Open;

  if VarType(DefKeyValue) = varInteger then
    Query.Locate(Query.Fields[0].FieldName,
                 DefKeyValue,
                 [loCaseInsensitive, loPartialKey]);

  if MultiSelect then
  begin
    Grid.IndicatorOptions := [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh];
    Grid.Options          := Grid.Options + [dgMultiSelect];
    Grid.PopupMenu        := PopupMenu;
  end;

end;

procedure TFormQuickSearch.bOKClick(Sender: TObject);
var
  i: integer;
begin

  if Query.IsEmpty then Exit;

  Grid.SelectedRows.CurrentRowSelected := True;

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    SetLength(FKeyValues, i + 1);
    Query.Bookmark      := Grid.SelectedRows[i];
    FKeyValues[i].Key   := Query.Fields[0].Value;
    FKeyValues[i].Value := Query.Fields[1].Value;
  end;

end;

procedure TFormQuickSearch.GridDblClick(Sender: TObject);
begin
  bOK.Click;
end;

procedure TFormQuickSearch.miSelectAllClick(Sender: TObject);
begin
  Grid.Selection.SelectAll;
end;

procedure TFormQuickSearch.miRemoveSelectionClick(Sender: TObject);
begin
  Grid.Selection.Clear;
end;

end.

