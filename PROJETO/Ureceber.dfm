object Receber: TReceber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Contas a Receber'
  ClientHeight = 433
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 8
    Top = 228
    Width = 54
    Height = 13
    Caption = 'A Receber:'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Caption = 'Buscar por nome:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 67
    Width = 465
    Height = 148
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 247
    Width = 465
    Height = 181
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 8
    Top = 21
    Width = 321
    Height = 21
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 319
    Top = 19
    Width = 50
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 479
    Top = -4
    Width = 185
    Height = 437
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Sub. Total:'
    end
    object Label5: TLabel
      Left = 8
      Top = 45
      Width = 24
      Height = 13
      Caption = 'juros'
    end
    object Label6: TLabel
      Left = 8
      Top = 84
      Width = 27
      Height = 13
      Caption = 'Desc:'
    end
    object Label7: TLabel
      Left = 8
      Top = 125
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 389
      Width = 105
      Height = 44
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 303
      Width = 105
      Height = 44
      Caption = 'Receber'
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 0
      Top = 260
      Width = 105
      Height = 44
      Caption = 'Novo'
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 174
      Width = 105
      Height = 44
      Caption = 'Estatisticas'
      TabOrder = 3
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 217
      Width = 105
      Height = 44
      Caption = 'Extrato'
      TabOrder = 4
    end
    object BitBtn8: TBitBtn
      Left = 0
      Top = 346
      Width = 105
      Height = 44
      Caption = 'Excluir'
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 8
      Top = 21
      Width = 89
      Height = 21
      TabOrder = 6
    end
    object Edit3: TEdit
      Left = 8
      Top = 58
      Width = 89
      Height = 21
      TabOrder = 7
    end
    object Edit4: TEdit
      Left = 8
      Top = 98
      Width = 89
      Height = 21
      TabOrder = 8
    end
    object Edit5: TEdit
      Left = 8
      Top = 137
      Width = 89
      Height = 21
      TabOrder = 9
    end
  end
  object BitBtn7: TBitBtn
    Left = 407
    Top = 19
    Width = 66
    Height = 25
    Caption = 'Limpar Busc'
    TabOrder = 5
  end
end
