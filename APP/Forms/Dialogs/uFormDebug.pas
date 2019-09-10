{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TFormDebug                      }
{                   Отладка информация                  }
{                                                       }
{        Дата изменения: 05.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormDebug;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin;

{ TFormDebug }

type
  TFormDebug = class(TForm)
    Memo: TMemo;
    ActionList: TActionList;
    ActionCopyClipboard: TAction;
    ActionSaveToFile: TAction;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionClose: TAction;
    lMemoTitle: TLabel;
    procedure ActionCopyClipboardExecute(Sender: TObject);
    procedure ActionSaveToFileExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ ShowDebug }

function ShowDebug(Text      : WideString;
                   Caption   : string = 'Отладка';
                   MemoTitle : string = 'Информация';
                   Width     : integer = 700;
                   Heigth    : integer = 560): boolean;

implementation

{$R *.dfm}

uses
  uDataModuleImages;

{ ShowDebug }

function ShowDebug(Text      : WideString;
                   Caption   : string = 'Отладка';
                   MemoTitle : string = 'Информация';
                   Width     : integer = 700;
                   Heigth    : integer = 560): boolean;
var
  FormDebug: TFormDebug;
begin

  FormDebug := TFormDebug.Create(nil);
  FormDebug.Memo.Lines.Text    := Text;
  FormDebug.Caption            := Caption;
  FormDebug.lMemoTitle.Caption := MemoTitle;
  FormDebug.Width              := Width;
  FormDebug.Height             := Heigth;
  FormDebug.ShowModal;
  FormDebug.Release;

end;

{ TFormDebug }

procedure TFormDebug.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormDebug.ActionCopyClipboardExecute(Sender: TObject);
begin

  Memo.SelectAll;
  Memo.CopyToClipboard;

end;

procedure TFormDebug.ActionSaveToFileExecute(Sender: TObject);
var
  sFileName: string;
begin

 sFileName := Self.Caption;

 if PromptForFileName(sFileName, 'Текстовые документы|*.txt', 'txt', '', '', True) then
   Memo.Lines.SaveToFile(sFileName);

end;

end.

