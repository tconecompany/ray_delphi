{*******************************************************}
{                                                       }
{                        Updater                        }
{                                                       }
{                    TFormMainUpdater                   }
{                 Обновление приложения Ray             }
{                                                       }
{        Дата изменения: 06.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormMainUpdater;

interface

uses
  // Sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Winapi.ShellAPI,
  // ZipForge
  ZipForge,
  // my
  uConst;

type
  TZipForgeFriend = class(TZipForge);

{ TFormMainUpdater }

  TFormMainUpdater = class(TForm)
    lTitle: TLabel;
    lFiles: TLabel;
    ProgressBar: TProgressBar;
    ZipForge: TZipForge;
    procedure FormCreate(Sender: TObject);
    procedure ZipForgeOverallProgress(Sender: TObject; Progress: Double;
      Operation: TZFProcessOperation; ProgressPhase: TZFProgressPhase;
      var Cancel: Boolean);
    procedure ZipForgeFileProgress(Sender: TObject; FileName: string;
      Progress: Double; Operation: TZFProcessOperation;
      ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
  private
    { Private declarations }
    procedure WMAfterCreate(var Message: TMessage); message WM_AFTER_CREATE;       // автостарт
  public
    { Public declarations }
  end;

var
  FormMainUpdater: TFormMainUpdater;

implementation

{$R *.dfm}

uses
  // my
  uParams;

{ TFormMainUpdater }

procedure TFormMainUpdater.WMAfterCreate(var Message: TMessage);
begin

  ZipForge.FileName := Params.PatchUpdateFile;
  ZipForge.OpenArchive;
  ZipForge.BaseDir := Params.BaseDir;
  ZipForge.ExtractFiles('*.*');
  ZipForge.CloseArchive;

  MessageBox(Handle,
             PChar('Обновление завершено!'),
             PChar('Информация'),
             MB_ICONINFORMATION or MB_OK);

  ShellExecute(Application.Handle,
             'open',
             PWideChar('ray64.exe'),
             nil,
             nil,
             SW_NORMAL);

  Close;

end;

procedure TFormMainUpdater.FormCreate(Sender: TObject);
begin
  PostMessage(Handle, WM_AFTER_CREATE, 0, 0);
end;

procedure TFormMainUpdater.ZipForgeFileProgress(Sender: TObject; FileName: string;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin

  lFiles.Caption := FileName;

  Application.ProcessMessages;

end;

procedure TFormMainUpdater.ZipForgeOverallProgress(Sender: TObject;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
var
  i, FProcessedFileCount: integer;
begin

  if (Operation = poExtract) then
  begin
    FProcessedFileCount := 0;
    for i := 0 to TZipForgeFriend(ZipForge).DMHandle.CDir.Count - 1 do
      if (TZipForgeFriend(ZipForge).DMHandle.CDir.Items[i].Tagged) then
        Inc(FProcessedFileCount);
  end;

  if (ProgressPhase = ppEnd) then
    lFiles.Caption := Format('Обновлено %d файла (-ов)', [FProcessedFileCount]);

  ProgressBar.Position := Round(Progress);

  Application.ProcessMessages;

end;

end.
