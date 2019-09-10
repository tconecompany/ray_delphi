object DataModuleRBI: TDataModuleRBI
  OldCreateOrder = False
  Height = 260
  Width = 214
  object tDICT_CURRENCY: TOraTable
    TableName = 'RBI.DICT_CURRENCY'
    ReadOnly = True
    Session = DataModuleRay.OraSession
    Left = 42
    Top = 16
    object tDICT_CURRENCYCURRENCY_ID: TIntegerField
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object tDICT_CURRENCYCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Required = True
      Size = 3
    end
    object tDICT_CURRENCYNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object tDICT_CURRENCYSIGN: TStringField
      FieldName = 'SIGN'
      FixedChar = True
      Size = 1
    end
  end
  object dsDICT_CURRENCY: TOraDataSource
    AutoEdit = False
    DataSet = tDICT_CURRENCY
    Left = 140
    Top = 16
  end
end
