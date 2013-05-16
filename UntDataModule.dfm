object FrmDataModule: TFrmDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 236
  Top = 106
  Height = 412
  Width = 441
  object ZConnection1: TZConnection
    Protocol = 'firebird-1.5'
    Port = 0
    Database = '10.21.153.51:/bancos/AGENDA.FDB'
    User = 'SYSDBA'
    Password = 'fblxdb'
    AutoCommit = True
    ReadOnly = False
    TransactIsolationLevel = tiReadCommitted
    Connected = False
    SQLHourGlass = False
    Left = 128
    Top = 61
  end
  object ZQueryCodigo: TZQuery
    Connection = ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Codigos')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 128
    Top = 112
    object ZQueryCodigoNO_CAMPO: TStringField
      FieldName = 'NO_CAMPO'
      Required = True
      Size = 30
    end
    object ZQueryCodigoNR_ATUAL: TIntegerField
      FieldName = 'NR_ATUAL'
    end
  end
  object ZQueryDiversos: TZQuery
    Connection = ZConnection1
    RequestLive = True
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 128
    Top = 168
  end
  object ZReadOnlyQueryDiversos2: TZQuery
    Connection = ZConnection1
    RequestLive = False
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 266
    Top = 264
  end
  object ZReadOnlyQueryDiversos: TZQuery
    Connection = ZConnection1
    RequestLive = False
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 109
    Top = 264
  end
end
