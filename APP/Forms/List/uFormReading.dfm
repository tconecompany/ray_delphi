object FormReading: TFormReading
  Left = 0
  Top = 0
  ActiveControl = ListBox
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
  ClientHeight = 141
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 100
    Width = 294
    Height = 41
    Align = alBottom
    ShowCaption = False
    TabOrder = 1
    OnClick = PanelClick
    object bOK: TButton
      Left = 68
      Top = 8
      Width = 75
      Height = 24
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
      OnClick = bOKClick
    end
    object bCancel: TButton
      Left = 149
      Top = 8
      Width = 75
      Height = 24
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 8
      TabOrder = 1
    end
  end
  object ListBox: TListBox
    Left = 0
    Top = 0
    Width = 294
    Height = 100
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = bOKClick
  end
end
