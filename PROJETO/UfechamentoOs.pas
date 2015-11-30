unit UfechamentoOs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, UGOS;

type
  TFrmfechamento = class(TForm)
    Esubtotal: TEdit;
    Bevel1: TBevel;
    Edesc: TEdit;
    Bevel2: TBevel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Etotal: TEdit;
    Bevel3: TBevel;
    Label4: TLabel;
    Etroco: TEdit;
    Bevel4: TBevel;
    Label5: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edinheiro: TEdit;
    Bevel5: TBevel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    IBQueryCad: TIBQuery;
    IBQuerymax: TIBQuery;
    IBQuerymaxMAX: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure EdescExit(Sender: TObject);
    procedure EdinheiroExit(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdescKeyPress(Sender: TObject; var Key: Char);
    procedure EdinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmfechamento: TFrmfechamento;

implementation

{$R *.dfm}

uses UitemOs, UnovaReceber;

{Fun��o de declarar valor por extenso------------------------------------------}
Const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco',
'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
'Cinquenta', 'Sessenta', 'Setenta',
'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
'Quatrocentos', 'Quinhentos', 'Seiscentos',
'Setecentos', 'Oitocentos', 'Novecentos');
MoedaSigular = 'Real';
MoedaPlural = 'Reais';
CentSingular = 'Centavo';
CentPlural = 'Centavos';
Zero = 'Zero';

function extenso(valor: real): string;
var Texto,Milhar,Centena,Centavos,msg: string;
//////////fucao auxiliar extenso
  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
    begin
      if Expressao then
      Result:=CasoVerdadeiro
      else
      Result:=CasoFalso;
  end;
////////////////////////////funcao auxiliar extenso
  function MiniExtenso (trio: string): string;
    var
      Unidade, Dezena, Centena: string;
    begin
      Unidade:='';
      Dezena:='';
      Centena:='';
      if (trio[2]='1') and (trio[3]<>'0') then
        begin
          Unidade:=Dez[strtoint(trio[3])];
          Dezena:='';
        end
      else
        begin
          if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
          if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
      end;
      if (trio[1]='1') and (Unidade='') and (Dezena='') then
        Centena:='Cem'
      else
        if trio[1]<>'0' then
          Centena:=Centenas[strtoint(trio[1])]
        else Centena:='';
      Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
      + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
  end;

begin
  if (valor>999999.99) or (valor<0) then
    begin
      msg:='O valor est� fora do intervalo permitido.';
      msg:=msg+'O n�mero deve ser maior ou igual a zero e menor que 999.999,99.';
      msg:=msg+' Se n�o for corrigido o n�mero n�o ser� escrito por extenso.';
      showmessage(msg);
      Result:='';
      exit;
    end;
  if valor=0 then
    begin
      Result:='';
      Exit;
  end;
  Texto:=formatfloat('000000.00',valor);
  Milhar:=MiniExtenso(Copy(Texto,1,3));
  Centena:=MiniExtenso(Copy(Texto,4,3));
  Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
  Result:=Milhar;
  if Milhar<>'' then
    begin
      if copy(texto,4,3)='000' then
        Result:=Result+' Mil Reais'
      else
        Result:=Result+' Mil, ';
  end;
  if (((copy(texto,4,2)='00') and (Milhar<>'') and (copy(texto,6,1)<>'0')))or (centavos='') and (milhar<>'')  then
    Result:=Result+' e ';
  if (Milhar+Centena <>'') then
    Result:=Result+Centena;
  if (Milhar='') and (copy(texto,4,3)='001') then
    Result:=Result+' Real'
  else
  if (copy(texto,4,3)<>'000') then
    Result:=Result+' Reais';
  if Centavos='' then
    begin
      Result:=Result+'.';
      Exit;
  end
  else
    begin
      if Milhar+Centena='' then
        Result:=Centavos
      else
        Result:=Result+', e '+Centavos;
  end;
  if (copy(texto,8,2)='01') and (Centavos<>'') then
      Result:=Result+' Centavo.'
  else
      Result:=Result+' Centavos.';

end;
{---Final da Fun��o------------------------------------------------------------}

