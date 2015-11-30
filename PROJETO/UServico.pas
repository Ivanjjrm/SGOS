unit UServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Uprincipal, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TServico = class(TForm)
    Eservico: TEdit;
    Evalor: TEdit;
    Ebusca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBQuerycad: TIBQuery;
    IBQueryGrid: TIBQuery;
    DataSourcegrid: TDataSource;
    Eid: TEdit;
    IBQueryGridID_SERV: TIntegerField;
    IBQueryGridDESC_SERV: TIBStringField;
    IBQueryGridDATA_CAD: TDateField;
    IBQueryGridVALOR: TIBBCDField;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EbuscaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EvalorExit(Sender: TObject);
    procedure EvalorKeyPress(Sender: TObject; var Key: Char);
    procedure EservicoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Servico: TServico;

implementation

{$R *.dfm}

procedure TServico.BitBtn1Click(Sender: TObject);
begin
Eid.Clear;Eservico.Clear;Evalor.Clear;
end;

procedure TServico.BitBtn2Click(Sender: TObject);
begin
try
  begin
    if (Eid.Text <> '') then
    if (Application.MessageBox('Deseja realmente excluir esse servi�o?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
      begin
        IBQuerycad.Close;
        IBQuerycad.sql.Text:=('DELETE FROM SERVICO WHERE ID_SERV = :id');
        IBQuerycad.ParamByName('id').AsString := Eid.Text;
        IBQuerycad.ExecSQL;
        IBQueryGrid.active:= FALSE;
        IBQueryGrid.active:= true;
        Eid.Clear;Eservico.Clear;Evalor.Text;
        end;
    end;
      except
       on e: Exception do
      begin
        Application.MessageBox('N�o � possivel Excluir! Existem refer�ncias deste servi�o no sistema!','Aten��o Usu�rio',MB_ICONERROR);
      end;
  end;
end;

procedure TServico.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure TServico.BitBtn4Click(Sender: TObject);
begin
Servico.Text:=Trim(Eservico.Text);
if (Eservico.text = '') then
begin
Servico.setfocus;
end;

 if (Eid.Text = '') and (Servico.Text <> '') then
  begin
   IBQueryCad.Close;
   IBQueryCAd.SQL.Text:='INSERT INTO SERVICO (ID_SERV,DESC_SERV,DATA_CAD,VALOR) '+
   ' VALUES (:id,:desc,:data,:valor)';
   IBQuerycad.ParamByName('id').Asinteger:=0;
   IBQuerycad.ParamByName('desc').AsString:=Eservico.Text;
   IBQuerycad.ParamByName('data').Asdate:=date;
   IBquerycad.ParamByName('valor').AsFloat:=strtofloat(Evalor.Text);
   IBQuerycad.ExecSQL;
   IBQueryGrid.active:= FALSE;
   IBQueryGrid.active:= true;
   Eid.Clear;Eservico.Clear;Evalor.Clear;
  end;

   if(Eid.Text <> '') and (Servico.Text <> '') then
    begin
     IBQueryCad.Close;
     IBQueryCad.SQL.Text:='UPDATE SERVICO SET DESC_SERV=:desc, DATA_CAD=:data, VALOR=:valor WHERE ID_SERV = :id';
     IBQuerycad.ParamByName('id').Asinteger:=Strtoint(Eid.Text);
     IBQuerycad.ParamByName('desc').AsString:=Eservico.Text;
     IBQuerycad.ParamByName('data').Asdate:=date;
     IBQuerycad.ParamByName('valor').AsFloat:=strtofloat(Evalor.Text);
     IBQuerycad.ExecSQL;
     IBQueryGrid.active:= FALSE;
     IBQueryGrid.active:= true;
     Eid.Clear;Eservico.Clear;Evalor.Clear;
    end;
end;

procedure TServico.BitBtn5Click(Sender: TObject);
begin
if (IBQueryGrid.RecordCount > 0) then
    begin
    Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
    Eservico.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
    Evalor.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
    Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
    Ebusca.Clear;
    end;
end;

procedure TServico.DBGrid1DblClick(Sender: TObject);
begin
if (IBQueryGrid.RecordCount > 0) then
    begin
    Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
    Eservico.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
    Evalor.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
    Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
    Ebusca.Clear;
    end;
end;

procedure TServico.EbuscaKeyPress(Sender: TObject; var Key: Char);
begin
IBQueryGrid.active := false;
IBQueryGrid.sql.clear;
IBQueryGrid.sql.add('SELECT * FROM SERVICO WHERE DESC_SERV LIKE :nome');
IBQueryGrid.ParamByName('nome').AsString := Ebusca.Text + '%';
IBQueryGrid.active:= true;
end;

procedure TServico.EservicoKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then
begin
key:=#0;
Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure TServico.EvalorExit(Sender: TObject);
begin
Evalor.Text:=FormatFloat('#######0.00',strtofloat(Evalor.Text));
end;

procedure TServico.EvalorKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',',',#8]) then key :=#0;
  if key =#13 then
begin
key:=#0;
BitBtn4.SetFocus;
end;
end;

procedure TServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Eid.Clear;Eservico.Clear;Evalor.Clear;
end;

end.
