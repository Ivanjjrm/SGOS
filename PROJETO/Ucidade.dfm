object FrmCidade: TFrmCidade
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Cidade'
  ClientHeight = 240
  ClientWidth = 390
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
    Left = 239
    Top = 8
    Width = 17
    Height = 13
    Caption = 'UF:'
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Ecidade: TEdit
    Left = 8
    Top = 20
    Width = 209
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
    OnKeyPress = EcidadeKeyPress
  end
  object Euf: TEdit
    Left = 239
    Top = 20
    Width = 50
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 1
    OnExit = EufExit
    OnKeyPress = EufKeyPress
  end
  object Ebusca: TEdit
    Left = 8
    Top = 59
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnKeyPress = EbuscaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 86
    Width = 281
    Height = 153
    DataSource = DataSourcegrid
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CID'
        Title.Caption = 'Codigo'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CID'
        Title.Caption = 'Cidade'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Title.Caption = 'Uf'
        Width = 20
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 295
    Top = -6
    Width = 130
    Height = 255
    TabOrder = 4
    object BitBtn1: TBitBtn
      Left = 1
      Top = 92
      Width = 94
      Height = 40
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 131
      Width = 94
      Height = 38
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 168
      Width = 94
      Height = 39
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 206
      Width = 94
      Height = 39
      Caption = 'Sair'
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object Eid: TEdit
      Left = 15
      Top = 33
      Width = 42
      Height = 21
      TabOrder = 4
      Visible = False
    end
  end
  object IBQueryCad: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 136
    Top = 56
  end
  object IBQuerygrid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CIDADE')
    Left = 88
    Top = 56
    object IBQuerygridID_CID: TIntegerField
      FieldName = 'ID_CID'
      Origin = '"CIDADE"."ID_CID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuerygridNOME_CID: TIBStringField
      FieldName = 'NOME_CID'
      Origin = '"CIDADE"."NOME_CID"'
      Size = 100
    end
    object IBQuerygridUF: TIBStringField
      FieldName = 'UF'
      Origin = '"CIDADE"."UF"'
      Size = 2
    end
  end
  object DataSourcegrid: TDataSource
    DataSet = IBQuerygrid
    Left = 208
    Top = 152
  end
end
