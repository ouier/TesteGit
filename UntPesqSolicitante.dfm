object FrmPesqSolicitante: TFrmPesqSolicitante
  Left = 193
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca por Solicitante'
  ClientHeight = 362
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 123
    Top = 19
    Width = 52
    Height = 13
    Caption = 'Data inicial'
    Transparent = True
  end
  object lbl2: TLabel
    Left = 329
    Top = 19
    Width = 45
    Height = 13
    Caption = 'Data final'
    Transparent = True
  end
  object lbl3: TLabel
    Left = 79
    Top = 47
    Width = 99
    Height = 13
    Caption = 'Escolha o Solicitante'
    Transparent = True
  end
  object lbl4: TLabel
    Left = 11
    Top = 312
    Width = 214
    Height = 26
    Caption = 'Clica 2 vezes para criar novo evento para o solicitante'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object lbl5: TLabel
    Left = 492
    Top = 46
    Width = 57
    Height = 26
    Caption = 'e pressione <ENTER>'
    Transparent = True
    WordWrap = True
  end
  object wwDBDateTimePickerDataInicial: TwwDBDateTimePicker
    Left = 181
    Top = 16
    Width = 108
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 0
    OnKeyPress = wwDBDateTimePickerDataInicialKeyPress
  end
  object wwDBDateTimePickerDataFinal: TwwDBDateTimePicker
    Left = 381
    Top = 16
    Width = 108
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 1
    OnKeyPress = wwDBDateTimePickerDataFinalKeyPress
  end
  object BitBtnFechar: TBitBtn
    Left = 266
    Top = 308
    Width = 80
    Height = 32
    Hint = 'Retorna ao menu principal'
    Caption = '&Fechar'
    TabOrder = 4
    TabStop = False
    OnClick = BitBtnFecharClick
    Glyph.Data = {
      72010000424D7201000000000000760000002800000015000000150000000100
      040000000000FC000000120B0000120B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888880008888888888888888888880008888888088888888888880008888
      8880888888888888800088888800888888888888800088888400888888888888
      800088880440888888888888800088004440000000088888800088804440FF80
      88888888800088804440FF8088881888800088804440FF808881188880008880
      4440FF8088111888800088804440FF8081111118800088804440FF8081111118
      800088804440FF8081111118800088804448FF808811111880008880448FFF80
      8881188880008880408FFF808888188880008880088FFF808888888880008880
      08888880888888888000888000000000888888888000}
  end
  object wwDBGridTabela: TwwDBGrid
    Left = 12
    Top = 80
    Width = 588
    Height = 225
    Selected.Strings = (
      'DATA'#9'10'#9'Data'
      'H_INICIO'#9'7'#9'In'#237'cio'
      'H_FIM'#9'7'#9'Fim'
      'SOLICITANTE'#9'19'#9'Solicitante'
      'DESCRICAO'#9'45'#9'Descri'#231#227'o'
      'FONE_PESSOA_CONTATO'#9'15'#9'FONE_PESSOA_CONTATO'
      'CELULAR_PESSOA_CONTATO'#9'15'#9'CELULAR_PESSOA_CONTATO'
      'EMAIL_PESSOA_CONTATO'#9'50'#9'EMAIL_PESSOA_CONTATO')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DataSourceEvento
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnDblClick = wwDBGridTabelaDblClick
  end
  object cxLookupComboBoxSolicitante: TcxLookupComboBox
    Left = 181
    Top = 44
    Width = 308
    Height = 21
    Properties.KeyFieldNames = 'SOLICITANTE'
    Properties.ListColumns = <
      item
        FieldName = 'SOLICITANTE'
      end>
    Properties.ListSource = DataSourceSolicitante
    TabOrder = 2
    OnEnter = cxDBLookupComboSolicitanteEnter
    OnKeyPress = cxLookupComboBoxSolicitanteKeyPress
  end
  object ZQuerySolicitante: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SOLICITANTE FROM EVENTOS WHERE ID_EVENTO = -1')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 336
    Top = 129
    object ZQuerySolicitanteSOLICITANTE: TStringField
      FieldName = 'SOLICITANTE'
      Size = 40
    end
  end
  object ZQueryEvento: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT EVENTOS.FONE_PESSOA_CONTATO, EVENTOS.CELULAR_PESSOA_CONTA' +
        'TO, EVENTOS.EMAIL_PESSOA_CONTATO, RESERVAS.DATA, RESERVAS.H_INIC' +
        'IO, RESERVAS.H_FIM, EVENTOS.SOLICITANTE, EVENTOS.DESCRICAO'
      'FROM RESERVAS'
      
        '   INNER JOIN EVENTOS ON (RESERVAS.ID_EVENTO = EVENTOS.ID_EVENTO' +
        ') AND ID_RESERVA = -1')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 304
    Top = 129
    object ZQueryEventoDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ZQueryEventoH_INICIO: TDateTimeField
      DisplayLabel = 'In'#237'cio'
      DisplayWidth = 7
      FieldName = 'H_INICIO'
      DisplayFormat = 'hh:nn'
    end
    object ZQueryEventoH_FIM: TDateTimeField
      DisplayLabel = 'Fim'
      DisplayWidth = 7
      FieldName = 'H_FIM'
      DisplayFormat = 'hh:nn'
    end
    object ZQueryEventoSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      DisplayWidth = 19
      FieldName = 'SOLICITANTE'
      Size = 40
    end
    object ZQueryEventoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object ZQueryEventoFONE_PESSOA_CONTATO: TStringField
      DisplayWidth = 15
      FieldName = 'FONE_PESSOA_CONTATO'
      Size = 15
    end
    object ZQueryEventoCELULAR_PESSOA_CONTATO: TStringField
      DisplayWidth = 15
      FieldName = 'CELULAR_PESSOA_CONTATO'
      Size = 15
    end
    object ZQueryEventoEMAIL_PESSOA_CONTATO: TStringField
      DisplayWidth = 50
      FieldName = 'EMAIL_PESSOA_CONTATO'
      Size = 50
    end
  end
  object DataSourceEvento: TDataSource
    DataSet = ZQueryEvento
    Left = 304
    Top = 160
  end
  object DataSourceSolicitante: TDataSource
    DataSet = ZQuerySolicitante
    Left = 336
    Top = 160
  end
end
