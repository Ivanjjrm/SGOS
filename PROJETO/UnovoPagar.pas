unit UnovoPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  Uprincipal;

type
  TFrmNovoPagar = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Evalor: TEdit;
    Mref: TMemo;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    IBQueryCadPag: TIBQuery;
    Eid: TEdit;
    Enome: TEdit;
    Eidcont: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EvalorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNovoPagar: TFrmNovoPagar;

implementation

{$R *.dfm}

uses UBuscaPessoa, Upagar;

procedure TFrmNovoPagar.BitBtn1Click(Sender: TObject);
begin
FrmBuscaPessoa.ShowModal;
FrmPagar.Eid.clear;
Frmpagar.Enome.clear;
end;

procedure TFrmNovoPagar.BitBtn2Click(Sender: TObject);
  begin
    Eid.Clear;Enome.Clear;Evalor.Text:='0,00';
    Mref.Clear;DateTimePicker1.Date:=date;DateTimePicker2.Date:=date+30;
    close;
  end;

procedure TFrmNovoPagar.BitBtn3Click(Sender: TObject);
begin
  Mref.Text:=trim(Mref.Text);
    if (Eid.Text = '') and (Eidcont.Text = '')then
    Begin
      showmessage('� necessario selecionar um Fornecedor!');
      BitBtn1.SetFocus;
    End;
  if (Evalor.Text = '0,00') then
    begin
      showmessage('O valor da conta a rcber tem que ser suaperior a R$ 0,00');
    end;
  if (Eid.Text <> '') and (Evalor.Text <> '0,00') then
     begin
  if (Mref.Text = '') then
    begin
      Mref.Text:='MANUAL';
    end;
  if (Eidcont.Text = '') then
 IBQueryCadPag.Close;
   IBQueryCadPag.SQL.Text:='INSERT INTO CONTA_PAG (ID_CONT_PAG,DESC_CONT,DATA_LANC,DATA_CONT,'+
   'DATA_VENC,VALOR_TOTAL,STATUS,ID_CAD_FK) '+
   'VALUES (:idpag,:desc,:datalan,:databert,:datavenc,:valor,:status,:idcad);';
   IBQueryCadPag.ParamByName('idpag').Asinteger:=0;
   IBQueryCadPag.ParamByName('desc').AsString:=Mref.Text;
   IBQueryCadPag.ParamByName('datalan').AsDate:=date;
   IBQueryCadPag.ParamByName('databert').AsDate:=DateTimePicker1.Date;
   IBQueryCadPag.ParamByName('datavenc').AsDate:=DateTimePicker2.Date;
   IBQueryCadPag.ParamByName('valor').Asfloat:=strtofloat(Evalor.Text);
   IBQueryCadPag.ParamByName('status').AsString:='ABERTA';
   IBQueryCadPag.ParamByName('idcad').AsInteger:=Strtoint(Eid.Text);
   IBQueryCadPag.ExecSQL;
   DateTimePicker1.Date:=Date;
   DateTimePicker2.Date:=Date+30;
   Eid.Clear;Enome.clear;Mref.Clear; Evalor.Text:='0,00';
   showmessage('Opera��o Realizada com Sucesso!');
  end;
   if (Eidcont.Text <> '') then
     begin
       IBQueryCadPag.Close;
       IBQueryCadPag.SQL.Text:='UPDATE CONTA_PAG SET ID_CONT_PAG=:idcont,DESC_CONT=:desc'+
       ',DATA_LANC=:datalan,DATA_CONT=:databert,DATA_VENC=:datavenc,VALOR_TOTAL=:valor,'+
       'STATUS=:status WHERE ID_CONT_PAG =:idpag';
       IBQueryCadPag.ParamByName('idcont').AsInteger:=Strtoint(Eidcont.Text);
       IBQueryCadPag.ParamByName('idpag').Asinteger:=Strtoint(Eidcont.Text);
       IBQueryCadPag.ParamByName('desc').AsString:=Mref.Text;
       IBQueryCadPag.ParamByName('datalan').AsDate:=date;
       IBQueryCadPag.ParamByName('databert').AsDate:=DateTimePicker1.Date;
       IBQueryCadPag.ParamByName('datavenc').AsDate:=DateTimePicker2.Date;
       IBQueryCadPag.ParamByName('valor').Asfloat:=strtofloat(Evalor.Text);
       IBQueryCadPag.ParamByName('status').AsString:='ABERTA';
       IBQueryCadPag.ExecSQL;
       DateTimePicker1.Date:=Date;
       DateTimePicker2.Date:=Date+30;
       Eid.Clear;Enome.clear;Mref.Clear; Evalor.Text:='0,00';
       close;
     end;


end;

procedure TFrmNovoPagar.BitBtn4Click(Sender: TObject);
begin
Eid.Clear;Enome.Clear;Evalor.Text:='0,00';
Mref.Clear;DateTimePicker1.Date:=date;DateTimePicker2.Date:=date+30;
end;

procedure TFrmNovoPagar.EvalorKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8,#13]) then key :=#0;   // permitir apenas digitar numeros no campo valor do item_O.S
  If key = #13 then
   Begin
    Key:= #0;
    BitBtn1.SetFocus;
   End;
end;

procedure TFrmNovoPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;
end.
