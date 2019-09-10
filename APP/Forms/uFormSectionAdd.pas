{*******************************************************}
{                                                       }
{                       Keymaker                        }
{                                                       }
{                    TFormSectionAdd                    }
{                                                       }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormSectionAdd;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  // ehlib
  DBCtrlsEh, Data.DB, MemDS, DBAccess, Ora, OraSmart,
  GDIPCustomItem, GDIPTextItem, AdvPolyPager, GDIPSplitterItem,
  GDIPSectionItem,
  // my
  uStrUtilsExt;

type
  PRecModule = ^TRecModule;
  TRecModule = record
    ModuleID       : integer;
    Signature      : string;
    SignatureShort : string;
    XMLConf        : widestring;
  end;

type
  TFormSectionAdd = class(TForm)
    Panel1: TPanel;
    bOK: TBitBtn;
    bCancel: TBitBtn;
    PolyPager: TAdvPolyPager;
    SectionItem1: TSectionItem;
    SplitterItem1: TSplitterItem;
    AdvPage_NewPage1: TAdvPolyPage;
    extItem_NewPage1: TTextItem;
    AdvPage_NewPage2: TAdvPolyPage;
    extItem_NewPage2: TTextItem;
    AdvPage_NewPage3: TAdvPolyPage;
    extItem_NewPage3: TTextItem;
    AdvPage_NewPage4: TAdvPolyPage;
    extItem_NewPage4: TTextItem;
    AdvPage_NewPage5: TAdvPolyPage;
    extItem_NewPage5: TTextItem;
    AdvPage_NewPage6: TAdvPolyPage;
    extItem_NewPage6: TTextItem;
    lbGUI: TListBox;
    Label1: TLabel;
    tModules: TOraTable;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSectionAdd: TFormSectionAdd;

implementation

{$R *.dfm}

uses
  uDataModuleRay;

procedure TFormSectionAdd.FormCreate(Sender: TObject);
var
  pRecModules_ :PRecModule;
begin

  tModules.Open;

  while not tModules.Eof do
  begin
    New(pRecModules_);
    pRecModules_.ModuleID       := tModules.FieldByName('module_id').AsInteger;
    pRecModules_.Signature      := tModules.FieldByName('signature').AsString;
    pRecModules_.SignatureShort := tModules.FieldByName('signature_short').AsString;
    pRecModules_.XMLConf        := tModules.FieldByName('xml_conf').AsWideString;
    lbGUI.Items.AddObject(tModules.FieldByName('signature').AsString, TObject(pRecModules_));
    tModules.Next;
  end;

  lbGUI.ItemIndex := 0;

end;

end.
