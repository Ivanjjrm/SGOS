object NovoReceber: TNovoReceber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Nova Conta'
  ClientHeight = 159
  ClientWidth = 416
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
    Left = 128
    Top = 51
    Width = 74
    Height = 13
    Caption = 'Data da Conta:'
  end
  object Label2: TLabel
    Left = 239
    Top = 52
    Width = 85
    Height = 13
    Caption = 'Data Vencimento:'
  end
  object Label3: TLabel
    Left = 8
    Top = 51
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Label5: TLabel
    Left = 8
    Top = 97
    Width = 56
    Height = 13
    Caption = 'Referencia:'
  end
  object Label6: TLabel
    Left = 279
    Top = 116
    Width = 49
    Height = 13
    Caption = 'Recebida?'
  end
  object TEdit
    Left = 8
    Top = 24
    Width = 265
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 271
    Top = 22
    Width = 58
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 70
    Width = 89
    Height = 21
    Date = 42116.621233518520000000
    Time = 42116.621233518520000000
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 239
    Top = 70
    Width = 89
    Height = 21
    Date = 42116.621233518520000000
    Time = 42116.621233518520000000
    TabOrder = 3
  end
  object Evalor: TEdit
    Left = 8
    Top = 70
    Width = 81
    Height = 21
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 335
    Top = -4
    Width = 185
    Height = 168
    TabOrder = 5
    object BitBtn2: TBitBtn
      Left = 0
      Top = 126
      Width = 81
      Height = 31
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 66
      Width = 81
      Height = 31
      Caption = 'Gravar'
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 0
      Top = 96
      Width = 81
      Height = 31
      Caption = 'Cancelar'
      TabOrder = 2
    end
  end
  object Memo2: TMemo
    Left = 8
    Top = 113
    Width = 265
    Height = 40
    TabOrder = 6
  end
  object ComboBox1: TComboBox
    Left = 278
    Top = 132
    Width = 54
    Height = 21
    Style = csDropDownList
    ItemIndex = 1
    TabOrder = 7
    Text = 'NAO'
    Items.Strings = (
      'SIM'
      'NAO')
  end
end
