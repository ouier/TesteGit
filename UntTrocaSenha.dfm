object FrmTrocaSenha: TFrmTrocaSenha
  Left = 252
  Top = 318
  Width = 359
  Height = 231
  Caption = 'Troca de Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 52
    Top = 18
    Width = 131
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Informe a nova senha: '
    Transparent = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 52
    Top = 50
    Width = 131
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Redigite a nova senha: '
    Transparent = True
    Layout = tlCenter
  end
  object EditNovaSenha: TEdit
    Left = 183
    Top = 18
    Width = 82
    Height = 21
    MaxLength = 10
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 183
    Top = 50
    Width = 82
    Height = 21
    MaxLength = 10
    TabOrder = 1
  end
end
