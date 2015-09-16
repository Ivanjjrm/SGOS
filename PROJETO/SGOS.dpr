program SGOS;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {Form1},
  Ucidade in 'Ucidade.pas' {FrmCidade},
  Uusuario in 'Uusuario.pas' {FrmUsuario},
  Upessoa in 'Upessoa.pas' {FrmPessoa},
  Uequipamento in 'Uequipamento.pas' {FrmEquipamento},
  UServico in 'UServico.pas' {Servico},
  UGOS in 'UGOS.pas' {FrmGos},
  UBuscaPessoa in 'UBuscaPessoa.pas' {FrmBuscaPessoa},
  Uos in 'Uos.pas' {FrmNovaOs},
  UitemOs in 'UitemOs.pas' {FrmItemOs},
  Ureceber in 'Ureceber.pas' {Receber},
  UbuscasReceber in 'UbuscasReceber.pas' {BuscaReceber},
  UnovaReceber in 'UnovaReceber.pas' {NovoReceber},
  Upagar in 'Upagar.pas' {Pagar},
  UnovoPagar in 'UnovoPagar.pas' {NovoPagar},
  Ucaixa in 'Ucaixa.pas' {Caixa},
  Vcl.Themes,
  Vcl.Styles,
  Ulogin in 'Ulogin.pas' {Frmlogin},
  Usplash in 'Usplash.pas' {FrmSplash},
  UConfiguracao in 'UConfiguracao.pas' {FrmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmCidade, FrmCidade);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  Application.CreateForm(TFrmPessoa, FrmPessoa);
  Application.CreateForm(TFrmEquipamento, FrmEquipamento);
  Application.CreateForm(TServico, Servico);
  Application.CreateForm(TFrmGos, FrmGos);
  Application.CreateForm(TFrmBuscaPessoa, FrmBuscaPessoa);
  Application.CreateForm(TFrmNovaOs, FrmNovaOs);
  Application.CreateForm(TFrmItemOs, FrmItemOs);
  Application.CreateForm(TReceber, Receber);
  Application.CreateForm(TBuscaReceber, BuscaReceber);
  Application.CreateForm(TNovoReceber, NovoReceber);
  Application.CreateForm(TPagar, Pagar);
  Application.CreateForm(TNovoPagar, NovoPagar);
  Application.CreateForm(TCaixa, Caixa);
  Application.CreateForm(TFrmlogin, Frmlogin);
  Application.CreateForm(TFrmConfig, FrmConfig);
  Application.Run;
end.
