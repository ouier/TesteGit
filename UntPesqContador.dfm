object FrmPesqContador: TFrmPesqContador
  Left = 109
  Top = 116
  Width = 483
  Height = 385
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisa de Contador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGridTabela: TwwDBGrid
    Left = 12
    Top = 39
    Width = 451
    Height = 274
    DittoAttributes.ShortCutDittoField = 0
    DittoAttributes.ShortCutDittoRecord = 0
    DittoAttributes.Options = []
    DisableThemesInTitle = False
    Selected.Strings = (
      'ID'#9'10'#9'C'#243'digo'
      'RAZAOSOCIAL'#9'58'#9'Raz'#227'o Social')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DataSourceBase
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnKeyPress = wwDBGridTabelaKeyPress
    PaintOptions.AlternatingRowColor = clSilver
    PaintOptions.ActiveRecordColor = clHighlight
  end
  object BitBtnFechar: TBitBtn
    Left = 198
    Top = 315
    Width = 80
    Height = 29
    Hint = 'Retorna ao menu principal'
    Caption = '&Fechar'
    TabOrder = 2
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
  object Panel2: TPanel
    Left = 12
    Top = 14
    Width = 105
    Height = 21
    Alignment = taRightJustify
    Caption = 'Descri'#231#227'o: '
    TabOrder = 3
  end
  object EditDescricao: TEdit
    Left = 118
    Top = 14
    Width = 345
    Height = 21
    TabOrder = 0
    OnKeyPress = EditDescricaoKeyPress
  end
  object QueryBase: TQuery
    DatabaseName = 'dbSindical'
    SQL.Strings = (
      'SELECT ID, RAZAOSOCIAL'
      'FROM  Contrib WHERE RAZAOSOCIAL LIKE :pDescricao'
      'ORDER BY RAZAOSOCIAL')
    Left = 144
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'pDescricao'
        ParamType = ptInput
      end>
    object QueryBaseID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object QueryBaseRAZAOSOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 58
      FieldName = 'RAZAOSOCIAL'
      Size = 100
    end
  end
  object DataSourceBase: TDataSource
    DataSet = QueryBase
    Left = 240
    Top = 136
  end
end
