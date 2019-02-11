object Frm1: TFrm1
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 288
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitle: TLabel
    Left = 0
    Top = 0
    Width = 551
    Height = 41
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'Formulario incrustado en panel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = -90
    ExplicitWidth = 641
  end
  object chk1: TCheckBox
    Left = 40
    Top = 72
    Width = 97
    Height = 17
    Caption = 'chk1'
    TabOrder = 0
  end
  object rb1: TRadioButton
    Left = 40
    Top = 112
    Width = 113
    Height = 17
    Caption = 'rb1'
    TabOrder = 1
  end
  object rb2: TRadioButton
    Left = 40
    Top = 136
    Width = 113
    Height = 17
    Caption = 'rb2'
    TabOrder = 2
  end
  object cbb1: TComboBox
    Left = 40
    Top = 168
    Width = 145
    Height = 21
    TabOrder = 3
    Text = 'cbb1'
  end
  object edt1: TEdit
    Left = 208
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edt1'
  end
  object btn1: TButton
    Left = 208
    Top = 104
    Width = 121
    Height = 25
    Caption = 'btn1'
    TabOrder = 5
  end
  object mmo1: TMemo
    Left = 352
    Top = 64
    Width = 185
    Height = 209
    Lines.Strings = (
      'mmo1')
    TabOrder = 6
  end
end
