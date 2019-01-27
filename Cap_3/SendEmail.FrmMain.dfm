object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Envio de correo electronico SMTP'
  ClientHeight = 371
  ClientWidth = 459
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
  object btnSendemail: TButton
    Left = 71
    Top = 327
    Width = 297
    Height = 34
    Cursor = crHandPoint
    Caption = 'Enviar Correo'
    TabOrder = 0
    OnClick = btnSendemailClick
  end
  object pgemail: TPageControl
    Left = 0
    Top = 0
    Width = 459
    Height = 321
    ActivePage = tsSend
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 3
    ExplicitTop = 1
    ExplicitWidth = 449
    object tsSend: TTabSheet
      Caption = 'Mensage de correo electronico'
      ExplicitLeft = -108
      ExplicitTop = 39
      ExplicitWidth = 377
      ExplicitHeight = 301
      object lblToEmail: TLabel
        Left = 19
        Top = 22
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Envia a :'
      end
      object lblAsunt: TLabel
        Left = 20
        Top = 49
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Asunto :'
      end
      object lblAttachment: TLabel
        Left = 16
        Top = 246
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Adjunto :'
      end
      object edtSentTo: TEdit
        Left = 71
        Top = 19
        Width = 320
        Height = 21
        TabOrder = 0
      end
      object edtAsunt: TEdit
        Left = 71
        Top = 46
        Width = 320
        Height = 21
        TabOrder = 1
      end
      object mmoMessage: TMemo
        Left = 71
        Top = 76
        Width = 320
        Height = 161
        Lines.Strings = (
          'esta es una prueba de envio de correo usando gmail'
          'en una aplicacion Delphi.')
        TabOrder = 2
      end
      object edtAttachment: TEdit
        Left = 72
        Top = 243
        Width = 320
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object btnOpenfile: TButton
        Left = 393
        Top = 241
        Width = 27
        Height = 25
        Cursor = crHandPoint
        Caption = '...'
        TabOrder = 4
        OnClick = btnOpenfileClick
      end
      object Pnl_Wait: TPanel
        Left = 187
        Top = 136
        Width = 64
        Height = 64
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
        Visible = False
        object ActivityInd_Wait: TActivityIndicator
          Left = 0
          Top = 0
          FrameDelay = 20
          IndicatorSize = aisXLarge
        end
      end
    end
    object tsSetting: TTabSheet
      Caption = 'Configuracion'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitWidth = 441
      object grpSetting: TGroupBox
        Left = 8
        Top = 8
        Width = 426
        Height = 276
        TabOrder = 0
        object lblHost: TLabel
          Left = 26
          Top = 27
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Server :'
        end
        object lblPort: TLabel
          Left = 271
          Top = 27
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Puerto :'
        end
        object lblEmail: TLabel
          Left = 34
          Top = 83
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Email :'
        end
        object lblPassword: TLabel
          Left = 12
          Top = 120
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Password :'
        end
        object lblName: TLabel
          Left = 12
          Top = 195
          Width = 161
          Height = 13
          Caption = 'Nombre que el destinatario vera :'
        end
        object edtHost: TEdit
          Left = 67
          Top = 24
          Width = 195
          Height = 21
          TabOrder = 0
          Text = 'smtp.gmail.com'
        end
        object edtPort: TEdit
          Left = 315
          Top = 24
          Width = 68
          Height = 21
          TabOrder = 1
          Text = '587'
        end
        object edtEmail: TEdit
          Left = 67
          Top = 80
          Width = 316
          Height = 21
          Alignment = taCenter
          TabOrder = 2
          Text = '@gmail.com'
        end
        object edtPassword: TEdit
          Left = 67
          Top = 117
          Width = 240
          Height = 21
          Alignment = taCenter
          PasswordChar = '*'
          TabOrder = 3
          Text = 'edtEmail'
        end
        object btnShow_hide: TButton
          Left = 312
          Top = 115
          Width = 35
          Height = 25
          Caption = 'Show'
          TabOrder = 4
          OnClick = btnShow_hideClick
        end
        object btnClear: TButton
          Left = 348
          Top = 115
          Width = 35
          Height = 26
          Caption = 'Clear'
          TabOrder = 5
          OnClick = btnClearClick
        end
        object edtNameRecipient: TEdit
          Left = 12
          Top = 214
          Width = 177
          Height = 21
          TabOrder = 7
          Text = 'Carlos Reyes'
        end
        object chkUseTLS: TCheckBox
          Left = 67
          Top = 152
          Width = 97
          Height = 17
          Cursor = crHandPoint
          Caption = 'TLS'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
      end
    end
  end
end
