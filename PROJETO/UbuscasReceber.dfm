object BuscaReceber: TBuscaReceber
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Contas a Receber'
  ClientHeight = 470
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 503
    Top = 13
    Width = 44
    Height = 13
    Caption = 'Dt. Final:'
  end
  object Label1: TLabel
    Left = 407
    Top = 13
    Width = 45
    Height = 13
    Caption = 'Dt. Incio:'
  end
  object Label2: TLabel
    Left = 319
    Top = 13
    Width = 71
    Height = 13
    Caption = 'Tipo de Conta:'
  end
  object Label3: TLabel
    Left = 8
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 273
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 279
    Top = 30
    Width = 34
    Height = 25
    Caption = 'B'
    TabOrder = 1
  end
  object MaskEdit1: TMaskEdit
    Left = 503
    Top = 32
    Width = 90
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object ComboBox1: TComboBox
    Left = 319
    Top = 32
    Width = 82
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Todas'
    Items.Strings = (
      'Todas'
      'Recebidas'
      'A Receber')
  end
  object MaskEdit2: TMaskEdit
    Left = 407
    Top = 32
    Width = 90
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 642
    Height = 393
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 656
    Top = 1
    Width = 129
    Height = 482
    TabOrder = 6
    object BitBtn4: TBitBtn
      Left = 0
      Top = 360
      Width = 109
      Height = 49
      Caption = 'Imprimir lista'
      TabOrder = 0
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 415
      Width = 109
      Height = 49
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 305
      Width = 109
      Height = 49
      Caption = 'Estornar'
      TabOrder = 2
    end
  end
  object BitBtn2: TBitBtn
    Left = 599
    Top = 30
    Width = 51
    Height = 25
    Caption = 'Buscar'
    TabOrder = 7
  end
  object BitBtn3: TBitBtn
    Left = 599
    Top = 3
    Width = 51
    Height = 25
    Caption = 'Limpar'
    TabOrder = 8
  end
end
