object Servico: TServico
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Servi'#231'o'
  ClientHeight = 307
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Desc. Servi'#231'o:'
  end
  object Label2: TLabel
    Left = 343
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object Eservico: TEdit
    Left = 8
    Top = 24
    Width = 297
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 0
    OnKeyPress = EservicoKeyPress
  end
  object Evalor: TEdit
    Left = 342
    Top = 24
    Width = 82
    Height = 21
    MaxLength = 10
    TabOrder = 1
    Text = '0,00'
    OnExit = EvalorExit
    OnKeyPress = EvalorKeyPress
  end
  object Ebusca: TEdit
    Left = 8
    Top = 65
    Width = 416
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 60
    TabOrder = 3
    OnKeyPress = EbuscaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 92
    Width = 416
    Height = 211
    DataSource = DataSourcegrid
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_SERV'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_SERV'
        Title.Caption = 'Servi'#231'o'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CAD'
        Title.Caption = 'Dt. Cadastro'
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 428
    Top = -5
    Width = 121
    Height = 315
    TabOrder = 2
    object BitBtn4: TBitBtn
      Left = 1
      Top = 172
      Width = 109
      Height = 35
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 1
      Top = 206
      Width = 109
      Height = 35
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 240
      Width = 109
      Height = 35
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 2
      Top = 273
      Width = 109
      Height = 35
      Caption = 'Sair'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object Eid: TEdit
      Left = 8
      Top = 51
      Width = 65
      Height = 21
      TabOrder = 4
      Visible = False
    end
  end
  object IBQuerycad: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 192
    Top = 48
  end
  object IBQueryGrid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM SERVICO')
    Left = 144
    Top = 144
    object IBQueryGridID_SERV: TIntegerField
      FieldName = 'ID_SERV'
      Origin = '"SERVICO"."ID_SERV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryGridDESC_SERV: TIBStringField
      FieldName = 'DESC_SERV'
      Origin = '"SERVICO"."DESC_SERV"'
      Size = 70
    end
    object IBQueryGridDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = '"SERVICO"."DATA_CAD"'
    end
    object IBQueryGridVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"SERVICO"."VALOR"'
      Precision = 9
      Size = 2
    end
  end
  object DataSourcegrid: TDataSource
    DataSet = IBQueryGrid
    Left = 272
    Top = 144
  end
end
