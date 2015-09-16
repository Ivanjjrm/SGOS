object FrmPessoa: TFrmPessoa
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gest'#227'o de Pessoa'
  ClientHeight = 198
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label3: TLabel
    Left = 8
    Top = 153
    Width = 35
    Height = 13
    Caption = 'Tel/cel:'
  end
  object Label5: TLabel
    Left = 72
    Top = 96
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label6: TLabel
    Left = 209
    Top = 153
    Width = 52
    Height = 13
    Caption = 'CPF/CNPJ:'
  end
  object SpeedButton1: TSpeedButton
    Left = 359
    Top = 109
    Width = 25
    Height = 22
    Caption = '+'
    OnClick = SpeedButton1Click
  end
  object Label4: TLabel
    Left = 295
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Tipo Cad.'
  end
  object Label7: TLabel
    Left = 8
    Top = 96
    Width = 15
    Height = 13
    Caption = 'Uf:'
  end
  object Enome: TEdit
    Left = 8
    Top = 21
    Width = 281
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 0
  end
  object Eendereco: TEdit
    Left = 8
    Top = 69
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 2
  end
  object Etel: TEdit
    Left = 8
    Top = 166
    Width = 177
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object MaskEditCPF_CNPJ: TMaskEdit
    Left = 209
    Top = 169
    Width = 176
    Height = 21
    TabOrder = 6
    Text = ''
    OnExit = MaskEditCPF_CNPJExit
  end
  object Panel1: TPanel
    Left = 412
    Top = -6
    Width = 106
    Height = 233
    TabOrder = 7
    object BitBtn1: TBitBtn
      Left = 0
      Top = 136
      Width = 105
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 0
      Top = 104
      Width = 105
      Height = 33
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 0
      Top = 168
      Width = 105
      Height = 33
      Caption = 'Sair'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 0
      Top = 72
      Width = 105
      Height = 33
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = BitBtn4Click
    end
  end
  object Eid: TEdit
    Left = 412
    Top = 21
    Width = 60
    Height = 21
    Enabled = False
    TabOrder = 8
    Visible = False
  end
  object DBLookupComboBoxcid: TDBLookupComboBox
    Left = 72
    Top = 109
    Width = 281
    Height = 21
    KeyField = 'ID_CID'
    ListField = 'NOME_CID'
    ListSource = DataSourcecid
    TabOrder = 4
  end
  object CBTipo: TComboBox
    Left = 295
    Top = 21
    Width = 90
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnExit = CBTipoExit
    Items.Strings = (
      'FISICO'
      'JURIDICO')
  end
  object CBEstado: TComboBox
    Left = 8
    Top = 109
    Width = 49
    Height = 21
    Style = csDropDownList
    ItemIndex = 19
    TabOrder = 3
    Text = 'RO'
    OnExit = CBEstadoExit
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RO'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object IBQuerycad: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 400
    Top = 2
  end
  object DataSourcecid: TDataSource
    DataSet = IBQuerycid
    Left = 192
    Top = 26
  end
  object IBQuerycid: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CIDADE')
    Left = 424
    Top = 26
    object IBQuerycidID_CID: TIntegerField
      FieldName = 'ID_CID'
      Origin = '"CIDADE"."ID_CID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuerycidNOME_CID: TIBStringField
      FieldName = 'NOME_CID'
      Origin = '"CIDADE"."NOME_CID"'
      Size = 100
    end
    object IBQuerycidUF: TIBStringField
      FieldName = 'UF'
      Origin = '"CIDADE"."UF"'
      Size = 2
    end
  end
  object IBQueryCPF_CNPJ: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 328
    Top = 42
  end
end
