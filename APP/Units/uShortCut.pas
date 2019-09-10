{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       uShortCut                       }
{      –абота з €рликами быстрого доступа в Windows     }
{                                                       }
{        ƒата изменени€: 02.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uShortCut;

interface

uses
  Windows,
  SysUtils,
  Registry,
  ActiveX,
  ComObj,
  ShlObj;

type
  ShortCutType = (_DESKTOP, _QUICKLAUNCH, _SENDTO, _STARTMENU, _OTHERFOLDER);

{ CreateShortCut}

function CreateShortCut(SourceFileName : string;                                // путь к файлу дл€ запуска в €рлыке
                        Location       : ShortcutType;                          // тип €рлыка. размещение
                        SubFolder,                                              // subfolder of location
                        WorkingDir,                                             // working directory property of the shortcut
                        Parameters,                                             // параметры
                        IconFile,                                               // путь к иконке ico
                        Caption        : string;                                // заголовок
                        Description    : string): boolean;                      // description property of the shortcut

implementation

{ GetProgramDir }

function GetProgramDir: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', False);
    Result := Reg.ReadString('Programs');
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

{ CreateShortCut }

function CreateShortCut(SourceFileName : string;
                        Location       : ShortcutType;
                        SubFolder,
                        WorkingDir,
                        Parameters,
                        IconFile,
                        Caption        : string;
                        Description    : string): boolean;

const
  SHELL_FOLDERS_ROOT = 'Software\MicroSoft\Windows\CurrentVersion\Explorer';
  QUICK_LAUNCH_ROOT  = 'Software\MicroSoft\Windows\CurrentVersion\GrpConv';

var
  MyObject   : IUnknown;
  MySLink    : IShellLink;
  MyPFile    : IPersistFile;
  Directory,
  LinkName   : string;
  WFileName  : WideString;
  Reg        : TRegIniFile;

begin
 
  MyObject := CreateComObject(CLSID_ShellLink); 
  MySLink  := MyObject as IShellLink;
  MyPFile  := MyObject as IPersistFile;

  MySLink.SetPath(PChar(SourceFileName)); 
  MySLink.SetArguments(PChar(Parameters));
  MySLink.SetIconLocation(PChar(IconFile), 0);
  MySLink.SetDescription(PChar(Description));

  LinkName := ChangeFileExt(Caption, '.lnk');
  LinkName := ExtractFileName(LinkName);

  // Quicklauch 
  if Location = _QUICKLAUNCH then 
  begin 
    Reg := TRegIniFile.Create(QUICK_LAUNCH_ROOT); 
    try 
      Directory := Reg.ReadString('MapGroups', 'Quick Launch', ''); 
    finally 
      Reg.Free; 
    end; 
  end 
  else 
  // Other locations 
  begin 
    Reg := TRegIniFile.Create(SHELL_FOLDERS_ROOT); 
    try 
    case Location of 
      _OTHERFOLDER : Directory := SubFolder; 
      _DESKTOP     : Directory := Reg.ReadString('Shell Folders', 'Desktop', '');
      _STARTMENU   : Directory := Reg.ReadString('Shell Folders', 'Start Menu', '');
      _SENDTO      : Directory := Reg.ReadString('Shell Folders', 'SendTo', ''); 
    end; 
    finally 
      Reg.Free; 
    end; 
  end; 
 
  if (Directory <> '') then
  begin 
    if (SubFolder <> '') and (Location <> _OTHERFOLDER) then
      WFileName := Directory + '\' + SubFolder + '\' + LinkName
    else 
      WFileName := Directory + '\' + LinkName;

    if WorkingDir = '' then 
      MySLink.SetWorkingDirectory(PChar(ExtractFilePath(SourceFileName)))
    else
      MySLink.SetWorkingDirectory(PChar(WorkingDir));

    MyPFile.Save(PWideChar(WFileName), False);
    Result := True;
  end;

end; 

end.
