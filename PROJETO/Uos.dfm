object FrmNovaOs: TFrmNovaOs
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Nova  de Servi'#231'o'
  ClientHeight = 298
  ClientWidth = 716
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
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 346
    Top = 5
    Width = 66
    Height = 13
    Caption = 'Equipamento:'
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 94
    Height = 13
    Caption = 'Defeito Reclamado:'
  end
  object Label4: TLabel
    Left = 8
    Top = 165
    Width = 119
    Height = 13
    Caption = 'Equipamentos Lan'#231'ados:'
  end
  object Label6: TLabel
    Left = 8
    Top = 51
    Width = 60
    Height = 13
    Caption = 'Idenfica'#231#227'o:'
  end
  object Enome: TEdit
    Left = 8
    Top = 24
    Width = 305
    Height = 21
    Enabled = False
    TabOrder = 10
  end
  object BitBtn1: TBitBtn
    Left = 307
    Top = 22
    Width = 33
    Height = 25
    Caption = 'B'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 567
    Top = 22
    Width = 33
    Height = 25
    Caption = 'novo'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object Mdefeito: TMemo
    Left = 8
    Top = 110
    Width = 474
    Height = 49
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 606
    Top = -5
    Width = 235
    Height = 295
    TabOrder = 6
    object BitBtn4: TBitBtn
      Left = 0
      Top = 184
      Width = 110
      Height = 34
      Caption = 'gravar'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 0
      Top = 217
      Width = 110
      Height = 34
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 0
      Top = 250
      Width = 110
      Height = 34
      Caption = 'Sair'
      TabOrder = 2
      OnClick = BitBtn6Click
    end
    object Eidpessoa: TEdit
      Left = 15
      Top = 54
      Width = 56
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object DBEidOs: TDBEdit
      Left = 17
      Top = 27
      Width = 64
      Height = 21
      DataField = 'MAX'
      DataSource = DataSourcemax
      TabOrder = 4
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 184
    Width = 592
    Height = 107
    DataSource = DataSourcegrid
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_ITEM'
        Title.Caption = 'C'#243'digo'
        Width = 50
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
        FieldName = 'DEFEITO'
        Title.Caption = 'Defeito'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDENTIFICACAO'
        Title.Caption = 'Identifica'#231#227'o'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_EQUIP_FK'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_OS_FK'
        Visible = False
      end>
  end
  object BitBtn3: TBitBtn
    Left = 488
    Top = 125
    Width = 73
    Height = 34
    Caption = 'Lan'#231'ar'
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 346
    Top = 24
    Width = 215
    Height = 21
    KeyField = 'ID_EQUIP'
    ListField = 'NOME_EQUIP'
    ListSource = DataSourceEquip
    TabOrder = 1
    OnKeyDown = DBLookupComboBox1KeyDown
  end
  object Edesc: TEdit
    Left = 8
    Top = 65
    Width = 474
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object Eiditem: TEdit
    Left = 192
    Top = 165
    Width = 33
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object BitBtn7: TBitBtn
    Left = 488
    Top = 85
    Width = 73
    Height = 34
    Caption = 'Limpar'
    TabOrder = 9
    OnClick = BitBtn7Click
  end
  object IBQueryEquip: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM EQUIPAMENTO ORDER BY NOME_EQUIP')
    Left = 384
    Top = 32
    object IBQueryEquipID_EQUIP: TIntegerField
      FieldName = 'ID_EQUIP'
      Origin = '"EQUIPAMENTO"."ID_EQUIP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryEquipNOME_EQUIP: TIBStringField
      FieldName = 'NOME_EQUIP'
      Origin = '"EQUIPAMENTO"."NOME_EQUIP"'
      Size = 50
    end
    object IBQueryEquipDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = '"EQUIPAMENTO"."DATA_CAD"'
    end
  end
  object DataSourceEquip: TDataSource
    DataSet = IBQueryEquip
    Left = 440
    Top = 24
  end
  object IBQuerycad: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 622
    Top = 108
  end
  object IBQuerymax: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(OS.ID_OS) FROM OS')
    Left = 654
    Top = 100
    object IBQuerymaxMAX: TIntegerField
      FieldName = 'MAX'
      ProviderFlags = []
    end
  end
  object DataSourcemax: TDataSource
    DataSet = IBQuerymax
    Left = 630
    Top = 148
  end
  object IBQuerygrid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.ID_EQUIP_FK,E.NOME_' +
        'EQUIP,I.ID_OS_FK FROM ITEM_OS AS I INNER JOIN'
      'EQUIPAMENTO AS E ON E.ID_EQUIP = I.ID_EQUIP_FK')
    Left = 72
    Top = 240
  end
  object DataSourcegrid: TDataSource
    DataSet = IBQuerygrid
    Left = 176
    Top = 248
  end
end
