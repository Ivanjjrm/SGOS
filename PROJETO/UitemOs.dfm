object FrmItemOs: TFrmItemOs
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 441
  ClientWidth = 669
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
    Left = 8
    Top = 47
    Width = 66
    Height = 13
    Caption = 'Equipamento:'
  end
  object Label3: TLabel
    Left = 8
    Top = 86
    Width = 94
    Height = 13
    Caption = 'Defeito Reclamado:'
  end
  object Label5: TLabel
    Left = 4
    Top = 143
    Width = 39
    Height = 13
    Caption = 'Servi'#231'o:'
  end
  object Label6: TLabel
    Left = 4
    Top = 184
    Width = 103
    Height = 13
    Caption = 'Descri'#231#227'o do Servi'#231'o:'
  end
  object Label7: TLabel
    Left = 8
    Top = 403
    Width = 53
    Height = 13
    Caption = 'Sub. Total:'
  end
  object Label8: TLabel
    Left = 112
    Top = 403
    Width = 49
    Height = 13
    Caption = 'Desconto:'
  end
  object Label9: TLabel
    Left = 212
    Top = 403
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object Label11: TLabel
    Left = 343
    Top = 143
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Bevel1: TBevel
    Left = 2
    Top = 403
    Width = 536
    Height = 38
  end
  object Label12: TLabel
    Left = 296
    Top = 47
    Width = 66
    Height = 13
    Caption = 'Identifica'#231#227'o:'
  end
  object Bevel2: TBevel
    Left = 3
    Top = 6
    Width = 537
    Height = 133
  end
  object Ecliente: TEdit
    Left = 8
    Top = 22
    Width = 529
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object MDefeito: TMemo
    Left = 8
    Top = 100
    Width = 529
    Height = 33
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 245
    Width = 533
    Height = 160
    DataSource = DataSourceGrid
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBLookupComboBoxServico: TDBLookupComboBox
    Left = 8
    Top = 157
    Width = 321
    Height = 21
    KeyField = 'ID_SERV'
    ListField = 'DESC_SERV'
    ListSource = DataSourceServ
    TabOrder = 3
  end
  object MDescServ: TMemo
    Left = 2
    Top = 197
    Width = 430
    Height = 40
    TabOrder = 4
  end
  object EsubTotal: TEdit
    Left = 6
    Top = 416
    Width = 100
    Height = 21
    TabOrder = 5
  end
  object Edesc: TEdit
    Left = 112
    Top = 416
    Width = 94
    Height = 21
    TabOrder = 6
  end
  object Etotal: TEdit
    Left = 212
    Top = 416
    Width = 94
    Height = 21
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 543
    Top = -2
    Width = 142
    Height = 459
    TabOrder = 8
    object Label10: TLabel
      Left = 8
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Data O.S'
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 318
      Width = 125
      Height = 42
      Caption = 'Fechar O.S'
      TabOrder = 0
    end
    object BitBtn5: TBitBtn
      Left = 1
      Top = 400
      Width = 124
      Height = 42
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 1
      Top = 359
      Width = 124
      Height = 42
      Caption = 'Cancelar O.S'
      TabOrder = 2
    end
    object Eidos: TEdit
      Left = 24
      Top = 65
      Width = 57
      Height = 21
      TabOrder = 3
      Visible = False
    end
    object Eiditem: TEdit
      Left = 24
      Top = 102
      Width = 65
      Height = 21
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 179
    Width = 89
    Height = 29
    Caption = 'Cancelar'
    TabOrder = 9
  end
  object BitBtn2: TBitBtn
    Left = 448
    Top = 148
    Width = 89
    Height = 29
    Caption = 'Lan'#231'ar'
    TabOrder = 10
  end
  object BitBtn3: TBitBtn
    Left = 448
    Top = 210
    Width = 89
    Height = 29
    Caption = 'Excluir'
    TabOrder = 11
  end
  object Edata: TEdit
    Left = 549
    Top = 22
    Width = 100
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object Evalor: TEdit
    Left = 343
    Top = 156
    Width = 91
    Height = 21
    TabOrder = 13
  end
  object Eidenfic: TEdit
    Left = 296
    Top = 63
    Width = 241
    Height = 21
    TabOrder = 14
  end
  object DBLookupComboBoxEquipamento: TDBLookupComboBox
    Left = 8
    Top = 63
    Width = 265
    Height = 21
    KeyField = 'ID_EQUIP'
    ListField = 'NOME_EQUIP'
    ListSource = DataSourceEquip
    TabOrder = 15
  end
  object IBQueryEquip: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from EQUIPAMENTO'
      'ORDER BY  NOME_EQUIP')
    Left = 88
    Top = 56
  end
  object IBQueryServ: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM SERVICO'
      'ORDER BY DESC_SERV')
    Left = 88
    Top = 152
  end
  object DataSourceEquip: TDataSource
    DataSet = IBQueryEquip
    Left = 128
    Top = 56
  end
  object DataSourceServ: TDataSource
    DataSet = IBQueryServ
    Left = 152
    Top = 160
  end
  object IBQueryGrid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 144
    Top = 248
  end
  object DataSourceGrid: TDataSource
    DataSet = IBQueryGrid
    Left = 256
    Top = 248
  end
end
