object Form1: TForm1
  Left = 653
  Top = 266
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CryptoGear File Crypter'
  ClientHeight = 216
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblSite: TLabel
    Left = 168
    Top = 196
    Width = 89
    Height = 11
    Caption = 'Breaking-Security.net'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAbout: TLabel
    Left = 168
    Top = 168
    Width = 129
    Height = 22
    Caption = 'Encrypt/Decrypt any file using CryptoGear cipher.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 64
    Width = 145
    Height = 41
    Caption = 'Key:'
    TabOrder = 0
    object edtKey: TEdit
      Left = 8
      Top = 16
      Width = 129
      Height = 21
      TabOrder = 0
      Text = 'password'
    end
  end
  object grpMode: TGroupBox
    Left = 8
    Top = 106
    Width = 145
    Height = 57
    Caption = 'Mode of operation:'
    TabOrder = 1
    object rbECB: TRadioButton
      Left = 8
      Top = 16
      Width = 129
      Height = 17
      Caption = 'ECB (Faster)'
      TabOrder = 0
    end
    object rbCBC: TRadioButton
      Left = 8
      Top = 32
      Width = 129
      Height = 17
      Caption = 'CBC (Safer)'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object grpIV: TGroupBox
    Left = 8
    Top = 168
    Width = 145
    Height = 41
    Caption = 'Initialization Vector (0-255)'
    TabOrder = 2
    object edtIV: TEdit
      Left = 8
      Top = 16
      Width = 129
      Height = 21
      TabOrder = 0
      Text = '0'
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 49
    Caption = 'Encrypt / Decrypt File'
    TabOrder = 3
    object edtPath: TEdit
      Left = 8
      Top = 18
      Width = 201
      Height = 21
      TabOrder = 0
    end
    object btnBrowse: TButton
      Left = 216
      Top = 16
      Width = 81
      Height = 25
      Caption = 'Browse...'
      TabOrder = 1
      OnClick = btnBrowseClick
    end
  end
  object btnEncrypt: TButton
    Left = 168
    Top = 70
    Width = 145
    Height = 33
    Caption = 'Encrypt'
    TabOrder = 4
    OnClick = btnEncryptClick
  end
  object btnDecrypt: TButton
    Left = 168
    Top = 110
    Width = 145
    Height = 33
    Caption = 'Decrypt'
    TabOrder = 5
    OnClick = btnDecryptClick
  end
  object dlgOpen: TOpenDialog
    Left = 448
    Top = 16
  end
end
