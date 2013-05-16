object FrmMudaASenha: TFrmMudaASenha
  Left = 243
  Top = 198
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe a Nova Senha'
  ClientHeight = 157
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 43
    Top = 23
    Width = 89
    Height = 22
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Digita a Senha'
    Transparent = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 43
    Top = 71
    Width = 89
    Height = 22
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Confirma a Senha'
    Transparent = True
    Layout = tlCenter
  end
  object JvShape3: TJvShape
    Left = 100
    Top = 122
    Width = 66
    Height = 23
    Brush.Style = bsClear
    Pen.Color = clBackground
  end
  object JvEnterAsTab1: TJvEnterAsTab
    Left = 189
    Top = 113
    Width = 28
    Height = 28
  end
  object EditSenhaNovaI: TEdit
    Left = 137
    Top = 24
    Width = 85
    Height = 21
    MaxLength = 6
    PasswordChar = '*'
    TabOrder = 0
  end
  object EditSenhaNovaII: TEdit
    Left = 137
    Top = 72
    Width = 85
    Height = 21
    MaxLength = 6
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtnSair: TLMDButton
    Left = 101
    Top = 123
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
    TabOrder = 2
    OnClick = BitBtnSairClick
    ButtonStyle = ubsExplorer
    Color = clActiveBorder
    NumGlyphs = 2
    ParentColor = False
  end
end
