{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                        TParams                        }
{         Параметры приложения (файл params.xml)        }
{                                                       }
{        Дата изменения: 08.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uParams;

interface

{ TParams }

type
  TParams = class
  private

    FBaseDir         : string;
    FVersion         : string;
    FPatchUpdateFile : string;
    FConnectDefault  : string;
    FConnectUserName : string;
    FConnectPassword : string;
    FDirectServer    : string;
    FClientServer    : string;
    FClientHome      : string;
    FAutoStartModule : integer;
    FTag             : integer;

    constructor Create;

  public

    property BaseDir: string read FBaseDir;                                     // абсолютный путь приложения
    property Version: string read FVersion;                                     // текущая сборка (файл version.txt)
    property PatchUpdateFile: string read FPatchUpdateFile;                     // путь к архиву с обновлениями
    property ConnectDefault: string read FConnectDefault;                       // режим подключени по умолчанию
    property ConnectUserName: string read FConnectUserName;                     // для быстрой отладки подстановка Логина
    property ConnectPassword: string read FConnectPassword;                     // для быстрой отладки подстановка Пароля
    property DirectServer: string read FDirectServer;                           //
    property ClientServer: string read FClientServer;                           // ip адрес сервера БД для режима direct
    property ClientHome: string read FClientHome;                               //
    property AutoStartModule: integer read FAutoStartModule;                    // для быстрой отладки подстановка Модуля
    property Tag: integer read FTag write FTag;                                 // Tag

    function CheckUpdate: boolean;                                              // проверка обновления ray, true - версии актуальны; false - обновляем;

    procedure RunUpdater;                                                       // запустить процесс обновления приложения
  end;

var
  Params: TParams;

implementation

uses
  // sys
  System.SysUtils,
  Vcl.Forms,
  Winapi.Windows,
  Winapi.ShellAPI,
  // oxml
  OXmlPDOM;

{ TParams }

constructor TParams.Create;
var
  xXML  : IXMLDocument;
  xNode : PXMLNode;
  f     : TextFile;
begin
              { TODO : доработать исключение отсудствие файла params.xml }
  // if FileExists('params.xml') then
  //raise Exception.Create('Отсудствует файл "params.xml"');

  FBaseDir := ExtractFilePath(ParamStr(0));

  // текущая версия программы у пользователя
  try
    AssignFile(f, 'version.txt');
    Reset(f);
    Read(f, FVersion);
    CloseFile(f);
  except
    FVersion := 'неопределено';
  end;

  // считываем параметры приложения params.xml
  xXML := OXmlPDOM.CreateXMLDoc;
  xXML.LoadFromFile('params.xml');

  xNode := xXML.DocumentElement;

  try FPatchUpdateFile := xNode.SelectNode('update').GetAttribute('file'); except end;
  try FConnectDefault  := xNode.SelectNode('connect').GetAttribute('default'); except end;
  try FConnectUserName := xNode.SelectNode('connect').GetAttribute('user_name'); except end;
  try FConnectPassword := xNode.SelectNode('connect').GetAttribute('password'); except end;
  try FDirectServer    := xNode.SelectNode('connect/direct').GetAttribute('server'); except end;
  try FClientServer    := xNode.SelectNode('connect/client').GetAttribute('server'); except end;
  try FClientHome      := xNode.SelectNode('connect/client').GetAttribute('home'); except end;
  try FAutoStartModule := xNode.SelectNode('autostart').GetAttribute('module').ToInteger; except FAutoStartModule := 1; end;

  // перехватываем параметры с ярлыка запуска
  if ParamCount >= 1 then
  begin
    FConnectUserName := ParamStr(1);
    FConnectPassword := '';
    FAutoStartModule := 0;
  end;

end;

function TParams.CheckUpdate: boolean;
var
  f          : TextFile;
  VersionNew : string; // версия с обменника
begin

  // псевдопроверка. если файл с обновой на сервере не доступен то просто запускаем приложение
  if    not FileExists(FPatchUpdateFile)
     or not FileExists(ExtractFilePath(FPatchUpdateFile) + 'version.txt')
     or not FileExists(FBaseDir + 'updater.exe')
  then
  begin
    Result := True;
    Exit;
  end;

  // новая версия
  AssignFile(f, ExtractFilePath(FPatchUpdateFile) + 'version.txt');
  Reset(f);
  Read(f, VersionNew);
  CloseFile(f);

  // версии согласованы
  if Trim(FVersion) = Trim(VersionNew) then
    Result := True
  else
    Result := False;

end;

procedure TParams.RunUpdater;
begin

  // удаляем ненужный после финального обновления файл
  DeleteFile('tmp_updater.exe');

  // версии согласованы выходим
  if CheckUpdate then Exit;

  // копируем updater.exe => tmp_updater.exe * именно при наличии этого файла будет запускатся процесс
  CopyFile('updater.exe', 'tmp_updater.exe', True);

  ShellExecute(Application.Handle,
               'open',
               'tmp_updater.exe',
               nil,
               nil,
               SW_NORMAL);

  Application.Terminate; // закрываем текущий запущеный updater.exe

end;

initialization
  Params := TParams.Create;

finalization
  Params.Free;

end.

