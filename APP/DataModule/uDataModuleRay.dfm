object DataModuleRay: TDataModuleRay
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 378
  Width = 488
  object OraSession: TOraSession
    Options.Direct = True
    Username = 'ray'
    Server = '192.168.1.2:1521:ORCL'
    LoginPrompt = False
    Schema = 'RAY'
    Left = 26
    Top = 32
    EncryptedPassword = '8DFF9EFF86FF'
  end
  object tUSERS: TOraTable
    TableName = 'RAY.USERS'
    Session = OraSession
    AutoCommit = False
    Left = 28
    Top = 202
    object tUSERSUSER_ID: TFloatField
      FieldName = 'USER_ID'
      Required = True
    end
    object tUSERSLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object tUSERSKEY_ID: TFloatField
      FieldName = 'KEY_ID'
    end
    object tUSERSCORR_ID: TFloatField
      FieldName = 'CORR_ID'
    end
    object tUSERSPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Required = True
    end
    object tUSERSDATE_REG: TDateTimeField
      FieldName = 'DATE_REG'
    end
    object tUSERSXML_SETTINGS: TOraXMLField
      FieldName = 'XML_SETTINGS'
      DataType = 108
    end
    object tUSERSXML_PERIOD: TOraXMLField
      FieldName = 'XML_PERIOD'
      DataType = 108
    end
    object tUSERSSIGN_ACTIVITY: TIntegerField
      FieldName = 'SIGN_ACTIVITY'
      Required = True
    end
  end
  object tMODULE: TOraTable
    TableName = 'RAY.MODULE'
    Session = OraSession
    AutoCommit = False
    Filtered = True
    Filter = 'sign_activity = -1'
    Left = 26
    Top = 146
    object tMODULEMODULE_ID: TFloatField
      FieldName = 'MODULE_ID'
      Required = True
    end
    object tMODULESIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Size = 50
    end
    object tMODULESIGNATURE_SHORT: TStringField
      FieldName = 'SIGNATURE_SHORT'
      Size = 50
    end
    object tMODULEICO: TStringField
      FieldName = 'ICO'
      Size = 50
    end
    object tMODULEXML_CONF: TOraXMLField
      FieldName = 'XML_CONF'
      DataType = 108
    end
    object tMODULESIGN_ACTIVITY: TIntegerField
      FieldName = 'SIGN_ACTIVITY'
      Required = True
    end
  end
  object dsMODULE: TOraDataSource
    DataSet = tMODULE
    Left = 91
    Top = 146
  end
  object tACTION: TOraTable
    TableName = 'RAY.ACTION'
    Session = OraSession
    AutoCommit = False
    Left = 28
    Top = 90
    object tACTIONACTION_ID: TFloatField
      FieldName = 'ACTION_ID'
      Required = True
    end
    object tACTIONSIGNATURE: TStringField
      FieldName = 'SIGNATURE'
      Size = 100
    end
  end
  object dsACTION: TOraDataSource
    DataSet = tACTION
    Left = 92
    Top = 90
  end
end
