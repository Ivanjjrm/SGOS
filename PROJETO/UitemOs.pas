unit UitemOs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, UGOS, UfechamentoOs;

type
  TFrmItemOs = class(TForm)
    Ecliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MDefeito: TMemo;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DBLookupComboBoxServico: TDBLookupComboBox;
    Label5: TLabel;
    MDescServ: TMemo;
    Label6: TLabel;
    Etotal: TEdit;
    Label9: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edata: TEdit;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Evalor: TEdit;
    Label11: TLabel;
    Bevel1: TBevel;
    Eidenfic: TEdit;
    Label12: TLabel;
    Bevel2: TBevel;
    Eidos: TEdit;
    IBQueryEquip: TIBQuery;
    IBQueryServ: TIBQuery;
    DataSourceEquip: TDataSource;
    DataSourceServ: TDataSource;
    IBQueryGrid: TIBQuery;
    DataSourceGrid: TDataSource;
    BitBtn7: TBitBtn;
    IBQueryLanc: TIBQuery;
    Eiditem: TEdit;
    Label4: TLabel;
    IBQueryGridID_ITEM: TIntegerField;
    IBQueryGridDEFEITO: TIBStringField;
    IBQueryGridIDENTIFICACAO: TIBStringField;
    IBQueryGridDESC_SERVICO: TIBStringField;
    IBQueryGridVALOR: TIBBCDField;
    IBQueryGridID_SERV_FK: TIntegerField;
    IBQueryGridID_EQUIP_FK: TIntegerField;
    IBQueryGridID_OS_FK: TIntegerField;
    IBQueryGridNOME_EQUIP: TIBStringField;
    DBLookupComboBoxEquipamento: TDBLookupComboBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBLookupComboBoxServicoClick(Sender: TObject);
    procedure DBLookupComboBoxServicoExit(Sender: TObject);
    procedure EvalorExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EvalorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxServicoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItemOs: TFrmItemOs;
   var SUB :double;
  var somar: double;
  var VLR:String;


implementation

{$R *.dfm}

procedure TFrmItemOs.BitBtn1Click(Sender: TObject);
begin
     Eiditem.Clear;Evalor.Clear;MDefeito.Text:='';MDescServ.Text:='';Eidenfic.Clear;
     DBLookupComboBoxServico.KeyValue:=-1; DBLookupComboBoxEquipamento.KeyValue:=-1;
     DBLookupComboBoxEquipamento.Enabled:=false; Eidenfic.Enabled:=false;
     MDefeito.Enabled:=false;DBLookupComboBoxServico.Enabled:=False; Evalor.Enabled:=false;
     MDescServ.Enabled:=false;
end;

procedure TFrmItemOs.BitBtn2Click(Sender: TObject);
begin
if (DBLookupComboBoxServico.KeyValue = -1) then
begin
Application.MessageBox('Selecione Um servi�o!','Erro',MB_ICONERROR);
DBLookupComboBoxServico.SetFocus;
end;

if (Eiditem.Text <> '') and (DBLookupComboBoxServico.KeyValue <> -1) then
begin
IBQueryLanc.Close;
     IBQueryLanc.SQL.Text:='UPDATE ITEM_OS SET DEFEITO=:defeito,IDENTIFICACAO=:identificacao,'+
      ' DESC_SERVICO=:desc_serv,VALOR=:valor,ID_SERV_FK=:idserv,' +
      ' ID_EQUIP_FK=:idequip WHERE ID_ITEM = :id_item';
     IBQueryLanc.ParamByName('id_item').Asinteger:=Strtoint(Eiditem.Text);
     IBQueryLanc.ParamByName('idequip').Asinteger:=Strtoint(DBLookupComboBoxEquipamento.KeyValue);
     IBQueryLanc.ParamByName('idserv').AsInteger:=Strtoint(DBLookupComboBoxServico.KeyValue);
     IBQueryLanc.ParamByName('identificacao').AsString:=Eidenfic.Text;
     IBQueryLanc.ParamByName('defeito').AsString:=MDefeito.Text;
     IBQueryLanc.ParamByName('desc_serv').AsString:=MDescServ.Text;
     IBQueryLanc.ParamByName('valor').AsFloat:=strtofloat(Evalor.Text);
     IBQueryLanc.ExecSQL;
     IBQueryGrid.active:= FALSE;
     IBQueryGrid.active:= true;
     Eiditem.Clear;Evalor.Clear;MDefeito.Text:='';MDescServ.Text:='';Eidenfic.Clear;
     DBLookupComboBoxServico.KeyValue:=-1; DBLookupComboBoxEquipamento.KeyValue:=-1;
     DBLookupComboBoxEquipamento.Enabled:=false; Eidenfic.Enabled:=false;
     MDefeito.Enabled:=false;DBLookupComboBoxServico.Enabled:=False; Evalor.Enabled:=false;
     MDescServ.Enabled:=false;

     inherited;
          Somar:=0;
           with Ibquerygrid do
          begin
          Ibquerygrid.disablecontrols;
          Ibquerygrid.first;
          while not Ibquerygrid.eof do
          Begin
          VLR:=(Ibquerygrid.fieldByname('VALOR').AsString);
          if (VLR = '') then
          begin
          VLR:= '0';
          end;
          somar := (Somar +StrToFloat(VLR));
           SUB   := SOMAR;
          Ibquerygrid.next;
          end;
          Ibquerygrid.Enablecontrols;
          End;
          Etotal.text:= FormatFloat('#######0.00',(somar));



