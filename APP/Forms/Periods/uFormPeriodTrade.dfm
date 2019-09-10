object FormPeriodTrade: TFormPeriodTrade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 121
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000680400001600000028000000100000002000
    0000010020000000000040040000000000000000000000000000000000000000
    00009C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
    78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF0000
    00009C8B78FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EB
    E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF9C8B78FF0000
    00009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
    00009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
    00009C8B78FFFFFFFFFFFFFFFFFFDED4C5FFFFFFFFFFDED4C5FFFFFFFFFFDED4
    C5FFFFFFFFFFDED4C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
    00009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
    00009C8B78FFFFFFFFFFFFFFFFFFDED4C5FFFFFFFFFFDED4C5FFFFFFFFFFDED4
    C5FFFFFFFFFFDED4C5FFFFFFFFFFDED4C5FFFFFFFFFFFFFFFFFF9C8B78FF0000
    00009D8B76FFDABCA6FFBF8D67FFB67B4FFFBF8D67FFDABDA7FFFCFAF8FFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FFB974
    460BB3825CFFCA9F7FFFEFE2D9FFFDFBF9FFEFE2D8FFC79C7BFFC59673FFDCD0
    BFFFFFFFFFFFDED4C5FFFFFFFFFFDED4C5FFFFFFFFFFFFFFFFFF9C8B78FFB77F
    5587C79C7BFFFFFEFEFFFFFFFFFFFFFFFFFFE3E1DFFFFFFEFEFFC99E7EFFDABC
    A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FFB981
    58E9EFE3DAFFFFFFFFFFFFFFFFFFBDB8B4FF63584FFFF8F8F7FFEEE1D7FFBF8C
    66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FFB67B
    50FCFBF8F6FFFFFFFFFFF8F7F6FF4E4037FFCBC8C4FFFFFFFFFFFBF8F5FFB47B
    52FF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FFB981
    58E9EFE3DAFFFFFFFFFFFFFFFFFF877E77FFB8B3AFFFFFFFFFFFEEE1D7FFB582
    65FF8F8FF7FF8F8FF7FF8F8FF7FF8F8FF7FF8F8FF7FF8F8FF7FF4343C7FFB77E
    5486C2987DFFFFFEFEFFFFFFFFFFD0CDCAFF7B716AFFFFFEFEFFC1967CFF7F61
    8BFF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FF4343C7FFB974
    460BB88056D3C79A79F3EEE0D5FFF7F2EEFFE7D9CEFFC79B7AF8B98056D3B974
    460B000000000000000000000000000000000000000000000000000000000000
    0000B3804D0AB87E5384B98258E8B77E54F6B98258E8B8805584B3804D0A0000
    0000000000000000000000000000000000000000000000000000000000008000
    0000800000008000000080000000800000008000000080000000800000000000
    00000000000000000000000000000000000000000000007F000080FF0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lBegin: TLabel
    Left = 14
    Top = 73
    Width = 41
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086':'
  end
  object Label4: TLabel
    Left = 182
    Top = 73
    Width = 16
    Height = 13
    Caption = #1087#1086':'
  end
  object bOK: TButton
    Left = 323
    Top = 68
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    OnClick = bOKClick
  end
  object dtpDateBeg: TDateTimePicker
    Left = 78
    Top = 69
    Width = 100
    Height = 21
    Date = 43566.000000000000000000
    Time = 0.874343240742746300
    TabOrder = 0
    OnChange = dtpDateBegChange
  end
  object dtpDateEnd: TDateTimePicker
    Left = 202
    Top = 69
    Width = 100
    Height = 21
    Date = 43566.000000000000000000
    Time = 0.874483171297470100
    TabOrder = 1
    OnChange = dtpDateBegChange
  end
  object cbPeriodChecked: TCheckBox
    Left = 308
    Top = 98
    Width = 90
    Height = 17
    Alignment = taLeftJustify
    Caption = #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 3
  end
  object eStorage: TDBEditEh
    Left = 78
    Top = 14
    Width = 320
    Height = 21
    Color = clBtnFace
    ControlLabel.Width = 61
    ControlLabel.Height = 13
    ControlLabel.Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077':'
    ControlLabel.Visible = True
    ControlLabelLocation.Position = lpLeftTextBaselineEh
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    EmptyDataInfo.Text = #1053#1077' '#1074#1099#1073#1088#1072#1085#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Visible = True
  end
  object ccbPeriod: TColumnComboBox
    Left = 78
    Top = 42
    Width = 140
    Height = 21
    Color = clWindow
    Version = '1.7.0.0'
    Visible = True
    Columns = <
      item
        Color = clWindow
        ColumnType = ctText
        Width = 140
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      item
        Color = clWindow
        ColumnType = ctText
        Width = 80
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      item
        Color = clWindow
        ColumnType = ctText
        Width = 80
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end>
    ComboItems = <
      item
        ImageIndex = -1
        Strings.Strings = (
          #1058#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1076#1077#1085#1100
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1058#1077#1082#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1058#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1058#1077#1082#1091#1097#1080#1081' '#1082#1074#1072#1088#1090#1072#1083
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1058#1077#1082#1091#1097#1080#1081' '#1075#1086#1076
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1075#1086#1076
          '-'
          '-')
        Tag = 0
      end
      item
        ImageIndex = -1
        Strings.Strings = (
          #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081
          '-'
          '-')
        Tag = 0
      end>
    EditColumn = 0
    EditHeight = 15
    EmptyText = ''
    EmptyTextStyle = []
    DropWidth = 300
    DropHeight = 200
    DropDownCount = 5
    Enabled = True
    ButtonWidth = 17
    GridLines = True
    ItemIndex = 0
    LookupColumn = 0
    LabelCaption = #1055#1077#1088#1080#1086#1076':'
    LabelPosition = lpLeftCenter
    LabelMargin = 21
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    SortColumn = 0
    TabOrder = 5
    OnSelect = ccbPeriodSelect
  end
end
