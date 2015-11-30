unit UGOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Urelatorio, ppBands, ppCache, ppClass,
  ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppVar, ppCtrls, ppPrnabl;

type
  TFrmGos = class(TForm)
    Ebusca: TEdit;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Label4: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    IBQuerygrid: TIBQuery;
    DataSourceBusca: TDataSource;
    Eid: TEdit;
    IBQueryCan: TIBQuery;
    ppDBPipelineListaOs: TppDBPipeline;
    ppDBPipelineConfig: TppDBPipeline;
    ppReportListaOs: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppDBText9: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabelDesc: TppLabel;
    IBQueryRelOs: TIBQuery;
    DataSourceRelOs: TDataSource;
    ppReportOs: TppReport;
    ppDBPipelineOs: TppDBPipeline;
    IBQueryRelOsID_ITEM: TIntegerField;
    IBQueryRelOsDEFEITO: TIBStringField;
    IBQueryRelOsIDENTIFICACAO: TIBStringField;
    IBQueryRelOsDESC_SERVICO: TIBStringField;
    IBQueryRelOsVALOR: TIBBCDField;
    IBQueryRelOsID_SERV_FK: TIntegerField;
    IBQueryRelOsID_EQUIP_FK: TIntegerField;
    IBQueryRelOsID_OS_FK: TIntegerField;
    IBQueryRelOsNOME_EQUIP: TIBStringField;
    IBQueryRelOsDESC_SERV: TIBStringField;
    IBQueryRelOsSUBTOTAL: TIBBCDField;
    IBQueryRelOsDESCONTO: TIBBCDField;
    IBQueryRelOsTOTAL: TIBBCDField;
    IBQueryRelOsDATA_ABERTA: TDateField;
    IBQueryRelOsDATA_FECHADA: TDateField;
    IBQueryRelOsSTATUS: TIBStringField;
    ppDBPipelinecli: TppDBPipeline;
    IBQuerycli: TIBQuery;
    DataSourcecli: TDataSource;
    IBQuerygridID_OS: TIntegerField;
    IBQuerygridID_CAD_FK: TIntegerField;
    IBQuerygridNOME: TIBStringField;
    IBQuerygridTOTAL: TIBBCDField;
    IBQuerygridDATA_ABERTA: TDateField;
    IBQuerygridDATA_FECHADA: TDateField;
    IBQuerygridSTATUS: TIBStringField;
    IBQuerycliID_OS: TIntegerField;
    IBQuerycliID_CAD_FK: TIntegerField;
    IBQuerycliNOME: TIBStringField;
    IBQuerycliENDERECO: TIBStringField;
    IBQuerycliTEL: TIBStringField;
    IBQuerycliCPF_CNPJ: TIBStringField;
    IBQuerycliTIPO_CAD: TIBStringField;
    IBQuerycliTOTAL: TIBBCDField;
    IBQuerycliDATA_ABERTA: TDateField;
    IBQuerycliDATA_FECHADA: TDateField;
    IBQuerycliSTATUS: TIBStringField;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel27: TppLabel;
    ppDBText29: TppDBText;
    ppLabel28: TppLabel;
    ppDBText30: TppDBText;
    ppLabel29: TppLabel;
    ppDBText31: TppDBText;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppSystemVariable2: TppSystemVariable;
    ppShape7: TppShape;
    ppShape5: TppShape;
    ppDBText22: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText23: TppDBText;
    ppLabel22: TppLabel;
    ppDBText24: TppDBText;
    ppShape3: TppShape;
    ppShape6: TppShape;
    ppShape4: TppShape;
    ppLabel23: TppLabel;
    ppDBText25: TppDBText;
    ppLabel24: TppLabel;
    ppDBText26: TppDBText;
    ppLabel25: TppLabel;
    ppDBText27: TppDBText;
    ppLabel26: TppLabel;
    ppDBText28: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppTitleBand1: TppTitleBand;
    ppShape2: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText13: TppDBText;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppLabel14: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel16: TppLabel;
    ppDBText18: TppDBText;
    ppLabel17: TppLabel;
    ppDBText19: TppDBText;
    ppLabel18: TppLabel;
    ppDBText20: TppDBText;
    ppLabel19: TppLabel;
    IBQuerycliID_CID_FK: TIntegerField;
    IBQuerycliNOME_CID: TIBStringField;
    ppDBText32: TppDBText;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel30: TppLabel;
    ppReportPedOs: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel15: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDBText36: TppDBText;
    ppLabel33: TppLabel;
    ppDBText37: TppDBText;
    ppLabel34: TppLabel;
    ppDBText38: TppDBText;
    ppLabel35: TppLabel;
    ppDBText39: TppDBText;
    ppLabel37: TppLabel;
    ppDBText42: TppDBText;
    ppDBText45: TppDBText;
    ppShape15: TppShape;
    ppLabel40: TppLabel;
    ppLine2: TppLine;
    ppLabel38: TppLabel;
    ppDBText43: TppDBText;
    ppLabel39: TppLabel;
    ppDBText44: TppDBText;
    ppLabel41: TppLabel;
    ppDBText46: TppDBText;
    ppLabel42: TppLabel;
    ppDBText47: TppDBText;
    ppLine5: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLine6: TppLine;
    ppLabel43: TppLabel;
    DBGrid2: TDBGrid;
    Button1: TButton;
    DBGrid1: TDBGrid;
    IBQuerycliente: TIBQuery;
    IBQueryPedOs: TIBQuery;
    ppDBPipelineCliente: TppDBPipeline;
    ppDBPipelinePedOs: TppDBPipeline;
    DataSourceCliente: TDataSource;
    DataSourcePedOs: TDataSource;
    IBQueryPedOsID_ITEM: TIntegerField;
    IBQueryPedOsDEFEITO: TIBStringField;
    IBQueryPedOsIDENTIFICACAO: TIBStringField;
    IBQueryPedOsDESC_SERVICO: TIBStringField;
    IBQueryPedOsVALOR: TIBBCDField;
    IBQueryPedOsID_SERV_FK: TIntegerField;
    IBQueryPedOsID_EQUIP_FK: TIntegerField;
    IBQueryPedOsID_OS_FK: TIntegerField;
    IBQueryPedOsNOME_EQUIP: TIBStringField;
    IBQueryPedOsSUBTOTAL: TIBBCDField;
    IBQueryPedOsDESCONTO: TIBBCDField;
    IBQueryPedOsTOTAL: TIBBCDField;
    IBQueryPedOsDATA_ABERTA: TDateField;
    IBQueryPedOsDATA_FECHADA: TDateField;
    IBQueryPedOsSTATUS: TIBStringField;
    IBQueryclienteID_OS: TIntegerField;
    IBQueryclienteID_CAD_FK: TIntegerField;
    IBQueryclienteNOME: TIBStringField;
    IBQueryclienteENDERECO: TIBStringField;
    IBQueryclienteTEL: TIBStringField;
    IBQueryclienteCPF_CNPJ: TIBStringField;
    IBQueryclienteTIPO_CAD: TIBStringField;
    IBQueryclienteID_CID_FK: TIntegerField;
    IBQueryclienteTOTAL: TIBBCDField;
    IBQueryclienteDATA_ABERTA: TDateField;
    IBQueryclienteDATA_FECHADA: TDateField;
    IBQueryclienteSTATUS: TIBStringField;
    IBQueryclienteNOME_CID: TIBStringField;
    ppSummaryBand2: TppSummaryBand;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppReportEtiqueta: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppDBText21: TppDBText;
    ppShape16: TppShape;
    ppLabel36: TppLabel;
    ppDBText48: TppDBText;
    ppLabel44: TppLabel;
    ppDBText49: TppDBText;
    ppLabel45: TppLabel;
    ppDBText50: TppDBText;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText51: TppDBText;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGos: TFrmGos;

