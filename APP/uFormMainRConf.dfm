object FormMainRConf: TFormMainRConf
  Left = 0
  Top = 0
  ActiveControl = ListBox
  Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1090#1086#1088' '#1056#1077#1087#1086#1079#1080#1090#1086#1088#1080#1103
  ClientHeight = 639
  ClientWidth = 1194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 300
    Top = 0
    Height = 639
    ExplicitLeft = 240
    ExplicitTop = 184
    ExplicitHeight = 100
  end
  object pLeft: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 639
    Align = alLeft
    TabOrder = 0
    DesignSize = (
      300
      639)
    object Label1: TLabel
      Left = 4
      Top = 75
      Width = 65
      Height = 13
      Caption = #1056#1077#1087#1086#1079#1080#1090#1086#1088#1080#1081
    end
    object ToolBar: TToolBar
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 292
      Height = 29
      Caption = 'ToolBar'
      Images = DataModuleImages.ImageList
      List = True
      TabOrder = 0
      object tbAppend: TToolButton
        Left = 0
        Top = 0
        Action = ActionAppend
      end
      object tbDelete: TToolButton
        Left = 23
        Top = 0
        Action = ActionDelete
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbReflesh: TToolButton
        Left = 54
        Top = 0
        Action = ActionReflesh
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbExit: TToolButton
        Left = 85
        Top = 0
        Action = ActionExit
      end
    end
    object lcModule: TDBLookupComboboxEh
      AlignWithMargins = True
      Left = 4
      Top = 48
      Width = 292
      Height = 21
      ControlLabel.Width = 39
      ControlLabel.Height = 13
      ControlLabel.Caption = #1052#1086#1076#1091#1083#1100
      ControlLabel.Visible = True
      ImeMode = imOpen
      DynProps = <>
      DataField = 'MODULE_ID'
      DataSource = dsMasterMODULE
      DropDownBox.Rows = 20
      EditButtons = <>
      KeyField = 'MODULE_ID'
      ListField = 'SIGNATURE'
      ListSource = DataModuleRay.dsMODULE
      ParentShowHint = False
      TabOrder = 1
      Visible = True
      OnChange = lcModuleChange
    end
    object ListBox: TDBLookupListBox
      AlignWithMargins = True
      Left = 4
      Top = 93
      Width = 292
      Height = 524
      Anchors = [akLeft, akTop, akRight, akBottom]
      KeyField = 'REPOSITORY_ID'
      ListField = 'REPOSITORY_VAL'
      ListSource = dsDetailREPOSITORY
      TabOrder = 2
      OnDblClick = ListBoxDblClick
    end
  end
  object pMain: TPanel
    Left = 303
    Top = 0
    Width = 891
    Height = 639
    Align = alClient
    Caption = 'pMain'
    TabOrder = 1
    object pTop: TPanel
      Left = 1
      Top = 1
      Width = 889
      Height = 112
      Align = alTop
      TabOrder = 0
      object lXMLConf: TLabel
        Left = 18
        Top = 93
        Width = 110
        Height = 13
        Caption = 'XML '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fRepositoryID: TDBEditEh
        Left = 102
        Top = 10
        Width = 75
        Height = 21
        ControlLabel.Width = 79
        ControlLabel.Height = 13
        ControlLabel.Caption = 'ID '#1088#1077#1087#1086#1079#1080#1090#1086#1088#1080#1103
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DataField = 'REPOSITORY_ID'
        DataSource = dsREPOSITORY
        DynProps = <>
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object fSignature: TDBEditEh
        Left = 473
        Top = 37
        Width = 150
        Height = 21
        ControlLabel.Width = 54
        ControlLabel.Height = 13
        ControlLabel.Caption = #1057#1080#1075#1085#1072#1090#1091#1088#1072
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DataField = 'SIGNATURE'
        DataSource = dsREPOSITORY
        DynProps = <>
        EditButtons = <>
        TabOrder = 1
        Visible = True
      end
      object fParam: TDBEditEh
        Left = 473
        Top = 64
        Width = 150
        Height = 21
        ControlLabel.Width = 49
        ControlLabel.Height = 13
        ControlLabel.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DataField = 'PARAM'
        DataSource = dsREPOSITORY
        DynProps = <>
        EditButtons = <>
        TabOrder = 2
        Visible = True
      end
      object fSignActivity: TDBCheckBoxEh
        Left = 792
        Top = 12
        Width = 69
        Height = 17
        Caption = #1072#1082#1090#1080#1074#1085#1099#1081
        DataField = 'SIGN_ACTIVITY'
        DataSource = dsREPOSITORY
        DynProps = <>
        TabOrder = 3
        OnClick = MemoChange
        ValueChecked = '-1'
        ValueUnchecked = '0'
      end
      object fDescribe: TDBEditEh
        Left = 102
        Top = 64
        Width = 300
        Height = 21
        ControlLabel.Width = 49
        ControlLabel.Height = 13
        ControlLabel.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DataField = 'DESCRIBE'
        DataSource = dsREPOSITORY
        DynProps = <>
        EditButtons = <>
        TabOrder = 4
        Visible = True
      end
      object fSignOneCopy: TDBCheckBoxEh
        Left = 792
        Top = 39
        Width = 77
        Height = 17
        Caption = #1086#1076#1085#1072' '#1082#1086#1087#1080#1103
        DataField = 'SIGN_ONE_COPY'
        DataSource = dsREPOSITORY
        DynProps = <>
        TabOrder = 5
        OnClick = MemoChange
        ValueChecked = '-1'
        ValueUnchecked = '0'
      end
      object fModuleID: TDBLookupComboboxEh
        Left = 102
        Top = 37
        Width = 150
        Height = 21
        ControlLabel.Width = 39
        ControlLabel.Height = 13
        ControlLabel.Caption = #1052#1086#1076#1091#1083#1100
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DynProps = <>
        DataField = 'MODULE_ID'
        DataSource = dsREPOSITORY
        DropDownBox.Rows = 20
        EditButtons = <
          item
            DefaultAction = False
            Glyph.Data = {
              1A020000424D1A0200000000000036000000280000000B0000000B0000000100
              200000000000E4010000C40E0000C40E00000000000000000000FFFFFF01EBDD
              D335CFAE8D85C49F79FAB48251FFB27E4BFFB48151FFC49E79FACEAD8D84EBDD
              CE35FFFFFF01ECDDCF36D2B498D5B8895BFCB38150FFCAA785FFDEC8B3FFC49B
              74FFB27F4DFFB8895CFCD2B698D4E6DDCE35CDAD8C86B9895BFCB17D4AFFB482
              51FFDAC1A9FFFAF7F4FFCFAE8EFFB27F4DFFB17D4AFFB8895CFCCEAD8E84C49E
              78FAB27E4CFFB17D4AFFB48251FFDAC1A9FFFAF7F4FFCFAE8EFFB27F4DFFB17D
              4AFFB17E4CFFC49E79FAB48150FFB17D4AFFB17D4AFFB48251FFDAC1A9FFFAF7
              F4FFCFAE8EFFB27F4DFFB17D4AFFB17D4AFFB48150FFB17D4AFFB17D4AFFB17D
              4AFFB48251FFDAC1A9FFFAF7F4FFCFAE8EFFB27F4DFFB17D4AFFB17D4AFFB17D
              4AFFB38150FFB17D4AFFB17D4AFFB48150FFD6BBA0FFF3EBE4FFCCA988FFB27F
              4DFFB17D4AFFB17D4AFFB38150FFC49E78FAB17E4CFFB17D4AFFB27E4CFFC197
              6FFFCFAF90FFBC9064FFB27E4BFFB17D4AFFB17E4CFFC49E78FACDAB8D87B989
              5BFCB17D4AFFB3814FFFD2B497FFE9DACCFFC9A683FFB27F4DFFB17D4AFFB889
              5BFCCFAE8D85ECDDD436D2B597D6B9895BFCB48251FFD4B699FFEADCCEFFCBA8
              86FFB3804FFFB9895CFCD2B598D5EBE2D335FFFFFF01ECDDCF36CFAD8E86C49E
              79FAB88859FFBB8E61FFB68556FFC49E78FACDAD8C86ECDDCF36FFFFFF01}
            Hint = #1057#1095#1080#1090#1072#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102' '#1084#1086#1076#1091#1083#1103
            Style = ebsGlyphEh
            OnClick = fModuleIDEditButtons0Click
          end>
        KeyField = 'MODULE_ID'
        ListField = 'SIGNATURE'
        ListSource = DataModuleRay.dsMODULE
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Visible = True
        OnChange = MemoChange
      end
      object fActionID: TDBLookupComboboxEh
        Left = 473
        Top = 10
        Width = 300
        Height = 21
        ControlLabel.Width = 49
        ControlLabel.Height = 13
        ControlLabel.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DynProps = <>
        DataField = 'ACTION_ID'
        DataSource = dsREPOSITORY
        DropDownBox.Rows = 20
        EditButtons = <>
        KeyField = 'ACTION_ID'
        ListField = 'SIGNATURE'
        ListSource = DataModuleRay.dsACTION
        TabOrder = 7
        Visible = True
        OnChange = MemoChange
      end
    end
    object pBottom: TPanel
      Left = 1
      Top = 597
      Width = 889
      Height = 41
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        889
        41)
      object bPost: TBitBtn
        Left = 257
        Top = 6
        Width = 105
        Height = 25
        Action = ActionPost
        Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00E7F1E8FFD0E3D1FFBDD9BEFFB7D6B8FFB7D6B9FFC3DB
          C5FFD7E8D8FFF0F7F0FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00A3C8A3FF7FB17FFF73AB73FF77A872FF74AE76FF73AE76FF73A2
          75FF75A975FF88B789FFBCD9BEFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00AECEB0FF72AA74FF81B281FF7DB07DFF7BB07BFF7BB07BFF7BB07BFF7DB0
          7EFF81B281FF81B281FF70AB78FFD7E7D8FFFF00FF00FF00FF00FF00FF00FF00
          FF009BC4A0FF6FAB71FF6AA86CFF65A667FF68A86AFF68A86AFF68A86AFF68A8
          69FF67A669FF6DAB6FFF69A666FFC8DFCBFFFF00FF00FF00FF00FF00FF00FF00
          FF0094C197FF67A669FF79AD7AFF7DB07DFF81B281FF81B281FF81B281FF81B2
          81FF7DB07EFF76AD78FF5FA660FFC5DDC8FFFF00FF00FF00FF00FF00FF00FF00
          FF009BC39FFF79AD7AFF79AD7AFF72AD74FF6FAB70FF6DAB6FFF6DAB6FFF6FAB
          70FF74AD75FF7BB07BFF73A76BFFC7DEC9FFFF00FF00FF00FF00FF00FF00FF00
          FF0095C197FF62A364FF6AA86CFF71AB73FFDFECDFFFDFECDFFFDFECDFFF74AD
          75FF6FAB70FF68A86AFF5FA660FFC7DEC8FFFF00FF00FF00FF00FF00FF00FF00
          FF0095C298FF74AD75FF81B281FF9EC49EFFE0ECE0FF167319FFDFECDFFF9DC4
          9DFF7DB07DFF81B281FF65A663FFC7DFCAFFFF00FF00FF00FF00FF00FF00FF00
          FF00A1C9A4FF71AB73FF92BE94FFDDEADEFF167319FF49DA4DFF167319FFDFEB
          DFFF95BE97FF71AB73FF6DA96EFFCEE3CFFFFF00FF00FF00FF00FF00FF00FF00
          FF009DC79FFF9AC09BFFE5EEE5FF167319FF49DA4DFFCAF4CBFF49DA4DFF1673
          19FFE5EEE5FFAAC6ACFF6CA76EFFCEE3CFFFFF00FF00FF00FF00FF00FF00FF00
          FF00E3EEE3FFE5EFE5FF167319FF49DA4DFFCAF4CBFFCAF4CBFFCAF4CBFF49DA
          4DFF167319FFE6EEE6FFAAC9AAFFDEEBDFFFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00167319FF17741AFF167319FFCAF4CBFFCAF4CBFFCAF4CBFF1673
          19FF167319FF167319FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00F3F7F3FF167319FFCAF4CBFFCAF4CBFFCAF4CBFF1673
          18FFE7F2E8FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00167318FFCAF4CBFFCAF4CBFFCAF4CBFF1673
          18FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00157319FF167319FF167319FF167319FF1573
          19FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 0
      end
      object bCancel: TBitBtn
        Left = 370
        Top = 6
        Width = 105
        Height = 25
        Action = ActionCancel
        Caption = #1054#1090#1082#1072#1090#1080#1090#1100
        TabOrder = 1
      end
      object bOpenFile: TBitBtn
        Left = 31
        Top = 6
        Width = 105
        Height = 25
        Action = ActionOpenFile
        Caption = #1054#1090#1082#1088#1099#1090#1100
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0082C2EAFF82C2
          EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2
          EAFF82C2EAFF82C2EAFF82C2EAFFE0F0FAFFFF00FF00FF00FF0082C2EAFF8AC6
          EBFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2
          EAFF82C2EAFF9ACDEEFFF7FBFEFFFFFFFFFFFBF7F4FFFF00FF0082C2EAFFB9DD
          F3FF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF8AC6EBFFE7F4
          FBFFD8ECF8FFF7FBFEFFD3B190FFB8824DFFB8824DFFB8824DFF82C2EAFFEFF7
          FCFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFFE7F4FBFFD7B9
          9BFFF2E7DDFFFFFFFFFFFFFFFFFFE4D0BCFFB8824DFFB8824DFF82C2EAFFFFFF
          FFFFA9D5F1FF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFFFFFFFFFFC59A
          6FFFBC8A58FFDBC0A6FFDBC0A6FFB8824DFFCAA17AFFB8824DFF82C2EAFFFFFF
          FFFFE0F0FAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFFC8E4F6FFFBF7
          F4FFD3B190FFBC8A58FFC59A6FFFDBC0A6FFFBF7F4FFD3B190FF82C2EAFFFFFF
          FFFFFFFFFFFF92CAEDFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFFB9DD
          F3FFF7FBFEFFFFFFFFFFFFFFFFFFEFF7FCFFFFFFFFFFFFFFFFFF82C2EAFFFFFF
          FFFFFFFFFFFFD0E8F7FF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2
          EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF8AC6EBFF82C2EAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF82C2EAFFFF00FF00FF00FF0082C2EAFFEFF7
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF82C2EAFFFF00FF00FF00FF009ACDEEFF82C2
          EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFF82C2EAFFB1D9F2FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF82C2EAFFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D0E8F7FF82C2EAFFB1D9
          F2FFFFFFFFFFFFFFFFFFEFF7FCFF82C2EAFFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E7F4FBFF8AC6
          EBFF82C2EAFF82C2EAFF82C2EAFFB1D9F2FFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 2
      end
      object bSaveToFile: TBitBtn
        Left = 144
        Top = 6
        Width = 105
        Height = 25
        Action = ActionSaveToFile
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00D7CB
          BAFF9B6082FFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFFF00FF009D5D
          82FFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAC538EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFE5CADCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFE7CDDEFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFFDFCFDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFFDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB528DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFFDFCFDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
          B8FFB8B8B8FFB8B8B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFFDFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFE5CADCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFE7CEDEFFAB518DFFAB518DFFFF00FF00AA52
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
          8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFFF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 3
      end
      object BitBtn1: TBitBtn
        Left = 758
        Top = 6
        Width = 105
        Height = 25
        Action = ActionDemo
        Anchors = [akTop, akRight]
        Caption = #1044#1077#1084#1086
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00B7A2
          93FF694731FF694731FF694731FF694731FF694731FF694731FF694731FF6947
          31FF694731FF694731FF694731FF694731FFFF00FF00FF00FF00FF00FF00B7A2
          93FFEEE6E1FFB7A293FFB7A293FFB7A293FF840000FF840000FF840000FF8400
          00FF840000FF840000FF840000FF840000FF840000FF840000FFFF00FF00B7A2
          93FFF1EAE6FFEEE6E1FFEBE2DDFFE9DED8FF840000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000FFFF00FF00B7A2
          93FFF4EEEBFFF1EAE6FFEEE6E1FFEBE2DDFF840000FFFFFFFFFFFFFFFFFFDABF
          B0FF963900FFAB5050FFDDB8B8FFDDB8B8FFAB5050FF840000FFFF00FF00B7A2
          93FFF6F2F0FFF4EEEBFFF1EAE6FFEEE6E1FF840000FFDABFB0FF963900FF9933
          00FFFFFFFFFFF0E0E0FF972828FF992C2CFFF0E0E0FF840000FFFF00FF00B7A2
          93FFF9F6F5FFF6F2F0FFF4EEEBFFF1EAE6FF840000FF963900FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB05C5CFFB26060FFFFFFFFFF840000FFFF00FF00B7A2
          93FFFCFBFAFFF9F6F5FFF6F2F0FFF4EEEBFF840000FFDABFB0FF963900FF9639
          00FFFFFFFFFFEEDCDCFF992C2CFF992C2CFFF0E0E0FF840000FFFF00FF00B7A2
          93FFFFFFFFFFFCFBFAFFF9F6F5FFF6F2F0FF840000FFFFFFFFFFFFFFFFFFDABF
          B0FF963900FFA74848FFDDB8B8FFDDB8B8FFAB5050FF840000FFFF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFDFDFDFFFBF9F8FF840000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000FFFF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF840000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000FFFF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF840000FF840000FF840000FF8400
          00FF840000FF840000FF840000FF840000FF840000FF840000FFFF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBF9F8FFF8F4
          F3FFB7A293FF694731FF694731FF694731FFFF00FF00FF00FF00FF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBF9
          F8FFB7A293FFF3EBE6FFDBC9BFFF694731FFFF00FF00FF00FF00FF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFB7A293FFDBC9BFFF694731FFFF00FF00FF00FF00FF00FF00FF00FF00B7A2
          93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB7A293FF694731FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B7A2
          93FFB7A293FFB7A293FFB7A293FFB7A293FFB7A293FFB7A293FFB7A293FFB7A2
          93FFB7A293FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 4
      end
    end
    object Memo: TAdvMemo
      Left = 1
      Top = 113
      Width = 889
      Height = 484
      Cursor = crIBeam
      ActiveLineSettings.ShowActiveLine = False
      ActiveLineSettings.ShowActiveLineIndicator = False
      Align = alClient
      AutoCompletion.Font.Charset = DEFAULT_CHARSET
      AutoCompletion.Font.Color = clWindowText
      AutoCompletion.Font.Height = -11
      AutoCompletion.Font.Name = 'Tahoma'
      AutoCompletion.Font.Style = []
      AutoCompletion.StartToken = '(.'
      AutoCorrect.Active = True
      AutoHintParameterPosition = hpBelowCode
      BookmarkGlyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
        2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
        2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
        B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
        B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
        BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
        BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
        BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
        25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      BorderStyle = bsSingle
      ClipboardFormats = [cfText]
      CodeFolding.Enabled = False
      CodeFolding.LineColor = clGray
      Ctl3D = False
      DelErase = True
      EnhancedHomeKey = False
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -13
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.ShowModified = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'COURIER NEW'
      Font.Style = []
      HiddenCaret = False
      Lines.Strings = (
        '')
      MarkerList.UseDefaultMarkerImageIndex = False
      MarkerList.DefaultMarkerImageIndex = -1
      MarkerList.ImageTransparentColor = 33554432
      OleDropTarget = []
      PrintOptions.MarginLeft = 0
      PrintOptions.MarginRight = 0
      PrintOptions.MarginTop = 0
      PrintOptions.MarginBottom = 0
      PrintOptions.PageNr = False
      PrintOptions.PrintLineNumbers = False
      RightMargin = 91
      RightMarginColor = 14869218
      ScrollHint = False
      SelColor = clWhite
      SelBkColor = clNavy
      ShowRightMargin = True
      SmartTabs = False
      SyntaxStyles = XMLMemoStyler
      TabOrder = 2
      TabStop = True
      TrimTrailingSpaces = False
      UILanguage.ScrollHint = #1057#1090#1088#1086#1082#1072
      UILanguage.Undo = #1054#1090#1084#1077#1085#1080#1090#1100
      UILanguage.Redo = #1055#1086#1074#1090#1086#1088#1080#1090#1100
      UILanguage.Copy = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      UILanguage.Cut = #1042#1099#1088#1077#1079#1072#1090#1100
      UILanguage.Paste = #1042#1089#1090#1072#1074#1080#1090#1100
      UILanguage.Delete = #1059#1076#1072#1083#1080#1090#1100
      UILanguage.SelectAll = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      UrlStyle.TextColor = clBlue
      UrlStyle.BkColor = clWhite
      UrlStyle.Style = [fsUnderline]
      UseStyler = True
      Version = '3.6.6.0'
      WordWrap = wwNone
      OnChange = MemoChange
    end
  end
  object XMLMemoStyler: TAdvXMLMemoStyler
    LineComment = '//'
    MultiCommentLeft = '<!--'
    MultiCommentRight = '-->'
    CommentStyle.TextColor = clGreen
    CommentStyle.BkColor = clNone
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clNone
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'val'
          'encoding'
          'xml version'
          ']]'
          '![CDATA['
          '![IGNORE['
          '![INCLUDE['
          '!ELEMENT'
          '!DOCTYPE'
          'PCDATA'
          'REQUIRED'
          'IMPLIED'
          'FIXED'
          'ENTITY'
          'NMTOKEN'
          'NMTOKENS'
          'NOTATION'
          'ID'
          'IDREF'
          'IDREFS'
          'xml:space'
          'xml:lang')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'XML Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Single quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16711808
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' =<?/>#'#13#10
        Info = 'XML delimiters'
      end>
    Description = 'XML Files (XML)'
    Filter = 'XML Files (*.xml)|*.xml'
    DefaultExtension = '.xml'
    StylerName = 'XML Files'
    Extensions = 'xml'
    Left = 384
    Top = 219
  end
  object ActionList: TActionList
    Images = DataModuleImages.ImageList
    Left = 384
    Top = 163
    object ActionAppend: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      ImageIndex = 1
      OnExecute = ActionAppendExecute
    end
    object ActionDelete: TAction
      Caption = 'ActionDelete'
      ImageIndex = 2
      OnExecute = ActionDeleteExecute
    end
    object ActionReflesh: TAction
      Caption = 'ActionReflesh'
      ImageIndex = 5
      OnExecute = ActionRefleshExecute
    end
    object ActionOpenFile: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 19
      OnExecute = ActionOpenFileExecute
    end
    object ActionSaveToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 18
      OnExecute = ActionSaveToFileExecute
    end
    object ActionPost: TAction
      Caption = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 20
      OnExecute = ActionPostExecute
    end
    object ActionCancel: TAction
      Caption = #1054#1090#1082#1072#1090#1080#1090#1100
      Enabled = False
      ImageIndex = 21
      OnExecute = ActionCancelExecute
    end
    object ActionDemo: TAction
      Caption = #1044#1077#1084#1086
      OnExecute = ActionDemoExecute
    end
    object ActionExit: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 24
      OnExecute = ActionExitExecute
    end
  end
  object tMasterMODULE: TOraTable
    TableName = 'RAY.MODULE'
    MasterFields = 'MODULE_ID'
    DetailFields = 'MODULE_ID'
    Session = DataModuleRay.OraSession
    Filtered = True
    Filter = 'sign_activity = -1'
    Left = 55
    Top = 493
    object tMasterMODULEMODULE_ID: TFloatField
      FieldName = 'MODULE_ID'
      Required = True
    end
    object tMasterMODULESIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Size = 50
    end
    object tMasterMODULESIGNATURE_SHORT: TStringField
      FieldName = 'SIGNATURE_SHORT'
      Size = 50
    end
    object tMasterMODULEICO: TStringField
      FieldName = 'ICO'
      Size = 50
    end
    object tMasterMODULEXML_CONF: TOraXMLField
      FieldName = 'XML_CONF'
      DataType = 108
    end
    object tMasterMODULESIGN_ACTIVITY: TIntegerField
      FieldName = 'SIGN_ACTIVITY'
      Required = True
    end
  end
  object tREPOSITORY: TOraTable
    TableName = 'RAY.REPOSITORY'
    Session = DataModuleRay.OraSession
    Filtered = True
    Filter = 'module_id = 1'
    Options.TemporaryLobUpdate = True
    Left = 1128
    Top = 456
    object tREPOSITORYREPOSITORY_ID: TFloatField
      FieldName = 'REPOSITORY_ID'
      Required = True
    end
    object tREPOSITORYACTION_ID: TFloatField
      FieldName = 'ACTION_ID'
      Required = True
    end
    object tREPOSITORYSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Required = True
      Size = 100
    end
    object tREPOSITORYMODULE_ID: TFloatField
      FieldName = 'MODULE_ID'
      Required = True
    end
    object tREPOSITORYDESCRIBE: TStringField
      FieldName = 'DESCRIBE'
      Size = 100
    end
    object tREPOSITORYSIGN_ONE_COPY: TIntegerField
      DefaultExpression = '0'
      FieldName = 'SIGN_ONE_COPY'
      Required = True
    end
    object tREPOSITORYXML_CONF: TOraXMLField
      FieldName = 'XML_CONF'
      DataType = 108
    end
    object tREPOSITORYSIGN_ACTIVITY: TIntegerField
      DefaultExpression = '-1'
      FieldName = 'SIGN_ACTIVITY'
      Required = True
    end
    object tREPOSITORYPARAM: TStringField
      FieldName = 'PARAM'
      Size = 100
    end
  end
  object dsREPOSITORY: TOraDataSource
    AutoEdit = False
    DataSet = tREPOSITORY
    OnDataChange = dsREPOSITORYDataChange
    Left = 1128
    Top = 512
  end
  object dsMasterMODULE: TOraDataSource
    DataSet = tMasterMODULE
    Left = 55
    Top = 549
  end
  object qDetailREPOSITORY: TOraQuery
    KeyFields = 'repository_id'
    Session = DataModuleRay.OraSession
    SQL.Strings = (
      'SELECT r.repository_id,'
      '       r.module_id,'
      '       r.repository_id || '#39' '#39' || r.describe repository_val'
      '  FROM repository r'
      ' WHERE r.sign_activity = -1'
      ' ORDER BY r.module_id, r.repository_id ')
    MasterSource = dsMasterMODULE
    MasterFields = 'MODULE_ID'
    DetailFields = 'MODULE_ID'
    IndexFieldNames = 'REPOSITORY_ID'
    Left = 159
    Top = 492
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MODULE_ID'
        ParamType = ptInput
        Value = 1.000000000000000000
      end>
    object qDetailREPOSITORYREPOSITORY_ID: TFloatField
      FieldName = 'REPOSITORY_ID'
      Required = True
    end
    object qDetailREPOSITORYMODULE_ID: TFloatField
      FieldName = 'MODULE_ID'
      Required = True
    end
    object qDetailREPOSITORYREPOSITORY_VAL: TStringField
      FieldName = 'REPOSITORY_VAL'
      Size = 141
    end
  end
  object dsDetailREPOSITORY: TOraDataSource
    DataSet = qDetailREPOSITORY
    Left = 159
    Top = 549
  end
end
