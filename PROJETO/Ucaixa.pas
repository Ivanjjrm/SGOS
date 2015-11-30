unit Ucaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Uprincipal, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe;

type
  TFrmMovFinan = class(TForm)
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn4: TBitBtn;
    Bevel1: TBevel;
    IBQueryGrid: TIBQuery;
    DataSourceGrid: TDataSource;
    ETotalDinAv: TEdit;
    ETotalCartAv: TEdit;
    ETotalDinCRec: TEdit;
    ETotalCartCRec: TEdit;
    ETotalDinPag: TEdit;
    ETotalCartPag: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    EtotalEntrada: TEdit;
    EtotalSaida: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Bevel6: TBevel;
    Label11: TLabel;
    Esaldo: TEdit;
    ppDBPipelineMovFinan: TppDBPipeline;
    ppReportMov_Finan: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppShape3: TppShape;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape5: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabelTotalDinAv: TppLabel;
    ppLabelTotalCartAv: TppLabel;
    ppLabelTotalDinCRec: TppLabel;
    ppLabelTotalCartCRec: TppLabel;
    ppLabelTotalDinPag: TppLabel;
    ppLabelTotalCartPag: TppLabel;
    ppShape4: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabelTotalAvista: TppLabel;
    ppLabel31: TppLabel;
    ppLabelTotalAprazo: TppLabel;
    ppLabel33: TppLabel;
    ppLabelContaPag: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabelTotalRecCartao: TppLabel;
    ppLabel42: TppLabel;
    ppLabelTotaoPagCartao: TppLabel;
    ppLabel44: TppLabel;
    ppLabelTotalPagDin: TppLabel;
    ppLabel46: TppLabel;
    ppLabelTotalRecDin: TppLabel;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel6: TppLabel;
    ppLabel35: TppLabel;
    ppLabelTotalEntrada: TppLabel;
    ppLabel51: TppLabel;
    ppShape6: TppShape;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppShape11: TppShape;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabelTotalScartao: TppLabel;
    ppShape12: TppShape;
    ppLabel58: TppLabel;
    ppLabelTotalSdin: TppLabel;
    ppLabel60: TppLabel;
    ppLabel48: TppLabel;
    ppLabelTotalSaida: TppLabel;
    ppShape13: TppShape;
    ppLabel49: TppLabel;
    ppLabel62: TppLabel;
    ppLabelSaldo: TppLabel;
    ppLabelDesc: TppLabel;
    ppShape14: TppShape;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovFinan: TFrmMovFinan;
     var TotalDinAv,TotalDinCRec,TotalDinPag :double;
     var TotalCartAv,TotalCartCRec,TotalCartPag :double;
  var VLR:String;

implementation

{$R *.dfm}

uses UnovoPagar, UnovaReceber;

procedure TFrmMovFinan.BitBtn1Click(Sender: TObject);
begin
    IBQueryGrid.active := false;
    IBQueryGrid.sql.clear;
    IBQueryGrid.sql.add('SELECT * FROM MOV_FINAN WHERE (DATA_MOV BETWEEN :dtincio AND :dtfim) ORDER BY ORIGEM');
    IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
    IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
    IBQueryGrid.active:= true;

    inherited;
          TotalDinAv:=0;
          TotalDinCRec:=0;
          TotalDinPag:=0;
          TotalCartAv:=0;
          TotalCartCRec:=0;
          TotalCartPag:=0;

           with Ibquerygrid do
          begin
          Ibquerygrid.disablecontrols;
          Ibquerygrid.first;
          while not Ibquerygrid.eof do
          Begin // Entrada em dinheiro Avista
          if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'O.S') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinAv:=(TotalDinAv +StrToFloat(VLR));
          end
          // Entrada em Cart�o Avista
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'O.S') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartAv:=(TotalCartAv +StrToFloat(VLR));
          end
           // Entrada em Dinheiro Contas a Receber
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.RECEBER') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinCRec:=(TotalDinCRec +StrToFloat(VLR));
          end
           // Entrada em Cart�o Contas a Rebeber
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.RECEBER') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartCRec:=(TotalCartCRec +StrToFloat(VLR));
          end
           // Saida em Dinheiro
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.A PAGAR') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinPag:=(TotalDinPag +StrToFloat(VLR));
          end
            // Saida em Cart�o
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.A PAGAR') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartPag:=(TotalCartPag +StrToFloat(VLR));
          end;

          Ibquerygrid.next;
          end;
          Ibquerygrid.Enablecontrols;
          End;


         ETotalDinAv.text:= FormatFloat('#######0.00',(TotalDinAv));
         ETotalCartAv.text:= FormatFloat('#######0.00',(TotalCartAv));
         ETotalDinCRec.text:= FormatFloat('#######0.00',(TotalDinCRec));
         ETotalCartCRec.text:= FormatFloat('#######0.00',(TotalCartCRec));
         ETotalDinPag.text:= FormatFloat('#######0.00',(TotalDinPag));
         ETotalCartPag.text:= FormatFloat('#######0.00',(TotalCartPag));

         EtotalEntrada.Text:= FormatFloat('#######0.00',(TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec));
         EtotalSaida.Text:= FormatFloat('#######0.00',(TotalCartPag+TotalDinPag));
         Esaldo.Text:= FormatFloat('#######0.00',((TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec)-(TotalCartPag+TotalDinPag)));


         ppLAbelDesc.Text:='Movimento Financeiro de '+DateTostr(DateTimePicker1.date)+' at� '+ DateTostr(DateTimePicker2.date);

         ppLabelTotalDinAv.Text:= FormatFloat('#######0.00',(TotalDinAv));
         ppLabelTotalCartAv.Text:= FormatFloat('#######0.00',(TotalCartAv));
         ppLabelTotalDinCRec.Text:= FormatFloat('#######0.00',(TotalDinCRec));
         ppLabelTotalCartCRec.Text:= FormatFloat('#######0.00',(TotalCartCRec));
         ppLabelTotalCartPag.Text:=  FormatFloat('#######0.00',(TotalCartPag));
         ppLabelTotalDinPag.Text:= FormatFloat('#######0.00',(TotalDinPag));
         ppLabelTotalEntrada.Text:= FormatFloat('#######0.00',(TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec));
         ppLabelTotalSaida.Text:= FormatFloat('#######0.00',(TotalCartPag+TotalDinPag));
         ppLabelSaldo.Text:= FormatFloat('#######0.00',((TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec)-(TotalCartPag+TotalDinPag)));
         ppLabelTotalAvista.Text:= FormatFloat('#######0.00',(TotalDinAv+TotalCartAv));
         ppLabelTotalAprazo.Text:= FormatFloat('#######0.00',(TotalDinCRec+TotalCartCRec));
         ppLabelContaPag.Text := FormatFloat('#######0.00',(TotalDinPag+TotalCartPag));
         ppLabelTotalRecCartao.Text := FormatFloat('#######0.00',(TotalCartAv+TotalCartCRec));
         ppLabelTotaoPagCartao.Text := FormatFloat('#######0.00',(TotalCartPag));
         ppLabelTotalScartao.Text := FormatFloat('#######0.00',((TotalCartAv+TotalCartCRec)-TotalCartPag));
         ppLabelTotalRecDin.Text := FormatFloat('#######0.00',(TotalDinAv+TotalDinCRec));
         ppLabelTotalPagDin.Text := FormatFloat('#######0.00',(TotalDinPag));
         ppLabelTotalSdin.Text := FormatFloat('#######0.00',((TotalDinAv+TotalDinCRec)-TotalDinpag));
         ppReportMov_Finan.Print;
