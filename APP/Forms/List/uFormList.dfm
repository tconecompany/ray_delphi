object FormList: TFormList
  Left = 0
  Top = 0
  Caption = 'FormList'
  ClientHeight = 555
  ClientWidth = 810
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
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000727272FF727272FF727272FF727272FF727272FF727272FF7272
    72FF727272FF727272FF727272FF727272FF727272FF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000727272FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
    B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000727272FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
    B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000727272FFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFF
    FFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF727272FF000000000000
    000000000000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
    4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
    000000000000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
    4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
    000000000000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
    4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    0000FFFF0000C0010000C0010000C0010000C0010000C0010000C0010000C001
    0000C0010000C0010000C0010000C0010000C0010000FFFF0000FFFF0000}
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 49
    Width = 810
    Height = 506
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.EndEllipsis = True
    ColumnDefValues.Footer.ToolTips = True
    ColumnDefValues.Title.TitleButton = True
    ColumnDefValues.Title.ToolTips = True
    ColumnDefValues.ToolTips = True
    DataSource = dsMemTable
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = 16775408
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clBtnFace
    FooterParams.FillStyle = cfstSolidEh
    FooterParams.HorzLines = False
    FooterParams.VertLines = True
    GridLineParams.DataVertLines = True
    GridLineParams.HorzEmptySpaceStyle = deshExtendTitleWideSpaceEh
    HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh, nbRefreshEh]
    HorzScrollBar.ExtraPanel.Visible = True
    HorzScrollBar.Height = 21
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorParams.FillStyle = cfstSolidEh
    IndicatorParams.HorzLines = True
    IndicatorParams.RecNoShowStep = 10
    IndicatorParams.VertLines = True
    EmptyDataInfo.Active = True
    EmptyDataInfo.Font.Charset = DEFAULT_CHARSET
    EmptyDataInfo.Font.Color = 5329407
    EmptyDataInfo.Font.Height = -13
    EmptyDataInfo.Font.Name = 'Tahoma'
    EmptyDataInfo.Font.Style = []
    EmptyDataInfo.ParentFont = False
    EmptyDataInfo.Text = #1044#1072#1085#1085#1099#1077' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1099
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghFooter3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghIncSearch, dghDialogFind, dghShowRecNo, dghColumnResize, dghExtendVertLines]
    ParentShowHint = False
    PopupMenu = pmGrid
    SearchPanel.Enabled = True
    SearchPanel.Location = splExternal
    SearchPanel.PersistentShowing = False
    SearchPanel.ShortCut = 0
    SearchPanel.CellBeginsWithMode = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    SelectionDrawParams.DrawFocusFrame = True
    SelectionDrawParams.DrawFocusFrameStored = True
    ShowHint = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    TabOrder = 0
    TitleParams.FillStyle = cfstSolidEh
    TitleParams.HorzLines = True
    TitleParams.MultiTitle = True
    TitleParams.RowLines = 1
    TitleParams.SortMarkerStyle = smstThemeDefinedEh
    TitleParams.VertLines = True
    TitleParams.VTitleMargin = 6
    OnCellMouseClick = GridCellMouseClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pGridTitle: TPanel
    Left = 0
    Top = 28
    Width = 810
    Height = 21
    Align = alTop
    Alignment = taLeftJustify
    BevelEdges = [beTop]
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'GridTitle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    TabOrder = 1
  end
  object pGridTop: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 28
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object atbRight: TActionToolBar
      Left = 720
      Top = 0
      Width = 90
      Height = 28
      ActionManager = ActionManager
      Align = alRight
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
      VertMargin = 4
    end
    object atbLeft: TActionToolBar
      Left = 0
      Top = 0
      Width = 321
      Height = 28
      ActionManager = ActionManager
      Align = alNone
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
      VertMargin = 2
    end
    object dbeFilter: TDBEditEh
      Left = 318
      Top = 4
      Width = 265
      Height = 21
      DynProps = <>
      EditButtons = <
        item
          Glyph.Data = {
            C6010000424DC60100000000000036000000280000000A0000000A0000000100
            20000000000090010000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFD2D2D2FFD0D0D0FFF5F5F5FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBFF6D6D6DFF6D6D
            6DFFD3D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECE
            CEFF5D5D5DFF6C6C6CFFD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCCCCCCFF5F5F5FFF6E6E6EFFD5D5D5FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF4F4F4FFABABABFF4B4B4BFF505050FFB7B7B7FFF6F6
            F6FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFC5C5C5FF6E6E6EFF6B6B6BFF6565
            65FF767676FFCDCDCDFFFBFBFBFFFFFFFFFFFFFFFFFFD3D3D3FF7A7A7AFF4141
            41FF646464FF5E5E5EFF424242FF888888FFDDDDDDFFFFFFFFFFF0F0F0FF9F9F
            9FFF494949FF333333FF3B3B3BFF373737FF333333FF4E4E4EFFB0B0B0FFF0F0
            F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF}
          Style = ebsGlyphEh
          OnClick = dbeFilterEditButtons0Click
        end
        item
          Glyph.Data = {
            7A010000424D7A01000000000000360000002800000009000000090000000100
            20000000000044010000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFD6D6D6FF313131FFD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFD8D8D8FF3E3E3EFF363636FF303030FFD7D7D7FFFFFFFFFFFFFF
            FFFFFFFFFFFFD9D9D9FF4C4C4CFF454545FF3D3D3DFF363636FF303030FFD8D8
            D8FFFFFFFFFFE8E8E8FF595959FF515151FF4C4C4CFF454545FF3D3D3DFF3434
            34FF313131FFE8E8E8FFFFFFFFFFE9E9E9FFDADADAFF515151FF4C4C4CFF4444
            44FFDADADAFFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9FF595959FF5353
            53FF4B4B4BFFE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFF6161
            61FF5A5A5AFF525252FFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEB
            EBFF696969FF616161FF5A5A5AFFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEBEBEBFFEBEBEBFFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Style = ebsGlyphEh
          OnClick = dbeFilterEditButtons1Click
        end
        item
          Glyph.Data = {
            7A010000424D7A01000000000000360000002800000009000000090000000100
            20000000000044010000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFE7E7E7FF363636FF2E2E2EFF282828FFE7E7E7FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFE8E8E8FF3D3D3DFF363636FF2E2E2EFFE8E8E8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE8E8E8FF444444FF3D3D3DFF353535FFE8E8E8FFFFFF
            FFFFFFFFFFFFFFFFFFFFE8E8E8FFD9D9D9FF4B4B4BFF454545FF3D3D3DFFD9D9
            D9FFE8E8E8FFFFFFFFFFE9E9E9FF616161FF5A5A5AFF535353FF4C4C4CFF4545
            45FF3D3D3DFF373737FFE9E9E9FFFFFFFFFFDADADAFF616161FF5A5A5AFF5353
            53FF4C4C4CFF454545FFDADADAFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDBFF6161
            61FF5A5A5AFF535353FFDBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFDCDCDCFF616161FFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          Style = ebsGlyphEh
          OnClick = dbeFilterEditButtons2Click
        end
        item
          DefaultAction = False
          Glyph.Data = {
            7A010000424D7A01000000000000360000002800000009000000090000000100
            20000000000044010000C40E0000C40E00000000000000000000EEEEEEFFC8C8
            C8FFEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFC8C8C8FFEEEEEEFFC8C8
            C8FF353535FF9D9D9DFFEEEEEEFFFFFFFFFFEEEEEEFF9D9D9DFF353535FFC8C8
            C8FFEFEFEFFF9D9D9DFF313131FF9D9D9DFFE6E6E6FF9D9D9DFF313131FF9D9D
            9DFFEFEFEFFFFFFFFFFFF0F0F0FF9E9E9EFF313131FF787878FF313131FF9E9E
            9EFFF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FF787878FF292929FF7878
            78FFE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FF9F9F9FFF323232FF7979
            79FF323232FF9F9F9FFFF1F1F1FFFFFFFFFFF1F1F1FF9F9F9FFF323232FF9F9F
            9FFFE7E7E7FF9F9F9FFF323232FF9F9F9FFFF1F1F1FFCBCBCBFF363636FF9F9F
            9FFFF2F2F2FFF9F9F9FFF2F2F2FF9F9F9FFF363636FFCBCBCBFFF3F3F3FFCCCC
            CCFFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFCCCCCCFFF3F3F3FF}
          Hint = 'Delete|Erases the selection'
          ShortCut = 46
          Style = ebsGlyphEh
          OnClick = dbeFilterEditButtons3Click
        end>
      EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1080#1089#1082#1086#1084#1099#1081' '#1090#1077#1082#1089#1090'...'
      MRUList.Active = True
      MRUList.Limit = 10
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnChange = dbeFilterChange
      OnEnter = dbeFilterEnter
      OnExit = dbeFilterExit
    end
  end
  object Query: TOraQuery
    SequenceMode = smInsert
    Session = OraSession
    FetchAll = True
    Options.AutoClose = True
    AutoCalcFields = False
    AfterOpen = QueryAfterOpen
    Left = 551
    Top = 456
  end
  object PrintDBGridEh: TPrintDBGridEh
    DBGridEh = Grid
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 40
    Top = 136
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1072' '#1074#1084#1077#1097#1072#1077#1090' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' '#1080' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077
              end
              item
                Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1072' '#1074#1084#1077#1097#1072#1077#1090' '#1079#1072#1075#1086#1083#1086#1074#1086#1082
              end
              item
                Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1072' '#1074#1084#1077#1097#1072#1077#1090' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077
              end
              item
                Caption = '-'
              end
              item
                Caption = #1064#1080#1088#1080#1085#1072' '#1089#1090#1086#1083#1073#1094#1072' '#1087#1086' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080
                Default = True
              end>
            Action = ActionGridWidth
            Caption = '&ActionGridWidth'
            ImageIndex = 0
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ActionRecNew
            ImageIndex = 1
            ShowCaption = False
          end
          item
            Action = ActionRecDelete
            ImageIndex = 2
            ShowCaption = False
          end
          item
            Action = ActionRecPost
            Caption = 'Act&ionRecPost'
            ImageIndex = 3
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ActionFetchAll
            Caption = 'Ac&tionFetchAll'
            ImageIndex = 4
            ShowCaption = False
          end
          item
            Action = ActionRefresh
            Caption = 'Actio&nRefresh'
            ImageIndex = 5
            ShowCaption = False
          end
          item
            Action = ActionFormPick
            Caption = 'Action&FormPick'
            ImageIndex = 6
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ActionExpExcel
            Caption = 'A&ctionExpExcel'
            ImageIndex = 8
            ShowCaption = False
          end
          item
            Action = ActionExp
            ImageIndex = 7
          end
          item
            Caption = '-'
          end
          item
            Action = ActionSetFilter
            Caption = 'ActionSetFi&lter'
            ImageIndex = 9
            ShowCaption = False
          end>
        ActionBar = atbLeft
      end
      item
        Items = <
          item
            Items = <
              item
                Action = ActionDebug
                ImageIndex = 10
                ShortCut = 123
              end>
            Action = ActionActions
          end>
        ActionBar = atbRight
      end>
    Images = DataModuleImages.ImageList
    Left = 40
    Top = 80
    StyleName = 'Platform Default'
    object ActionGridWidth: TAction
      Caption = 'ActionGridWidth'
      Enabled = False
      Hint = #1047#1072#1076#1072#1090#1100' '#1096#1080#1088#1080#1085#1091' '#1089#1090#1086#1083#1073#1094#1086#1074
      ImageIndex = 0
      OnExecute = ActionGridWidthExecute
    end
    object ActionRecNew: TAction
      Enabled = False
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 1
      OnExecute = ActionRecNewExecute
    end
    object ActionRecDelete: TAction
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 2
      OnExecute = ActionRecDeleteExecute
    end
    object ActionRecPost: TAction
      Caption = 'ActionRecPost'
      Hint = #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1041#1044
      ImageIndex = 3
      OnExecute = ActionRecPostExecute
    end
    object ActionFetchAll: TAction
      Caption = 'ActionFetchAll'
      Enabled = False
      ImageIndex = 4
      OnExecute = ActionFetchAllExecute
    end
    object ActionRefresh: TAction
      Caption = 'ActionRefresh'
      Enabled = False
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 5
      OnExecute = ActionRefreshExecute
    end
    object ActionFormPick: TAction
      Caption = 'ActionFormPick'
      Enabled = False
      Hint = #1054#1090#1073#1086#1088
      ImageIndex = 6
      OnExecute = ActionFormPickExecute
    end
    object ActionExpExcel: TAction
      Caption = 'ActionExpExcel'
      ImageIndex = 8
      OnExecute = ActionExpExcelExecute
    end
    object ActionExp: TAction
      Enabled = False
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1079#1072#1087#1088#1086#1089#1072'...'
      ImageIndex = 7
      OnExecute = ActionExpExecute
    end
    object ActionSetFilter: TAction
      AutoCheck = True
      Caption = 'ActionSetFilter'
      Enabled = False
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1086#1090#1073#1086#1088#1072
      ImageIndex = 9
      OnExecute = ActionSetFilterExecute
    end
    object ActionRecReading: TAction
      Caption = 'ActionRecReading'
      OnExecute = ActionRecReadingExecute
    end
    object ActionActions: TAction
      Caption = #1042#1089#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
      OnExecute = ActionActionsExecute
    end
    object ActionDebug: TAction
      Caption = #1054#1090#1083#1072#1076#1086#1095#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 10
      ShortCut = 123
      OnExecute = ActionDebugExecute
    end
    object ActionPopupSelectRow: TAction
      Category = 'PopupGrid'
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnExecute = ActionPopupSelectRowExecute
    end
    object ActionPopupFreeSelection: TAction
      Category = 'PopupGrid'
      Caption = #1057#1074#1086#1073#1086#1076#1085#1086#1077' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      OnExecute = ActionPopupFreeSelectionExecute
    end
    object ActionPopupSelectEverything: TAction
      Category = 'PopupGrid'
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 11
      OnExecute = ActionPopupSelectEverythingExecute
    end
    object ActionPopupCopy: TAction
      Category = 'PopupGrid'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 12
      OnExecute = ActionPopupCopyExecute
    end
    object ActionPopupExpToExcel: TAction
      Category = 'PopupExp'
      Caption = #1060#1072#1081#1083' Excel'
      Enabled = False
      OnExecute = ActionPopupExpToExcelExecute
    end
    object ActionExpToRTF: TAction
      Category = 'PopupExp'
      Caption = 'RTF '#1092#1072#1081#1083
      OnExecute = ActionExpToRTFExecute
    end
    object ActionPopupExpToCSV: TAction
      Category = 'PopupExp'
      Caption = 'CSV '#1092#1072#1081#1083
      Enabled = False
      OnExecute = ActionPopupExpToCSVExecute
    end
    object ActionPopupExpToHTML: TAction
      Category = 'PopupExp'
      Caption = 'HTML '#1092#1072#1081#1083
      Enabled = False
      OnExecute = ActionPopupExpToHTMLExecute
    end
    object ActionPopupExpToXML: TAction
      Category = 'PopupExp'
      Caption = 'XML '#1092#1072#1081#1083
      Enabled = False
    end
    object ActionPopupCopyInExcel: TAction
      Category = 'PopupGrid'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' Excel... '
      OnExecute = ActionPopupCopyInExcelExecute
    end
    object ActionExpandNodes: TAction
      Category = 'PopupGrid'
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      Enabled = False
      ImageIndex = 13
      OnExecute = ActionExpandNodesExecute
    end
    object ActionСollapseNodes: TAction
      Category = 'PopupGrid'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1091#1079#1083#1099
      Enabled = False
      ImageIndex = 14
      OnExecute = ActionСollapseNodesExecute
    end
  end
  object OraSession: TOraSession
    Options.Direct = True
    Username = 'tre'
    Server = '192.168.1.2:1521'
    Left = 491
    Top = 457
    EncryptedPassword = '8BFF8DFF9AFF'
  end
  object pmGrid: TPopupMenu
    Images = DataModuleImages.ImageList
    Left = 104
    Top = 80
    object miSelectRow: TMenuItem
      Action = ActionPopupSelectRow
    end
    object miFreeSelection: TMenuItem
      Action = ActionPopupFreeSelection
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miSelectEverything: TMenuItem
      Action = ActionPopupSelectEverything
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miCopy: TMenuItem
      Action = ActionPopupCopy
    end
    object miCopyInExcel: TMenuItem
      Action = ActionPopupCopyInExcel
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miExpandNodes: TMenuItem
      Action = ActionExpandNodes
    end
    object miСollapseNodes: TMenuItem
      Action = ActionСollapseNodes
    end
  end
  object pmExp: TPopupMenu
    Left = 160
    Top = 80
    object miExpToExcel: TMenuItem
      Action = ActionPopupExpToExcel
    end
    object miExpToRTF: TMenuItem
      Action = ActionExpToRTF
    end
    object miExpToCSV: TMenuItem
      Action = ActionPopupExpToCSV
    end
    object miExpToHTML: TMenuItem
      Action = ActionPopupExpToHTML
    end
    object miExpToXML: TMenuItem
      Action = ActionPopupExpToXML
    end
  end
  object MemTable: TMemTableEh
    Filtered = True
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataSetDriver
    AfterOpen = MemTableAfterOpen
    Left = 680
    Top = 456
  end
  object dsMemTable: TDataSource
    DataSet = MemTable
    OnStateChange = dsMemTableStateChange
    Left = 747
    Top = 456
  end
  object DataSetDriver: TDataSetDriverEh
    ProviderDataSet = Query
    Left = 613
    Top = 456
  end
end
