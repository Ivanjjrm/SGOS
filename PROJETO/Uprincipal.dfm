object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema de Ger'#234'nciamento de Ordens de Servi'#231'o'
  ClientHeight = 457
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 81
    Align = alTop
    TabOrder = 0
    DesignSize = (
      721
      81)
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 121
      Height = 81
      Caption = 'Gerenciar Serv'#231'os'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 240
      Top = 0
      Width = 121
      Height = 81
      Caption = 'Receber'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 360
      Top = 0
      Width = 121
      Height = 81
      Caption = 'Pagar'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 600
      Top = 0
      Width = 121
      Height = 81
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      OnClick = SpeedButton4Click
      ExplicitLeft = 637
    end
    object SpeedButton5: TSpeedButton
      Left = 480
      Top = 0
      Width = 121
      Height = 81
      Anchors = [akTop, akRight]
      Caption = 'Caixa'
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 120
      Top = 0
      Width = 121
      Height = 81
      Caption = 'Pessoa'
      OnClick = SpeedButton6Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 152
    object a1: TMenuItem
      Caption = 'Cadastros'
      object PessoaFisica1: TMenuItem
        Caption = 'Equipamento'
        OnClick = PessoaFisica1Click
      end
      object PessoaJuridica1: TMenuItem
        Caption = 'Servi'#231'o'
        OnClick = PessoaJuridica1Click
      end
      object Equipamento1: TMenuItem
        Caption = 'Pessoa Fisica'
        OnClick = Equipamento1Click
      end
      object PessoaJuridica2: TMenuItem
        Caption = 'Pessoa Juridica'
        OnClick = PessoaJuridica2Click
      end
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#227'o'
      object Sistema1: TMenuItem
        Caption = 'Sistema'
        OnClick = Sistema1Click
      end
      object Usurio1: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = Usurio1Click
      end
    end
  end
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'C:\SGOS\DADOS\SGOS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    ServerType = 'IBServer'
    Left = 192
    Top = 152
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 328
    Top = 152
  end
  object IBQueryConfg_CPF: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM CONFIGURACAO')
    Left = 392
    Top = 152
    object IBQueryConfg_CPFID_CONFIG: TIntegerField
      FieldName = 'ID_CONFIG'
      Origin = '"CONFIGURACAO"."ID_CONFIG"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryConfg_CPFNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CONFIGURACAO"."NOME"'
      Size = 60
    end
    object IBQueryConfg_CPFFANTASIA: TIBStringField
      FieldName = 'FANTASIA'
      Origin = '"CONFIGURACAO"."FANTASIA"'
      Size = 60
    end
    object IBQueryConfg_CPFTEL: TIBStringField
      FieldName = 'TEL'
      Origin = '"CONFIGURACAO"."TEL"'
    end
    object IBQueryConfg_CPFEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"CONFIGURACAO"."EMAIL"'
      Size = 60
    end
    object IBQueryConfg_CPFCPF_CNPJ: TIBStringField
      FieldName = 'CPF_CNPJ'
      Origin = '"CONFIGURACAO"."CPF_CNPJ"'
      Size = 19
    end
    object IBQueryConfg_CPFJUROS: TIntegerField
      FieldName = 'JUROS'
      Origin = '"CONFIGURACAO"."JUROS"'
    end
    object IBQueryConfg_CPFCARENCIA: TIntegerField
      FieldName = 'CARENCIA'
      Origin = '"CONFIGURACAO"."CARENCIA"'
    end
  end
end
