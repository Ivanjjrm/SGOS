object FrmUsuario: TFrmUsuario
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o Usu'#225'rio'
  ClientHeight = 135
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label3: TLabel
    Left = 8
    Top = 89
    Width = 80
    Height = 13
    Caption = 'Confimar Senha:'
  end
  object Elogin: TEdit
    Left = 8
    Top = 21
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 30
    TabOrder = 0
  end
  object Esenha: TEdit
    Left = 8
    Top = 62
    Width = 193
    Height = 21
    MaxLength = 30
    PasswordChar = '*'
    TabOrder = 1
  end
  object EconfirmaSenha: TEdit
    Left = 8
    Top = 106
    Width = 193
    Height = 21
    MaxLength = 30
    PasswordChar = '*'
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 207
    Top = -6
    Width = 122
    Height = 143
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 0
      Top = 49
      Width = 81
      Height = 30
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 108
      Width = 81
      Height = 30
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 78
      Width = 81
      Height = 30
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
  end
  object IBQuerycad: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 128
    Top = 16
  end
end
