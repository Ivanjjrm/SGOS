object Gos: TGos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Ordens de Servi'#231'o'
  ClientHeight = 434
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 1
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 392
    Top = 3
    Width = 41
    Height = 13
    Caption = 'Dt. inicio'
  end
  object Label3: TLabel
    Left = 482
    Top = 3
    Width = 56
    Height = 13
    Caption = 'Dt. Termino'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 49
    Width = 641
    Height = 380
    DataSource = DataSourceBusca
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_OS'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CAD_FK'
        Title.Caption = 'Cliente'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Cliente'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ABERTA'
        Title.Caption = 'Dt. Aberta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_FECHADA'
        Title.Caption = 'Dt. Fechamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object Ebusca: TEdit
    Left = 8
    Top = 20
    Width = 281
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 287
    Top = 18
    Width = 34
    Height = 25
    Caption = 'B'
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 327
    Top = 22
    Width = 106
    Height = 21
    Date = 42113.677036585650000000
    Time = 42113.677036585650000000
    TabOrder = 3
  end
  object DateTimePicker2: TDateTimePicker
    Left = 439
    Top = 22
    Width = 99
    Height = 21
    Date = 42113.677036585650000000
    Time = 42113.677036585650000000
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 655
    Top = -7
    Width = 185
    Height = 457
    TabOrder = 5
    object Label4: TLabel
      Left = 5
      Top = 14
      Width = 72
      Height = 13
      Caption = 'Busca Tipo O.S'
    end
    object BitBtn4: TBitBtn
      Left = 0
      Top = 332
      Width = 121
      Height = 36
      Caption = 'Abrir'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 402
      Width = 121
      Height = 36
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 297
      Width = 121
      Height = 36
      Caption = 'Nova O.S'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object ComboBox1: TComboBox
      Left = 5
      Top = 33
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'ABERTA'
      Items.Strings = (
        'ABERTA'
        'FECHADA'
        'CANCELADA'
        'TODAS')
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 367
      Width = 121
      Height = 36
      Caption = 'Cancelar O.S'
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 227
      Width = 121
      Height = 36
      Caption = 'Rel'#225'torio da Busca'
      TabOrder = 5
    end
    object BitBtn7: TBitBtn
      Left = 0
      Top = 262
      Width = 121
      Height = 36
      Caption = 'Rel'#225'rio Detalhe O.S'
      TabOrder = 6
    end
  end
  object BitBtn8: TBitBtn
    Left = 544
    Top = 8
    Width = 49
    Height = 35
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 599
    Top = 8
    Width = 50
    Height = 35
    Caption = 'Limpar'
    TabOrder = 7
  end
  object IBQuerygrid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,O.TOTAL,O.DATA_ABERTA,O.DATA_F' +
        'ECHADA,O.STATUS FROM OS AS O'
      'INNER JOIN PESSOA AS P ON P.ID_CAD = O.ID_CAD_FK')
    Left = 320
    Top = 192
  end
  object DataSourceBusca: TDataSource
    DataSet = IBQuerygrid
    Left = 392
    Top = 192
  end
end