object ItemOs: TItemOs
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 411
  ClientWidth = 655
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
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 66
    Height = 13
    Caption = 'Equipamento:'
  end
  object Label3: TLabel
    Left = 319
    Top = 8
    Width = 94
    Height = 13
    Caption = 'Defeito Reclamado:'
  end
  object Label4: TLabel
    Left = 8
    Top = 182
    Width = 71
    Height = 13
    Caption = 'Equipamentos:'
  end
  object Label5: TLabel
    Left = 8
    Top = 92
    Width = 39
    Height = 13
    Caption = 'Servi'#231'o:'
  end
  object Label6: TLabel
    Left = 239
    Top = 92
    Width = 103
    Height = 13
    Caption = 'Descri'#231#227'o do Servi'#231'o:'
  end
  object Label7: TLabel
    Left = 196
    Top = 367
    Width = 53
    Height = 13
    Caption = 'Sub. Total:'
  end
  object Label8: TLabel
    Left = 335
    Top = 367
    Width = 49
    Height = 13
    Caption = 'Desconto:'
  end
  object Label9: TLabel
    Left = 456
    Top = 367
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object Label11: TLabel
    Left = 8
    Top = 135
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Edit1: TEdit
    Left = 8
    Top = 22
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 8
    Top = 65
    Width = 305
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 319
    Top = 22
    Width = 218
    Height = 64
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 201
    Width = 529
    Height = 160
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 108
    Width = 225
    Height = 21
    TabOrder = 4
  end
  object Memo2: TMemo
    Left = 239
    Top = 108
    Width = 203
    Height = 87
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 196
    Top = 382
    Width = 100
    Height = 21
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 335
    Top = 382
    Width = 81
    Height = 21
    TabOrder = 7
  end
  object Edit5: TEdit
    Left = 456
    Top = 382
    Width = 81
    Height = 21
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 543
    Top = -2
    Width = 142
    Height = 423
    TabOrder = 9
    object Label10: TLabel
      Left = 8
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Data O.S'
    end
    object BitBtn4: TBitBtn
      Left = 0
      Top = 258
      Width = 113
      Height = 45
      Caption = 'Fechar O.S'
      TabOrder = 0
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 360
      Width = 113
      Height = 45
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 309
      Width = 113
      Height = 45
      Caption = 'Cancelar O.S'
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 135
    Width = 89
    Height = 29
    Caption = 'Cancelar'
    TabOrder = 10
  end
  object BitBtn2: TBitBtn
    Left = 448
    Top = 104
    Width = 89
    Height = 29
    Caption = 'Lan'#231'ar'
    TabOrder = 11
  end
  object BitBtn3: TBitBtn
    Left = 448
    Top = 166
    Width = 89
    Height = 29
    Caption = 'Excluir'
    TabOrder = 12
  end
  object Edit6: TEdit
    Left = 549
    Top = 22
    Width = 100
    Height = 21
    TabOrder = 13
  end
  object Edit7: TEdit
    Left = 8
    Top = 148
    Width = 81
    Height = 21
    TabOrder = 14
  end
end