unit Uequipamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmEquipamento = class(TForm)
    Eequipamento: TEdit;
    Label1: TLabel;
    Ebusca: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBQuerycad: TIBQuery;
    DataSourceBusca: TDataSource;
    IBQuerybusca: TIBQuery;
    Eid: TEdit;
    IBQuerybuscaID_EQUIP: TIntegerField;
    IBQuerybuscaNOME_EQUIP: TIBStringField;
    IBQuerybuscaDATA_CAD: TDateField;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EbuscaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EequipamentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEquipamento: TFrmEquipamento;

implementation

{$R *.dfm}

procedure TFrmEquipamento.BitBtn1Click(Sender: TObject);
begin
try
  begin
    if (Eid.Text <> '') then
    if (Application.MessageBox('Deseja realmente excluir esse equipamento?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
      begin
        IBQuerycad.Close;
        IBQuerycad.sql.Text:=('DELETE FROM EQUIPAMENTO WHERE ID_EQUIP = :id');
        IBQuerycad.ParamByName('id').AsString := Eid.Text;
        IBQuerycad.ExecSQL;
        IBQuerybusca.active:= FALSE;
        IBQuerybusca.active:= true;
        Eid.Clear;Eequipamento.Clear;
        end;
    end;
      except
       on e: Exception do
      begin
        Application.MessageBox('N�o � possivel Excluir! Existem refer�ncias deste equipamento no sistema!','Aten��o Usu�rio',MB_ICONERROR);
      end;
  end;
end;

procedure TFrmEquipamento.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TFrmEquipamento.BitBtn4Click(Sender: TObject);
begin
if (Eequipamento.text = '') then
begin
Eequipamento.setfocus;
end;

 if (Eid.Text = '') and (Eequipamento.Text <> '') then
  begin
   IBQueryCad.Close;
   IBQueryCAd.SQL.Text:='INSERT INTO EQUIPAMENTO (ID_EQUIP,NOME_EQUIP,DATA_CAD) VALUES (:id,:nome,:data)';
   IBQuerycad.ParamByName('id').Asinteger:=0;
   IBQuerycad.ParamByName('nome').AsString:=Eequipamento.Text;
   IBQuerycad.ParamByName('data').Asdate:=date;
   IBQuerycad.ExecSQL;
   IBQuerybusca.active:= FALSE;
   IBQuerybusca.active:= true;
   Eid.Clear;Eequipamento.Clear;
  end;

   if(Eid.Text <> '') and (Eequipamento.Text <> '') then
    begin
     IBQueryCad.Close;
     IBQueryCad.SQL.Text:='UPDATE EQUIPAMENTO SET NOME_EQUIP=:nome, DATA_CAD=:data WHERE ID_EQUIP = :id';
     IBQuerycad.ParamByName('id').Asinteger:=Strtoint(Eid.Text);
     IBQuerycad.ParamByName('nome').AsString:=Eequipamento.Text;
     IBQuerycad.ParamByName('data').Asdate:=date;
     IBQuerycad.ExecSQL;
     IBQuerybusca.active:= FALSE;
     IBQuerybusca.active:= true;
     Eid.Clear;Eequipamento.Clear;
    end;


end;

procedure TFrmEquipamento.DBGrid1DblClick(Sender: TObject);
begin
if (IBQuerybusca.RecordCount > 0) then
    begin
    Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
    Eequipamento.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
    Ebusca.Clear;
    end;
end;

procedure TFrmEquipamento.EbuscaKeyPress(Sender: TObject; var Key: Char);
begin
IBQueryBusca.active := false;
IBQueryBusca.sql.clear;
IBQueryBusca.sql.add('SELECT * FROM EQUIPAMENTO WHERE NOME_EQUIP LIKE :nome');
IBQueryBusca.ParamByName('nome').AsString := Ebusca.Text + '%';
IBQueryBusca.active:= true;
end;

procedure TFrmEquipamento.EequipamentoKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 then
   Begin
    Key:= #0;
    BitBtn4.SetFocus;
end;
end;

procedure TFrmEquipamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Eid.Clear;Eequipamento.Clear;
end;

end.
