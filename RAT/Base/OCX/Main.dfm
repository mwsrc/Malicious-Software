object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Viotto ocx Registrator'
  ClientHeight = 165
  ClientWidth = 448
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
  object OcxList: TListView
    Left = 8
    Top = 8
    Width = 329
    Height = 150
    Checkboxes = True
    Columns = <
      item
        Caption = '.ocx name'
        Width = 220
      end
      item
        Caption = 'Exist in system32?'
        Width = 105
      end>
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
  end
  object GroupBoxUnregister: TGroupBox
    Left = 343
    Top = 84
    Width = 97
    Height = 34
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object ButtonUnregister: TButton
      Left = 3
      Top = 4
      Width = 89
      Height = 25
      Caption = 'Unregister'
      TabOrder = 0
      OnClick = ButtonUnregisterClick
    end
  end
  object GroupBoxRegister: TGroupBox
    Left = 343
    Top = 8
    Width = 97
    Height = 70
    TabOrder = 2
    object chkOverwrite: TCheckBox
      Left = 11
      Top = 34
      Width = 83
      Height = 26
      Caption = 'Overwrite if exists'
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      WordWrap = True
    end
    object ButtonRegister: TButton
      Left = 3
      Top = 3
      Width = 89
      Height = 25
      Caption = 'Register'
      TabOrder = 1
      OnClick = ButtonRegisterClick
    end
  end
  object InfoButton: TButton
    Left = 351
    Top = 132
    Width = 77
    Height = 25
    BiDiMode = bdLeftToRight
    Caption = 'Informations'
    ParentBiDiMode = False
    TabOrder = 3
    OnClick = InfoButtonClick
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 48
    object Refresh: TMenuItem
      Caption = 'Refresh'
      OnClick = RefreshClick
    end
  end
end
