object FormUserSettings: TFormUserSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 292
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    495
    292)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 220
    Width = 262
    Height = 13
    Caption = #1089#1086#1079#1076#1072#1090#1100' '#1103#1088#1083#1099#1082' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1079#1072#1087#1091#1089#1082#1072' '#1085#1072' '#1088#1072#1073#1086#1095#1077#1084' '#1089#1090#1086#1083#1077
  end
  object sbCreateShortCut: TSpeedButton
    Left = 8
    Top = 216
    Width = 23
    Height = 22
    Anchors = [akTop, akRight]
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000479DB8410000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000489AB98B499BBB3800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000499AB9494A9DBBE84A9FBF18000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004D99B30A499BBBFB4D9FBECD3399CC050000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000050A1BFC34D9FBDFD4D9EBDA60000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A9CBA6F65B5D0F853A4C2F44A9C
      BA67000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004B9EBC224EA0BEF596E2F5FF4DA0
      BDF44A9CB93E0000000000000000000000000000000000000000000000000000
      0000000000004A9DBBD7489BBAFF489BBAFF489BBAFF489BBAFF92DEF2FF8AD8
      ECFF4C9FBDEF469EB91D00000000000000000000000000000000000000000000
      0000000000004B9DBC826EBFD7FAA3EEFFFFA3EEFFFFA3EEFFFFA3EEFFFFA3EE
      FFFF78C7DEF94CA0BDD3409FBF08000000000000000000000000000000000000
      0000000000004699B9284EA1C0F5A2EEFFFFA3EEFFFF82D1E7FF489BBAFF489B
      BAFF489BBAFF489BBAFF489CBA9F000000000000000000000000000000000000
      000000000000000000004EA0BEE290DCF0FFA3EEFFFFA1ECFEFF51A4C1F3489B
      BB40000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B9EBB8470BFD8FAA3EEFFFFA3EEFFFF82CFE6FE4D9F
      BDCA000000000000000000000000000000000000000000000000000000000000
      00000000000000000000479AB82B4FA2BFF4A2EEFFFFA3EEFFFFA1ECFEFF51A4
      C1F3489BBB400000000000000000000000000000000000000000000000000000
      00000000000000000000000000004EA0BEE290DCF0FFA3EEFFFFA3EEFFFF82CF
      E6FE4D9FBDCA0000000000000000000000000000000000000000000000000000
      00000000000000000000000000004B9DBC826EBFD7FAA3EEFFFFA3EEFFFFA2ED
      FEFF52A4C2F2479ABC4400000000000000000000000000000000000000000000
      00000000000000000000000000004699B928489BBAFF489BBAFF489BBAFF489B
      BAFF489BBAFF499CBBC600000000000000000000000000000000}
    OnClick = sbCreateShortCutClick
  end
  object lLogical: TLabel
    Left = 8
    Top = 57
    Width = 59
    Height = 13
    Caption = #1051#1086#1075#1080#1095#1077#1089#1082#1080#1077
  end
  object Panel: TPanel
    Left = 0
    Top = 251
    Width = 495
    Height = 41
    Align = alBottom
    TabOrder = 2
    object lQntSession: TLabel
      Left = 368
      Top = 4
      Width = 119
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1077#1089#1089#1080#1081': 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object bCancel: TButton
      Left = 114
      Top = 8
      Width = 75
      Height = 24
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 8
      TabOrder = 0
    end
    object bOK: TButton
      Left = 31
      Top = 8
      Width = 75
      Height = 24
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = bOKClick
    end
  end
  object eWorkFolder: TDBEditEh
    Left = 8
    Top = 30
    Width = 479
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ControlLabel.Width = 75
    ControlLabel.Height = 13
    ControlLabel.Caption = #1056#1072#1073#1086#1095#1072#1103' '#1087#1072#1087#1082#1072
    ControlLabel.Visible = True
    DynProps = <>
    EditButtons = <
      item
        DefaultAction = False
        Glyph.Data = {
          EE010000424DEE0100000000000036000000280000000B0000000A0000000100
          200000000000B8010000C40E0000C40E000000000000000000004B83A0FF5691
          B1FF5894B3FF5894B3FF5894B3FF5894B3FF5894B3FF5894B3FF5894B3FF518B
          A8FB447C98645691B1FF7CC3E8FF83CCF3FF83CCF3FF83CCF3FF83CCF3FF83CC
          F3FF83CCF3FF83CCF3FF6FB2D4FC4C83A27C528BAAFF7ABFE4FF85CEF5FF85CE
          F5FF85CEF5FF85CEF5FF85CEF5FF85CEF5FF85CEF5FF74B9DCFC4E8BA8964D85
          A3FF75B9DEFF85CEF5FF85CEF5FF85CEF5FF85CEF5FF85CEF5FF85CEF5FF85CE
          F5FF77BEE2FD5390AFB448809CFF6BADD0FF7DC3E9FF7DC4E9FF7EC6ECFF83CC
          F2FF85CEF5FF85CEF5FF85CEF5FF7CC1E7FE5794B3D548809EFF5391B3FF5695
          B7FF5695B7FF5B9ABCFF6BADCFFF71B4D8FF71B4D8FF71B4D8FF6DAFD2FF4F8A
          ABED4F8CACFF63AED8FF64AFD9FF64AED9FF61A9D2FF5A9EC4FF589BBFFF589B
          BFFF589BBFFF4F8EB0FD437B979B4F8CADFF64AFDAFF65B0DBFF64AFD9FF5FA6
          CEFE5EA5CDFF5EA5CDFF5EA5CDFF5EA5CDFF5494B6FB457C97544F8CACFF63AE
          D8FF64AED9FF5AA0C7F74D87A7C046809D9547809D9347809D9347809D93467D
          9A90457A9A3047809DFF4E8AABFF4E8AABFF4983A1C2467F97365555AA030000
          000100000001000000010000000100000000}
        Style = ebsGlyphEh
        OnClick = eWorkFolderEditButtons0Click
      end>
    TabOrder = 0
    Visible = True
  end
  object clbLogical: TCheckListBox
    Left = 8
    Top = 73
    Width = 479
    Height = 137
    ItemHeight = 13
    Items.Strings = (
      #1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1072#1082#1077#1090' '#1086#1082#1086#1085' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
      #1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1084#1072#1082#1077#1090' '#1086#1082#1086#1085' '#1087#1088#1080' '#1074#1093#1086#1076#1077
      #1088#1077#1079#1077#1088#1074
      #1088#1077#1079#1077#1088#1074
      #1088#1077#1079#1077#1088#1074
      #1088#1077#1079#1077#1088#1074)
    TabOrder = 1
  end
  object FolderDialog: TFolderDialog
    Caption = #1042#1099#1073#1086#1088' '#1087#1072#1087#1082#1080
    Title = #1055#1091#1090#1100' '#1082' '#1088#1072#1073#1086#1095#1077#1081' '#1087#1072#1087#1082#1077
    Options = [fdoNewDialogStyle]
    DialogPosition = fdpParentFormCenter
    DialogX = 0
    DialogY = 0
    Version = '1.1.4.0'
    Left = 432
    Top = 88
  end
end