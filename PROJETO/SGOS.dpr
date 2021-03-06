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
  UnovaReceber in 'UnovaReceber.pas' {FrmNovoReceber},
  Upagar in 'Upagar.pas' {FrmPagar},
  UnovoPagar in 'UnovoPagar.pas' {FrmNovoPagar},
  Ucaixa in 'Ucaixa.pas' {FrmMovFinan},
  Vcl.Themes,
  Vcl.Styles,
  Ulogin in 'Ulogin.pas' {Frmlogin},
  Usplash in 'Usplash.pas' {FrmSplash},
  UConfiguracao in 'UConfiguracao.pas' {FrmConfig},
  UfechamentoOs in 'UfechamentoOs.pas' {Frmfechamento},
  Upagamento in 'Upagamento.pas' {Frmpagamento},
  UrecPag in 'UrecPag.pas' {FrmRecPag};

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
  Application.CreateForm(TFrmNovoReceber, FrmNovoReceber);
  Application.CreateForm(TFrmPagar, FrmPagar);
  Application.CreateForm(TFrmNovoPagar, FrmNovoPagar);
  Application.CreateForm(TFrmMovFinan, FrmMovFinan);
  Application.CreateForm(TFrmlogin, Frmlogin);
  Application.CreateForm(TFrmConfig, FrmConfig);
  Application.CreateForm(TFrmfechamento, Frmfechamento);
  Application.CreateForm(TFrmpagamento, Frmpagamento);
  Application.CreateForm(TFrmRecPag, FrmRecPag);
  Application.Run;
end.
