object FormTradeInvoice: TFormTradeInvoice
  Left = 0
  Top = 0
  Width = 995
  Height = 817
  AutoScroll = True
  Caption = #1057#1095#1077#1090' '#1092#1072#1082#1090#1091#1088#1072
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
  inline Frame: TFrameTradeDoc
    Left = 0
    Top = 0
    Width = 979
    Height = 778
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 979
    ExplicitHeight = 779
    inherited lBlockDoc: TLabel
      Top = 761
      ExplicitTop = 761
    end
    inherited FrameTitle: TFrameTitle
      Width = 979
      ExplicitWidth = 979
      inherited atbMain: TActionToolBar
        ActionManager = ActionManager
      end
      inherited atbRight: TActionToolBar
        ActionManager = ActionManager
      end
    end
    inherited fDateDoc: TDBDateTimeEditEh
      OnChange = FramefDateDocChange
    end
    inherited fFirm: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fDepartament: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fSender: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fRecipient: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fPrice: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fCountDayReserve: TDBNumberEditEh
      OnChange = FramefDateDocChange
    end
    inherited fEvent: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited fDealType: TDBComboBoxEh
      OnChange = FramefDateDocChange
    end
    inherited PageControl: TPageControl
      Height = 363
      ExplicitHeight = 363
      inherited tsGoods: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 948
        ExplicitHeight = 335
        inherited Grid: TDBGridEh
          Height = 306
        end
        inherited pGridTop: TPanel
          inherited atbGridRight: TActionToolBar
            Left = 868
            Width = 79
            ActionManager = ActionManager
            ExplicitLeft = 868
            ExplicitWidth = 79
          end
          inherited atbGrid: TActionToolBar
            Width = 867
            ActionManager = ActionManager
            ExplicitWidth = 867
          end
        end
      end
      inherited TabSheet1: TTabSheet
        Enabled = False
        TabVisible = False
      end
    end
    inherited fComm: TDBMemoEh
      EditButtons = <
        item
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
          ShortCut = 0
          Style = ebsGlyphEh
        end
        item
          Style = ebsEllipsisEh
        end>
      OnChange = FramefDateDocChange
    end
    inherited GridSummary: TDBGridEh
      Top = 712
    end
    inherited FrameCUUser: TFrameCUUser
      Top = 712
      ExplicitTop = 712
    end
    inherited fSignPriceViewBlock: TDBCheckBoxEh
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    inherited fSignDocBlock: TDBCheckBoxEh
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    inherited dsDOC: TOraDataSource
      OnDataChange = FramedsDOCDataChange
    end
    inherited ActionList: TActionList
      inherited ActionSave: TAction
        OnExecute = FrameActionSaveExecute
      end
      inherited ActionPrint: TAction
        OnExecute = FrameActionPrintExecute
      end
      inherited ActionClose: TAction
        OnExecute = FrameActionCloseExecute
      end
    end
    inherited OraSession: TOraSession
      EncryptedPassword = '8BFF8DFF'
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = Frame.ActionSave
            ImageIndex = 1
          end
          item
            Caption = '-'
          end
          item
            Action = Frame.ActionDiscount
          end
          item
            Caption = '-'
          end
          item
            Action = Frame.ActionPrint
            ImageIndex = 2
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = Frame.ActionClose
            ImageIndex = 3
          end>
        ActionBar = Frame.FrameTitle.atbMain
      end
      item
        Items = <
          item
            Action = Frame.ActionAllActions
          end
          item
            Caption = '-'
          end
          item
            Action = Frame.ActionHelp
            ImageIndex = 4
            ShowCaption = False
          end>
        ActionBar = Frame.FrameTitle.atbRight
      end
      item
        ActionBar = Frame.atbGrid
      end
      item
        ActionBar = Frame.atbGridRight
      end>
    LinkedActionLists = <
      item
        ActionList = Frame.ActionList
        Caption = 'ActionList'
      end>
    Images = Frame.ImageList
    Left = 193
    Top = 1
    StyleName = 'Platform Default'
  end
end