implementation

{$R *.dfm}

uses Uos, UitemOs, UBuscaPessoa;


procedure TFrmGos.BitBtn1Click(Sender: TObject);
begin
FrmBuscaPessoa.showmodal;
end;

procedure TFrmGos.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TFrmGos.BitBtn3Click(Sender: TObject);
begin
FrmNovaOs.DateTimePicker1.Date:=date;

FrmNovaOs.IBQueryEquip.Active:=false;
FrmNovaOs.IBQueryEquip.Active:=true;
FrmNovaOs.ShowModal;
end;

procedure TFrmGos.BitBtn4Click(Sender: TObject);
   var SUB :double;
  var somar: double;
  var VLR:String;
Begin
if  ((DbGrid1.Columns.Items[6].Field).AsString <> 'ABERTA') then
begin
showmessage('N�o foi possivel abrir Ordem de Servi�o! Ela est� '+(DbGrid1.Columns.Items[6].Field).AsString);
end;


if (IBQuerygrid.RecordCount > 0) And ((DbGrid1.Columns.Items[6].Field).AsString = 'ABERTA') then
begin
FrmItemOs.EidOS.Text:=(FrmGos.DbGrid1.Columns.Items[0].Field).AsString;
FrmItemOs.Ecliente.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
FrmItemOs.Edata.Text:=(DbGrid1.Columns.Items[4].Field).AsString;

