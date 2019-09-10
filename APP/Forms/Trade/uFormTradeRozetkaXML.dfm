object FormTradeRozetkaXML: TFormTradeRozetkaXML
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' XML '#1076#1083#1103' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1087#1083#1086#1097#1072#1076#1082#1080' '#1056#1054#1047#1045#1058#1050#1040
  ClientHeight = 707
  ClientWidth = 1098
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1098
    707)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 33
    Width = 186
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1088#1072#1079#1084#1077#1097#1077#1085#1080#1103' '#1056#1086#1079#1077#1090#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 204
    Width = 350
    Height = 13
    Caption = #1041#1099#1089#1090#1088#1072#1103' '#1087#1088#1072#1074#1082#1072' '#1086#1087#1080#1089#1072#1085#1080#1081' '#1072#1088#1090#1080#1082#1091#1083#1086#1074'. '#1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1077#1082#1074#1077#1079#1080#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object hlGridFind: THTMLabel
    Left = 948
    Top = 669
    Width = 140
    Height = 19
    AutoSizeType = asBoth
    HTMLText.Strings = (
      '<A href="a1">'#1044#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1085#1072#1078#1084#1080#1090#1077' Ctrl+F</A>')
    Transparent = True
    URLColor = clHotLight
    OnAnchorClick = hlGridFindAnchorClick
    Version = '2.2.1.2'
  end
  object hlCheckWebImage: THTMLabel
    Left = 8
    Top = 669
    Width = 753
    Height = 19
    AutoSizing = True
    Enabled = False
    HTMLText.Strings = (
      'hlCheckWebImage')
    Transparent = True
    URLColor = clHotLight
    OnAnchorClick = hlCheckWebImageAnchorClick
    Version = '2.2.1.2'
  end
  object Grid1: TDBGridEh
    Left = 8
    Top = 50
    Width = 625
    Height = 150
    ColumnDefValues.Title.Alignment = taCenter
    Ctl3D = False
    DataSource = dsROZETKA_XML_CATEGORY
    DynProps = <>
    Flat = True
    HorzScrollBar.ExtraPanel.Visible = True
    IndicatorParams.FillStyle = cfstSolidEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghColumnResize, dghExtendVertLines]
    ParentCtl3D = False
    TabOrder = 0
    TitleParams.FillStyle = cfstSolidEh
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1089' '#1089#1072#1081#1090#1072
        Width = 209
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'GROUP_ID_SEP'
        Footers = <>
        Title.Caption = #1050#1086#1076#1099' '#1075#1088#1091#1087' ('#1095#1077#1088#1077#1079' '#1082#1086#1084#1091')'
        Width = 319
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Grid2: TDBGridEh
    Left = 8
    Top = 221
    Width = 1080
    Height = 442
    Anchors = [akLeft, akTop, akBottom]
    ColumnDefValues.Title.Alignment = taCenter
    ColumnDefValues.Title.TitleButton = True
    Ctl3D = False
    DataSource = dsROZETKA_XML_DESC
    DrawMemoText = True
    DynProps = <>
    Flat = True
    HorzScrollBar.ExtraPanel.Visible = True
    IndicatorParams.FillStyle = cfstSolidEh
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghExtendVertLines]
    ParentCtl3D = False
    RowHeight = 52
    RowSizingAllowed = True
    TabOrder = 1
    TitleParams.FillStyle = cfstSolidEh
    TitleParams.RowLines = 2
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VENDOR_CODE'
        Footers = <>
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 50
      end
      item
        AlwaysShowEditButton = True
        CellButtons = <>
        DynProps = <>
        EditButtons = <
          item
            Style = ebsEllipsisEh
          end>
        FieldName = 'FEATURE_DESC_NEW'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Width = 830
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'QNT'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1072#1093
        Width = 68
        WordWrap = True
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHECKED'
        Footers = <>
        Title.Caption = #1055#1088#1086#1074#1077#1088#1077#1085#1086
        Width = 74
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 688
    Width = 1098
    Height = 19
    Panels = <
      item
        Text = #1092#1072#1081#1083' '#1085#1077' '#1074#1099#1073#1088#1072#1085
        Width = 50
      end>
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 1098
    Height = 26
    ActionManager = ActionManager
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
  object dsROZETKA_XML_CATEGORY: TOraDataSource
    DataSet = tROZETKA_XML_CATEGORY
    Left = 437
    Top = 129
  end
  object tROZETKA_XML_CATEGORY: TOraTable
    TableName = 'TRADE.ROZETKA_XML_CATEGORY'
    OrderFields = 'ID'
    FetchAll = True
    Left = 435
    Top = 81
    object tROZETKA_XML_CATEGORYID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object tROZETKA_XML_CATEGORYNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tROZETKA_XML_CATEGORYGROUP_ID_SEP: TStringField
      FieldName = 'GROUP_ID_SEP'
      Size = 50
    end
  end
  object dsROZETKA_XML_DESC: TOraDataSource
    DataSet = tROZETKA_XML_DESC
    Left = 985
    Top = 567
  end
  object tROZETKA_XML_DESC: TOraTable
    TableName = 'TRADE.ROZETKA_XML_DESC'
    OrderFields = 'VENDOR_CODE'
    Filtered = True
    Left = 982
    Top = 517
    object tROZETKA_XML_DESCVENDOR_CODE: TFloatField
      FieldName = 'VENDOR_CODE'
      Required = True
    end
    object tROZETKA_XML_DESCFEATURE_DESC_NEW: TMemoField
      FieldName = 'FEATURE_DESC_NEW'
      BlobType = ftOraClob
    end
    object tROZETKA_XML_DESCCHECKED: TFloatField
      FieldName = 'CHECKED'
      Required = True
    end
    object tROZETKA_XML_DESCQNT: TFloatField
      FieldName = 'QNT'
      Required = True
    end
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 744
    Top = 48
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActionClose
            ImageIndex = 15
          end
          item
            Caption = '-'
          end
          item
            Action = ActionOpen
            ImageIndex = 19
          end
          item
            Caption = '-'
          end
          item
            Action = ActionExec
            ImageIndex = 22
          end>
        ActionBar = ActionToolBar1
      end>
    Images = DataModuleImages.ImageList
    Left = 672
    Top = 49
    StyleName = 'Platform Default'
    object ActionClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 15
      OnExecute = ActionCloseExecute
    end
    object ActionOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 19
      OnExecute = ActionOpenExecute
    end
    object ActionExec: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      ImageIndex = 22
      OnExecute = ActionExecExecute
    end
  end
end
