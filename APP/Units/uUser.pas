{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                         TUser                         }
{                   ������������ �������                }
{                                                       }
{        ���� ���������: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uUser;

interface

uses
  // sys
  Classes,
  // odac
  Ora,
  // oxml
  OXmlPDOM,
  // my
  uTypes;

{ TPeriodMode ���� ������� �������� }

type
  TPeriodMode = (pmCurDay,                                                      // ������� ����
                 pmPreDay,                                                      // ���������� ����
                 pmCurWeek,                                                     // ������� ������
                 pmCurQuarter,                                                  // ������� �������
                 pmCurMonth,                                                    // ������� �����
                 pmPreMonth,                                                    // ���������� �����
                 pmCurYear,                                                     // ������� ���
                 pmPreYear,                                                     // ���������� ���
                 pmCustom);                                                     // ����������������

{ TModule }

type
  TModule = record
    ID             : integer;                                                   // id ��������� ������
    Signature      : string;                                                    // ������ ��������� ������
    SignatureShort : string;                                                    // ������� ��������� ������
    Ico            : string;                                                    // ������ ��� ������
  end;

{ TSettings ������ ��������� ��� ������ ������������ }

type
  TSettings = record
    QNTSession : integer;                                                       // ���������� ����������� ������
    WorkFolder : string;                                                        // ������� �����
    Logical    : TDynBooleans;
  end;

{ TPeriod ���� �������� �������� }

type
  TPeriod = record
    DateBeg : TDate;                                                            // ���� ������
    DateEnd : TDate;                                                            // ���� ���������
  end;

{ TKey ���� ������� }

type
  TKey = record
    ID        : integer;                                                        // id �����
    Signature : string;                                                         // ��������� �����
    // ...                                                                      // TOpenMode = (omUsual, omReadOnly, omInsert, omUpdate);
  end;

{ ������������ }

type
  TDynModules = array of TModule;                                               // ������������ ����� �������

{ TUser }

type
  TUser = class
  private

    FQuery           : TOraQuery;                                               // ���������� ������ �������
    FXML             : IXMLDocument;                                            // ���������� xml ���������
    FID              : integer;
    FSettings        : TSettings;
    FPeriod          : TPeriod;
    FPeriodMode      : TPeriodMode;
    FPeriodChecked   : boolean;
    FLogin           : string;
    FPassword        : string;
    FStorageID       : integer;
    FModuleID        : integer;
    FAvailableModule : TDynModules;
    FKey             : TKey;
    FTag             : integer;

    constructor Create;

    procedure SetModuleID(ModuleID: integer);
    procedure SetPeriodMode(PeriodMode: TPeriodMode);

    function GetModuleXMLConf: widestring;
    function GetActiveModule: TModule;

  public

    function CheckReg(Login, Password: string; ModuleID: integer): boolean;     // ����������� ������������ � �������
    function ChangePass(Values: array of string): boolean;                      // ����� ������
    function PeriodByMode(PeriodMode: TPeriodMode): TPeriod;                    // �������� �������� ������ �� ����

    procedure SaveSettings;                                                     // ��������� ��������� ������������ � ����
    procedure SavePeriod;                                                       // ���������� �������� ������� � ����

    property ID: integer read FID;                                              // id ������������
    property Login: string read FLogin;                                         // �����
    property Password: string read FPassword;                                   // ������
    property Settings: TSettings read FSettings write FSettings;                // ��������� ������������
    property Period: TPeriod read FPeriod write FPeriod;                        // �������� ������
    property PeriodMode: TPeriodMode read FPeriodMode write SetPeriodMode;      // ������� ��������� ������� �� ����
    property PeriodChecked: boolean read FPeriodChecked write FPeriodChecked;   // �������� ������ ��� ������� ��� ������������
    property ModuleID: integer read FModuleID write SetModuleID;                // �� �������� ������
    property ModuleXMLConf: widestring read GetModuleXMLConf;                   //
    property AvailableModule: TDynModules read FAvailableModule;                // ���������� ��������� ������� ��� ������������ (������������ � ����� �������)
    property ActiveModule: TModule read GetActiveModule;                         // ���������� � �������� ������
    property Key: TKey read FKey;                                               // ���� �������
    property StorageID: integer read FStorageID;                                // ������������� ���������
    property Tag: integer read FTag write FTag;                                 // Tag

    class function LoadModuleConf(ModuleID: integer): WideString;               // ���������� ������������ ������ ��� ��������� ���. ����

  end;

var
  User: TUser;

implementation

uses
  // sys
  System.SysUtils,
  System.StrUtils,
  DateUtils,
  Variants,
  // odac
  OraPackage,
  // oxml
  OXmlUtils,
  // my
  uDataModuleRay,
  uStrUtilsExt,
  uInit;

{ TUser }

constructor TUser.Create;
begin

  FQuery := TOraQuery.Create(nil);
  FQuery.Session := DataModuleRay.OraSession;
  FXML := OXmlPDOM.CreateXMLDoc;
  FTag := 0;

  // ��������� ������ ��������� ������� �� ����� (��� ����� ���������� ������������)
  FQuery.SQL.Text := 'SELECT m.module_id,' + #10
                   + '       m.signature,' + #10
                   + '       m.signature_short,' + #10
                   + '       m.ico' + #10
                   + '  FROM MODULE m' + #10
                   + ' WHERE m.sign_activity = -1' + #10
                   + ' ORDER BY m.module_id';

  FQuery.Open;

  while not FQuery.Eof do
  begin
    SetLength(FAvailableModule, Length(FAvailableModule) + 1);
    FAvailableModule[Length(FAvailableModule) - 1].ID             := FQuery.FieldByName('module_id').AsInteger;
    FAvailableModule[Length(FAvailableModule) - 1].Signature      := FQuery.FieldByName('signature').AsString;
    FAvailableModule[Length(FAvailableModule) - 1].SignatureShort := FQuery.FieldByName('signature_short').AsString;
    FAvailableModule[Length(FAvailableModule) - 1].Ico            := FQuery.FieldByName('ico').AsString;
    FQuery.Next;
  end;

  // ������ ��-���������
  SetPeriodMode(pmCurDay);

  FQuery.Close;

end;

procedure TUser.SetModuleID(ModuleID: integer);
var
  xNode            : PXMLNode;
  locUserXMLPeriod : WideString;
begin

  FModuleID := ModuleID;

  // �������� ������
  FQuery.SQL.Text := 'SELECT u.xml_period' + #10
                   + '  FROM USERS u' + #10
                   + ' WHERE u.user_id = :pUserID';

  FQuery.ParamByName('pUserID').AsInteger := ID;

  try
    FQuery.Open;
    locUserXMLPeriod := FQuery.Fields.FieldByName('xml_period').AsWideString;
  finally
    FQuery.Close;
  end;

  // ������������� ���������� �������� ������ � ����
  FXML.LoadFromXML(locUserXMLPeriod);

  xNode := FXML.DocumentElement;

  // ������� � ��������� ����� �� �������� PeriodMode
  while (xNode <> nil) do
  begin
    if xNode.GetAttributeDef('module', '0').ToInteger = ModuleID then
    begin
      FPeriod.DateBeg := StrToDate(xNode.GetAttribute('date_beg'));
      FPeriod.DateEnd := StrToDate(xNode.GetAttribute('date_end'));
      FPeriodChecked  := xNode.GetAttribute('checked').ToBoolean;
      PeriodMode      := TPeriodMode(StrToInt(xNode.GetAttribute('mode'))); // ��������
      Break;
    end;
    xNode := xNode.NextNodeInTree;
  end;

end;

procedure TUser.SetPeriodMode(PeriodMode: TPeriodMode);
begin

  FPeriodMode := PeriodMode;

  if PeriodMode <> pmCustom then
    FPeriod := PeriodByMode(PeriodMode);

end;

function TUser.GetModuleXMLConf: WideString;
begin
  Result := LoadModuleConf(FModuleID);
end;

function TUser.GetActiveModule: TModule;
var
  i: integer;
begin

  for i := 0 to High(FAvailableModule) do
    if FAvailableModule[i].ID = ModuleID then
    begin
      Result := FAvailableModule[i];
      Break;
    end;

end;

function TUser.CheckReg(Login, Password: string; ModuleID: integer): boolean;
var
  Package         : TOraPackage;
  xNode           : PXMLNode;
  xNodeList       : IXMLNodeList;
  locUserID       : integer;
  locLogin        : string;
  locXMLSettings  : WideString;
  locKeyID        : integer;
  locKeySignature : string;
  locKeyXMLConf   : WideString;
begin

  // ������ �� �����
  if Password = '' then
    raise Exception.Create('������� ������');

  // ���� ������������ �� ������
  FQuery.SQL.Text := 'SELECT u.user_id,' + #10
                   + '       u.login,' + #10
                   + '       u.password,' + #10
                   + '       u.key_id,' + #10
                   + '       u.date_reg,' + #10
                   + '       u.xml_settings,' + #10
                   + '       u.sign_activity user_sign_activity,' + #10
                   + '       k.signature     key_signature,' + #10
                   + '       k.xml_conf      key_xml_conf,' + #10
                   + '       k.sign_activity key_sign_activity' + #10
                   + '  FROM USERS u,' + #10
                   + '       KEY k' + #10
                   + ' WHERE u.key_id = k.key_id(+)' + #10
                   + '   AND UPPER(u.login) = UPPER(:pLogin)';

  FQuery.ParamByName('pLogin').AsString := Login;

  try

    FQuery.Open;

    if FQuery.IsEmpty then
      raise Exception.Create('������������ �� ������');

    if FQuery.FieldValues['password'] <> Password then
      raise Exception.Create('�������� ������');

    if not Boolean(FQuery.FieldValues['user_sign_activity']) then
      raise Exception.Create('������������ ������������');

    if FQuery.FieldValues['key_id'] = Null then
      raise Exception.Create('���� ������� �� �������. ���� ��������');

    if not Boolean(FQuery.FieldValues['key_sign_activity']) then
      raise Exception.Create('���� ������������');

    // ��������� ������������ �������� � ��������� ����������
    locUserID       := FQuery.Fields.FieldByName('user_id').AsInteger;
    locLogin        := FQuery.Fields.FieldByName('login').AsString;
    locXMLSettings  := FQuery.Fields.FieldByName('xml_settings').AsWideString;
    locKeyID        := FQuery.Fields.FieldByName('key_id').AsInteger;
    locKeySignature := FQuery.Fields.FieldByName('key_signature').AsString;
    locKeyXMLConf   := FQuery.Fields.FieldByName('key_xml_conf').AsWideString;

    // ��������� ������ �� ������ ���������� ����� ��� ����������� �������
    Package             := TOraPackage.Create(nil);
    Package.Session     := DataModuleRay.OraSession;
    Package.PackageName := 'IKEY';

    try
      {if Package.ExecProcEx('READ',
                             ['keys_id', tmpKeyID,
                              'signature', 'MODULE',
                              'element_id', ModuleID]) <= 0
      then
        raise Exception.Create('� ��� ��� ������� � ������� ������. ���� ��������');}
    finally
      FreeAndNil(Package);
    end;

    // ������������ ������ ��������. ��������� ���� ��������� ����������� � �������
    FQuery.SQL.Text := 'UPDATE USERS' + #10
                     + '   SET date_reg = :pDateReg' + #10
                     + ' WHERE user_id = :pUserID';

    FQuery.ParamByName('pUserID').AsInteger   := locUserID;
    FQuery.ParamByName('pDateReg').AsDateTime := Now;
    FQuery.Execute;

    // ��������� �������� ��������/���� � �������
    FID            := locUserID;
    FLogin         := locLogin;
    Self.ModuleID  := ModuleID; // ��������. + ������������ �������� ������
    FPassword      := Password;
    FKey.ID        := locKeyID;
    FKey.Signature := locKeySignature;

  finally
    FQuery.Close;
  end;

  // xml-settings. ��������� ������������
  FXML.LoadFromXML(locXMLSettings);

  xNode := FXML.DocumentElement;

  // qnt_session
  try
    FSettings.QNTSession := xNode.SelectNode('qnt_session').Text.ToInteger;
  except
    FSettings.QNTSession := Init.ParamByName('USER_QNT_SESSION').ToInteger;
  end;

  // work_folder
  try
    FSettings.WorkFolder := xNode.SelectNode('work_folder').Text;
  except
    FSettings.WorkFolder := Init.ParamByName('TEMP');
  end;

  // logical
  try
    xNodeList := xNode.SelectNodes('logical/item');
    xNode     := xNodeList.GetFirst;
    SetLength(FSettings.Logical, xNodeList.Count);
    while (xNode <> nil) do
    begin
      FSettings.Logical[xNodeList.IndexOf(xNode)] := xNode.Text.ToBoolean;
      xNodeList.GetNext(xNode);
    end;
  except
    FXML.Clear(True);
  end;

  // �������� �����������
  Result := True;

end;

function TUser.ChangePass(Values: array of string): boolean;
begin

  if Values[0] <> FPassword then
    raise Exception.Create('������� ������ ������ �������');

  if (Values[1] + Values[2]) = '' then
    raise Exception.Create('������� ����� ������');

  if Values[1] <> Values[2] then
    raise Exception.Create('����� ������ �� �����������');

  User.FPassword := Values[1];

  FQuery.SQL.Text := 'UPDATE USERS' + #10
                   + '   SET password = :pPassword' + #10
                   + ' WHERE user_id = :pUserID';

  FQuery.ParamByName('pUserID').AsInteger := ID;
  FQuery.ParamByName('pPassword').AsString := FPassword;

  try
    FQuery.Execute;
  finally
    FQuery.Close;
  end;

  Result := True;

end;

function TUser.PeriodByMode(PeriodMode: TPeriodMode): TPeriod;

  function SetP(DateBeg, DateEnd: TDate): TPeriod;
  begin
    SetP.DateBeg := DateBeg;
    SetP.DateEnd := DateEnd;
  end;

begin

  case PeriodMode of
    pmCurDay     : Result := SetP(Now, Now);
    pmPreDay     : Result := SetP(Now - 1, Now - 1);
    pmCurWeek    : Result := SetP(Now - DayOfWeek(Now - 2), Now);
    pmCurQuarter : Result := SetP(EnCodeDate(YearOf(Date), Round(((MonthOf(Date) - 1) / 3) * 3 + 1), 1), Now);
    pmCurMonth   : Result := SetP(EnCodeDate(YearOf(Date), MonthOf(Date), 1), Now);
    pmPreMonth   : Result := SetP(EnCodeDate(YearOf(Date), MonthOf(Date) - 1, 1), EnCodeDate(YearOf(Date), MonthOf(Date), 1) - 1);
    pmCurYear    : Result := SetP(EnCodeDate(YearOf(Date), 1, 1), Now);
    pmPreYear    : Result := SetP(EnCodeDate(YearOf(Date) - 1, 1, 1), EnCodeDate(YearOf(Date) - 1, 12, 31));
    pmCustom     : ; // ������ �� ������
  end;

end;

procedure TUser.SaveSettings;
var
  xNode : PXMLNode;
  i     : integer;
begin

  {
    <root>
      <qnt_session>10</qnt_session>
      <work_folder>\TEMP</work_folder>
      <logical>
        <item>-1</item>
        <item>0</item>
        <item>0</item>
      </logical>
    </root>
  }

  FXML.WriterSettings.IndentType := itIndent;
  FXML.Clear(True);
  FXML.AddChild('root');

  xNode := FXML.DocumentElement;
  xNode.AddChild('qnt_session').AddText(FSettings.QNTSession.ToString);
  xNode.AddChild('work_folder').AddText(FSettings.WorkFolder);

  // logical
  xNode := xNode.AddChild('logical');

  for i := 0 to High(FSettings.Logical) do
    xNode.AddChild('item').AddText(BoolToStr(FSettings.Logical[i]));

  // ��������� � ��
  try
    FQuery.SQL.Text := 'UPDATE USERS u' + #10
                    + '   SET u.xml_settings = :pXML' + #10
                    + ' WHERE u.user_id = :pUserID';

    FQuery.ParamByName('pUserID').AsInteger := ID;
    FQuery.ParamByName('pXML').AsWideString := FXML.XML;
    FQuery.Execute;
  finally
    FQuery.Close;
    FXML.Clear(True);
  end;

end;

procedure TUser.SavePeriod;
var
  xNode: PXMLNode;
begin

  {
    <root>
      <period module="5" checked="-1" mode="0" date_beg="16.08.2019" date_end="16.08.2019"/>
      <period module="1" checked="0" mode="2" date_beg="12.08.2019" date_end="16.08.2019"/>
    </root>
  }

  FXML.Clear(True);
  FXML.WriterSettings.IndentType := itIndent;

  FQuery.SQL.Text := 'SELECT u.xml_period' + #10
                   + '  FROM USERS u' + #10
                   + ' WHERE u.user_id = :pUserID';

  FQuery.ParamByName('pUserID').AsInteger := ID;

  try
    FQuery.Open;

    FXML.LoadFromXML(FQuery.FieldByName('xml_period').AsWideString);

    if FXML.XML = '' then
      FXML.AddChild('root');

    xNode := FXML.DocumentElement;

    // ������� � ������� ������ ����� �� modules_id
    while (xNode <> nil) do
    begin
      if xNode.GetAttributeDef('module', '0').ToInteger = ModuleID then
      begin
        xNode.DeleteSelf;
        Break;
      end;
      xNode := xNode.NextNodeInTree;
    end;

    xNode := FXML.DocumentElement;

    // ��������� ����� �����
    xNode := xNode.AddChild('period');
    xNode.AddAttribute('module', ModuleID.ToString);
    xNode.AddAttribute('checked', BoolToStr(PeriodChecked));
    xNode.AddAttribute('mode', Ord(PeriodMode).ToString);
    xNode.AddAttribute('date_beg', DateToStr(Period.DateBeg));
    xNode.AddAttribute('date_end', DateToStr(Period.DateEnd));

    // ��������� � ��
    FQuery.SQL.Text := 'UPDATE USERS u' + #10
                     + '   SET u.xml_period = :pXMLPeriod' + #10
                     + ' WHERE u.user_id = :pUserID';

    FQuery.ParamByName('pUserID').AsInteger := ID;
    FQuery.ParamByName('pXMLPeriod').AsWideString := FXML.XML;
    FQuery.Execute;

  finally
    FQuery.Close;
    FXML.Clear(True);
  end;

end;

class function TUser.LoadModuleConf(ModuleID: integer): WideString;
var
  Query: TOraQuery;
begin

  Query := TOraQuery.Create(nil);
  Query.Session := DataModuleRay.OraSession;

  Query.SQL.Text := 'SELECT m.xml_conf' + #10
                  + '  FROM MODULE m' + #10
                  + ' WHERE m.module_id = :pModuleID';

  Query.ParamByName('pModuleID').AsInteger := ModuleID;

  try
    Query.Open;
    Result := Query.FieldByName('xml_conf').AsWideString;
  finally
    Query.Close;
  end;

end;

initialization
  User := TUser.Create;

finalization
  User.Free;

end.

