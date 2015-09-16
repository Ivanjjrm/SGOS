unit Upessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmPessoa = class(TForm)
    Enome: TEdit;
    Eendereco: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Etel: TEdit;
    MaskEditCPF_CNPJ: TMaskEdit;
    Label6: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Eid: TEdit;
    IBQuerycad: TIBQuery;
    SpeedButton1: TSpeedButton;
    DataSourcecid: TDataSource;
    IBQuerycid: TIBQuery;
    IBQuerycidID_CID: TIntegerField;
    IBQuerycidNOME_CID: TIBStringField;
    IBQuerycidUF: TIBStringField;
    Label4: TLabel;
    IBQueryCPF_CNPJ: TIBQuery;
    DBLookupComboBoxcid: TDBLookupComboBox;
    CBTipo: TComboBox;
    CBEstado: TComboBox;
    Label7: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEditCPF_CNPJExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CBEstadoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTipoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoa: TFrmPessoa;
implementation

{$R *.dfm}

uses Uprincipal, Ucidade, UBuscaPessoa;

//Incio Fun��es ---------------------------------------------------------------|

Function LimparMascara(Valor : String) : String;
var cont : integer;
begin // limpa mascara
Trim(Valor);
cont:=Length(valor);
if (Cont = 14 ) then
begin
Valor  := StringReplace(Valor, '-', '', [rfReplaceAll]);
Valor  := StringReplace(Valor, '_', '', [rfReplaceAll]);
Valor  := StringReplace(Valor, '.', '', [rfReplaceAll]);
Result:=Valor;
end
else if (cont = 18) then
begin
Valor  := StringReplace(Valor, '.', '', [rfReplaceAll]);
Valor  := StringReplace(Valor, '.', '', [rfReplaceAll]);
Valor  := StringReplace(Valor, '/', '', [rfReplaceAll]);
Valor  := StringReplace(Valor, '-', '', [rfReplaceAll]);
Result:=Valor;
end;
end;

function TestaCpf( xCPF:String ):Boolean;
{Testa se o CPF � v�lido ou n�o}
Var
d1,d4,xx,nCount,resto,digito1,digito2 : Integer;
Check : String;
Begin


try

