{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormRegistration                  }
{        ‘орма регистрации пользоваетл€ в системе       }
{                                                       }
{        ƒата изменени€: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormRegistration;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Menus,
  System.ImageList, Vcl.ImgList,
  // ehlib
  DBCtrlsEh,
  // my
  uConst;

{ TFormRegistration }

type
  TFormRegistration = class(TForm)
    Image: TImage;
    bOK: TButton;
    bCancel: TButton;
    Bevel: TBevel;
    cbModule: TDBComboBoxEh;
    eLogin: TDBEditEh;
    ePassword: TDBEditEh;
    SpeedButton1: TSpeedButton;
    PopupMenu: TPopupMenu;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ePasswordEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eLoginEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eLoginChange(Sender: TObject);
    procedure ePasswordChange(Sender: TObject);
    procedure ePasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }

    procedure WMAfterCreate(var Message: TMessage); message WM_AFTER_CREATE;    // автостарт

  public
    { Public declarations }
  end;

{ ExecRegistration }

function ExecRegistration: boolean;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  // my
  uParams,
  uUser;

{ ExecRegistration }

function ExecRegistration: boolean;
var
  FormRegistration: TFormRegistration;
begin

  Result := False;

  FormRegistration := TFormRegistration.Create(nil);
  FormRegistration.ShowModal;

  if FormRegistration.ModalResult = mrOk then
    Result := True;

  FormRegistration.Release;

end;

{ TFormRegistration }

procedure TFormRegistration.WMAfterCreate(var Message: TMessage);
begin
  bOK.Click;
end;

procedure TFormRegistration.FormCreate(Sender: TObject);
var
  Icon : TIcon;
  i    : integer;
begin

  Icon := TIcon.Create;

  for i := 0 to High(User.AvailableModule) do
  begin
    cbModule.KeyItems.Add(User.AvailableModule[i].ID.ToString);
    cbModule.Items.Add(User.AvailableModule[i].Signature);
    // дополнительна€ проверка существовани€ файла
    if FileExists(User.AvailableModule[i].Ico) then
    begin
      Icon.LoadFromFile(User.AvailableModule[i].Ico);
      ImageList.AddIcon(Icon);
    end;
  end;

  cbModule.ItemIndex := 0;

  // подстановка дл€ быстрой отладки или авто-входа
  eLogin.Text    := Params.ConnectUserName;
  ePassword.Text := Params.ConnectPassword;

  // устанавливаем фокус ввода на поле парол€
  if Params.ConnectUserName <> '' then
    ePassword.TabOrder := 0;

  // автостарт при условии наличи€ парол€
  if Params.ConnectPassword <> '' then
  begin
    cbModule.Value := Params.AutoStartModule;
    PostMessage(Handle, WM_AFTER_CREATE, 0, 0);
  end;

  //
  Icon.Free;

end;

procedure TFormRegistration.bOKClick(Sender: TObject);
begin
  if User.CheckReg(eLogin.Text, ePassword.Text, cbModule.Value) then
    ModalResult := mrOk;
end;

procedure TFormRegistration.eLoginChange(Sender: TObject);
begin
  eLogin.EditButtons.Items[0].Visible := ifThen(Length(eLogin.Text) > 0, 'True', 'False').ToBoolean;
end;

procedure TFormRegistration.ePasswordChange(Sender: TObject);
begin
  ePassword.EditButtons.Items[0].Visible := ifThen(Length(ePassword.Text) > 0, 'True', 'False').ToBoolean;
end;

procedure TFormRegistration.eLoginEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  eLogin.Text := '';
end;

procedure TFormRegistration.ePasswordEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  ePassword.Text := '';
end;

procedure TFormRegistration.ePasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then bOK.Click;
end;

end.
