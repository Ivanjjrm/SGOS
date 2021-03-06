unit UBuscaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Menus, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Uos,
  UnovaReceber, UGOS, UnovoPagar;

type
  TFrmBuscaPessoa = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    MaskEditCPF_CNPJ: TMaskEdit;
    Ebusca: TEdit;
    IBQueryBusca: TIBQuery;
    DataSourcebusca: TDataSource;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    IBQueryBuscaID_CAD: TIntegerField;
    IBQueryBuscaNOME: TIBStringField;
    IBQueryBuscaTEL: TIBStringField;
    IBQueryBuscaENDERECO: TIBStringField;
    IBQueryBuscaID_CID_FK: TIntegerField;
    IBQueryBuscaNOME_CID: TIBStringField;
    IBQueryBuscaCPF_CNPJ: TIBStringField;
    IBQueryBuscaDATA_CAD: TDateField;
    IBQueryBuscaTIPO_CAD: TIBStringField;
    PopupMenu1: TPopupMenu;
    PessoaFsica1: TMenuItem;
    PessoaJurdica1: TMenuItem;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EbuscaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PessoaJurdica1Click(Sender: TObject);
    procedure PessoaFsica1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure MaskEditCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaPessoa: TFrmBuscaPessoa;

implementation

{$R *.dfm}

uses Uprincipal, Upessoa, Upagar, Ureceber;

procedure TFrmBuscaPessoa.BitBtn1Click(Sender: TObject);
begin
Ebusca.Text:=Trim(Ebusca.Text);
try
IF (RadioGroup1.ItemIndex = 0) then // Buscar por Codigo
Begin
if (Ebusca.Text  = '') then // verifica se o campo est� vazio
  begin
  Ebusca.SetFocus;
  end
  else if (Ebusca.Text  <> '') then    // BUSCAR POR ID
    begin
    IBQuerybusca.active := false;
    IBQuerybusca.sql.clear;
    IBQuerybusca.sql.add('SELECT P.ID_CAD, P.NOME,P.TEL, P.ENDERECO,P.ID_CID_FK,C.NOME_CID,P.CPF_CNPJ,P.DATA_CAD,P.TIPO_CAD'+
    ' FROM PESSOA AS P INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID WHERE P.ID_CAD =:id ');
    IBQuerybusca.ParamByName('id').AsInteger := StrToInt(Ebusca.Text);
    IBQuerybusca.active:= true;
    Ebusca.Clear;
    DBGrid1.SetFocus;
    End;
  End;

  if (RadioGroup1.ItemIndex = 1) then    // Busca por nome
  begin
  IBQuerybusca.active := false;
  IBQuerybusca.sql.clear;
  IBQuerybusca.sql.add('SELECT P.ID_CAD, P.NOME,P.TEL, P.ENDERECO,P.ID_CID_FK,C.NOME_CID,P.CPF_CNPJ,P.DATA_CAD,P.TIPO_CAD'+
  ' FROM PESSOA AS P INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID WHERE P.NOME  LIKE :nome ');
  IBQuerybusca.ParamByName('nome').AsString := Ebusca.Text + '%';
  IBQuerybusca.active:= true;
  Ebusca.Clear;
  if (IBQueryBusca.RecordCount < 0) then
  Ebusca.SetFocus;
  end;

  if (RadioGroup1.ItemIndex = 2) or (RadioGroup1.ItemIndex = 3) then  // Busca por CPF - CNPJ
  begin
  IBQuerybusca.active := false;
  IBQuerybusca.sql.clear;
  IBQuerybusca.sql.add('SELECT P.ID_CAD, P.NOME,P.TEL, P.ENDERECO,P.ID_CID_FK,C.NOME_CID,P.CPF_CNPJ,P.DATA_CAD,P.TIPO_CAD '+
  ' FROM PESSOA AS P INNER JOIN CIDADE AS C ON P.ID_CID_FK = C.ID_CID WHERE P.CPF_CNPJ =:cpf_cnpj');
  IBQuerybusca.ParamByName('cpf_cnpj').AsString := MaskEditCPF_CNPJ.Text;
  IBQuerybusca.active:= true;
  DBGrid1.SetFocus;
  End;
except
  on e: Exception do
  begin
    Application.MessageBox('Pesquisa Invalida! Tente Outra.','Aten��o Usu�rio',MB_ICONERROR);
    Ebusca.SetFocus;
    end;

end;

