object FrmEscolhaUnid: TFrmEscolhaUnid
  Left = 167
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Escolha de Unidade'
  ClientHeight = 124
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 30
    Top = 34
    Width = 69
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Unidade: '
    Transparent = True
    Layout = tlCenter
  end
  object JvShape12: TJvShape
    Left = 160
    Top = 84
    Width = 68
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvShape1: TJvShape
    Left = 231
    Top = 84
    Width = 68
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object ButtonBuscaUnid: TButton
    Left = 405
    Top = 34
    Width = 24
    Height = 20
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = ButtonBuscaUnidClick
  end
  object LMDButtonOk: TLMDButton
    Left = 161
    Top = 85
    Width = 66
    Height = 21
    Cursor = crHandPoint
    Hint = 'Editar o registro corrente'
    Caption = '&Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = LMDButtonOkClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object LMDButtonSair: TLMDButton
    Left = 232
    Top = 85
    Width = 66
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
    TabOrder = 3
    OnClick = LMDButtonSairClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
  object EditUnidade: TEdit
    Left = 99
    Top = 34
    Width = 304
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnKeyDown = EditUnidadeKeyDown
  end
end
