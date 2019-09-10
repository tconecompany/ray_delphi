object FormRayUser: TFormRayUser
  Left = 0
  Top = 0
  Caption = 'FormRayUser'
  ClientHeight = 417
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 275
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object DBGridEh1: TDBGridEh
    Left = 104
    Top = 27
    Width = 625
    Height = 350
    DataSource = dsMain
    DynProps = <>
    TabOrder = 1
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tMain: TOraTable
    TableName = 'ERP.KEYS'
    CachedUpdates = True
    Left = 16
    Top = 32
  end
  object dsMain: TOraDataSource
    DataSet = tMain
    OnDataChange = dsMainDataChange
    Left = 64
    Top = 32
  end
end