FrmItemOs.IBQueryGrid.sql.clear;
        FrmItemOs.IBQuerygrid.sql.add('SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.DESC_SERVICO,'+
        'I.VALOR,I.ID_SERV_FK,I.ID_EQUIP_FK,I.ID_OS_FK,'+
        'E.NOME_EQUIP FROM ITEM_OS AS I INNER JOIN EQUIPAMENTO AS '+
        'E ON ID_EQUIP_FK = ID_EQUIP WHERE ID_OS_FK = :idos');
        FrmItemOs.IBQuerygrid.ParamByName('idos').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        FrmItemOs.IBQuerygrid.active:= true;
        FrmItemOs.Eidenfic.Enabled:=false;
        FrmItemOs.MDefeito.Enabled:=false;FrmItemOs.DBLookupComboBoxServico.Enabled:=False; FrmItemOs.Evalor.Enabled:=false;
        FrmItemOs.MDescServ.Enabled:=false;


     inherited;
          Somar:=0;
           with FrmItemOs.Ibquerygrid do
          begin
          FrmItemOs.Ibquerygrid.disablecontrols;
          FrmItemOs.Ibquerygrid.first;
          while not FrmItemOs.Ibquerygrid.eof do
          Begin
          VLR:=(FrmItemOs.Ibquerygrid.fieldByname('VALOR').AsString);
          if (VLR = '') then
          begin
          VLR:= '0';
          end;
          somar := (Somar +StrToFloat(VLR));
           SUB   := SOMAR;
          FrmItemOs.Ibquerygrid.next;
          end;
          FrmItemOs.Ibquerygrid.Enablecontrols;
          End;
          FrmItemOs.Etotal.text:= FormatFloat('#######0.00',(somar));

          FrmItemOs.IBQueryServ.Active:=false;
          FrmItemOs.IBQueryServ.Active:=true;
    FrmItemOs.ShowModal;
end;
end;

