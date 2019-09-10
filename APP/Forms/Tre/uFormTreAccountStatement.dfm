object FormTreAccountStatement: TFormTreAccountStatement
  Left = 0
  Top = 0
  Caption = 'FormTreAccountStatement'
  ClientHeight = 556
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000B57A4E45B97D51E9B87D
    51E9B47C4F44000000000000000000000000000000000000000000000000B77D
    52CEB57A4EFFB57A4EFFB57A4EFFB57A4EFFB57A4EFFB67B4FFDE2A87DFFE2A9
    7CFFB57B4FFDB57A4EFFB57A4EFFB57A4EFFB57A4EFFB57A4EFFB87D51CC9C8B
    78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
    78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFF8F7966FFFFFFFFFF8F7966FF8F7966FF8F7966FFFFFFFFFFF2EB
    E1FFF2EBE1FFD1CDE8FF8F8FF7FFE2DCE5FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFC0BCECFFC1BDEDFF9D9CF4FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFEFE8E2FFBEBBEDFFA7A5F2FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFF8F7966FFFFFFFFFF8F7966FF8F7966FFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFA6A4F2FFC1BEECFFEFE8E2FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FF9E9DF4FFC1BEEBFFCEC9E9FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFF8F7966FFFFFFFFFF8F7966FF8F7966FF8F7966FFFFFFFFFFF2EB
    E1FFF2EBE1FFE0DBE5FF8F8FF7FFDBD6E6FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EB
    E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E1DCFFA1907EEBA090
    7DECEFE9E0FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF9C8B78FF9C8B
    78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FFA1907FE99C8B7A4B9C8B
    7B4DA1907EE99C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF0000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FC3F00000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000FFFF0000}
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 851
    Height = 65
    Align = alTop
    TabOrder = 0
    object DBText1: TDBText
      Left = 77
      Top = 39
      Width = 41
      Height = 13
      AutoSize = True
      DataField = 'CURRENCY'
      DataSource = dsUSER_ACCOUNTS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lCurrency: TLabel
      Left = 34
      Top = 39
      Width = 39
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 151
      Top = 39
      Width = 42
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 325
      Top = 39
      Width = 79
      Height = 13
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1086':'
    end
    object DBText3: TDBText
      Left = 408
      Top = 39
      Width = 65
      Height = 17
    end
    object Label7: TLabel
      Left = 197
      Top = 39
      Width = 122
      Height = 13
      Caption = '01.01.2019 - 01.01.2019'
    end
    object fAccountName: TDBText
      Left = 151
      Top = 10
      Width = 306
      Height = 17
      DataField = 'ACCOUNT_NAME'
      DataSource = dsUSER_ACCOUNTS
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEditEh1: TDBEditEh
      Left = 653
      Top = 9
      Width = 100
      Height = 21
      Color = clBtnFace
      ControlLabel.Width = 96
      ControlLabel.Height = 13
      ControlLabel.Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      ControlLabel.Visible = True
      ControlLabelLocation.Position = lpLeftTextBaselineEh
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '0'
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 653
      Top = 36
      Width = 100
      Height = 21
      Color = clBtnFace
      ControlLabel.Width = 104
      ControlLabel.Height = 13
      ControlLabel.Caption = #1042#1099#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      ControlLabel.Visible = True
      ControlLabelLocation.Position = lpLeftTextBaselineEh
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = '0'
      Visible = True
    end
    object fAccount: TDBLookupComboboxEh
      Left = 77
      Top = 9
      Width = 70
      Height = 21
      ControlLabel.Width = 51
      ControlLabel.Height = 16
      ControlLabel.Caption = #1057#1095#1077#1090' '#8470
      ControlLabel.Font.Charset = DEFAULT_CHARSET
      ControlLabel.Font.Color = clWindowText
      ControlLabel.Font.Height = -13
      ControlLabel.Font.Name = 'Tahoma'
      ControlLabel.Font.Style = [fsBold]
      ControlLabel.ParentFont = False
      ControlLabel.Visible = True
      ControlLabelLocation.Position = lpLeftTextBaselineEh
      AutoSelect = False
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'ACCOUNT'
          Width = 70
        end
        item
          FieldName = 'ACCOUNT_NAME'
          Width = 300
        end
        item
          FieldName = 'CURRENCY'
          Width = 30
        end>
      DropDownBox.Rows = 20
      DropDownBox.Width = 400
      EditButtons = <>
      KeyField = 'ACCOUNT'
      ListSource = dsUSER_ACCOUNTS
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnCloseUp = fAccountCloseUp
      OnKeyDown = fAccountKeyDown
    end
  end
  object ToolBar1: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 845
    Height = 22
    AutoSize = True
    Caption = 'ToolBar1'
    Images = DataModuleImages.ImageList
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActionRefresh
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 31
      Top = 0
      Action = ActionExpExcel
    end
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 93
    Width = 851
    Height = 463
    Align = alClient
    TabOrder = 2
    Tabs.Strings = (
      #1055#1086' '#1076#1077#1073#1077#1090#1091
      #1055#1086' '#1082#1088#1077#1076#1080#1090#1091)
    TabIndex = 0
    object Grid: TDBGridEh
      Left = 4
      Top = 24
      Width = 843
      Height = 435
      Align = alClient
      ColumnDefValues.Title.Alignment = taCenter
      DynProps = <>
      Flat = True
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghExtendVertLines]
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1044#1077#1073#1077#1090
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1050#1088#1077#1076#1077#1090
          Width = 52
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #8470' '#1055#1083#1072#1090'. '#1076#1086#1082'.'
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 120
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1079#1072#1090#1088#1072#1090
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          Footers = <>
          Title.Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
          Width = 150
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ActionList: TActionList
    Images = DataModuleImages.ImageList
    Left = 44
    Top = 161
    object ActionRefresh: TAction
      Caption = 'ActionReflesh'
      ImageIndex = 5
      OnExecute = ActionRefreshExecute
    end
    object ActionExpExcel: TAction
      Caption = 'ActionExpExcel'
      ImageIndex = 8
      OnExecute = ActionExpExcelExecute
    end
  end
  object qUSER_ACCOUNTS: TOraQuery
    Session = DataModuleRay.OraSession
    SQL.Strings = (
      'SELECT a.account,'
      '       a.account || '#39' '#39' || a.name account_name,'
      '       dc.currency'
      '  FROM TRE.ACCOUNTS a,'
      '       TRE.ACCOUNTS_USERS au,'
      '       RBI.DICT_CURRENCY dc '
      ' WHERE a.account_id = au.account_id'
      '   AND a.currency_id = dc.currency_id(+)'
      '   AND au.user_id = :pUserID'
      ' ORDER BY TO_NUMBER(RPAD(a.account, 10, '#39'0'#39'))')
    Left = 44
    Top = 217
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pUserID'
        Value = 1
      end>
    object qUSER_ACCOUNTSACCOUNT: TFloatField
      FieldName = 'ACCOUNT'
      Required = True
    end
    object qUSER_ACCOUNTSACCOUNT_NAME: TStringField
      FieldName = 'ACCOUNT_NAME'
      Size = 241
    end
    object qUSER_ACCOUNTSCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Size = 3
    end
  end
  object dsUSER_ACCOUNTS: TOraDataSource
    DataSet = qUSER_ACCOUNTS
    Left = 46
    Top = 271
  end
end
