object FrmCadOperador: TFrmCadOperador
  Left = 187
  Top = 107
  AutoScroll = False
  BorderIcons = []
  Caption = 'Cadastro de Operador'
  ClientHeight = 448
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 10
    Top = 155
    Width = 222
    Height = 13
    Caption = 'End. do AAAAAAAAAAAAAAAAAAAATrabalho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 10
    Top = 176
    Width = 222
    Height = 13
    Caption = 'End. do AAAAAAAAAAAAAAAAAAAATrabalho'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 616
    Height = 417
    Align = alClient
    BevelOuter = bvNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = True
    object JvEnterAsTab1: TJvEnterAsTab
      Left = 464
      Top = 380
      Width = 28
      Height = 28
    end
    object JvShape11: TJvShape
      Left = 216
      Top = 385
      Width = 66
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clBackground
    end
    object JvShape1: TJvShape
      Left = 287
      Top = 385
      Width = 66
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clBackground
    end
    object JvShape2: TJvShape
      Left = 358
      Top = 385
      Width = 66
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clBackground
    end
    object JvShape3: TJvShape
      Left = 527
      Top = 385
      Width = 66
      Height = 23
      Brush.Style = bsClear
      Pen.Color = clBackground
    end
    object Label1: TLabel
      Left = 107
      Top = 4
      Width = 109
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome Completo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object GroupBoxDados: TGroupBox
      Left = 5
      Top = 23
      Width = 606
      Height = 352
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object BitBtnConsultaUnidade: TSpeedButton
        Left = 146
        Top = 278
        Width = 20
        Height = 21
        Hint = 'Consulta Unidades'
        BiDiMode = bdLeftToRight
        Caption = '...'
        Layout = blGlyphBottom
        ParentShowHint = False
        ParentBiDiMode = False
        ShowHint = True
        Spacing = 0
      end
      object LMDDrawEdge1: TLMDDrawEdge
        Left = 11
        Top = 14
        Width = 231
        Height = 126
        EdgeStyle = etBump
      end
      object LMDDrawEdge2: TLMDDrawEdge
        Left = 240
        Top = 42
        Width = 185
        Height = 98
        EdgeStyle = etBump
      end
      object LMDDrawEdge4: TLMDDrawEdge
        Left = 240
        Top = 14
        Width = 185
        Height = 31
        EdgeStyle = etBump
        Filled = True
      end
      object Label4: TLabel
        Left = 242
        Top = 45
        Width = 182
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Acesso dispon'#237'vel'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LMDDrawEdge3: TLMDDrawEdge
        Left = 424
        Top = 14
        Width = 172
        Height = 126
        EdgeStyle = etBump
        Filled = True
      end
      object JvShape5: TJvShape
        Left = 472
        Top = 62
        Width = 82
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clBackground
      end
      object JvShape4: TJvShape
        Left = 472
        Top = 110
        Width = 82
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clBackground
      end
      object DBCheckBoxTodosAmbiente: TDBCheckBox
        Left = 449
        Top = 93
        Width = 130
        Height = 17
        Caption = 'Todos Ambientes'
        DataField = 'TODOSAMBIENTES'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBoxTodosAmbienteClick
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 145
        Width = 587
        Height = 203
        Caption = 'Direitos do Operador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object wwDBGridTabela: TwwDBGrid
          Left = 12
          Top = 16
          Width = 563
          Height = 178
          ControlType.Strings = (
            'CADASTRAR;CheckBox;1;0'
            'ALTERAR;CheckBox;1;0'
            'EXCLUIR;CheckBox;1;0'
            'UNICO;CheckBox;1;0'
            'LIBERADO;CheckBox;1;0'
            'ALTERACAO;CheckBox;1;0'
            'CADASTRO;CheckBox;1;0'
            'EXCLUSAO;CheckBox;1;0'
            'LIBERACAO;CheckBox;1;0')
          Selected.Strings = (
            'OPCAO'#9'68'#9'Op'#231#227'o'#9'F'
            'LIBERACAO'#9'4'#9'Lib'#9'F'
            'CADASTRO'#9'4'#9'Cad'#9'F'
            'ALTERACAO'#9'4'#9'Alt'#9'F'
            'EXCLUSAO'#9'4'#9'Exc'#9'F')
          IniAttributes.FileName = 'delphi32.ini'
          IniAttributes.SectionName = 'GridDemowwDBGrid1'
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Color = clBtnHighlight
          Ctl3D = True
          DataSource = DataSourceOpcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = [dgEnterToTab]
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgFixedResizable]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clActiveCaption
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          FooterColor = clWhite
          FooterCellColor = clWindow
          object wwDBGrid1IButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
      end
      object DBCheckBoxSabado: TDBCheckBox
        Left = 338
        Top = 83
        Width = 57
        Height = 17
        Caption = 'S'#225'bado'
        DataField = 'SABADO'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxQuinta: TDBCheckBox
        Left = 265
        Top = 115
        Width = 52
        Height = 17
        Caption = 'Quinta'
        DataField = 'QUINTA'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxQuarta: TDBCheckBox
        Left = 265
        Top = 98
        Width = 54
        Height = 17
        Caption = 'Quarta'
        DataField = 'QUARTA'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxSexta: TDBCheckBox
        Left = 338
        Top = 66
        Width = 49
        Height = 17
        Caption = 'Sexta'
        DataField = 'SEXTA'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxTerca: TDBCheckBox
        Left = 265
        Top = 81
        Width = 51
        Height = 17
        Caption = 'Ter'#231'a'
        DataField = 'TERCA'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxSegunda: TDBCheckBox
        Left = 265
        Top = 64
        Width = 67
        Height = 17
        Caption = 'Segunda'
        DataField = 'SEGUNDA'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxDomingo: TDBCheckBox
        Left = 338
        Top = 100
        Width = 62
        Height = 17
        Caption = 'Domingo'
        DataField = 'DOMINGO'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxDesativado: TDBCheckBox
        Left = 275
        Top = 21
        Width = 117
        Height = 17
        Caption = 'Usu'#225'rio desativado'
        DataField = 'DESATIVADO'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object LMDButtonPermAmbiente: TLMDButton
        Left = 473
        Top = 111
        Width = 80
        Height = 21
        Cursor = crHandPoint
        Hint = 'Editar o registro corrente'
        Caption = '&Permiss'#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnClick = LMDButtonPermAmbienteClick
        ButtonStyle = ubsExplorer
        Color = clActiveBorder
        NumGlyphs = 2
        ParentColor = False
        OnMouseEnter = LMDButtonPermAmbienteMouseEnter
        OnMouseExit = LMDButtonPermAmbienteMouseExit
      end
      object DBCheckBoxMudarSenhaAoLogar: TDBCheckBox
        Left = 449
        Top = 21
        Width = 130
        Height = 17
        Caption = 'Mudar Senha ao Logar'
        DataField = 'MUDAR_SENHA_NOLOGON'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBoxTodasUnid: TDBCheckBox
        Left = 449
        Top = 45
        Width = 130
        Height = 17
        Caption = 'Todas Unidades'
        DataField = 'TODASUNIDADES'
        DataSource = DataSourceOperador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBoxTodasUnidClick
      end
      object LMDButtonPermUnidade: TLMDButton
        Left = 473
        Top = 63
        Width = 80
        Height = 21
        Cursor = crHandPoint
        Hint = 'Editar o registro corrente'
        Caption = '&Permiss'#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnClick = LMDButtonPermUnidadeClick
        ButtonStyle = ubsExplorer
        Color = clActiveBorder
        NumGlyphs = 2
        ParentColor = False
        OnMouseEnter = LMDButtonPermAmbienteMouseEnter
        OnMouseExit = LMDButtonPermAmbienteMouseExit
      end
    end
    object EditSenhaHabilitar: TEdit
      Left = 8
      Top = 386
      Width = 89
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
      Visible = False
      OnEnter = EditSenhaHabilitarEnter
      OnExit = EditSenhaHabilitarExit
      OnKeyPress = EditSenhaHabilitarKeyPress
    end
    object EditTodasUnidades: TEdit
      Left = 112
      Top = 386
      Width = 89
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
      Visible = False
      OnEnter = EditTodasUnidadesEnter
      OnExit = EditTodasUnidadesExit
      OnKeyPress = EditTodasUnidadesKeyPress
    end
    object BitBtnEditar: TLMDButton
      Left = 217
      Top = 386
      Width = 64
      Height = 21
      Cursor = crHandPoint
      Hint = 'Editar o registro corrente'
      Caption = '&Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtnEditarClick
      ButtonStyle = ubsExplorer
      Color = clActiveBorder
      NumGlyphs = 2
      ParentColor = False
      OnMouseEnter = BitBtnEditarMouseEnter
      OnMouseExit = BitBtnEditarMouseExit
    end
    object BitBtnCancelar: TLMDButton
      Left = 359
      Top = 386
      Width = 64
      Height = 21
      Cursor = crHandPoint
      Hint = 'Editar o registro corrente'
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtnCancelarClick
      ButtonStyle = ubsExplorer
      Color = clActiveBorder
      NumGlyphs = 2
      ParentColor = False
      OnMouseEnter = BitBtnCancelarMouseEnter
      OnMouseExit = BitBtnCancelarMouseExit
    end
    object BitBtnSalvar: TLMDButton
      Left = 288
      Top = 386
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
      TabOrder = 5
      OnClick = BitBtnSalvarClick
      ButtonStyle = ubsExplorer
      Color = clActiveBorder
      NumGlyphs = 2
      ParentColor = False
      OnMouseEnter = BitBtnSalvarMouseEnter
      OnMouseExit = BitBtnSalvarMouseExit
    end
    object BitBtnSair: TLMDButton
      Left = 528
      Top = 386
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
      TabOrder = 7
      OnClick = BitBtnSairClick
      ButtonStyle = ubsExplorer
      Color = clActiveBorder
      NumGlyphs = 2
      ParentColor = False
      OnMouseEnter = BitBtnSairMouseEnter
      OnMouseExit = BitBtnSairMouseExit
    end
    object DBEdit1: TDBEdit
      Left = 221
      Top = 4
      Width = 287
      Height = 21
      HelpContext = 250
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOMECOMPLETO'
      DataSource = DataSourceOperador
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 616
    Height = 31
    Bands = <>
    EdgeBorders = [ebTop, ebBottom]
    object BtnNovo: TSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Inclui novo Operador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888800000000000888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
        F0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFF
        F0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F08888880FFFFFF00
        888888800000000888888888888888888888}
      Layout = blGlyphBottom
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = BtnNovoClick
    end
    object BtnConsulta: TSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Consulta Operadores'
      BiDiMode = bdLeftToRight
      Glyph.Data = {
        FE040000424DFE04000000000000360000002800000016000000120000000100
        180000000000C8040000C30E0000C30E00000000000000000000BBBFBBBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB0000BBBF
        BBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB
        0000BBBFBBBFBFBFBFBFBF000000000000000000000000000000BFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBF000000000000000000000000000000BFBFBFBFBFBFBFBF
        BFBBBFBB0000BBBFBBBFBFBFBFBFBF000000FFFFFF000000000000000000BFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000000000BFBFBFBF
        BFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBF000000FFFFFF00000000000000
        0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000000000
        BFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBF000000000000000000
        000000000000000000000000BFBFBF0000000000000000000000000000000000
        00000000BFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBF0000000000
        00FFFFFF000000000000000000000000000000000000FFFFFF00000000000000
        0000000000000000BFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBF00
        0000000000FFFFFF000000000000000000C0C7C0000000000000FFFFFF000000
        000000000000000000000000BFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBF
        BFBFBF000000000000FFFFFF000000000000000000C0C7C0000000000000FFFF
        FF000000000000000000000000000000BFBFBFBFBFBFBFBFBFBBBFBB0000BBBF
        BBBFBFBFBFBFBFBFBFBF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBBBFBB
        0000BBBFBBBFBFBFBFBFBFBFBFBFBFBFBF000000FFFFFF000000000000000000
        BFBFBF000000FFFFFF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBBBFBB0000BBBFBBBFBFBFBFBFBFBFBFBFBFBFBF0000000000000000000000
        00000000BFBFBF000000000000000000000000000000BFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF00000000
        0000000000BFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        000000FFFFFF000000BFBFBFBFBFBFBFBFBF000000FFFFFF000000BFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBF000000000000000000BF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB0000BBBFBBBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBBBFBB0000BBBF
        BBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBB
        BFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBBBBBFBB
        0000}
      Layout = blGlyphBottom
      ParentShowHint = False
      ParentBiDiMode = False
      ShowHint = True
      Spacing = 0
      OnClick = BtnConsultaClick
    end
    object BtnExclui: TSpeedButton
      Left = 51
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Exclui o Operador atual'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333888F33333333313333333333133333338F8F333333331113333333
        33333333338F8F33333333111133333331333333338F8F333333333111333333
        13333333338F8F33333333331113333113333333FF8F8FFFF333333331113311
        3333333888838888F333333333111113333333383F3333383333333333311133
        333333338F33338F33333333331111133333333383F333833333333331113311
        3333333338F338F3333333311113333113333333383F38333333331111333333
        11333333338F8F33333333111333333333133333338383333333333333333333
        333333333338F333333333333333333333333333333833333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnExcluiClick
    end
    object ShadowLabel1: TfcLabel
      Left = 78
      Top = 2
      Width = 535
      Height = 23
      AutoSize = False
      Caption = 'Cadastro de Operadores'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Pitch = fpFixed
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
  end
  object PanelSenha: TPanel
    Left = 18
    Top = 70
    Width = 228
    Height = 123
    TabOrder = 2
    object Label5: TLabel
      Left = 9
      Top = 68
      Width = 60
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Conf. Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 9
      Top = 20
      Width = 60
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 9
      Top = 44
      Width = 60
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 9
      Top = 92
      Width = 60
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Acesso at'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object EditSenhaConf: TEdit
      Left = 74
      Top = 68
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      OnExit = EditSenhaConfExit
      OnKeyDown = EditSenhaConfKeyDown
    end
    object DBEditNome: TDBEdit
      Left = 74
      Top = 20
      Width = 126
      Height = 21
      HelpContext = 250
      CharCase = ecUpperCase
      Color = clWhite
      DataField = 'NOME'
      DataSource = DataSourceOperador
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 74
      Top = 92
      Width = 70
      Height = 21
      DataField = 'VALIDADE'
      DataSource = DataSourceOperador
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEditSenha: TDBEdit
      Left = 74
      Top = 44
      Width = 70
      Height = 21
      DataField = 'SENHA'
      DataSource = DataSourceOperador
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object MainMenu1: TMainMenu
    Left = 165
    Top = 101
    object OpcaoExcluir: TMenuItem
      Caption = '&Arquivo'
      object Opcaonovo: TMenuItem
        Caption = '&Novo'
        Hint = 'Inclui novo Operador'
        ShortCut = 115
        OnClick = OpcaonovoClick
      end
      object OpcaoConsulta: TMenuItem
        Caption = '&Consultar'
        Hint = 'Consulta Operadores'
        ShortCut = 113
        OnClick = OpcaoConsultaClick
      end
      object Excluir1: TMenuItem
        Caption = '&Excluir'
        Hint = 'Exclui o Operador atual'
        ShortCut = 114
        OnClick = Excluir1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object OpcaoFechar: TMenuItem
        Caption = '&Fechar'
        Hint = 'Retorna ao menu principal'
        OnClick = OpcaoFecharClick
      end
    end
  end
  object ADODataSetOperador: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    AfterEdit = ADODataSetOperadorAfterEdit
    BeforePost = ADODataSetOperadorBeforePost
    SQL.Strings = (
      'SELECT * FROM OPERADOR WHERE CODIGO = :pCodOperador')
    ParamCheck = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'pCodOperador'
        ParamType = ptUnknown
      end>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 62
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pCodOperador'
        ParamType = ptUnknown
      end>
    object ADODataSetOperadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object ADODataSetOperadorNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object ADODataSetOperadorSENHA: TStringField
      FieldName = 'SENHA'
      Size = 6
    end
    object ADODataSetOperadorVALIDADE: TDateTimeField
      FieldName = 'VALIDADE'
      OnSetText = ADODataSetOperadorVALIDADESetText
      EditMask = '##/##/####'
    end
    object ADODataSetOperadorDESATIVADO: TStringField
      FieldName = 'DESATIVADO'
      Size = 1
    end
    object ADODataSetOperadorALTERA_SENHA: TStringField
      FieldName = 'ALTERA_SENHA'
      Size = 1
    end
    object ADODataSetOperadorSEGUNDA: TStringField
      FieldName = 'SEGUNDA'
      Size = 1
    end
    object ADODataSetOperadorTERCA: TStringField
      FieldName = 'TERCA'
      Size = 1
    end
    object ADODataSetOperadorQUARTA: TStringField
      FieldName = 'QUARTA'
      Size = 1
    end
    object ADODataSetOperadorQUINTA: TStringField
      FieldName = 'QUINTA'
      Size = 1
    end
    object ADODataSetOperadorSEXTA: TStringField
      FieldName = 'SEXTA'
      Size = 1
    end
    object ADODataSetOperadorSABADO: TStringField
      FieldName = 'SABADO'
      Size = 1
    end
    object ADODataSetOperadorDOMINGO: TStringField
      FieldName = 'DOMINGO'
      Size = 1
    end
    object ADODataSetOperadorACESSOTODAS: TStringField
      FieldName = 'ACESSOTODAS'
      Size = 1
    end
    object ADODataSetOperadorTODOSAMBIENTES: TStringField
      FieldName = 'TODOSAMBIENTES'
      Size = 1
    end
    object ADODataSetOperadorMUDAR_SENHA_NOLOGON: TStringField
      FieldName = 'MUDAR_SENHA_NOLOGON'
      Size = 1
    end
    object ADODataSetOperadorTODASUNIDADES: TStringField
      FieldName = 'TODASUNIDADES'
      Size = 1
    end
    object ADODataSetOperadorNOMECOMPLETO: TStringField
      FieldName = 'NOMECOMPLETO'
      Size = 60
    end
  end
  object ADODataSetOpcoes: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM OP_OPERADOR WHERE CODOPERADOR = :CODIGO')
    ParamCheck = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    DataSource = DataSourceOperador
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 174
    Top = 227
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object ADODataSetOpcoesACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
    object ADODataSetOpcoesCADASTRAR: TIntegerField
      FieldName = 'CADASTRAR'
    end
    object ADODataSetOpcoesALTERAR: TIntegerField
      FieldName = 'ALTERAR'
    end
    object ADODataSetOpcoesEXCLUIR: TIntegerField
      FieldName = 'EXCLUIR'
    end
    object ADODataSetOpcoesLIBERADO: TIntegerField
      FieldName = 'LIBERADO'
    end
    object ADODataSetOpcoesCODOPERADOR: TIntegerField
      FieldName = 'CODOPERADOR'
    end
  end
  object DataSourceOperador: TDataSource
    AutoEdit = False
    DataSet = ADODataSetOperador
    OnStateChange = DataSourceOperadorStateChange
    Left = 62
    Top = 274
  end
  object DataSourceOpcoes: TDataSource
    AutoEdit = False
    DataSet = JvMemoryDataOpcoes
    Left = 174
    Top = 275
  end
  object JvMemoryDataOpcoes: TJvMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'OPCAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CADASTRO'
        DataType = ftInteger
      end
      item
        Name = 'ALTERACAO'
        DataType = ftInteger
      end
      item
        Name = 'EXCLUSAO'
        DataType = ftInteger
      end
      item
        Name = 'LIBERACAO'
        DataType = ftInteger
      end
      item
        Name = 'ACESSO'
        DataType = ftInteger
      end
      item
        Name = 'UNICO'
        DataType = ftInteger
      end>
    OnCalcFields = JvMemoryDataOpcoesCalcFields
    Left = 436
    Top = 224
    object JvMemoryDataOpcoesOPCAO: TStringField
      FieldName = 'OPCAO'
      Size = 60
    end
    object JvMemoryDataOpcoesCADASTRO: TIntegerField
      FieldName = 'CADASTRO'
      OnSetText = JvMemoryDataOpcoesCADASTROSetText
    end
    object JvMemoryDataOpcoesALTERACAO: TIntegerField
      FieldName = 'ALTERACAO'
      OnSetText = JvMemoryDataOpcoesALTERACAOSetText
    end
    object JvMemoryDataOpcoesEXCLUSAO: TIntegerField
      FieldName = 'EXCLUSAO'
      OnSetText = JvMemoryDataOpcoesEXCLUSAOSetText
    end
    object JvMemoryDataOpcoesLIBERACAO: TIntegerField
      FieldName = 'LIBERACAO'
      OnSetText = JvMemoryDataOpcoesLIBERACAOSetText
    end
    object JvMemoryDataOpcoesACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
    object JvMemoryDataOpcoesUNICO: TIntegerField
      FieldName = 'UNICO'
    end
    object JvMemoryDataOpcoesCALC_OPCAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_OPCAO'
      Size = 60
      Calculated = True
    end
  end
  object ADODataSetAcesso: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM ACESSO ORDER BY ACESSO')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 435
    Top = 272
    object ADODataSetAcessoACESSO: TIntegerField
      FieldName = 'ACESSO'
    end
    object ADODataSetAcessoMODULO: TStringField
      FieldName = 'MODULO'
    end
    object ADODataSetAcessoMENU: TStringField
      FieldName = 'MENU'
    end
    object ADODataSetAcessoOPCAO: TStringField
      FieldName = 'OPCAO'
      Size = 50
    end
    object ADODataSetAcessoACESSO_UNICO: TIntegerField
      FieldName = 'ACESSO_UNICO'
    end
  end
  object ADODataSetDiversos: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = False
    CachedUpdates = False
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 303
    Top = 226
  end
  object ZQueryOperador: TZQuery
    Connection = FrmDataModule.ZConnection1
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'Select * From Acesso')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 303
    Top = 277
  end
end
