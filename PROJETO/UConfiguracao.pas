unit UConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TFrmConfig = class(TForm)
    Bevel1: TBevel;
    Etel: TEdit;
    Enome: TEdit;
    Ecarencia: TEdit;
    Eemail: TEdit;
    Efantasia: TEdit;
    Ejuros: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    MaskEditCPF_CNPJ: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure EcarenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EjurosKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

uses Uprincipal;

procedure TFrmConfig.BitBtn1Click(Sender: TObject);
begin
Enome.Text:=Trim(Enome.Text);
Efantasia.Text:=Trim(Efantasia.Text);
if (Enome.Text = '') then
begin
Enome.SetFocus;
end;
if (Efantasia.Text = '') then
begin
Efantasia.SetFocus;
end;
if (Enome.Text <> '') and (Efantasia.Text <> '') and (Application.MessageBox('Deseja Alterar Configura��es','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
begin
Form1.IBQueryConfg_CPF.Close;
Form1.IBQueryConfg_CPF.SQL.Text:='UPDATE CONFIGURACAO SET NOME=:nome, FANTASIA=:fantasia, '+
' TEL=:tel,EMAIL=:email,CPF_CNPJ=:cpf_cnpj,JUROS=:juros, CARENCIA=:carencia WHERE ID_CONFIG =:id';
Form1.IBQueryConfg_CPF.ParamByName('id').Asinteger:=1;
Form1.IBQueryConfg_CPF.ParamByName('nome').AsString:=Enome.Text;
Form1.IBQueryConfg_CPF.ParamByName('fantasia').AsString:=Efantasia.Text;
Form1.IBQueryConfg_CPF.ParamByName('tel').AsString:=Etel.Text;
Form1.IBQueryConfg_CPF.ParamByName('cpf_cnpj').AsString:=MaskEditCPF_CNPJ.Text;
Form1.IBQueryConfg_CPF.ParamByName('juros').AsString:=Ejuros.Text;
Form1.IBQueryConfg_CPF.ParamByName('carencia').AsString:=Ecarencia.Text;
Form1.IBQueryConfg_CPF.ExecSQL;
close;
end;
end;

procedure TFrmConfig.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmConfig.EcarenciaKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TFrmConfig.EjurosKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TFrmConfig.RadioGroup1Click(Sender: TObject);
begin
if Frmconfig.RadioGroup1.ItemIndex = 0 then
begin
Frmconfig.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
end
else if Frmconfig.RadioGroup1.ItemIndex = 1 then
begin
Frmconfig.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
end;
end;

end.
