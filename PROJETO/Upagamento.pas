unit Upagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Uprincipal, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  Urelatorio;

type
  TFrmpagamento = class(TForm)
    DateTimePicker1: TDateTimePicker;
    EValor: TEdit;
    EvalorApresen: TEdit;
    Etroco: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel4: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQueryPag: TIBQuery;
    ComboBox1: TComboBox;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EvalorApresenKeyPress(Sender: TObject; var Key: Char);
    procedure EvalorApresenExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmpagamento: TFrmpagamento;

implementation

{$R *.dfm}

uses Ureceber;

procedure TFrmpagamento.BitBtn1Click(Sender: TObject);
var v1,v2,result:Double;
begin
v1:=StrToFloat(Evalor.Text);
v2:=StrToFloat(EvalorApresen.Text);
if (v1 > v2) then
begin
Application.MessageBox('Valor insuficiente!','Erro',MB_ICONERROR);
EvalorApresen.SetFocus;
Etroco.Text:='0,00';
end;
if (ComboBox1.ItemIndex = -1) then
begin
showmessage('Selesone uma forma de Pagamento');
ComboBox1.SetFocus;
end;

if (ComboBox1.ItemIndex <>-1) and (v1 <= v2) then
Begin
if (Application.MessageBox('Cofirma a data de Recebimento?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
begin
IBQueryPag.Close;
IBQueryPag.SQL.Text:='UPDATE CONTA_REC SET VALOR_JUROS=:juros,DATA_PAG=:datapag,VALOR_PAGO=:vtotal,STATUS=:status WHERE ID_CONT_REC = :id';
IBQueryPag.ParamByName('id').AsInteger:=Strtoint((Receber.DbGrid1.Columns.Items[0].Field).AsString);
IBQueryPag.ParamByName('juros').AsFloat:=StrtoFloat(Receber.Ejuros.Text);
IBQueryPag.ParamByName('vtotal').AsFloat:=StrtoFloat(EValor.Text);
IBQueryPag.ParamByName('datapag').AsDate:=DateTimePicker1.Date;
IBQueryPag.ParamByName('status').AsString:='FECHADA';
IBQueryPag.ExecSQL;

IBQueryPag.Close;
IBQueryPag.SQL.Text:='INSERT INTO MOV_FINAN (ID_MOV,DATA_MOV,ORIGEM,TIPO_PAG,VALOR_MOV,HORA_MOV,ID_CONT_REC)'+
' VALUES (:idmov,:data_mov,:origem,:tipo_pag,:valor,:hora,:idcontrec)';
IBQueryPag.ParamByName('idmov').AsInteger:=0;
IBQueryPag.ParamByName('data_mov').AsDate:=date;
IBQueryPag.ParamByName('Origem').AsString:='C.RECEBER';
IBQueryPag.ParamByName('valor').AsFloat:=StrtoFloat(Evalor.Text);
IBQueryPag.ParamByName('hora').AsTime:=Time;
IBQueryPag.ParamByName('tipo_pag').AsString:=ComboBox1.Text;
IBQueryPag.ParamByName('idcontrec').AsInteger:= Strtoint((Receber.DbGrid1.Columns.Items[0].Field).AsString);
IBQueryPag.ExecSQL;
Receber.IBQueryCli.Active:=false;
Receber.IBQueryCli.Active:=true;
close;
end;
end;


end;

procedure TFrmpagamento.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmpagamento.EvalorApresenExit(Sender: TObject);
var v1,v2,result:Double;
begin
if (EvalorApresen.Text = '') then
begin
EvalorApresen.Text:='0,00';
end;

v1:=StrToFloat(Evalor.Text);
v2:=StrToFloat(EvalorApresen.Text);

if (v1 <= v2) then
begin
result:=v2-V1;
Etroco.Text:=FormatFloat('#######0.00',(result));
end;
end;

procedure TFrmpagamento.EvalorApresenKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8,#13]) then key :=#0;   // permitir apenas digitar numeros no campo valor do item_O.S
  If key = #13 then
   Begin
    Key:= #0;
    BitBtn1.SetFocus;
   End;

end;

end.