procedure TFrmfechamento.BitBtn1Click(Sender: TObject);
var verifc : string;
begin
verifc:='false';
if (ComboBox1.ItemIndex = 0) and (Edinheiro.Text = '0,00') then      // caso tentar fechar no dinheiro sem apresentar o valor
begin
Application.MessageBox('Digite o Valor a apresentar!','Erro',MB_ICONERROR);
Edinheiro.SetFocus;
end;
if (ComboBox1.ItemIndex = 1) then    // para fazer fechamento a prazo
begin
IBQueryCad.Close;
IBQueryCAd.SQL.Text:='INSERT INTO CONTA_REC (ID_CONT_REC,DATA_LANC,DATA_ABERT,DATA_VENC,VALOR_TOTAL,REF,'+
'STATUS,ID_CAD_FK,ID_OS_FK) VALUES (:idcont,:datalanc,:databert,:data_venc,:valor,:ref,:status,:idcad,:idos)';
IBQuerycad.ParamByName('idcont').Asinteger:=0;
IBQuerycad.ParamByName('datalanc').AsDate:=date;
IBQuerycad.ParamByName('databert').Asdate:=date;
IBQuerycad.ParamByName('data_venc').AsDate:=DateTimePicker1.Date;
IBQuerycad.ParamByName('valor').AsFloat:=strtofloat(Etotal.Text);
IBQuerycad.ParamByName('ref').AsString:='APRAZO';
IBQuerycad.ParamByName('status').AsString:='ATIVA';
IBQuerycad.ParamByName('idcad').AsInteger:= Strtoint((FrmGos.DbGrid1.Columns.Items[1].Field).AsString);
IBQueryCad.ParamByName('idos').AsInteger:=Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
IBQuerycad.ExecSQL;


