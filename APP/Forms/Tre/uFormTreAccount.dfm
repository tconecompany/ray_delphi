object FormTreAccount: TFormTreAccount
  Left = 0
  Top = 0
  Caption = #1057#1095#1077#1090' '#1050#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
  ClientHeight = 574
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 12
    Top = 245
    Width = 179
    Height = 13
    Caption = #1050#1090#1086' '#1091#1087#1088#1072#1074#1083#1103#1077#1090' '#1076#1077#1073#1077#1090#1086#1084' '#1089#1095#1077#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 413
    Top = 245
    Width = 221
    Height = 13
    Caption = #1057#1095#1077#1090' '#1076#1083#1103' '#1090#1086#1074#1072#1088#1085#1099#1093' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1086#1090#1076#1077#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object fAccount: TDBEditEh
    Left = 134
    Top = 110
    Width = 80
    Height = 21
    ControlLabel.Width = 29
    ControlLabel.Height = 13
    ControlLabel.Caption = #1057#1095#1077#1090':'
    ControlLabel.Transparent = True
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 92
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DataField = 'ACCOUNT'
    DataSource = dsACCOUNTS
    DynProps = <>
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object fAccountTypeId: TDBLookupComboboxEh
    Left = 134
    Top = 191
    Width = 270
    Height = 21
    ControlLabel.Width = 55
    ControlLabel.Height = 13
    ControlLabel.Caption = #1042#1080#1076' '#1089#1095#1077#1090#1072':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 66
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DynProps = <>
    DataField = 'ACCOUNT_TYPE_ID'
    DataSource = dsACCOUNTS
    EditButtons = <>
    KeyField = 'ACCOUNT_TYPE_ID'
    ListField = 'NAME'
    ListSource = DataModuleTre.dsDICT_ACCOUNT_TYPE
    TabOrder = 1
    Visible = True
  end
  object fAccountSubtypeId: TDBLookupComboboxEh
    Left = 134
    Top = 218
    Width = 270
    Height = 21
    ControlLabel.Width = 75
    ControlLabel.Height = 13
    ControlLabel.Caption = #1055#1086#1076#1074#1080#1076' '#1089#1095#1077#1090#1072':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 46
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DynProps = <>
    DataField = 'ACCOUNT_SUBTYPE_ID'
    DataSource = dsACCOUNTS
    DropDownBox.Rows = 15
    EditButtons = <>
    KeyField = 'ACCOUNT_SUBTYPE_ID'
    ListField = 'NAME'
    ListSource = DataModuleTre.dsDICT_ACCOUNT_SUBTYPE
    TabOrder = 2
    Visible = True
  end
  object fCurrencyId: TDBLookupComboboxEh
    Left = 134
    Top = 164
    Width = 270
    Height = 21
    ControlLabel.Width = 43
    ControlLabel.Height = 13
    ControlLabel.Caption = #1042#1072#1083#1102#1090#1072':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 78
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DynProps = <>
    DataField = 'CURRENCY_ID'
    DataSource = dsACCOUNTS
    EditButtons = <>
    KeyField = 'CURRENCY_ID'
    ListField = 'CURRENCY'
    ListSource = DataModuleRBI.dsDICT_CURRENCY
    TabOrder = 3
    Visible = True
  end
  object fName: TDBEditEh
    Left = 224
    Top = 110
    Width = 450
    Height = 21
    ControlLabel.Width = 4
    ControlLabel.Height = 13
    ControlLabel.Caption = '-'
    ControlLabel.Visible = True
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DataField = 'NAME'
    DataSource = dsACCOUNTS
    DynProps = <>
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object GridL: TDBGridEh
    Left = 12
    Top = 264
    Width = 372
    Height = 260
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    ColumnDefValues.Title.Alignment = taCenter
    Ctl3D = False
    DataSource = dsACCOUNTS_USERS
    DynProps = <>
    Flat = True
    FooterParams.FillStyle = cfstSolidEh
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorParams.FillStyle = cfstSolidEh
    IndicatorParams.HorzLines = True
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghExtendVertLines]
    ParentCtl3D = False
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 5
    TitleParams.FillStyle = cfstSolidEh
    Columns = <
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGN_ACTIVITY'
        Footers = <>
        KeyList.Strings = (
          '-1;1;True'
          '0;0;False')
        Title.Caption = #1044#1086#1089#1090#1091#1087
      end
      item
        ButtonStyle = cbsNone
        CellButtons = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 0
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'USER_ID'
        Footers = <>
        LookupParams.KeyFieldNames = 'USER_ID'
        LookupParams.LookupDataSet = DataModuleRay.tUSERS
        LookupParams.LookupDisplayFieldName = 'LOGIN'
        LookupParams.LookupKeyFieldNames = 'USER_ID'
        ReadOnly = True
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        Width = 250
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object GridR: TDBGridEh
    Left = 413
    Top = 264
    Width = 372
    Height = 260
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    ColumnDefValues.Title.Alignment = taCenter
    Ctl3D = False
    DataSource = dsACCOUNTS_COMM_OPER
    DynProps = <>
    Flat = True
    FooterParams.FillStyle = cfstSolidEh
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorParams.FillStyle = cfstSolidEh
    IndicatorParams.HorzLines = True
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghExtendVertLines]
    ParentCtl3D = False
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 6
    TitleParams.FillStyle = cfstSolidEh
    Columns = <
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGN_ACTIVITY'
        Footers = <>
        KeyList.Strings = (
          '-1;1;True'
          '0;0;False')
        Title.Caption = #1044#1086#1089#1090#1091#1087
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'COR_ID'
        Footers = <>
        LookupParams.KeyFieldNames = 'COR_ID'
        LookupParams.LookupDisplayFieldName = 'FNAME'
        LookupParams.LookupKeyFieldNames = 'COR_ID'
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 250
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object atbGridL: TActionToolBar
    Left = 12
    Top = 528
    Width = 185
    Height = 25
    ActionManager = ActionManager
    Align = alNone
    Caption = 'atbGridL'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object atbGridR: TActionToolBar
    Left = 413
    Top = 528
    Width = 185
    Height = 25
    ActionManager = ActionManager
    Align = alNone
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object flTopLevelAccount: TDBEditEh
    Left = 224
    Top = 137
    Width = 450
    Height = 21
    Color = clBtnFace
    ControlLabel.Width = 4
    ControlLabel.Height = 13
    ControlLabel.Caption = '-'
    ControlLabel.Visible = True
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DataField = 'L_TOP_LEVEL_ACCOUNT'
    DataSource = dsACCOUNTS
    DynProps = <>
    EditButtons = <>
    TabOrder = 9
    Visible = True
  end
  object pCheck: TPanel
    Left = 12
    Top = 72
    Width = 956
    Height = 30
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 10
    object fSignActivity: TDBCheckBoxEh
      Left = 31
      Top = 5
      Width = 74
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1099#1081
      DataField = 'SIGN_ACTIVITY'
      DataSource = dsACCOUNTS
      DynProps = <>
      TabOrder = 0
      ValueChecked = '-1'
      ValueUnchecked = '0'
    end
    object fSignExchangeDifference: TDBCheckBoxEh
      Left = 129
      Top = 5
      Width = 160
      Height = 17
      Caption = #1057#1095#1080#1090#1072#1090#1100' '#1082#1091#1088#1089#1086#1074#1091#1102' '#1088#1072#1079#1085#1080#1094#1091
      DataField = 'SIGN_EXCHANGE_DIFFERENCE'
      DataSource = dsACCOUNTS
      DynProps = <>
      TabOrder = 1
      ValueChecked = '-1'
      ValueUnchecked = '0'
    end
    object fSignStatement: TDBCheckBoxEh
      Left = 315
      Top = 5
      Width = 69
      Height = 17
      Caption = #1042#1099#1087#1080#1089#1082#1072
      DataField = 'SIGN_STATEMENT'
      DataSource = dsACCOUNTS
      DynProps = <>
      TabOrder = 2
      ValueChecked = '-1'
      ValueUnchecked = '0'
    end
  end
  inline FrameTitle: TFrameTitle
    Left = 0
    Top = 0
    Width = 981
    Height = 72
    TabOrder = 11
    inherited lTitle: TLabel
      Width = 161
      Caption = #1057#1095#1077#1090' '#1050#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1072
      ExplicitWidth = 161
    end
    inherited bButton: TBitBtn
      Action = FrameTitle.ActionRecPost
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        20000000000000080000C40E0000C40E0000000000000000000000000000D7CB
        BAFF9B6082FFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFF00000000C7C7
        C7FF707070FF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C
        6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF000000009D5D
        82FFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFF000000006F6F
        6FFF6C6C6CFF6E6E6EFFFFFFFFFFFFFFFFFF6D6D6DFF727272FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6E6E6EFFFFFFFFFFFFFFFFFF6D6D6DFF727272FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6E6E6EFFFFFFFFFFFFFFFFFF6D6D6DFF727272FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C
        6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C
        6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFE5CADCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFDFEFFE7CDDEFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFFD2D2D2FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFDFFD4D4D4FF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFFDFCFDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
        B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFF000000006D6D
        6DFF6C6C6CFFFCFCFCFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
        B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFF6D6D6DFF6C6C6CFF00000000AA52
        8DFFAB518DFFFDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB528DFFAB518DFF000000006D6D
        6DFF6C6C6CFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6DFF6C6C6CFF00000000AA52
        8DFFAB518DFFFDFCFDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
        B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFF000000006D6D
        6DFF6C6C6CFFFCFCFCFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
        B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFF6D6D6DFF6C6C6CFF00000000AA52
        8DFFAB518DFFFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFE5CADCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEFFE7CEDEFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFFD2D2D2FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEFFD5D5D5FF6C6C6CFF6C6C6CFF00000000AA52
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
        8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFF000000006D6D
        6DFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C
        6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      NumGlyphs = 2
    end
    inherited atbMain: TActionToolBar
      ActionManager = ActionManager
    end
    inherited ActionList: TActionList
      inherited ActionRecPost: TAction
        OnExecute = FrameTitleActionRecPostExecute
      end
      inherited ActionRecEdit: TAction
        OnExecute = FrameTitleActionRecEditExecute
      end
      inherited ActionRecCancel: TAction
        OnExecute = FrameTitleActionRecCancelExecute
      end
    end
  end
  object fTopLevelAccount: TDBLookupComboboxEh
    Left = 134
    Top = 137
    Width = 80
    Height = 21
    ControlLabel.Width = 118
    ControlLabel.Height = 13
    ControlLabel.Caption = #1057#1095#1077#1090' '#1074#1077#1088#1093#1085#1077#1075#1086' '#1091#1088#1086#1074#1085#1103':'
    ControlLabel.Visible = True
    ControlLabelLocation.Spacing = 4
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DynProps = <>
    DataField = 'TOP_LEVEL_ACCOUNT'
    DataSource = dsACCOUNTS
    DropDownBox.Columns = <
      item
        FieldName = 'ACCOUNT'
        Width = 80
      end
      item
        FieldName = 'NAME'
        Width = 300
      end>
    DropDownBox.Rows = 20
    DropDownBox.Width = 380
    EditButtons = <>
    KeyField = 'ACCOUNT'
    ListField = 'ACCOUNT'
    ListSource = DataModuleTre.dsACCOUNTS
    Style = csDropDownEh
    TabOrder = 12
    Visible = True
  end
  object tACCOUNTS: TOraTable
    TableName = 'TRE.ACCOUNTS'
    KeySequence = 'TRE.SEQ_ACCOUNTS'
    SequenceMode = smInsert
    Session = OraSession
    CachedUpdates = True
    Left = 846
    Top = 167
    object tACCOUNTSACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
    end
    object tACCOUNTSACCOUNT: TFloatField
      FieldName = 'ACCOUNT'
      Required = True
    end
    object tACCOUNTSNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object tACCOUNTSACCOUNT_TYPE_ID: TFloatField
      FieldName = 'ACCOUNT_TYPE_ID'
    end
    object tACCOUNTSACCOUNT_SUBTYPE_ID: TFloatField
      FieldName = 'ACCOUNT_SUBTYPE_ID'
    end
    object tACCOUNTSCURRENCY_ID: TIntegerField
      FieldName = 'CURRENCY_ID'
    end
    object tACCOUNTSTOP_LEVEL_ACCOUNT: TFloatField
      FieldName = 'TOP_LEVEL_ACCOUNT'
    end
    object tACCOUNTSSIGN_ACTIVITY: TIntegerField
      FieldName = 'SIGN_ACTIVITY'
    end
    object tACCOUNTSSIGN_EXCHANGE_DIFFERENCE: TIntegerField
      FieldName = 'SIGN_EXCHANGE_DIFFERENCE'
    end
    object tACCOUNTSSIGN_STATEMENT: TIntegerField
      FieldName = 'SIGN_STATEMENT'
    end
    object tACCOUNTSL_TOP_LEVEL_ACCOUNT: TStringField
      FieldKind = fkLookup
      FieldName = 'L_TOP_LEVEL_ACCOUNT'
      LookupDataSet = DataModuleTre.tACCOUNTS
      LookupKeyFields = 'ACCOUNT'
      LookupResultField = 'NAME'
      KeyFields = 'TOP_LEVEL_ACCOUNT'
      Size = 255
      Lookup = True
    end
  end
  object OraSession: TOraSession
    Options.Direct = True
    Username = 'tre'
    Server = '192.168.1.2:1521:ORCL'
    Connected = True
    LoginPrompt = False
    Left = 915
    Top = 110
    EncryptedPassword = '8BFF8DFF9AFF'
  end
  object dsACCOUNTS: TOraDataSource
    AutoEdit = False
    DataSet = tACCOUNTS
    OnStateChange = dsACCOUNTSStateChange
    Left = 916
    Top = 167
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionGridLAppend
            ImageIndex = 1
          end
          item
            Action = ActionGridLDelete
            ImageIndex = 2
          end>
        ActionBar = atbGridL
      end
      item
        Items = <
          item
            Action = ActionGridRAppend
            ImageIndex = 1
          end
          item
            Action = ActionGridRDelete
            ImageIndex = 2
          end>
        ActionBar = atbGridR
      end
      item
        Items = <
          item
            Action = FrameTitle.ActionRecEdit
            ImageIndex = 16
          end
          item
            Action = FrameTitle.ActionRecCancel
            ImageIndex = 17
          end>
        ActionBar = FrameTitle.atbMain
      end>
    LinkedActionLists = <
      item
        ActionList = FrameTitle.ActionList
        Caption = 'ActionList'
      end>
    Images = DataModuleImages.ImageList
    Left = 845
    Top = 110
    StyleName = 'Platform Default'
    object ActionGridLAppend: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ImageIndex = 1
      OnExecute = ActionGridLAppendExecute
    end
    object ActionGridLDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 2
      OnExecute = ActionGridLDeleteExecute
    end
    object ActionGridRAppend: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
      ImageIndex = 1
      OnExecute = ActionGridRAppendExecute
    end
    object ActionGridRDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 2
      OnExecute = ActionGridRDeleteExecute
    end
  end
  object tACCOUNTS_USERS: TOraTable
    TableName = 'TRE.ACCOUNTS_USERS'
    MasterFields = 'ACCOUNT_ID'
    DetailFields = 'ACCOUNT_ID'
    MasterSource = dsACCOUNTS
    SequenceMode = smInsert
    Session = OraSession
    CachedUpdates = True
    Left = 64
    Top = 307
    object tACCOUNTS_USERSACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
      Required = True
    end
    object tACCOUNTS_USERSUSER_ID: TFloatField
      FieldName = 'USER_ID'
      Required = True
    end
    object tACCOUNTS_USERSSIGN_ACTIVITY: TIntegerField
      DefaultExpression = '-1'
      FieldName = 'SIGN_ACTIVITY'
    end
  end
  object tACCOUNTS_COMM_OPER: TOraTable
    TableName = 'TRE.ACCOUNTS_COMM_OPER'
    MasterFields = 'ACCOUNT_ID'
    DetailFields = 'ACCOUNT_ID'
    MasterSource = dsACCOUNTS
    SequenceMode = smInsert
    Session = OraSession
    CachedUpdates = True
    Left = 560
    Top = 307
    object tACCOUNTS_COMM_OPERACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
      Required = True
    end
    object tACCOUNTS_COMM_OPERCOR_ID: TFloatField
      FieldName = 'COR_ID'
      Required = True
    end
    object tACCOUNTS_COMM_OPERSIGN_ACTIVITY: TIntegerField
      DefaultExpression = '-1'
      FieldName = 'SIGN_ACTIVITY'
    end
  end
  object dsACCOUNTS_COMM_OPER: TOraDataSource
    AutoEdit = False
    DataSet = tACCOUNTS_COMM_OPER
    OnStateChange = dsACCOUNTS_COMM_OPERStateChange
    Left = 704
    Top = 307
  end
  object dsACCOUNTS_USERS: TOraDataSource
    AutoEdit = False
    DataSet = tACCOUNTS_USERS
    OnStateChange = dsACCOUNTS_USERSStateChange
    Left = 176
    Top = 307
  end
end
