object DataModuleTre: TDataModuleTre
  OldCreateOrder = False
  Height = 509
  Width = 327
  object tDICT_ACCOUNT_TYPE: TOraTable
    TableName = 'TRE.DICT_ACCOUNT_TYPE'
    Session = DataModuleRay.OraSession
    Left = 70
    Top = 76
    object tDICT_ACCOUNT_TYPEACCOUNT_TYPE_ID: TFloatField
      FieldName = 'ACCOUNT_TYPE_ID'
      Required = True
    end
    object tDICT_ACCOUNT_TYPENAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object tDICT_ACCOUNT_SUBTYPE: TOraTable
    TableName = 'TRE.DICT_ACCOUNT_SUBTYPE'
    Session = DataModuleRay.OraSession
    Left = 70
    Top = 131
    object tDICT_ACCOUNT_SUBTYPEACCOUNT_SUBTYPE_ID: TFloatField
      FieldName = 'ACCOUNT_SUBTYPE_ID'
      Required = True
    end
    object tDICT_ACCOUNT_SUBTYPENAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object tDICT_ACCOUNT_SUBTYPESNAME: TStringField
      FieldName = 'SNAME'
      Required = True
      Size = 50
    end
    object tDICT_ACCOUNT_SUBTYPEACCOUNT_TYPE_ID: TFloatField
      FieldName = 'ACCOUNT_TYPE_ID'
    end
  end
  object tACCOUNTS: TOraTable
    TableName = 'TRE.ACCOUNTS'
    Session = DataModuleRay.OraSession
    Left = 72
    Top = 28
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
  object dsDICT_ACCOUNT_TYPE: TOraDataSource
    AutoEdit = False
    DataSet = tDICT_ACCOUNT_TYPE
    Left = 210
    Top = 75
  end
  object dsDICT_ACCOUNT_SUBTYPE: TOraDataSource
    AutoEdit = False
    DataSet = tDICT_ACCOUNT_SUBTYPE
    Left = 211
    Top = 131
  end
  object dsACCOUNTS: TOraDataSource
    DataSet = tACCOUNTS
    Left = 210
    Top = 29
  end
  object tDICT_BUDG_PAY_TYPE: TOraTable
    TableName = 'TRE.DICT_BUDG_PAY_TYPE'
    Session = DataModuleRay.OraSession
    Left = 70
    Top = 187
    object tDICT_BUDG_PAY_TYPEBUDG_PAY_TYPE_ID: TFloatField
      FieldName = 'BUDG_PAY_TYPE_ID'
      Required = True
    end
    object tDICT_BUDG_PAY_TYPENAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object dsDICT_BUDG_PAY_TYPE: TOraDataSource
    AutoEdit = False
    DataSet = tDICT_BUDG_PAY_TYPE
    Left = 211
    Top = 187
  end
end
