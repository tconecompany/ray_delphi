object DataModuleTrade: TDataModuleTrade
  OldCreateOrder = False
  Height = 379
  Width = 455
  object tDICT_STATUS: TOraTable
    TableName = 'TRADE.DICT_STATUS'
    Left = 47
    Top = 24
  end
  object qCOR_TYPE_ID_12: TOraQuery
    Session = DataModuleRay.OraSession
    SQL.Strings = (
      'SELECT c.* '
      '  FROM TRADE.COR c'
      ' WHERE c.cor_type_id = 12')
    Left = 47
    Top = 80
  end
  object dsCOR_TYPE_ID_12: TOraDataSource
    DataSet = qCOR_TYPE_ID_12
    Left = 152
    Top = 80
  end
end