IBQueryCad.Close;
IBQueryCAd.SQL.Text:='UPDATE OS SET SUBTOTAL=:subtotal,DESCONTO=:desconto,'+
'TOTAL=:total,DATA_FECHADA=:dtfechada,STATUS=:status WHERE ID_OS =:idos';
IBQueryCad.ParamByName('idos').AsInteger:=Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
IBQuerycad.ParamByName('subtotal').AsFloat:=strtofloat(Esubtotal.Text);
IBQuerycad.ParamByName('desconto').AsFloat:=strtofloat(Edesc.Text);
IBQuerycad.ParamByName('total').AsFloat:=strtofloat(Etotal.Text);
IBQueryCad.ParamByName('dtfechada').AsDate:=date;
IBQuerycad.ParamByName('status').AsString:='FECHADA';
IBQuerycad.ExecSQL;
verifc:='true';

 IF (Application.MessageBox('Deseja Imprimir Duplicata?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) THEN
      begin
      IBQueryMax.Active:=false;
      IBQueryMax.Active:=true;
      FrmNovoReceber.IBQueryDuplicata.active := false;
      FrmNovoReceber.IBQueryDuplicata.sql.clear;
      FrmNovoReceber.IBQueryDuplicata.sql.add('SELECT R.ID_CONT_REC,R.DATA_LANC,R.DATA_ABERT,R.DATA_VENC,R.DATA_PAG'+
     ',R.DATA_PAG,R.VALOR_TOTAL,R.ID_CAD_FK,P.ID_CAD,P.NOME,P.ENDERECO '+
     ',P.TEL,P.CPF_CNPJ,P.ID_CID_FK,C.ID_CID,C.NOME_CID,C.UF FROM CONTA_REC '+
     'AS R INNER JOIN PESSOA AS P ON R.ID_CAD_FK = P.ID_CAD INNER JOIN '+
     'CIDADE AS C ON P.ID_CID_FK = C.ID_CID WHERE R.ID_CONT_REC =:idos');
        FrmNovoReceber.IBQueryDuplicata.ParamByName('idos').AsInteger := Strtoint(IBQueryMax.fieldByname('MAX').AsString);
        FrmNovoReceber.IBQueryDuplicata.active:= true;
        FrmNovoReceber.IBQueryMax.Active:=false;

        FrmNovoReceber.ppLabelExtenso.Text:= extenso(strtofloat(FrmNovoReceber.IBQueryDuplicata.fieldByname('VALOR_TOTAL').AsString));

        FrmNovoReceber.ppReportDupli.Print;
      end;



end;

if (ComboBox1.ItemIndex = 0) and (Edinheiro.Text <> '0,00') then    // FECHAMENTO A VISTA
begin
IBQueryCad.Close;
IBQueryCAd.SQL.Text:='UPDATE OS SET SUBTOTAL=:subtotal,DESCONTO=:desconto,'+
'TOTAL=:total,DATA_FECHADA=:dtfechada,STATUS=:status WHERE ID_OS =:idos';
IBQueryCad.ParamByName('idos').AsInteger:=Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
IBQuerycad.ParamByName('subtotal').AsFloat:=strtofloat(Esubtotal.Text);
IBQuerycad.ParamByName('desconto').AsFloat:=strtofloat(Edesc.Text);
IBQuerycad.ParamByName('total').AsFloat:=strtofloat(Etotal.Text);
IBQueryCad.ParamByName('dtfechada').AsDate:=date;
IBQuerycad.ParamByName('status').AsString:='FECHADA';
IBQuerycad.ExecSQL;

IBQueryCad.Close;
IBQueryCAd.SQL.Text:='INSERT INTO MOV_FINAN (ID_MOV,DATA_MOV,ORIGEM,TIPO_PAG,VALOR_MOV,HORA_MOV)'+
' VALUES (:idmov,:data_mov,:origem,:tipo_pag,:valor,:hora)';
IBQueryCad.ParamByName('idmov').AsInteger:=0;
IBQuerycad.ParamByName('data_mov').AsDate:=date;
IBQuerycad.ParamByName('Origem').AsString:='O.S';
IBQueryCad.ParamByName('tipo_pag').AsString:='DINHEIRO';
IBQueryCad.ParamByName('hora').AsTime:=time;
IBQuerycad.ParamByName('valor').AsFloat:=strtofloat(Etotal.Text);
IBQueryCad.ExecSQL;
verifc:='true';
end;

if (ComboBox1.ItemIndex = 2) then    // para fazer fechamento no CART�O
  begin
    IBQueryCad.Close;
    IBQueryCAd.SQL.Text:='UPDATE OS SET SUBTOTAL=:subtotal,DESCONTO=:desconto,'+
    'TOTAL=:total,DATA_FECHADA=:dtfechada,STATUS=:status WHERE ID_OS =:idos';
    IBQueryCad.ParamByName('idos').AsInteger:=Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
    IBQuerycad.ParamByName('subtotal').AsFloat:=strtofloat(Esubtotal.Text);
    IBQuerycad.ParamByName('desconto').AsFloat:=strtofloat(Edesc.Text);
    IBQuerycad.ParamByName('total').AsFloat:=strtofloat(Etotal.Text);
    IBQueryCad.ParamByName('dtfechada').AsDate:=date;
    IBQuerycad.ParamByName('status').AsString:='FECHADA';
    IBQuerycad.ExecSQL;
    IBQueryCad.Close;
    IBQueryCAd.SQL.Text:='INSERT INTO MOV_FINAN (ID_MOV,DATA_MOV,ORIGEM,TIPO_PAG,VALOR_MOV,HORA_MOV)'+
    ' VALUES (:idmov,:data_mov,:origem,:tipo_pag,:valor,:hora)';
    IBQueryCad.ParamByName('idmov').AsInteger:=0;
    IBQuerycad.ParamByName('data_mov').AsDate:=date;
    IBQuerycad.ParamByName('Origem').AsString:='O.S';
    IBQueryCad.ParamByName('hora').AsTime:=time;
    IBQueryCad.ParamByName('tipo_pag').AsString:='CART�O';
    IBQuerycad.ParamByName('valor').AsFloat:=strtofloat(Etotal.Text);
    IBQuerycad.ExecSQL;
    verifc:='true';
    end;

    IF (verifc = 'true') and (Application.MessageBox('Deseja Imprirmir Ordem de Servi�o?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) THEN
      BEGIN
        FrmGos.IBQueryRelOs.active := false;
        FrmGos.IBQueryRelOs.sql.clear;
        FrmGos.IBQueryRelOs.sql.add('SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.DESC_SERVICO,I.VALOR,'+
        'I.ID_SERV_FK,I.ID_EQUIP_FK,I.ID_OS_FK,E.NOME_EQUIP,S.DESC_SERV,'+
        'O.SUBTOTAL,O.DESCONTO,O.TOTAL,O.DATA_ABERTA,O.DATA_FECHADA,'+
        'O.STATUS FROM ITEM_OS AS I INNER JOIN EQUIPAMENTO AS E ON '+
        'I.ID_EQUIP_FK = E.ID_EQUIP INNER JOIN SERVICO AS S ON '+
        'I.ID_SERV_FK = S.ID_SERV INNER JOIN OS AS O ON '+
        'I.ID_OS_FK = O.ID_OS WHERE I.ID_OS_FK = :id');
        FrmGos.IBQueryRelOs.ParamByName('id').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        FrmGos.IBQueryRelOs.active:= true;
       FrmGos.IBQuerycli.active := false;
       FrmGos.IBQuerycli.sql.clear;
       FrmGos.IBQuerycli.sql.add('SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,P.ENDERECO,P.TEL,P.CPF_CNPJ,P.TIPO_CAD,P.ID_CID_FK,O.TOTAL, '+
        'O.DATA_ABERTA,O.DATA_FECHADA,O.STATUS,C.NOME_CID FROM OS AS O '+
        'INNER JOIN PESSOA AS P ON O.ID_CAD_FK = P.ID_CAD INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID  WHERE ID_OS =:idos');
        FrmGos.IBQuerycli.ParamByName('idos').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        FrmGos.IBQuerycli.active:= true;
        FrmGos.ppReportoS.Print;
       FrmItemOs.Close;
      CLOSE;
       END
      else if (verifc = 'true') then
      begin
      FrmItemOs.Close;
      CLOSE;
      end;
   end;

procedure TFrmfechamento.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmfechamento.ComboBox1Click(Sender: TObject);
begin
if (ComboBox1.ItemIndex = 1) then
begin
DateTimePicker1.Visible:=true;
Edinheiro.Enabled:=false;
end
else if (ComboBox1.ItemIndex = 0) then
begin
Edinheiro.Enabled:=true;
DateTimePicker1.Visible:=false;
end
else if (ComboBox1.ItemIndex = 2) then
begin
Edinheiro.Enabled:=false;
DateTimePicker1.Visible:=false;
end;
end;

procedure TFrmfechamento.ComboBox1Exit(Sender: TObject);
begin
begin
if (ComboBox1.ItemIndex = 1) then
begin
Edinheiro.Text:='0,00';
Etroco.Text:='0,00';
Edinheiro.Enabled:=true;
DateTimePicker1.Visible:=true;
end
else if (ComboBox1.ItemIndex = 0) then
begin
Edinheiro.Enabled:=true;
DateTimePicker1.Visible:=false;
Edinheiro.Text:='0,00';
Etroco.Text:='0,00';
end
else if (ComboBox1.ItemIndex = 2) then
begin
Edinheiro.Enabled:=false;
DateTimePicker1.Visible:=false;
Edinheiro.Text:='0,00';
Etroco.Text:='0,00';
end;
end;
end;

procedure TFrmfechamento.DateTimePicker1Click(Sender: TObject);
begin
Edinheiro.Enabled:=false;
end;

procedure TFrmfechamento.EdescExit(Sender: TObject);
var v1,v2,result:Double;
begin
v1:=StrToFloat(Esubtotal.Text);
v2:=StrToFloat(Edesc.Text);

if (v1 < v2) then
begin
Application.MessageBox('Valor do Desconto n�o pode ser superior ao dos Servi�os!','Erro',MB_ICONERROR);
Edesc.SetFocus;
end
else if (v1 >= v2) then
begin
result:=v1-v2;
Etotal.Text:=FormatFloat('#######0.00',(result));
Edesc.Text:=FormatFloat('#######0.00',(v2));
end;
end;

procedure TFrmfechamento.EdescKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8,#13]) then key :=#0;   // permitir apenas digitar numeros no campo valor do item_O.S
  If key = #13 then
   Begin
    Key:= #0;

    if(ComboBox1.ItemIndex = 1) then
    begin
    BitBtn1.SetFocus;
    end
    else if (ComboBox1.ItemIndex = 0) then
    Edinheiro.SetFocus;
   End;
end;

procedure TFrmfechamento.EdinheiroExit(Sender: TObject);
var v1,v2,v3,result:Double;
begin
if (Edinheiro.text = '') then
begin
Edinheiro.Text:='0,00';
end;
v1:=StrToFloat(Etotal.Text);
v2:=StrToFloat(EDinheiro.Text);
if (v1 > v2) and (v2 <> 0) then
begin
Application.MessageBox('Valor insuficiente!','Erro',MB_ICONERROR);
Edinheiro.SetFocus;
Etroco.Text:='0,00';
end
else if (v1 <= v2) then
begin
result:=v2-V1;
Etroco.Text:=FormatFloat('#######0.00',(result));
end;
end;

procedure TFrmfechamento.EdinheiroKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8,#13]) then key :=#0;   // permitir apenas digitar numeros no campo valor do item_O.S
  If key = #13 then
   Begin
    Key:= #0;
    BitBtn1.SetFocus;
   End;
end;

procedure TFrmfechamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ComboBox1.ItemIndex:=-1;
Esubtotal.Text:='0,00';
Edesc.Text:='0,00';
Edinheiro.Text:='0,00';
Etroco.Text:='0,00';
end;

end.
