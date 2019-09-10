{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormUserSettings                  }
{           Настройки для сеанса пользователя           }
{                                                       }
{        Дата изменения: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormUserSettings;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, Vcl.CheckLst,
  // ehlib
  DBCtrlsEh,
  // tms
  FolderDialog;

{ TFormUserSettings }

type
  TFormUserSettings = class(TForm)
    Label1: TLabel;
    Panel: TPanel;
    bCancel: TButton;
    eWorkFolder: TDBEditEh;
    sbCreateShortCut: TSpeedButton;
    lLogical: TLabel;
    clbLogical: TCheckListBox;
    bOK: TButton;
    lQntSession: TLabel;
    FolderDialog: TFolderDialog;
    procedure sbCreateShortCutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eWorkFolderEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ ShowUserSettings }

procedure ShowUserSettings;

implementation

{$R *.dfm}

uses
  // my
  uShortCut,
  uUser;

{ ShowUserSettings }

procedure ShowUserSettings;
var
  FormUserSettings: TFormUserSettings;
begin
  FormUserSettings := TFormUserSettings.Create(Application);
  FormUserSettings.ShowModal;
  FormUserSettings.Release;
end;

{ TFormUserSettings }

procedure TFormUserSettings.FormCreate(Sender: TObject);
var
  i: integer;
begin

  lQntSession.Caption    := 'Количество сессий: ' + User.Settings.QNTSession.ToString;
  eWorkFolder.Text       := User.Settings.WorkFolder;
  FolderDialog.Directory := User.Settings.WorkFolder;

  for i := 0 to High(User.Settings.Logical) do
    clbLogical.Checked[i] := User.Settings.Logical[i];

end;

procedure TFormUserSettings.eWorkFolderEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if FolderDialog.Execute then
    eWorkFolder.Text := FolderDialog.Directory;
end;

procedure TFormUserSettings.sbCreateShortCutClick(Sender: TObject);
begin

  CreateShortCut(Application.ExeName,
                 _DESKTOP,
                 '',
                 ExtractFilePath(ParamStr(0)),
                 '"' + User.Login + '"',
                 ExtractFilePath(ParamStr(0)) + User.ActiveModule.Ico,
                 User.ActiveModule.Signature + ' - ' + User.Login,
                 'Ярлык быстрого запуска ERP TC');

  sbCreateShortCut.Enabled := False;

end;

procedure TFormUserSettings.bOKClick(Sender: TObject);
var
  Settings : TSettings;
  i        : integer;
begin

  Settings := User.Settings;
  Settings.WorkFolder := eWorkFolder.Text;

  // логические опции
  SetLength(Settings.Logical, clbLogical.Count);

  for i := 0 to clbLogical.Count - 1 do
    Settings.Logical[i] := clbLogical.Checked[i];

  User.Settings := Settings;
  User.SaveSettings;

end;

end.
