object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sample operations'
  ClientHeight = 350
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    491
    350)
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 407
    Top = 317
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 475
    Height = 65
    Caption = 'Suma'
    TabOrder = 1
    object lblValorA: TLabel
      Left = 16
      Top = 27
      Width = 38
      Height = 13
      Caption = 'ValorA :'
    end
    object lblValorB: TLabel
      Left = 128
      Top = 27
      Width = 37
      Height = 13
      Caption = 'ValorB :'
    end
    object lblResult: TLabel
      Left = 238
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Resultado :'
    end
    object edtValorA: TEdit
      Left = 58
      Top = 24
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object edtValorB: TEdit
      Left = 169
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edtResult: TEdit
      Left = 298
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object btnRun: TButton
      Left = 381
      Top = 22
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Calcular'
      TabOrder = 3
      OnClick = btnRunClick
    end
  end
  object grpResta: TGroupBox
    Left = 8
    Top = 79
    Width = 475
    Height = 65
    Caption = 'Resta'
    TabOrder = 2
    object lblValorAResta: TLabel
      Left = 16
      Top = 27
      Width = 38
      Height = 13
      Caption = 'ValorA :'
    end
    object lblValorBResta: TLabel
      Left = 128
      Top = 27
      Width = 37
      Height = 13
      Caption = 'ValorB :'
    end
    object lblResultResta: TLabel
      Left = 238
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Resultado :'
    end
    object edtValorAResta: TEdit
      Left = 59
      Top = 24
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object edtValorBResta: TEdit
      Left = 169
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edtResultResta: TEdit
      Left = 298
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object btnRunResta: TButton
      Left = 381
      Top = 22
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Calcular'
      TabOrder = 3
      OnClick = btnRunRestaClick
    end
  end
  object grpmMulti: TGroupBox
    Left = 8
    Top = 150
    Width = 475
    Height = 65
    Caption = 'Multiplicar'
    TabOrder = 3
    object lblValorAMulti: TLabel
      Left = 16
      Top = 27
      Width = 38
      Height = 13
      Caption = 'ValorA :'
    end
    object lblValorBMulti: TLabel
      Left = 128
      Top = 27
      Width = 37
      Height = 13
      Caption = 'ValorB :'
    end
    object lblResultMulti: TLabel
      Left = 238
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Resultado :'
    end
    object edtValorAMulti: TEdit
      Left = 59
      Top = 24
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object edtValorBMulti: TEdit
      Left = 169
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edtResultMulti: TEdit
      Left = 298
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object btnRunMulti: TButton
      Left = 381
      Top = 22
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Calcular'
      TabOrder = 3
      OnClick = btnRunMultiClick
    end
  end
  object grpDividir: TGroupBox
    Left = 8
    Top = 221
    Width = 475
    Height = 65
    Caption = 'dividir'
    TabOrder = 4
    object lblValorADividir: TLabel
      Left = 16
      Top = 27
      Width = 38
      Height = 13
      Caption = 'ValorA :'
    end
    object lblValorBDividir: TLabel
      Left = 128
      Top = 27
      Width = 37
      Height = 13
      Caption = 'ValorB :'
    end
    object lblResulDividir: TLabel
      Left = 238
      Top = 27
      Width = 55
      Height = 13
      Caption = 'Resultado :'
    end
    object edtValorADividir: TEdit
      Left = 59
      Top = 24
      Width = 64
      Height = 21
      TabOrder = 0
    end
    object edtValorBDividir: TEdit
      Left = 169
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edtResultDividir: TEdit
      Left = 298
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object btnRunDividir: TButton
      Left = 381
      Top = 22
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Calcular'
      TabOrder = 3
      OnClick = btnRunDividirClick
    end
  end
end
