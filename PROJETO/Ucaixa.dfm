object Caixa: TCaixa
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Caixa'
  ClientHeight = 387
  ClientWidth = 601
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
    Width = 41
    Height = 13
    Caption = 'Dt. Incio'
  end
  object Label2: TLabel
    Left = 120
    Top = 8
    Width = 34
    Height = 13
    Caption = 'Dt. Fim'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 51
    Width = 473
    Height = 328
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 24
    Width = 89
    Height = 21
    Date = 42116.853608634260000000
    Time = 42116.853608634260000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 120
    Top = 24
    Width = 89
    Height = 21
    Date = 42116.853608634260000000
    Time = 42116.853608634260000000
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 487
    Top = 0
    Width = 161
    Height = 398
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 0
      Top = 270
      Width = 113
      Height = 49
      Caption = 'Relat'#243'rio'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 325
      Width = 113
      Height = 49
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 160
      Width = 113
      Height = 49
      Caption = 'Lan'#231'ar Saida'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 215
      Width = 113
      Height = 49
      Caption = 'Lan'#231'ar Entrada'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object BitBtn4: TBitBtn
    Left = 232
    Top = 8
    Width = 75
    Height = 37
    Caption = 'Buscar'
    TabOrder = 4
  end
  object BitBtn5: TBitBtn
    Left = 406
    Top = 8
    Width = 75
    Height = 37
    Caption = 'Limpar Busca'
    TabOrder = 5
  end
end