end;
procedure TFrmBuscaPessoa.BitBtn2Click(Sender: TObject);
begin
Receber.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
Receber.Ebusca.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmGos.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmGos.Ebusca.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmnovaOs.Eidpessoa.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmnovaOs.Enome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmNovoReceber.Eid.text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmNovoReceber.Ecliente.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmNovoPagar.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmNovoPagar.ENome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
Frmpagar.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
Frmpagar.ENome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
close;
end;

procedure TFrmBuscaPessoa.BitBtn3Click(Sender: TObject);
var cont : integer;
begin
if (IBQueryBusca.RecordCount > 0) then
begin
cont:= Length((DbGrid1.Columns.Items[6].Field).AsString);
if (cont = 14) then
begin
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
end else if (Cont = 18) then
begin
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
end;

FrmPessoa.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmPessoa.Enome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmPessoa.Etel.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
FrmPessoa.Eendereco.Text:=(DbGrid1.Columns.Items[3].Field).AsString;
FrmPessoa.DBLookupComboBoxcid.KeyValue:=(DbGrid1.Columns.Items[4].Field).AsInteger;
FrmPessoa.MaskEditCPF_CNPJ.Text:=(DbGrid1.Columns.Items[6].Field).AsString;
FrmPessoa.Eid.Visible:=true;
FrmPessoa.Eid.Visible:=false;
if ((DbGrid1.Columns.Items[8].Field).AsString = 'FISICO') then
FrmPessoa.CBTipo.ItemIndex:=0
else if ((DbGrid1.Columns.Items[8].Field).AsString = 'JURIDICO') then
FrmPessoa.CBTipo.ItemIndex:=1;
end;
FrmPessoa.ShowModal;
end;

procedure TFrmBuscaPessoa.BitBtn4Click(Sender: TObject);
begin
PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TFrmBuscaPessoa.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure TFrmBuscaPessoa.DBGrid1DblClick(Sender: TObject);
begin
Receber.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
Receber.Ebusca.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmGos.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmGos.Ebusca.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmnovaOs.Eidpessoa.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmnovaOs.Enome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmNovoReceber.Eid.text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmNovoReceber.Ecliente.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
FrmNovoPagar.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
FrmNovoPagar.ENome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
Frmpagar.Eid.Text:=(DbGrid1.Columns.Items[0].Field).AsString;
Frmpagar.ENome.Text:=(DbGrid1.Columns.Items[1].Field).AsString;
close;
end;

procedure TFrmBuscaPessoa.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    BitBtn2.SetFocus;
end;
end;

procedure TFrmBuscaPessoa.EbuscaKeyPress(Sender: TObject; var Key: Char);
begin // deixa somente digitar numeros.. quando a busca estiver por codigo
IF (RadioGroup1.ItemIndex = 0) then
begin
if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;
if key =#13 then
begin
key:=#0;
BitBtn1.SetFocus;
end;
end;

procedure TFrmBuscaPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
end;
end;

procedure TFrmBuscaPessoa.FormShow(Sender: TObject);
begin
Ebusca.SetFocus;
end;

procedure TFrmBuscaPessoa.MaskEditCPF_CNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key = #13 then
   Begin
    Key:= #0;
    BitBtn1.SetFocus;
end;
end;

procedure TFrmBuscaPessoa.PessoaFsica1Click(Sender: TObject);
begin
FrmPessoa.CBtipo.ItemIndex:=0;
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
FrmPessoa.ShowModal;
end;

procedure TFrmBuscaPessoa.PessoaJurdica1Click(Sender: TObject);
begin
IBQueryBusca.Close;
FrmPessoa.CBtipo.ItemIndex:=1;
FrmPessoa.MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
FrmPessoa.ShowModal;
end;

procedure TFrmBuscaPessoa.RadioGroup1Click(Sender: TObject);
begin
if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 1) then
begin
MaskEditCPF_CNPJ.Clear;
MaskEditCPF_CNPJ.Visible:=false;
Ebusca.Visible:=true;
end
else if (RadioGroup1.ItemIndex = 2) then
begin
IBQuerybusca.active := false;
MaskEditCPF_CNPJ.Clear;
MaskEditCPF_CNPJ.EditMask:='999.999.999-99;9';
Ebusca.Visible:=false;
MaskEditCPF_CNPJ.Visible:=true;
end
else if (RadioGroup1.ItemIndex = 3) then
begin
IBQuerybusca.active := false;
MaskEditCPF_CNPJ.EditMask:='99.999.999/9999-99;9';
Ebusca.Visible:=false;
MaskEditCPF_CNPJ.Visible:=true;
end
end;

end.
