object FrmPerAgendamento: TFrmPerAgendamento
  Left = 297
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Per'#237'odo Agendamento'
  ClientHeight = 281
  ClientWidth = 273
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
  object Label1: TLabel
    Left = 26
    Top = 21
    Width = 87
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data Inicial: '
    Transparent = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 26
    Top = 48
    Width = 87
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Data Final: '
    Transparent = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 56
    Top = 83
    Width = 78
    Height = 13
    Caption = 'Dias de Eventos'
    Transparent = True
  end
  object bsSkinDateEditInicial: TbsSkinDateEdit
    Left = 115
    Top = 21
    Width = 101
    Height = 20
    EditMask = '!99/99/0000;1; '
    Text = '19/01/2009'
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 0
    UseSkinFont = True
    Date = 39832.624345717590000000
    TodayDefault = True
    CalendarWidth = 200
    CalendarHeight = 150
    CalendarFont.Charset = DEFAULT_CHARSET
    CalendarFont.Color = clWindowText
    CalendarFont.Height = 14
    CalendarFont.Name = 'Arial'
    CalendarFont.Style = []
    CalendarBoldDays = False
    CalendarUseSkinFont = True
    CalendarSkinDataName = 'panel'
    FirstDayOfWeek = Sun
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 20
    ButtonMode = True
    SkinData = FrmPrincipal.bsSkinData1
    SkinDataName = 'buttonedit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    OnKeyPress = bsSkinDateEditInicialKeyPress
  end
  object bsSkinDateEditFinal: TbsSkinDateEdit
    Left = 115
    Top = 48
    Width = 101
    Height = 20
    EditMask = '!99/99/0000;1; '
    Text = '19/01/2009'
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 0
    UseSkinFont = True
    Date = 39832.624345717590000000
    TodayDefault = True
    CalendarWidth = 200
    CalendarHeight = 150
    CalendarFont.Charset = DEFAULT_CHARSET
    CalendarFont.Color = clWindowText
    CalendarFont.Height = 14
    CalendarFont.Name = 'Arial'
    CalendarFont.Style = []
    CalendarBoldDays = False
    CalendarUseSkinFont = True
    CalendarSkinDataName = 'panel'
    FirstDayOfWeek = Sun
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 20
    ButtonMode = True
    SkinData = FrmPrincipal.bsSkinData1
    SkinDataName = 'buttonedit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
  end
  object BitBtnFechar: TBitBtn
    Left = 145
    Top = 241
    Width = 80
    Height = 32
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
  object CheckListBoxDiasEventos: TCheckListBox
    Left = 56
    Top = 98
    Width = 161
    Height = 132
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    IntegralHeight = True
    ItemHeight = 16
    Items.Strings = (
      'Domingo'
      'Segunda'
      'Ter'#231'a'
      'Quarta'
      'Quinta'
      'Sexta'
      'S'#225'bado')
    ParentFont = False
    TabOrder = 3
  end
  object BitBtnGravar: TBitBtn
    Left = 57
    Top = 241
    Width = 80
    Height = 32
    Hint = 'Retorna ao menu principal'
    Caption = '&Gravar'
    TabOrder = 4
    TabStop = False
    OnClick = BitBtnGravarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
end
