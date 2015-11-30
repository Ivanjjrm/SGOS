unit UnovaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Uprincipal, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  Vcl.Imaging.pngimage, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDesignLayer, ppCtrls, ppPrnabl, ppCache, ppBands, ppParameter;

type
  TFrmNovoReceber = class(TForm)
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Evalor: TEdit;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Mref: TMemo;
    Label5: TLabel;
    Eid: TEdit;
    IBQueryCadRec: TIBQuery;
    Ecliente: TEdit;
    Image1: TImage;
    IBQueryDuplicata: TIBQuery;
    DataSourceduplicata: TDataSource;
    ppDBPipelineDupli: TppDBPipeline;
    IBQueryDuplicataID_CONT_REC: TIntegerField;
    IBQueryDuplicataDATA_LANC: TDateField;
    IBQueryDuplicataDATA_ABERT: TDateField;
    IBQueryDuplicataDATA_VENC: TDateField;
    IBQueryDuplicataDATA_PAG: TDateField;
    IBQueryDuplicataDATA_PAG1: TDateField;
    IBQueryDuplicataVALOR_TOTAL: TIBBCDField;
    IBQueryDuplicataID_CAD_FK: TIntegerField;
    IBQueryDuplicataID_CAD: TIntegerField;
    IBQueryDuplicataNOME: TIBStringField;
    IBQueryDuplicataENDERECO: TIBStringField;
    IBQueryDuplicataTEL: TIBStringField;
    IBQueryDuplicataCPF_CNPJ: TIBStringField;
    IBQueryDuplicataID_CID_FK: TIntegerField;
    IBQueryDuplicataID_CID: TIntegerField;
    IBQueryDuplicataNOME_CID: TIBStringField;
    IBQueryDuplicataUF: TIBStringField;
    IBQueryMax: TIBQuery;
    ppReportDupli: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppShape16: TppShape;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine9: TppLine;
    ppLabel17: TppLabel;
    ppLine12: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText15: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText16: TppDBText;
    ppLabel25: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel26: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel27: TppLabel;
    ppDBText21: TppDBText;
    ppLabelExtenso: TppLabel;
    ppLine8: TppLine;
    ppLabel1: TppLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EvalorExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public

  end;

var
  FrmNovoReceber: TFrmNovoReceber;

implementation

{$R *.dfm}

uses UBuscaPessoa, Ureceber;
{Função de declarar valor por extenso------------------------------------------}
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
      msg:='O valor está fora do intervalo permitido.';
      msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
      msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
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
{---Final da Função------------------------------------------------------------}

procedure TFrmNovoReceber.BitBtn1Click(Sender: TObject);
begin
FrmBuscaPessoa.ShowModal;
Receber.Eid.clear;
Receber.Ebusca.clear;
end;

procedure TFrmNovoReceber.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmNovoReceber.BitBtn3Click(Sender: TObject);
begin
Mref.Text:=trim(Mref.Text);

if (Eid.Text = '') then
Begin
showmessage('É necessario selecionar um cliente!');
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

 IBQueryCadRec.Close;
   IBQueryCadRec.SQL.Text:='INSERT INTO CONTA_REC (ID_CONT_REC,DATA_LANC,DATA_ABERT,'+
   'DATA_VENC,VALOR_TOTAL,REF,STATUS,ID_CAD_FK)'+
    ' VALUES (:id,:datalanc,:databert,:datavenc,:valor,:ref,:status,:idcad)';
   IBQueryCadRec.ParamByName('id').Asinteger:=0;
   IBQueryCadRec.ParamByName('datalanc').AsDate:=date;
   IBQueryCadRec.ParamByName('databert').AsDate:=DateTimePicker1.Date;
   IBQueryCadRec.ParamByName('datavenc').AsDate:=DateTimePicker2.Date;
   IBQueryCadRec.ParamByName('valor').Asfloat:=strtofloat(Evalor.Text);
   IBQueryCadRec.ParamByName('ref').AsString:=Mref.Text;
   IBQueryCadRec.ParamByName('status').AsString:='ATIVA';
   IBQueryCadRec.ParamByName('idcad').AsInteger:=Strtoint(Eid.Text);
   IBQueryCadRec.ExecSQL;
   FrmNovoReceber.DateTimePicker1.Date:=Date;
   FrmNovoReceber.DateTimePicker2.Date:=Date+30;
   Eid.Clear;Ecliente.clear;Mref.Clear; Evalor.Text:='0,00';

    IF (Application.MessageBox('Deseja Imprimir Duplicata?','Atenção Usuário',MB_YESNO+MB_ICONQUESTION)=6) THEN
      begin
      IBQueryMax.Active:=false;
      IBQueryMax.Active:=true;
      IBQueryDuplicata.active := false;
        IBQueryDuplicata.sql.clear;
        IBQueryDuplicata.sql.add('SELECT R.ID_CONT_REC,R.DATA_LANC,R.DATA_ABERT,R.DATA_VENC,R.DATA_PAG'+
     ',R.DATA_PAG,R.VALOR_TOTAL,R.ID_CAD_FK,P.ID_CAD,P.NOME,P.ENDERECO '+
     ',P.TEL,P.CPF_CNPJ,P.ID_CID_FK,C.ID_CID,C.NOME_CID,C.UF FROM CONTA_REC '+
     'AS R INNER JOIN PESSOA AS P ON R.ID_CAD_FK = P.ID_CAD INNER JOIN '+
     'CIDADE AS C ON P.ID_CID_FK = C.ID_CID WHERE R.ID_CONT_REC =:idos');
        IBQueryDuplicata.ParamByName('idos').AsInteger := Strtoint(IBQueryMax.fieldByname('MAX').AsString);
        IBQueryDuplicata.active:= true;
        IBQueryMax.Active:=false;

        ppLabelExtenso.Text:= extenso(strtofloat(IBQueryDuplicata.fieldByname('VALOR_TOTAL').AsString));

        ppReportDupli.Print;
      end;


  end;

  end;
  procedure TFrmNovoReceber.BitBtn4Click(Sender: TObject);
begin
Eid.Clear;Ecliente.Clear;Evalor.Text:='0,00';
Mref.Clear;DateTimePicker1.Date:=date;DateTimePicker2.Date:=date+30;
end;

procedure TFrmNovoReceber.EvalorExit(Sender: TObject);
begin
Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
end;

procedure TFrmNovoReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure TFrmNovoReceber.FormShow(Sender: TObject);
begin
BitBtn1.SetFocus;
end;

end.