end;

procedure TFrmMovFinan.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TFrmMovFinan.BitBtn3Click(Sender: TObject);
begin
frmNovoReceber.ShowModal;
end;

procedure TFrmMovFinan.BitBtn4Click(Sender: TObject);
begin
    IBQueryGrid.active := false;
    IBQueryGrid.sql.clear;
    IBQueryGrid.sql.add('SELECT * FROM MOV_FINAN WHERE (DATA_MOV BETWEEN :dtincio AND :dtfim)');
    IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
    IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
    IBQueryGrid.active:= true;

    inherited;
          TotalDinAv:=0;
          TotalDinCRec:=0;
          TotalDinPag:=0;
          TotalCartAv:=0;
          TotalCartCRec:=0;
          TotalCartPag:=0;

           with Ibquerygrid do
          begin
          Ibquerygrid.disablecontrols;
          Ibquerygrid.first;
          while not Ibquerygrid.eof do
          Begin // Entrada em dinheiro Avista
          if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'O.S') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinAv:=(TotalDinAv +StrToFloat(VLR));
          end
          // Entrada em Cart�o Avista
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'O.S') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartAv:=(TotalCartAv +StrToFloat(VLR));
          end
           // Entrada em Dinheiro Contas a Receber
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.RECEBER') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinCRec:=(TotalDinCRec +StrToFloat(VLR));
          end
           // Entrada em Cart�o Contas a Rebeber
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.RECEBER') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartCRec:=(TotalCartCRec +StrToFloat(VLR));
          end
           // Saida em Dinheiro
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'DINHEIRO') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.A PAGAR') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalDinPag:=(TotalDinPag +StrToFloat(VLR));
          end
            // Saida em Cart�o
          else if (Ibquerygrid.fieldByname('TIPO_PAG').AsString = 'CART�O') and
          (Ibquerygrid.fieldByname('ORIGEM').AsString = 'C.A PAGAR') then
          begin
          VLR:=(Ibquerygrid.fieldByname('VALOR_MOV').AsString);
          TotalCartPag:=(TotalCartPag +StrToFloat(VLR));
          end;

          Ibquerygrid.next;
          end;
          Ibquerygrid.Enablecontrols;
          End;

         ETotalDinAv.text:= FormatFloat('#######0.00',(TotalDinAv));
         ETotalCartAv.text:= FormatFloat('#######0.00',(TotalCartAv));
         ETotalDinCRec.text:= FormatFloat('#######0.00',(TotalDinCRec));
         ETotalCartCRec.text:= FormatFloat('#######0.00',(TotalCartCRec));
         ETotalDinPag.text:= FormatFloat('#######0.00',(TotalDinPag));
         ETotalCartPag.text:= FormatFloat('#######0.00',(TotalCartPag));

         EtotalEntrada.Text:= FormatFloat('#######0.00',(TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec));
         EtotalSaida.Text:= FormatFloat('#######0.00',(TotalCartPag+TotalDinPag));
         Esaldo.Text:= FormatFloat('#######0.00',((TotalDinAv+TotalCartAv+TotalDinCRec+TotalCartCRec)-(TotalCartPag+TotalDinPag)));


end;

procedure TFrmMovFinan.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
DBGrid1.Canvas.Font.Color := clBlack;
   if (IBQueryGrid.FieldByName('ORIGEM').Value = 'C.A PAGAR') then
   begin
      DBGrid1.Canvas.Brush.Color := clMedGray;
   end;
   DBGrid1.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure TFrmMovFinan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IBQueryGrid.active:= false;
end;

end.
