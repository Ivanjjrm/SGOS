object FrmBuscaPessoa: TFrmBuscaPessoa
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Buscar Pessoa'
  ClientHeight = 337
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 512
    Top = 0
    Width = 113
    Height = 339
  end
  object Ebusca: TEdit
    Left = 8
    Top = 47
    Width = 417
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = EbuscaKeyPress
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 2
    Width = 369
    Height = 39
    Caption = 'Tipo de Busca:'
    Columns = 4
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome:'
      'CPF:'
      'CNPJ:')
    TabOrder = 4
    OnClick = RadioGroup1Click
  end
  object BitBtn1: TBitBtn
    Left = 431
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 74
    Width = 497
    Height = 255
    DataSource = DataSourcebusca
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CAD'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = 'Tel\Cel'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CID_FK'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME_CID'
        Title.Caption = 'Cidade'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF_CNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CAD'
        Title.Caption = 'Dt. Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_CAD'
        Title.Caption = 'Tipo Cadastro'
        Width = 70
        Visible = True
      end>
  end
  object MaskEditCPF_CNPJ: TMaskEdit
    Left = 8
    Top = 47
    Width = 137
    Height = 21
    TabOrder = 5
    Text = ''
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 511
    Top = 159
    Width = 111
    Height = 38
    Caption = 'Ok'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 512
    Top = 203
    Width = 111
    Height = 38
    Caption = 'Altarar'
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 512
    Top = 247
    Width = 110
    Height = 38
    BiDiMode = bdRightToLeft
    Caption = 'Novo'
    ParentBiDiMode = False
    PopupMenu = PopupMenu1
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 512
    Top = 291
    Width = 111
    Height = 38
    Caption = 'Sair'
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object IBQueryBusca: TIBQuery
    Database = Form1.IBDatabase
    Transaction = Form1.IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT P.ID_CAD, P.NOME,P.TEL, P.ENDERECO,P.ID_CID_FK,C.NOME_CID' +
        ',P.CPF_CNPJ,P.DATA_CAD,P.TIPO_CAD'
      
        ' FROM PESSOA AS P INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_C' +
        'ID')
    Left = 464
    Top = 112
    object IBQueryBuscaID_CAD: TIntegerField
      FieldName = 'ID_CAD'
      Origin = '"PESSOA"."ID_CAD"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryBuscaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"PESSOA"."NOME"'
      Size = 100
    end
    object IBQueryBuscaTEL: TIBStringField
      FieldName = 'TEL'
      Origin = '"PESSOA"."TEL"'
      Size = 14
    end
    object IBQueryBuscaENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = '"PESSOA"."ENDERECO"'
      Size = 100
    end
    object IBQueryBuscaID_CID_FK: TIntegerField
      FieldName = 'ID_CID_FK'
      Origin = '"PESSOA"."ID_CID_FK"'
    end
    object IBQueryBuscaNOME_CID: TIBStringField
      FieldName = 'NOME_CID'
      Origin = '"CIDADE"."NOME_CID"'
      Size = 100
    end
    object IBQueryBuscaCPF_CNPJ: TIBStringField
      FieldName = 'CPF_CNPJ'
      Origin = '"PESSOA"."CPF_CNPJ"'
      Size = 19
    end
    object IBQueryBuscaDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = '"PESSOA"."DATA_CAD"'
    end
    object IBQueryBuscaTIPO_CAD: TIBStringField
      FieldName = 'TIPO_CAD'
      Origin = '"PESSOA"."TIPO_CAD"'
      Size = 8
    end
  end
  object DataSourcebusca: TDataSource
    DataSet = IBQueryBusca
    Left = 424
    Top = 168
  end
  object PopupMenu1: TPopupMenu
    Alignment = paRight
    Left = 264
    Top = 168
    object PessoaFsica1: TMenuItem
      Caption = 'Pessoa F'#237'sica'
      OnClick = PessoaFsica1Click
    end
    object PessoaJurdica1: TMenuItem
      Caption = 'Pessoa Jur'#237'dica'
      OnClick = PessoaJurdica1Click
    end
  end
end
