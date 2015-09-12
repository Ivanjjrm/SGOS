object FrmEquipamento: TFrmEquipamento
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Equipamento'
  ClientHeight = 254
  ClientWidth = 477
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
    Width = 66
    Height = 13
    Caption = 'Equipamento:'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object Eequipamento: TEdit
    Left = 8
    Top = 27
    Width = 353
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = EequipamentoKeyPress
  end
  object Ebusca: TEdit
    Left = 8
    Top = 69
    Width = 353
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = EbuscaKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 96
    Width = 353
    Height = 153
    DataSource = DataSourceBusca
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_EQUIP'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_EQUIP'
        Title.Caption = 'Equipamento'
        Width = 200
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
    Left = 367
    Top = -1
    Width = 124
    Height = 260
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 2
      Top = 113
      Width = 109
      Height = 35
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 181
      Width = 109
      Height = 35
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 2
      Top = 147
      Width = 109
      Height = 35
      Caption = 'cancelar'
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 2
      Top = 215
      Width = 109
      Height = 35
      Caption = 'Sair'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object Eid: TEdit
      Left = 16
      Top = 54
      Width = 57
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
    Left = 232
  end
  object DataSourceBusca: TDataSource
    DataSet = IBQuerybusca
    Left = 104
    Top = 8
  end
  object IBQuerybusca: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM EQUIPAMENTO')
    Left = 216
    Top = 64
    object IBQuerybuscaID_EQUIP: TIntegerField
      FieldName = 'ID_EQUIP'
      Origin = '"EQUIPAMENTO"."ID_EQUIP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuerybuscaNOME_EQUIP: TIBStringField
      FieldName = 'NOME_EQUIP'
      Origin = '"EQUIPAMENTO"."NOME_EQUIP"'
      Size = 50
    end
    object IBQuerybuscaDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = '"EQUIPAMENTO"."DATA_CAD"'
    end
  end
end