procedure TFrmGos.BitBtn5Click(Sender: TObject);
begin
 if ((DbGrid1.Columns.Items[6].Field).AsString = 'ABERTA') and (Application.MessageBox('Deseja realmente cancelar essa Ordem de Servi�o?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
 Begin
IBQueryCan.Close;
     IBQueryCan.SQL.Text:='UPDATE OS SET STATUS=:status WHERE ID_OS =:id_os';
     IBQueryCan.ParamByName('id_os').Asinteger:=Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
     IBQueryCan.ParamByName('status').AsString:='CANCELADA';
     IBQueryCan.ExecSQL;
     FrmGos.IBQuerygrid.Active:=false;
     FrmGos.IBQuerygrid.Active:=true;
 End;
end;
procedure TFrmGos.BitBtn6Click(Sender: TObject);
begin
if (IBQuerygrid.RecordCount > 0) then
begin
ppLabelDesc.Text:='Lista de Ordens de Servi�o "'+Combobox1.Text+'" de '+DateTostr(DateTimePicker1.date)+' at� '+DateTostr(DateTimePicker2.date);
ppReportListaOs.print;
end;
end;

procedure TFrmGos.BitBtn7Click(Sender: TObject);
begin
if (IBQuerygrid.RecordCount > 0)  and (ComboBox1.ItemIndex = 0) then
 Begin


        IBQueryPedOs.active := false;
        IBQueryPedOs.sql.clear;
         IBQueryPedOs.sql.add('SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.DESC_SERVICO,I.VALOR,'+
        ' I.ID_SERV_FK,I.ID_EQUIP_FK,I.ID_OS_FK,E.NOME_EQUIP,'+
        ' O.SUBTOTAL,O.DESCONTO,O.TOTAL,O.DATA_ABERTA,O.DATA_FECHADA,'+
        ' O.STATUS FROM ITEM_OS AS I INNER JOIN EQUIPAMENTO AS E ON '+
        ' I.ID_EQUIP_FK = E.ID_EQUIP'+
        ' INNER JOIN OS AS O ON '+
        ' I.ID_OS_FK = O.ID_OS WHERE I.ID_OS_FK = :id');
        IBQueryPedOs.ParamByName('id').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        IBQueryPedOs.active:= true;

        IBQueryCliente.active := false;
        IBQueryCliente.sql.clear;
        IBQueryCliente.sql.add('SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,P.ENDERECO,P.TEL,P.CPF_CNPJ,P.TIPO_CAD,P.ID_CID_FK,O.TOTAL, '+
        'O.DATA_ABERTA,O.DATA_FECHADA,O.STATUS,C.NOME_CID FROM OS AS O '+
        'INNER JOIN PESSOA AS P ON O.ID_CAD_FK = P.ID_CAD INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID  WHERE ID_OS =:idos');
        IBQueryCliente.ParamByName('idos').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        IBQueryCliente.active:= true;

        ppReportPedOs.print;


 End;

if (IBQuerygrid.RecordCount > 0) and (ComboBox1.ItemIndex =1) then
 begin
        IBQueryRelOs.active := false;
        IBQueryRelOs.sql.clear;
        IBQueryRelOs.sql.add('SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.DESC_SERVICO,I.VALOR,'+
        ' I.ID_SERV_FK,I.ID_EQUIP_FK,I.ID_OS_FK,E.NOME_EQUIP,S.DESC_SERV,'+
        ' O.SUBTOTAL,O.DESCONTO,O.TOTAL,O.DATA_ABERTA,O.DATA_FECHADA,'+
        ' O.STATUS FROM ITEM_OS AS I INNER JOIN EQUIPAMENTO AS E ON '+
        ' I.ID_EQUIP_FK = E.ID_EQUIP INNER JOIN SERVICO AS S ON '+
        ' I.ID_SERV_FK = S.ID_SERV INNER JOIN OS AS O ON '+
        ' I.ID_OS_FK = O.ID_OS WHERE I.ID_OS_FK = :id');
        IBQueryRelOs.ParamByName('id').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        IBQueryRelOs.active:= true;

        IBQuerycli.active := false;
        IBQuerycli.sql.clear;
        IBQuerycli.sql.add(' SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,P.ENDERECO,P.TEL,P.CPF_CNPJ,P.TIPO_CAD,P.ID_CID_FK,O.TOTAL, '+
        'O.DATA_ABERTA,O.DATA_FECHADA,O.STATUS,C.NOME_CID FROM OS AS O '+
        'INNER JOIN PESSOA AS P ON O.ID_CAD_FK = P.ID_CAD INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID  WHERE ID_OS =:idos');
        IBQuerycli.ParamByName('idos').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        IBQuerycli.active:= true;

      ppReportoS.Print;

  end;

end;

procedure TFrmGos.BitBtn8Click(Sender: TObject);
var verif : string;
begin
    if (Eid.Text = '') then
      begin
        IBQuerygrid.active := false;
        IBQuerygrid.sql.clear;
        IBQuerygrid.sql.add('SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,O.TOTAL,O.DATA_ABERTA, '+
        'O.DATA_FECHADA,O.STATUS FROM OS AS O INNER JOIN PESSOA AS P ON P.ID_CAD = O.ID_CAD_FK '+
        ' WHERE (O.DATA_ABERTA BETWEEN :dtincio AND :dtfim) AND O.STATUS like :status');
        IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
        IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
        if (ComboBox1.ItemIndex = 3) then
        begin
        verif:='%';
        end
        else
        begin
        verif:=ComboBox1.Text;
        end;
        IBQuerygrid.ParamByName('status').AsString:= verif;
        IBQuerygrid.active:= true;
      end;
      if (Eid.Text <> '') then
       Begin
        IBQuerygrid.active := false;
        IBQuerygrid.sql.clear;
        IBQuerygrid.sql.add('SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,O.TOTAL,O.DATA_ABERTA, '+
        'O.DATA_FECHADA,O.STATUS FROM OS AS O INNER JOIN PESSOA AS P ON P.ID_CAD = O.ID_CAD_FK '+
        ' WHERE (O.DATA_ABERTA BETWEEN :dtincio AND :dtfim) AND O.ID_CAD_FK =:idcad AND O.STATUS like :status');
        IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
        IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
        IBQuerygrid.ParamByName('idcad').Asinteger:= Strtoint(Eid.Text);
        if (ComboBox1.ItemIndex = 3) then
        begin
        verif:='%';
        end
        else
        begin
        verif:=ComboBox1.Text;
        end;
        IBQuerygrid.ParamByName('status').AsString:= verif;
        IBQuerygrid.active:= true;
       end;
end;

procedure TFrmGos.BitBtn9Click(Sender: TObject);
begin
Eid.Clear;
Ebusca.Clear;
DateTimePicker1.Date:=date-30;
DateTimePicker2.Date:=date;
end;

procedure TFrmGos.DBGrid1DblClick(Sender: TObject);
 var SUB :double;
  var somar: double;
  var VLR:String;
Begin
if  ((DbGrid1.Columns.Items[6].Field).AsString <> 'ABERTA') then
begin
showmessage('N�o foi possivel abrir Ordem de Servi�o! Ela est� '+(DbGrid1.Columns.Items[6].Field).AsString);
end;


if (IBQuerygrid.RecordCount > 0) And ((DbGrid1.Columns.Items[6].Field).AsString = 'ABERTA') then
begin
FrmItemOs.EidOS.Text:=(FrmGos.DbGrid1.Columns.Items[0].Field).AsString;
FrmItemOs.Ecliente.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
FrmItemOs.Edata.Text:=(DbGrid1.Columns.Items[4].Field).AsString;

FrmItemOs.IBQueryGrid.sql.clear;
        FrmItemOs.IBQuerygrid.sql.add('SELECT I.ID_ITEM,I.DEFEITO,I.IDENTIFICACAO,I.DESC_SERVICO,'+
        'I.VALOR,I.ID_SERV_FK,I.ID_EQUIP_FK,I.ID_OS_FK,'+
        'E.NOME_EQUIP FROM ITEM_OS AS I INNER JOIN EQUIPAMENTO AS '+
        'E ON ID_EQUIP_FK = ID_EQUIP WHERE ID_OS_FK = :idos');
        FrmItemOs.IBQuerygrid.ParamByName('idos').AsInteger := Strtoint((FrmGos.DbGrid1.Columns.Items[0].Field).AsString);
        FrmItemOs.IBQuerygrid.active:= true;
        FrmItemOs.Eidenfic.Enabled:=false;
        FrmItemOs.MDefeito.Enabled:=false;FrmItemOs.DBLookupComboBoxServico.Enabled:=False; FrmItemOs.Evalor.Enabled:=false;
        FrmItemOs.MDescServ.Enabled:=false;


     inherited;
          Somar:=0;
           with FrmItemOs.Ibquerygrid do
          begin
          FrmItemOs.Ibquerygrid.disablecontrols;
          FrmItemOs.Ibquerygrid.first;
          while not FrmItemOs.Ibquerygrid.eof do
          Begin
          VLR:=(FrmItemOs.Ibquerygrid.fieldByname('VALOR').AsString);
          if (VLR = '') then
          begin
          VLR:= '0';
          end;
          somar := (Somar +StrToFloat(VLR));
           SUB   := SOMAR;
          FrmItemOs.Ibquerygrid.next;
          end;
          FrmItemOs.Ibquerygrid.Enablecontrols;
          End;
          FrmItemOs.Etotal.text:= FormatFloat('#######0.00',(somar));

          FrmItemOs.IBQueryServ.Active:=false;
          FrmItemOs.IBQueryServ.Active:=true;
    FrmItemOs.ShowModal;
end;
end;

procedure TFrmGos.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date+30;
end;

end.
