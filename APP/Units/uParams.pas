{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                        TParams                        }
{         ��������� ���������� (���� params.xml)        }
{                                                       }
{        ���� ���������: 08.08.2019 (Build 1.0.01)      }
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

    property BaseDir: string read FBaseDir;                                     // ���������� ���� ����������
    property Version: string read FVersion;                                     // ������� ������ (���� version.txt)
    property PatchUpdateFile: string read FPatchUpdateFile;                     // ���� � ������ � ������������
    property ConnectDefault: string read FConnectDefault;                       // ����� ���������� �� ���������
    property ConnectUserName: string read FConnectUserName;                     // ��� ������� ������� ����������� ������
    property ConnectPassword: string read FConnectPassword;                     // ��� ������� ������� ����������� ������
    property DirectServer: string read FDirectServer;                           //
    property ClientServer: string read FClientServer;                           // ip ����� ������� �� ��� ������ direct
    property ClientHome: string read FClientHome;                               //
    property AutoStartModule: integer read FAutoStartModule;                    // ��� ������� ������� ����������� ������
    property Tag: integer read FTag write FTag;                                 // Tag

    function CheckUpdate: boolean;                                              // �������� ���������� ray, true - ������ ���������; false - ���������;

    procedure RunUpdater;                                                       // ��������� ������� ���������� ����������
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
              { TODO : ���������� ���������� ���������� ����� params.xml }
  // if FileExists('params.xml') then
  //raise Exception.Create('����������� ���� "params.xml"');

  FBaseDir := ExtractFilePath(ParamStr(0));

  // ������� ������ ��������� � ������������
  try
    AssignFile(f, 'version.txt');
    Reset(f);
    Read(f, FVersion);
    CloseFile(f);
  except
    FVersion := '������������';
  end;

  // ��������� ��������� ���������� params.xml
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

  // ������������� ��������� � ������ �������
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
  VersionNew : string; // ������ � ���������
begin

  // ��������������. ���� ���� � ������� �� ������� �� �������� �� ������ ��������� ����������
  if    not FileExists(FPatchUpdateFile)
     or not FileExists(ExtractFilePath(FPatchUpdateFile) + 'version.txt')
     or not FileExists(FBaseDir + 'updater.exe')
  then
  begin
    Result := True;
    Exit;
  end;

  // ����� ������
  AssignFile(f, ExtractFilePath(FPatchUpdateFile) + 'version.txt');
  Reset(f);
  Read(f, VersionNew);
  CloseFile(f);

  // ������ �����������
  if Trim(FVersion) = Trim(VersionNew) then
    Result := True
  else
    Result := False;

end;

procedure TParams.RunUpdater;
begin

  // ������� �������� ����� ���������� ���������� ����
  DeleteFile('tmp_updater.exe');

  // ������ ����������� �������
  if CheckUpdate then Exit;

  // �������� updater.exe => tmp_updater.exe * ������ ��� ������� ����� ����� ����� ���������� �������
  CopyFile('updater.exe', 'tmp_updater.exe', True);

  ShellExecute(Application.Handle,
               'open',
               'tmp_updater.exe',
               nil,
               nil,
               SW_NORMAL);

  Application.Terminate; // ��������� ������� ��������� updater.exe

end;

initialization
  Params := TParams.Create;

finalization
  Params.Free;

end.

