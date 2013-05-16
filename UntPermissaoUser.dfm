object FrmPermissaoUser: TFrmPermissaoUser
  Left = 167
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#227'o de Usu'#225'rio'
  ClientHeight = 341
  ClientWidth = 716
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
  object JvShape3: TJvShape
    Left = 453
    Top = 308
    Width = 66
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape1: TJvShape
    Left = 383
    Top = 308
    Width = 66
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape2: TJvShape
    Left = 197
    Top = 308
    Width = 85
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape4: TJvShape
    Left = 286
    Top = 308
    Width = 93
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object wwDBGrid1: TwwDBGrid
    Left = 9
    Top = 8
    Width = 681
    Height = 297
    ControlType.Strings = (
      'MARCA;CustomEdit;wwCheckBox1;F'
      'ALT_EVENTO;CustomEdit;wwCheckBoxAltEvento;F'
      'EXC_EVENTO;CustomEdit;wwCheckBoxExcEvento;F')
    Selected.Strings = (
      'UNIDADE'#9'41'#9'UNIDADE'#9#9
      'MARCA'#9'2'#9' '#9#9
      'AMBIENTE'#9'54'#9'AMBIENTE'#9#9
      'ALT_EVENTO'#9'1'#9'ALT'#9#9
      'EXC_EVENTO'#9'1'#9'EXC'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    DataSource = DataSourceAmb_Unidade
    KeyOptions = []
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object BitBtnSair: TLMDButton
    Left = 454
    Top = 309
    Width = 64
    Height = 21
    Cursor = crHandPoint
    Hint = 'Editar o registro corrente'
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtnSairClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object BitBtnSalvar: TLMDButton
    Left = 384
    Top = 309
    Width = 64
    Height = 21
    Cursor = crHandPoint
    Hint = 'Editar o registro corrente'
    Caption = 'Sal&var'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnSalvarClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object wwCheckBox1: TwwCheckBox
    Left = 360
    Top = 144
    Width = 16
    Height = 16
    DisableThemes = False
    AlwaysTransparent = False
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    DisplayValueChecked = 'S'
    DisplayValueUnchecked = 'F'
    NullAndBlankState = cbUnchecked
    DataField = 'MARCA'
    DataSource = DataSourceAmb_Unidade
    TabOrder = 5
  end
  object LMDButtonMarcaTodos: TLMDButton
    Left = 198
    Top = 309
    Width = 83
    Height = 21
    Cursor = crHandPoint
    Hint = 'Editar o registro corrente'
    Caption = 'Marca todos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = LMDButtonMarcaTodosClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object LMDButtonDesmacacao: TLMDButton
    Left = 287
    Top = 309
    Width = 91
    Height = 21
    Cursor = crHandPoint
    Hint = 'Editar o registro corrente'
    Caption = 'Desmarca todos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = LMDButtonDesmacacaoClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object wwCheckBoxAltEvento: TwwCheckBox
    Left = 368
    Top = 152
    Width = 24
    Height = 16
    DisableThemes = False
    AlwaysTransparent = False
    ValueChecked = 'V'
    ValueUnchecked = 'F'
    DisplayValueChecked = 'S'
    DisplayValueUnchecked = 'F'
    NullAndBlankState = cbUnchecked
    DataField = 'ALT_EVENTO'
    DataSource = DataSourceAmb_Unidade
    TabOrder = 6
  end
  object wwCheckBoxExcEvento: TwwCheckBox
    Left = 376
    Top = 160
    Width = 25
    Height = 16
    DisableThemes = False
    AlwaysTransparent = False
    ValueChecked = 'V'
    ValueUnchecked = 'F'
    DisplayValueChecked = 'S'
    DisplayValueUnchecked = 'F'
    NullAndBlankState = cbUnchecked
    DataField = 'EXC_EVENTO'
    DataSource = DataSourceAmb_Unidade
    TabOrder = 7
  end
  object ZQueryAmb_Unidade: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ambientes.id_unidade, unidades.desc_unidade Unidade, ambi' +
        'entes.id_ambiente, ambientes.nome Ambiente'
      
        'FROM ambientes, unidades Where ambientes.id_unidade = unidades.c' +
        'odunidade'
      'ORDER BY unidades.desc_unidade, ambientes.nome')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 128
    Top = 72
    object ZQueryAmb_UnidadeID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
    end
    object ZQueryAmb_UnidadeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 60
    end
    object ZQueryAmb_UnidadeID_AMBIENTE: TIntegerField
      FieldName = 'ID_AMBIENTE'
      Required = True
    end
    object ZQueryAmb_UnidadeAMBIENTE: TStringField
      FieldName = 'AMBIENTE'
      Size = 40
    end
  end
  object DataSourceAmb_Unidade: TDataSource
    DataSet = ClientDataSetAmb_Unidade
    Left = 128
    Top = 168
  end
  object ClientDataSetAmb_Unidade: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MARCA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'AMBIENTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ALT_EVENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EXC_EVENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_UNIDADE'
        DataType = ftInteger
      end
      item
        Name = 'ID_AMBIENTE'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 120
    Data = {
      D20000009619E0BD010000001800000007000000000003000000D20007554E49
      444144450100490000000100055749445448020002003C00054D415243410100
      49000000010005574944544802000200050008414D4249454E54450100490000
      000100055749445448020002003C000A414C545F4556454E544F010049000000
      01000557494454480200020001000A4558435F4556454E544F01004900000001
      000557494454480200020001000A49445F554E49444144450400010000000000
      0B49445F414D4249454E544504000100000000000000}
    object ClientDataSetAmb_UnidadeUNIDADE: TStringField
      DisplayWidth = 41
      FieldName = 'UNIDADE'
      Size = 60
    end
    object ClientDataSetAmb_UnidadeMARCA: TStringField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'MARCA'
      Size = 5
    end
    object ClientDataSetAmb_UnidadeAMBIENTE: TStringField
      DisplayWidth = 54
      FieldName = 'AMBIENTE'
      Size = 60
    end
    object ClientDataSetAmb_UnidadeALT_EVENTO: TStringField
      DisplayLabel = 'ALT'
      DisplayWidth = 1
      FieldName = 'ALT_EVENTO'
      Size = 1
    end
    object ClientDataSetAmb_UnidadeEXC_EVENTO: TStringField
      DisplayLabel = 'EXC'
      DisplayWidth = 1
      FieldName = 'EXC_EVENTO'
      Size = 1
    end
    object ClientDataSetAmb_UnidadeID_UNIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 11
      FieldName = 'ID_UNIDADE'
      Visible = False
    end
    object ClientDataSetAmb_UnidadeID_AMBIENTE: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID_AMBIENTE'
      Visible = False
    end
  end
  object ZQueryAmbienteOper: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    Active = True
    SQL.Strings = (
      'Select * From Ambiente_Operador Where Id_Operador = :pIdOperador')
    ParamCheck = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'pIdOperador'
        ParamType = ptUnknown
      end>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pIdOperador'
        ParamType = ptUnknown
      end>
    object ZQueryAmbienteOperID_OPERADOR: TIntegerField
      FieldName = 'ID_OPERADOR'
      Required = True
    end
    object ZQueryAmbienteOperID_AMBIENTE: TIntegerField
      FieldName = 'ID_AMBIENTE'
      Required = True
    end
    object ZQueryAmbienteOperID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object ZQueryAmbienteOperSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ZQueryAmbienteOperALT_EVENTO: TStringField
      FieldName = 'ALT_EVENTO'
      Size = 1
    end
    object ZQueryAmbienteOperEXC_EVENTO: TStringField
      FieldName = 'EXC_EVENTO'
      Size = 1
    end
  end
  object ZReadOnlyQueryDiversos: TZReadOnlyQuery
    Connection = FrmDataModule.ZConnection1
    ParamCheck = True
    Params = <>
    Options = [doCalcDefaults]
    Left = 264
    Top = 224
  end
end
