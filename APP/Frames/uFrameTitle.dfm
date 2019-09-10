object FrameTitle: TFrameTitle
  Left = 0
  Top = 0
  Width = 981
  Height = 72
  TabOrder = 0
  object lTitle: TLabel
    Left = 12
    Top = 12
    Width = 80
    Height = 19
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bButton: TBitBtn
    Left = 12
    Top = 40
    Width = 100
    Height = 25
    Caption = #1050#1085#1086#1087#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object atbMain: TActionToolBar
    Left = 120
    Top = 40
    Width = 653
    Height = 25
    Align = alNone
    Caption = 'atbMain'
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
  object atbRight: TActionToolBar
    Left = 839
    Top = 40
    Width = 129
    Height = 25
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
  object ActionList: TActionList
    Images = DataModuleImages.ImageList
    Left = 834
    Top = 9
    object ActionRecPost: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      ImageIndex = 18
    end
    object ActionRecEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      ImageIndex = 16
    end
    object ActionRecCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Enabled = False
      ImageIndex = 17
    end
  end
end
