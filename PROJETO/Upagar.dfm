object Pagar: TPagar
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Contas a Pagar'
  ClientHeight = 418
  ClientWidth = 745
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
    Top = 13
    Width = 59
    Height = 13
    Caption = 'Fornecedor:'
  end
  object Label2: TLabel
    Left = 377
    Top = 13
    Width = 41
    Height = 13
    Caption = 'Dt. Incio'
  end
  object Label3: TLabel
    Left = 480
    Top = 13
    Width = 34
    Height = 13
    Caption = 'Dt. Fim'
  end
  object Label4: TLabel
    Left = 295
    Top = 13
    Width = 67
    Height = 13
    Caption = 'Tipo de Conta'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 254
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 263
    Top = 30
    Width = 26
    Height = 25
    Caption = 'B'
    TabOrder = 1
  end
  object DateTimePicker1: TDateTimePicker
    Left = 377
    Top = 32
    Width = 97
    Height = 21
    Date = 42116.631671423610000000
    Time = 42116.631671423610000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 480
    Top = 32
    Width = 97
    Height = 21
    Date = 42116.631671423610000000
    Time = 42116.631671423610000000
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 295
    Top = 32
    Width = 67
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 4
    Text = 'Todas'
    Items.Strings = (
      'Todas'
      'A pagar'
      'Pagas')
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 61
    Width = 626
    Height = 350
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn2: TBitBtn
    Left = 583
    Top = 30
    Width = 51
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
  end
  object BitBtn3: TBitBtn
    Left = 583
    Top = -1
    Width = 51
    Height = 25
    Caption = 'Limpar'
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 640
    Top = -8
    Width = 185
    Height = 457
    TabOrder = 8
    object BitBtn4: TBitBtn
      Left = 0
      Top = 271
      Width = 105
      Height = 49
      Caption = 'Pagar'
      TabOrder = 0
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 381
      Width = 105
      Height = 49
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 326
      Width = 105
      Height = 49
      Caption = 'Excluir'
      TabOrder = 2
    end
    object BitBtn7: TBitBtn
      Left = 0
      Top = 216
      Width = 105
      Height = 49
      Caption = 'Novo'
      TabOrder = 3
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 0
      Top = 161
      Width = 105
      Height = 49
      Caption = 'Imprimir Lista'
      TabOrder = 4
    end
  end
end
