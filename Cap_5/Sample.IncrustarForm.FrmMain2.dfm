object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Incrustar formularios .... Dev. Ing. Carlos Reyes'
  ClientHeight = 516
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgcSample: TPageControl
    Left = 0
    Top = 40
    Width = 794
    Height = 476
    Align = alClient
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 40
    Align = alTop
    Caption = 'pnl1'
    ShowCaption = False
    TabOrder = 1
    object btnCreatePage: TButton
      Left = 1
      Top = 2
      Width = 113
      Height = 34
      Caption = 'Crear paginas'
      TabOrder = 0
      OnClick = btnCreatePageClick
    end
    object btnChangeColorPage: TButton
      Left = 120
      Top = 2
      Width = 113
      Height = 34
      Caption = 'Crear paginas'
      TabOrder = 1
      OnClick = btnChangeColorPageClick
    end
  end
  object dlgColorPage: TColorDialog
    Color = clGray
    CustomColors.Strings = (
      'ColorA=FFFFFFFF'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 576
    Top = 152
  end
end
