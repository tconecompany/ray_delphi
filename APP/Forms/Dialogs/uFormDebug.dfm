object FormDebug: TFormDebug
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'FormDebug'
  ClientHeight = 522
  ClientWidth = 684
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000D6E8F1FF7EC8EDFF7EC8
    EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF0000
    0000B2B2B2FF7A7A7AFF727272FF727272FF929292FFE5EEF3FF7EC8EDFF7EC8
    EDFF7EC8EDFF7EC8EDFF505050FF7EC8EDFF7EC8EDFF7EC8EDFF85CAEDFFABAB
    ABFF727272FFB9B9B9FFDCDCDCFFDCDCDCFFA7A7A7FFD3D3D3FFB8DDF0FF7EC8
    EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFF7EC8EDFFB8DDF0FF7272
    72FFCACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6FFECF1F3FF85CA
    EDFF7EC8EDFF7EC8EDFF505050FF7EC8EDFF7EC8EDFF8CCDEDFF000000007272
    72FFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFFFFFFFFFFFFFFFFFEFEFEFFFC7E3
    F1FF7EC8EDFF7EC8EDFF505050FF7EC8EDFF7EC8EDFFC7E3F1FF000000007272
    72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF4F4
    F4FF9BD3EFFF7EC8EDFF505050FF7EC8EDFF9BD3EFFF00000000000000007272
    72FFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFF9F9
    F9FFDDEBF2FF7EC8EDFF505050FF7EC8EDFFD6E8F1FF00000000000000007272
    72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFF5F5F5FFB2DBF0FF7EC8EDFFB2DBF0FF0000000000000000000000007272
    72FFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFFFFFFFFF3255D6FF3255D6FF3255
    D6FFFDFDFDFFEBEBEBFF00000000000000000000000000000000000000007272
    72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF727272FF00000000000000000000000000000000000000007272
    72FFFFFFFFFFB3B3B3FFB3B3B3FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFF727272FF00000000000000000000000000000000000000007272
    72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF727272FF7272
    72FF727272FF7A7A7AFF00000000000000000000000000000000000000007272
    72FFFFFFFFFF3255D6FF3255D6FF3255D6FF3255D6FFFFFFFFFF727272FFFFFF
    FFFF7A7A7AFFDADADAFF00000000000000000000000000000000000000007272
    72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF727272FF7A7A
    7AFFDADADAFF0000000000000000000000000000000000000000000000007272
    72FF727272FF727272FF727272FF727272FF727272FF727272FF7A7A7AFFDADA
    DAFF000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FC00
    000080000000000000000001000000010000000300000003000000070000001F
    0000001F0000001F0000001F0000001F0000003F0000007F0000FFFF0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lMemoTitle: TLabel
    Left = 0
    Top = 24
    Width = 684
    Height = 20
    Align = alTop
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'lMemoTitle'
    ParentBiDiMode = False
    Layout = tlCenter
    ExplicitTop = 22
    ExplicitWidth = 750
  end
  object Memo: TMemo
    Left = 0
    Top = 44
    Width = 684
    Height = 478
    Align = alClient
    Color = 14745599
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 684
    Height = 24
    AutoSize = True
    ButtonWidth = 71
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Images = DataModuleImages.ImageList
    List = True
    AllowTextButtons = True
    TabOrder = 1
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Action = ActionClose
      Style = tbsTextButton
    end
    object ToolButton4: TToolButton
      Left = 75
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 0
      Action = ActionSaveToFile
    end
    object ToolButton1: TToolButton
      Left = 107
      Top = 0
      Action = ActionCopyClipboard
    end
  end
  object ActionList: TActionList
    Images = DataModuleImages.ImageList
    Left = 48
    Top = 88
    object ActionClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ImageIndex = 15
      OnExecute = ActionCloseExecute
    end
    object ActionSaveToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 18
      OnExecute = ActionSaveToFileExecute
    end
    object ActionCopyClipboard: TAction
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 12
      OnExecute = ActionCopyClipboardExecute
    end
  end
end
