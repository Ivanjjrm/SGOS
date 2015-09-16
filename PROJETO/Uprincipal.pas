unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Menus, Vcl.ButtonGroup,
  Vcl.ExtCtrls, IBX.IBDatabase, Data.DB, Vcl.StdCtrls, UitemOs, Uequipamento,
  UConfiguracao, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    a1: TMenuItem;
    PessoaFisica1: TMenuItem;
    PessoaJuridica1: TMenuItem;
    Equipamento1: TMenuItem;
    PessoaJuridica2: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Configuraes1: TMenuItem;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Sistema1: TMenuItem;
    Usurio1: TMenuItem;
    Cidade1: TMenuItem;
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    IBQueryConfg_CPF: TIBQuery;
    IBQueryConfg_CPFID_CONFIG: TIntegerField;
    IBQueryConfg_CPFNOME: TIBStringField;
    IBQueryConfg_CPFFANTASIA: TIBStringField;
    IBQueryConfg_CPFTEL: TIBStringField;
    IBQueryConfg_CPFEMAIL: TIBStringField;
    IBQueryConfg_CPFCPF_CNPJ: TIBStringField;
    IBQueryConfg_CPFJUROS: TIntegerField;
    IBQueryConfg_CPFCARENCIA: TIntegerField;
    procedure SpeedButton4Click(Sender: TObject);
    procedure PessoaFisica1Click(Sender: TObject);
    procedure PessoaJuridica1Click(Sender: TObject);
    procedure Equipamento1Click(Sender: TObject);
    procedure PessoaJuridica2Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UBuscaPessoa, UbuscasReceber, Ucidade, UGOS, Uos, Upagar, Upessoa,
 Ureceber, UServico, Uusuario, Ucaixa, Ulogin;

procedure TForm1.Cidade1Click(Sender: TObject);
begin
FrmCidade.ShowModal;
end;

procedure TForm1.Equipamento1Click(Sender: TObject);
begin
FrmPessoa.CBtipo.ItemIndex:=0;
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
FrmPessoa.ShowModal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Frmlogin.ShowModal;
end;

procedure TForm1.PessoaFisica1Click(Sender: TObject);
begin
FrmEquipamento.showmodal;
end;

procedure TForm1.PessoaJuridica1Click(Sender: TObject);
begin
Servico.ShowModal;
end;

procedure TForm1.PessoaJuridica2Click(Sender: TObject);
begin
FrmPessoa.CBtipo.ItemIndex:=1;
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
FrmPessoa.ShowModal;
end;

procedure TForm1.Sistema1Click(Sender: TObject);
var cont : integer;
begin
    IBQueryConfg_CPF.active := false;
	  IBQueryConfg_CPF.sql.clear;
	  IBQueryConfg_CPF.sql.add('SELECT * FROM CONFIGURACAO');
    IBQueryConfg_CPF.active:= true;
    FrmConfig.Enome.text:=IBQueryConfg_CPF.fieldByname('NOME').AsString;
    FrmConfig.Efantasia.text:=IBQueryConfg_CPF.fieldByname('FANTASIA').AsString;
    FrmConfig.Etel.text:=IBQueryConfg_CPF.fieldByname('TEL').AsString;
    FrmConfig.Eemail.text:=IBQueryConfg_CPF.fieldByname('EMAIL').AsString;
    FrmConfig.Ejuros.text:=IBQueryConfg_CPF.fieldByname('JUROS').AsString;
    FrmConfig.Ecarencia.text:=IBQueryConfg_CPF.fieldByname('CARENCIA').AsString;
    cont:= Length(IBQueryConfg_CPF.fieldByname('CPF_CNPJ').AsString);


if (cont = 14) then
begin
Frmconfig.RadioGroup1.ItemIndex := 0;
Frmconfig.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
FrmConfig.MaskEditCPF_CNPJ.text:=IBQueryConfg_CPF.fieldByname('CPF_CNPJ').AsString;
end
else if (cont = 14) then
begin
Frmconfig.RadioGroup1.ItemIndex := 1;
Frmconfig.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
FrmConfig.MaskEditCPF_CNPJ.text:=IBQueryConfg_CPF.fieldByname('CPF_CNPJ').AsString;
end;
Frmconfig.showmodal;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
FrmGos.ShowModal;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
Receber.ShowModal;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
Pagar.ShowModal;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
caixa.ShowModal;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
frmBuscapessoa.ShowModal;
end;

procedure TForm1.Usurio1Click(Sender: TObject);
begin
if (Application.MessageBox('Para altarar os dados do usu�rio � preciso altentica��o! Deseja continuar?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
begin
Frmlogin.ShowModal;
frmUsuario.ShowModal;
end;
end;
end.