d1 := 0; d4 := 0; xx := 1;
for nCount := 1 to Length( xCPF )-2 do
    begin
    if Pos( Copy( xCPF, nCount, 1 ), '/-.' ) = 0 then
       begin
       d1 := d1 + ( 11 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       d4 := d4 + ( 12 - xx ) * StrToInt( Copy( xCPF, nCount, 1 ) );
       xx := xx+1;
       end;
    end;
resto := (d1 mod 11);
if resto < 2 then
   begin
   digito1 := 0;
   end
else
   begin
   digito1 := 11 - resto;
   end;
d4 := d4 + 2 * digito1;
resto := (d4 mod 11);
if resto < 2 then
   begin
   digito2 := 0;
   end
else
   begin
   digito2 := 11 - resto;
   end;
Check := IntToStr(Digito1) + IntToStr(Digito2);
if Check <> copy(xCPF,succ(length(xCPF)-2),2) then
   begin
   Result := False;
   end
else
   begin
   Result := True;
   end;


except
Result:=False;
end;
end;


function TestaCNPJ(CNPJ: string): boolean;
{Testa se o CNPJ � v�lido ou n�o}
 var dig13, dig14: string;
 sm, i, r, peso: integer;
 begin if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111')
 or (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
 (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
 (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
 (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
 (length(CNPJ) <> 14))
 then begin TestaCNPJ := false;
 exit;
 end;
try
	sm := 0;
	peso := 2;
	for i := 12 downto 1 do
	begin
	sm := sm + (StrToInt(CNPJ[i]) * peso);
	peso := peso + 1; if (peso = 10) then
	peso := 2;
	end;
	r := sm mod 11;
	if ((r = 0) or (r = 1)) then
	dig13 := '0'
	else str((11-r):1, dig13);
	sm := 0;
	peso := 2;
	for i := 13 downto 1 do begin sm := sm + (StrToInt(CNPJ[i]) * peso);
	peso := peso + 1;
	if (peso = 10) then peso := 2;
	end;
	r := sm mod 11;
	if ((r = 0) or (r = 1)) then
	dig14 := '0'
	else str((11-r):1, dig14);
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
	TestaCNPJ := true
	else
  TestaCNPJ := false;
	except
  TestaCNPJ := false;

	end;
	end;






//Final Fun��es ---------------------------------------------------------------|


procedure TFrmPessoa.BitBtn1Click(Sender: TObject);
begin
if (Eid.Text = '') then
BEGIN
Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
DBLookupComboBoxCid.KeyValue:=0;
END
else if (Eid.Text <> '') then
begin
Eid.Text:=(FrmbuscaPessoa.DbGrid1.Columns.Items[0].Field).AsString;
Enome.Text:=(FrmbuscaPessoa.DbGrid1.Columns.Items[1].Field).AsString;
Etel.Text:=(FrmbuscaPessoa.DbGrid1.Columns.Items[2].Field).AsString;
Eendereco.Text:=(FrmbuscaPessoa.DbGrid1.Columns.Items[3].Field).AsString;
DBLookupComboBoxcid.KeyValue:=(FrmbuscaPessoa.DbGrid1.Columns.Items[4].Field).AsInteger;
MaskEditCPF_CNPJ.Text:=(FrmbuscaPessoa.DbGrid1.Columns.Items[6].Field).AsString;

if ((FrmbuscaPessoa.DbGrid1.Columns.Items[8].Field).AsString = 'FISICO') then
CBTipo.ItemIndex:= 1
else if ((FrmbuscaPessoa.DbGrid1.Columns.Items[8].Field).AsString = 'JURIDICO') then
CBTipo.ItemIndex:=2;
end;
end;

procedure TFrmPessoa.BitBtn2Click(Sender: TObject);
begin
try
begin
if (Eid.Text <> '') then
if (Application.MessageBox('Deseja Realmente Excluir essa Pessoa?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
begin
IBQuerycad.Close;
IBQuerycad.sql.Text:=('DELETE FROM PESSOA WHERE ID_CAD = :id');
IBQuerycad.ParamByName('id').AsString := Eid.Text;
IBQuerycad.ExecSQL;
Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
DBLookupComboBoxCid.KeyValue:=0; CBTipo.ItemIndex:=0;
end;
end;
  except
  on e: Exception do
  begin
    Application.MessageBox('N�o � possivel Excluir! Existem refer�ncias desta pessoa no sistema!','Aten��o Usu�rio',MB_ICONERROR);
  end;
end;
end;

procedure TFrmPessoa.BitBtn3Click(Sender: TObject);
begin
if (Eid.Text = '') then
begin
close;
end
else if (Eid.Text <> '') then
begin
Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
DBLookupComboBoxCid.KeyValue:=0; CBTipo.ItemIndex:=0;
close;
end;

end;

procedure TFrmPessoa.BitBtn4Click(Sender: TObject);
begin

  Enome.Text:=Trim(Enome.Text);
   if (DBLookupComboBoxcid.KeyValue  <= 0 ) then
  begin
  showmessage('Precisa Selecionar a Cidade!');
  DBLookupComboBoxcid.SetFocus;
  end;
  if (Enome.Text = '') then
  begin
  Showmessage('Campo nome est� vazio!');
  Enome.SetFocus;
  end;

  if (Eid.Text = '') and (Enome.Text <> '') and (DBLookupComboBoxcid.KeyValue  >= 0 )   then
    begin
     IBQueryCad.Close;
     IBQueryCAd.SQL.Text:='INSERT INTO PESSOA (ID_CAD,NOME,ENDERECO,TEL,CPF_CNPJ,'+
     'DATA_CAD,TIPO_CAD,ID_CID_FK) VALUES (:id,:nome,:endereco,:tel,:cpfCnpj,:data,:tipo,:idcid)';
     IBQuerycad.ParamByName('id').Asinteger:=0;
     IBQuerycad.ParamByName('nome').AsString:=Enome.Text;
     IBQuerycad.ParamByName('endereco').AsString:=Eendereco.Text;
     IBQuerycad.ParamByName('tel').AsString:=Etel.Text;
     IBQuerycad.ParamByName('cpfcnpj').AsString:=MaskEditCPF_CNPJ.Text;
     IBQuerycad.ParamByName('data').Asdate:=date;
     IBQuerycad.ParamByName('tipo').AsString:=CBTipo.Text;
     IBQuerycad.ParamByName('idcid').AsInteger:=DBLookupComboBoxCid.KeyValue;
     IBQuerycad.ExecSQL;
     Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
     DBLookupComboBoxCid.KeyValue:=0;
    end;

   if (Eid.Text <> '') and (Enome.Text <> '') then
    begin
    IBQueryCad.Close;
     IBQueryCAd.SQL.Text:='UPDATE PESSOA SET NOME=:nome,ENDERECO=:endereco,TEL=:tel,CPF_CNPJ=:cpfCnpj, '+
     'DATA_CAD=:data,TIPO_CAD=:tipo, ID_CID_FK=:idcid WHERE ID_CAD=:id';
     IBQuerycad.ParamByName('id').Asinteger:=Strtoint(Eid.Text);
     IBQuerycad.ParamByName('nome').AsString:=Enome.Text;
     IBQuerycad.ParamByName('endereco').AsString:=Eendereco.Text;
     IBQuerycad.ParamByName('tel').AsString:=Etel.Text;
     IBQuerycad.ParamByName('cpfCnpj').AsString:=MaskEditCPF_CNPJ.Text;
     IBQuerycad.ParamByName('data').Asdate:=date;
     IBQuerycad.ParamByName('tipo').AsString:=CBtipo.Text;
     IBQuerycad.ParamByName('idcid').AsInteger:=DBLookupComboBoxCid.KeyValue;
     IBQuerycad.ExecSQL;
    Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
     DBLookupComboBoxCid.KeyValue:=0;
     close;
    end;


end;

procedure TFrmPessoa.CBEstadoExit(Sender: TObject);
begin
IBQuerycid.active := false;
IBQuerycid.sql.clear;
IBQuerycid.sql.add('SELECT * FROM CIDADE WHERE UF =:estado');
IBQuerycid.ParamByName('estado').AsString := CBEstado.Text;
IBQuerycid.active:= true;
end;

procedure TFrmPessoa.CBTipoExit(Sender: TObject);
begin
if (CBTipo.ItemIndex = 0) then
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9'
else
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
end;

procedure TFrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FrmPessoa.CBtipo.ItemIndex:=-1;
Eid.clear;Enome.clear;Eendereco.clear;Etel.clear;MaskEditCPF_CNPJ.Clear;
DBLookupComboBoxCid.KeyValue:=0;
end;





procedure TFrmPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure TFrmPessoa.FormShow(Sender: TObject);
begin
IBQuerycid.active := false;
IBQuerycid.sql.clear;
IBQuerycid.sql.add('SELECT * FROM CIDADE WHERE UF =:estado');
IBQuerycid.ParamByName('estado').AsString := CBEstado.Text;
IBQuerycid.active:= true;
end;

procedure TFrmPessoa.MaskEditCPF_CNPJExit(Sender: TObject);
var nome: String;
begin
if (CBtipo.Text = 'FISICO') then // Verifica CPF
  begin
  if not TestaCpf(LimparMascara(MaskEditCPF_CNPJ.Text)) and ( MaskEditCPF_CNPJ.Text  <> '   .   .   -  ') then
  begin
    Application.MessageBox('CPF Inv�lido','Erro',MB_ICONERROR);
    MaskEditCPF_CNPJ.SetFocus;
    Exit;
   end;

    IBQueryCPF_CNPJ.active := false;
	  IBQueryCPF_CNPJ.sql.clear;
	  IBQueryCPF_CNPJ.sql.add('SELECT NOME,CPF_CNPJ FROM PESSOA WHERE CPF_CNPJ= :vlr');
    IBQueryCPF_CNPJ.ParamByName('vlr').AsString :=MaskEditCPF_CNPJ.Text;
    IBQueryCPF_CNPJ.active:= true;
    nome:= IBQueryCPF_CNPJ.fieldByname('NOME').AsString;

  if(MaskEditCPF_CNPJ.Text  <> '   .   .   -  ') and (IBQueryCPF_CNPJ.RecordCount > 0) and (MaskEditCPF_CNPJ.Text <> (FrmBuscaPessoa.DbGrid1.Columns.Items[6].Field).AsString) then
    begin
     ShowMessage('CPF j� Cadastrado! E est� no Nome de: '+nome);
     nome:='';
     MaskEditCPF_CNPJ.SetFocus;
     IBQueryCPF_CNPJ.Active:= false;
    end;
  end;

 if (CBtipo.Text = 'JURIDICO') then // Verifica CNPJ
 begin
  if not TestaCNPJ(LimparMascara(MaskEditCPF_CNPJ.Text)) and ( MaskEditCPF_CNPJ.Text  <>  '  .   .   /    -  ') then
  begin
    Application.MessageBox('CNPJ Inv�lido','Erro',MB_ICONERROR);
    MaskEditCPF_CNPJ.SetFocus;
    Exit;
   end;

    IBQueryCPF_CNPJ.active := false;
	  IBQueryCPF_CNPJ.sql.clear;
	  IBQueryCPF_CNPJ.sql.add('SELECT NOME,CPF_CNPJ FROM PESSOA WHERE CPF_CNPJ= :vlr');
    IBQueryCPF_CNPJ.ParamByName('vlr').AsString :=MaskEditCPF_CNPJ.Text;
    IBQueryCPF_CNPJ.active:= true;
    nome:= IBQueryCPF_CNPJ.fieldByname('NOME').AsString;

    if(MaskEditCPF_CNPJ.Text  <>  '  .   .   /    -  ') and (IBQueryCPF_CNPJ.RecordCount > 0) and (MaskEditCPF_CNPJ.Text <> (FrmBuscaPessoa.DbGrid1.Columns.Items[6].Field).AsString) then
    begin
     ShowMessage('CNPJ j� Cadastrado! E est� no Nome de : '+nome);
     nome:='';
     MaskEditCPF_CNPJ.SetFocus;
     IBQueryCPF_CNPJ.Active:= false;
    end;
  end;


end;

procedure TFrmPessoa.SpeedButton1Click(Sender: TObject);
begin
FrmCidade.ShowModal;
IBQuerycid.Active:=false;
IBQuerycid.Active:=true;
end;

end.
