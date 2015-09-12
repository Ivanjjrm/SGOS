unit Ucidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmCidade = class(TForm)
    Ecidade: TEdit;
    Euf: TEdit;
    Ebusca: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Eid: TEdit;
    IBQueryCad: TIBQuery;
    IBQuerygrid: TIBQuery;
    DataSourcegrid: TDataSource;
    IBQuerygridID_CID: TIntegerField;
    IBQuerygridNOME_CID: TIBStringField;
    IBQuerygridUF: TIBStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EbuscaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EcidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EufKeyPress(Sender: TObject; var Key: Char);
    procedure EufExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCidade: TFrmCidade;

implementation

{$R *.dfm}

uses Uprincipal;

procedure TFrmCidade.BitBtn1Click(Sender: TObject);
Var
contuf : integer;
begin
 contuf:=Length(Euf.Text);
 Ecidade.Text:=Trim(Ecidade.Text);
  if (Ecidade.Text = '') then
    begin
     Showmessage('Campo Cidade est� vazio!');
     Ecidade.SetFocus;
    end;

  if (contuf < 2) then
    begin
    Showmessage('Campo Estado est� Invalido');
    Euf.SetFocus;
    end;

  if (Eid.Text = '') and (Ecidade.Text <> '') and (Euf.Text <> '') then
  begin
   IBQueryCad.Close;
   IBQueryCAd.SQL.Text:='INSERT INTO CIDADE (ID_CID,NOME_CID,UF) VALUES (:id,:cidade,:uf)';
   IBQuerycad.ParamByName('id').Asinteger:=0;
   IBQuerycad.ParamByName('cidade').AsString:=Ecidade.Text;
   IBQuerycad.ParamByName('uf').AsString:=Euf.Text;
   IBQuerycad.ExecSQL;
   IBQuerygrid.active:= FALSE;
   IBQuerygrid.active:= true;
   Eid.Clear;Ecidade.Clear;Euf.Clear;
  end;

  if(Eid.Text <> '') and (Ecidade.Text <> '') and (Euf.Text <> '') then
    begin
     IBQueryCad.Close;
     IBQueryCad.SQL.Text:='UPDATE CIDADE SET NOME_CID=:cidade, UF=:uf WHERE ID_CID = :id';
     IBQuerycad.ParamByName('id').Asinteger:=Strtoint(Eid.Text);
     IBQuerycad.ParamByName('cidade').AsString:=Ecidade.Text;
     IBQuerycad.ParamByName('uf').AsString:=Euf.Text;
     IBQuerycad.ExecSQL;
     IBQuerygrid.active:= FALSE;
     IBQuerygrid.active:= true;
     Eid.Clear;Ecidade.Clear;Euf.Clear;
    end;

end;


procedure TFrmCidade.BitBtn2Click(Sender: TObject);
begin
Eid.Clear;Ecidade.Clear;Euf.Clear;
end;

procedure TFrmCidade.BitBtn3Click(Sender: TObject);
begin
try
  begin
    if (Eid.Text <> '') then
    if (Application.MessageBox('Deseja Realmente Excluir essa Cidade?','Aten��o Usu�rio',MB_YESNO+MB_ICONQUESTION)=6) then
      begin
        IBQuerycad.Close;
        IBQuerycad.sql.Text:=('DELETE FROM CIDADE WHERE ID_CID = :id');
        IBQuerycad.ParamByName('id').AsString := Eid.Text;
        IBQuerycad.ExecSQL;
        IBQuerygrid.active:= FALSE;
        IBQuerygrid.active:= true;
        Eid.Clear;Ecidade.Clear;Euf.Clear;Ebusca.Clear;IBQueryGrid.close; Ebusca.setfocus;
        end;
    end;
      except
       on e: Exception do
      begin
        Application.MessageBox('N�o � possivel Excluir! Existem refer�ncias desta Cidade no sistema!','Aten��o Usu�rio',MB_ICONERROR);
      end;
  end;
end;
procedure TFrmCidade.BitBtn4Click(Sender: TObject);
begin
close;
end;

procedure TFrmCidade.DBGrid1DblClick(Sender: TObject);
begin
  if (IBQuerygrid.RecordCount > 0) then
    begin
    Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
    Ecidade.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
    Euf.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
    Ebusca.Clear;
    end;
end;

procedure TFrmCidade.EbuscaKeyPress(Sender: TObject; var Key: Char);
begin
IBQuerygrid.active := false;
IBQuerygrid.sql.clear;
IBQuerygrid.sql.add('SELECT * FROM CIDADE WHERE NOME_CID LIKE :cidade');
IBQuerygrid.ParamByName('cidade').AsString := Ebusca.Text + '%';
IBQuerygrid.active:= true;
end;

procedure TFrmCidade.EcidadeKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure TFrmCidade.EufExit(Sender: TObject);
begin
BitBtn1.SetFocus;
end;

procedure TFrmCidade.EufKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;

end.
