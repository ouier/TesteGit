object FrmPermUnidade: TFrmPermUnidade
  Left = 159
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#227'o de Unidades'
  ClientHeight = 341
  ClientWidth = 467
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
    Left = 328
    Top = 308
    Width = 66
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape1: TJvShape
    Left = 258
    Top = 308
    Width = 66
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape2: TJvShape
    Left = 72
    Top = 308
    Width = 85
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape4: TJvShape
    Left = 161
    Top = 308
    Width = 93
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object wwDBGrid1: TwwDBGrid
    Left = 11
    Top = 8
    Width = 445
    Height = 297
    DittoAttributes.ShortCutDittoField = 0
    DittoAttributes.ShortCutDittoRecord = 0
    DittoAttributes.Options = []
    DisableThemesInTitle = False
    ControlType.Strings = (
      'MARCA;CustomEdit;wwCheckBox1;F')
    Selected.Strings = (
      'UNIDADE'#9'65'#9'UNIDADE'
      'MARCA'#9'2'#9' ')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 1
    ShowHorzScrollBar = True
    DataSource = DataSourceUnid_Operador
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
    Left = 329
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
    Visible = True
    OnClick = BitBtnSairClick
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
    ExtStyle = ubsWinXPTool
  end
  object BitBtnSalvar: TLMDButton
    Left = 259
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
    Visible = True
    OnClick = BitBtnSalvarClick
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
    ExtStyle = ubsWinXPTool
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
    DataSource = DataSourceUnid_Operador
    TabOrder = 5
  end
  object LMDButtonMarcaTodos: TLMDButton
    Left = 73
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
    Visible = True
    OnClick = LMDButtonMarcaTodosClick
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
    ExtStyle = ubsWinXPTool
  end
  object LMDButtonDesmacacao: TLMDButton
    Left = 162
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
    Visible = True
    OnClick = LMDButtonDesmacacaoClick
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
    ExtStyle = ubsWinXPTool
  end
  object ZQueryUnidade: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM unidades ORDER BY unidades.desc_unidade')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 128
    Top = 72
    object ZQueryUnidadeCODUNIDADE: TIntegerField
      FieldName = 'CODUNIDADE'
      Required = True
    end
    object ZQueryUnidadeDESC_UNIDADE: TStringField
      FieldName = 'DESC_UNIDADE'
      Size = 60
    end
  end
  object DataSourceUnid_Operador: TDataSource
    DataSet = ClientDataSetUnid_Operador
    Left = 128
    Top = 168
  end
  object ClientDataSetUnid_Operador: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_UNIDADE'
        DataType = ftInteger
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MARCA'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 120
    Data = {
      630000009619E0BD01000000180000000300000000000300000063000A49445F
      554E4944414445040001000000000007554E4944414445010049000000010005
      5749445448020002003C00054D41524341010049000000010005574944544802
      00020005000000}
    object ClientDataSetUnid_OperadorUNIDADE: TStringField
      DisplayWidth = 65
      FieldName = 'UNIDADE'
      Size = 60
    end
    object ClientDataSetUnid_OperadorMARCA: TStringField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'MARCA'
      Size = 5
    end
    object ClientDataSetUnid_OperadorID_UNIDADE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 11
      FieldName = 'ID_UNIDADE'
      Visible = False
    end
  end
  object ZQueryUnidadeOper: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Unidade_Operador Where Id_Operador = :pIdOperador')
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
    object ZQueryUnidadeOperID_OPERADOR: TIntegerField
      FieldName = 'ID_OPERADOR'
      Required = True
    end
    object ZQueryUnidadeOperID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Required = True
    end
    object ZQueryUnidadeOperSTATUS: TSmallintField
      FieldName = 'STATUS'
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