end;
     end;

procedure TFrmItemOs.BitBtn2KeyPress(Sender: TObject; var Key: Char);
begin
If key = #13 then
   Begin
    Key:= #0;
    DBGrid1.SetFocus;
end;
end;

procedure TFrmItemOs.BitBtn3Click(Sender: TObject);
begin
if (Eiditem.Text <> '') then
if (Application.MessageBox('Deseja Realmente Excluir?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
begin
IBQueryLanc.Close;
IBQueryLanc.sql.Text:=('DELETE FROM ITEM_OS WHERE ID_ITEM =:iditem');
IBQueryLanc.ParamByName('iditem').AsString := Eiditem.Text;
IBQueryLanc.ExecSQL;
IBQueryGrid.Close;
IBQueryGrid.Open;
     Eiditem.Clear;Evalor.Clear;MDefeito.Text:='';MDescServ.Text:='';Eidenfic.Clear;
     DBLookupComboBoxServico.KeyValue:=-1; DBLookupComboBoxEquipamento.KeyValue:=-1;
     DBLookupComboBoxEquipamento.Enabled:=false; Eidenfic.Enabled:=false;
     MDefeito.Enabled:=false;DBLookupComboBoxServico.Enabled:=False; Evalor.Enabled:=false;
     MDescServ.Enabled:=false;

inherited;
          Somar:=0;
           with Ibquerygrid do
          begin
          Ibquerygrid.disablecontrols;
          Ibquerygrid.first;
          while not Ibquerygrid.eof do
          Begin
          VLR:=(Ibquerygrid.fieldByname('VALOR').AsString);
          if (VLR = '') then
          begin
          VLR:= '0';
          end;
          somar := (Somar +StrToFloat(VLR));
           SUB   := SOMAR;
          Ibquerygrid.next;
          end;
          Ibquerygrid.Enablecontrols;
          End;
          Etotal.text:= FormatFloat('#######0.00',(somar));
end;
end;

procedure TFrmItemOs.BitBtn4Click(Sender: TObject);
var verif: String;
begin
Verif:='false';

          with Ibquerygrid do
          begin
          Ibquerygrid.disablecontrols;
          Ibquerygrid.first;
          while not Ibquerygrid.eof do
          Begin
          VLR := (Ibquerygrid.fieldByname('VALOR').AsString);
          if (VLR = '') then
          begin
          Verif:='true';
          end;
          Ibquerygrid.next;
          end;
          Ibquerygrid.Enablecontrols;
          End;
          if (Verif = 'false') then
          begin
          Frmfechamento.Esubtotal.Text:=Etotal.Text;
          Frmfechamento.Etotal.Text:=Etotal.Text;
          Frmfechamento.DateTimePicker1.Date:=date+30;
          Frmfechamento.ShowModal;
          FrmGos.IBQuerygrid.Active:=false;
          FrmGos.IBQuerygrid.Active:=true;
          end
          else if (Verif = 'true') then
          begin
          Application.MessageBox('Aida Existe Equipamentos sem servi�o!','Erro',MB_ICONERROR);
           end;
end;

procedure TFrmItemOs.BitBtn5Click(Sender: TObject);
begin
Close;
end;

procedure TFrmItemOs.BitBtn6Click(Sender: TObject);
begin
 if (Application.MessageBox('Deseja realmente cancelar essa Ordem de Servi�o?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
 Begin
IBQueryLanc.Close;
     IBQueryLanc.SQL.Text:='UPDATE OS SET STATUS=:status WHERE ID_OS =:id_os';
     IBQueryLanc.ParamByName('id_os').Asinteger:=Strtoint(Eidos.Text);
     IBQueryLanc.ParamByName('status').AsString:='CANCELADA';
     IBQueryLanc.ExecSQL;
     close;
     FrmGos.IBQuerygrid.Active:=false;
     FrmGos.IBQuerygrid.Active:=true;
 End;

 end;

procedure TFrmItemOs.BitBtn7Click(Sender: TObject);
begin
  if (IBQueryGrid.RecordCount > 0) then
    begin
    IBQueryEquip.open;
     DBLookupComboBoxEquipamento.Enabled:=true; Eidenfic.Enabled:=true;
     MDefeito.Enabled:=true;DBLookupComboBoxServico.Enabled:=true; Evalor.Enabled:=true;
     MDescServ.Enabled:=true;
      Eiditem.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
      DBLookupComboBoxEquipamento.KeyValue:=(DbGrid1.Columns.Items[7].Field).AsString;
      MDefeito.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
      Eidenfic.Text:=(DbGrid1.Columns.Items[3].Field).AsString;
      Evalor.Text:=(DbGrid1.Columns.Items[5].Field).AsString;
      MDescServ.Text:=(DbGrid1.Columns.Items[4].Field).AsString;
      if ((DbGrid1.Columns.Items[6].Field).AsString <> '') then
      DBLookupComboBoxServico.KeyValue:=(DbGrid1.Columns.Items[6].Field).AsString;
      DBLookupComboBoxEquipamento.Enabled:=FALSE;
    end;
end;

procedure TFrmItemOs.BitBtn7KeyPress(Sender: TObject; var Key: Char);
begin
If key = #13 then
   Begin
    Key:= #0;
    DBLookupComboBoxServico.SetFocus;
end;
end;


procedure TFrmItemOs.DBGrid1DblClick(Sender: TObject);
begin
 if (IBQueryGrid.RecordCount > 0) then
    begin
    IBQueryEquip.open;
     DBLookupComboBoxEquipamento.Enabled:=true; Eidenfic.Enabled:=true;
     MDefeito.Enabled:=true;DBLookupComboBoxServico.Enabled:=true; Evalor.Enabled:=true;
     MDescServ.Enabled:=true;
      Eiditem.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
      MDefeito.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
      Eidenfic.Text:=(DbGrid1.Columns.Items[3].Field).AsString;
      Evalor.Text:=(DbGrid1.Columns.Items[5].Field).AsString;
      MDescServ.Text:=(DbGrid1.Columns.Items[4].Field).AsString;
      DBLookupComboBoxEquipamento.KeyValue:=Strtoint((DbGrid1.Columns.Items[7].Field).AsString);
      if ((DbGrid1.Columns.Items[6].Field).AsString <> '') then
      DBLookupComboBoxServico.KeyValue:=(DbGrid1.Columns.Items[6].Field).AsString;
      DBLookupComboBoxEquipamento.Enabled:=FALSE;
    end;
end;


procedure TFrmItemOs.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
Begin
DBGrid1.Canvas.Font.Color := clBlack;
   if (IBQueryGrid.FieldByName('ID_SERV_FK').Value > 0) then
   begin
      DBGrid1.Canvas.Font.Color := clBlue;
   end;
   DBGrid1.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure TFrmItemOs.DBLookupComboBoxServicoClick(Sender: TObject);
begin
Evalor.Text:=IBQueryServ.fieldByname('VALOR').AsString;
Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
end;

procedure TFrmItemOs.DBLookupComboBoxServicoExit(Sender: TObject);
begin
Evalor.Text:=IBQueryServ.fieldByname('VALOR').AsString;
Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
end;

procedure TFrmItemOs.DBLookupComboBoxServicoKeyPress(Sender: TObject;
  var Key: Char);
begin
If key = #13 then
   Begin
    Key:= #0;
    MDescServ.SetFocus;
end;
end;

procedure TFrmItemOs.EvalorExit(Sender: TObject);
begin
Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
end;

procedure TFrmItemOs.EvalorKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then key :=#0;
  if key =#13 then
begin
key:=#0;
BitBtn4.SetFocus;
end;
end;

end.
