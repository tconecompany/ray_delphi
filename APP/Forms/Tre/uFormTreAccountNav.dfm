object FormTreAccountNav: TFormTreAccountNav
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1095#1077#1090' '#1053#1072#1074#1080#1075#1072#1094#1080#1103
  ClientHeight = 141
  ClientWidth = 294
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
  object Panel: TPanel
    Left = 0
    Top = 100
    Width = 294
    Height = 41
    Align = alBottom
    ShowCaption = False
    TabOrder = 0
    OnClick = PanelClick
    object bOK: TButton
      Left = 68
      Top = 8
      Width = 75
      Height = 24
      Caption = #1054#1050
      TabOrder = 0
      OnClick = bOKClick
    end
    object bCancel: TButton
      Left = 151
      Top = 8
      Width = 75
      Height = 24
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 8
      TabOrder = 1
    end
  end
  object ListBox: TListBox
    Left = 0
    Top = 0
    Width = 294
    Height = 100
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 13
    Items.Strings = (
      #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1087#1086' '#1089#1095#1077#1090#1091
      #1042#1099#1087#1080#1089#1082#1072' '#1087#1086' '#1089#1095#1077#1090#1091
      #1056#1077#1079#1077#1088#1074)
    TabOrder = 1
    OnDblClick = bOKClick
    OnDrawItem = ListBoxDrawItem
  end
  object tACCOUNTS: TOraTable
    TableName = 'TRE.ACCOUNTS'
    Session = DataModuleRay.OraSession
    Active = True
    Left = 232
    Top = 16
    object tACCOUNTSACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
      Required = True
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
    object tACCOUNTSTREE_PARENT_ID: TFloatField
      FieldName = 'TREE_PARENT_ID'
    end
  end
end
