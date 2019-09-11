{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TRegForms                       }
{             Регистр сигнатурных форм вызова           }
{                                                       }
{        Дата изменения: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uRegForms;

interface

uses
  // sys
  System.Contnrs,
  Vcl.Forms;

{ TLaunch }

type
  TLaunch = record
    Signature  : string;                                                        // сигнатура формы
    FormName   : string;                                                        // имя формы
    ID         : integer;                                                       // ид репозитория
    Param      : string;                                                        // параметр формы
    LaunchMenu : string;                                                        // меню запуска
  end;

{ TDynLaunches }

type
  TDynLaunches = array of TLaunch;

{ TRegForms }

type
  TRegForms = class
  private

    FItems             : TDynLaunches;
    FModalResult       : integer;
    FLimitChildWindows : integer;
    FTag               : integer;

    function GetLastLaunch: TLaunch;
    function GetCount: integer;

    procedure OnCloseQuery(Sender: TObject; var CanClose: Boolean);             // переназначение для события закрытия формы
    procedure OnClose(Sender: TObject; var Action: TCloseAction);               // закрытие формы

  public

    procedure ShowChild(Signature : string;                                     // отобразить форму в дочернем режиме
                        ID        : integer = 0;
                        Param     : string = '');

    procedure ShowModal(Signature : string;                                     // отобразить форму в модальном режиме
                        ID        : integer = 0;
                        Param     : string = '');

    procedure Execute(Signature: string);                                       // запустить программу

    property LastLaunch: TLaunch read GetLastLaunch;                            // последняя запущеная форма
    property Count: integer read GetCount;                                      // количество запущеных форм
    property Items: TDynLaunches read FItems;                                   // спиcок запущеных форм
    property ModalResult: integer read FModalResult;                            // результат закрытия модальной формы

    property LimitChildWindows: integer read FLimitChildWindows                 // максимальное количество создания сессий/окон
                                        write FLimitChildWindows;

  end;

var
  RegForms: TRegForms;

implementation

uses
  // sys
  System.Classes,
  System.SysUtils,
  Vcl.Controls,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
   // my
  uConst,
  uMenuXML;

{ TRegForms }

procedure TRegForms.ShowChild(Signature : string;
                              ID        : integer = 0;
                              Param     : string = '');
var
  Form: TForm;
begin

  if Signature = '' then Exit;

  // контролируем верхний предел окон/сессий
  if FLimitChildWindows = Count then
    raise Exception.Create('Превышен лимит создания нового окна');

  // добавляем в историю запусков
  SetLength(FItems, Count + 1);
  FItems[Count - 1].Signature  := Signature;
  FItems[Count - 1].ID         := ID;
  FItems[Count - 1].Param      := Param;
  FItems[Count - 1].LaunchMenu := MenuXML.FindLaunchMenu(ID);

  // создаем новую форму по сигнатуре
  Form := TFormClass(FindClass(Concat('T', Signature))).Create(Application);
  Form.Tag          := ID;
  Form.AutoScroll   := True;
  Form.FormStyle    := fsMDIChild;
  Form.OnClose      := OnClose;
  Form.OnCloseQuery := OnCloseQuery;

  // по имени будет удалятся! (динамическое с префиксом _)
  FItems[Count - 1].FormName := Form.Name;

  // автостарт
  PostMessage(Form.Handle, WM_AFTER_CREATE, 0, 0);

  // сообщение главной форме чтобы добавить закладку в MDITabSet
  Application.MainForm.Perform(WM_MAIN_MDI_CHILD, ID, 0);

end;

procedure TRegForms.ShowModal(Signature : string;
                              ID        : integer = 0;
                              Param     : string = '');
var
  Form: TForm;
begin

  if Signature = '' then Exit;

  // добавляем в историю запусков
  SetLength(FItems, Count + 1);
  FItems[Count - 1].Signature  := Signature;
  FItems[Count - 1].ID         := ID;
  FItems[Count - 1].Param      := Param;
  FItems[Count - 1].LaunchMenu := MenuXML.FindLaunchMenu(ID);

  // создаем новую форму по сигнатуре
  Form := TFormClass(FindClass(Concat('T', Signature))).Create(Application);
  // Form.BorderIcons  := [];
  Form.WindowState  := wsNormal;
  Form.Position     := poMainFormCenter;
  Form.Tag          := ID;
  Form.OnCloseQuery := OnCloseQuery;

  // по имени будет удалятся! (динамическое с префиксом _)
  FItems[Count - 1].FormName := Form.Name;

  // автостарт
  PostMessage(Form.Handle, WM_AFTER_CREATE, 0, 0);

  Form.ShowModal;

  FModalResult := Form.ModalResult;

  Form.Release;

end;

procedure TRegForms.Execute(Signature: string);
begin

  ShellExecute(Application.Handle,
               'open',
               PWideChar(Signature),
               nil,
               nil,
               SW_NORMAL);

end;

function TRegForms.GetCount: integer;
begin
  Result := Length(FItems);
end;

function TRegForms.GetLastLaunch: TLaunch;
begin
  Result := FItems[Count - 1];
end;

procedure TRegForms.OnClose(Sender: TObject; var Action: TCloseAction);
begin

  Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 1);

  Action := caFree;

end;

procedure TRegForms.OnCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: integer;
begin

  if Pos('*', TForm(Sender).Caption) > 0 then
  begin
    i := MessageBox(Application.Handle,
                    PChar('Сохранить изменения?'),
                    PChar(TForm(Sender).Caption),
                    MB_ICONWARNING or MB_YESNOCANCEL);
    case i of
      mrYes    : begin
                   TForm(Sender).Perform(WM_DB_POST, 0, 0);
                   CanClose := True;
                 end;

      mrCancel : begin
                   CanClose := False;
                   Exit;
                 end
    else
      CanClose := True;
    end;
  end;

  // удаляем с истории по имени форму в случае закрытия
  for i := 0 to Count - 1 do
    if SameText(TForm(Sender).Name, FItems[i].FormName) then
    begin
      Delete(FItems, i, 1);
      Break;
    end;

end;

initialization
  RegForms := TRegForms.Create;

finalization
  RegForms.Free;

end.
