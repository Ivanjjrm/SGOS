unit UGOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmGos = class(TForm)
    DBGrid1: TDBGrid;
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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGos: TFrmGos;

implementation

{$R *.dfm}

uses Uos, UitemOs;

procedure TFrmGos.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TFrmGos.BitBtn3Click(Sender: TObject);
begin
FrmNovaOs.ShowModal;
end;

procedure TFrmGos.BitBtn4Click(Sender: TObject);
begin
if (IBQuerygrid.RecordCount > 0) then
begin
FrmItemOs.EidOS.Text:=(FrmGos.DbGrid1.Columns.Items[0].Field).AsString;
FrmItemOs.Ecliente.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
FrmItemOs.Edata.Text:=(DbGrid1.Columns.Items[4].Field).AsString;
FrmItemOs.ShowModal;
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
        ' WHERE (O.DATA_ABERTA BETWEEN :dtincio AND :dtfim) AND O.STATUS like :status ');
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
        ' WHERE (O.DATA_ABERTA BETWEEN :dtincio AND :dtfim) AND O.ID_CAD_FK = :idcad AND O.STATUS like :status ');
        IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
        IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
        IBQuerygrid.ParamByName('idcad').Asinteger:= Strtoint(Eid.Text);
        IBQuerygrid.ParamByName('status').AsString:= ComboBox1.Text;
        IBQuerygrid.active:= true;
       end;

end;

procedure TFrmGos.DBGrid1DblClick(Sender: TObject);
begin
if (IBQuerygrid.RecordCount > 0) then
begin
FrmItemOs.EidOS.Text:=(FrmGos.DbGrid1.Columns.Items[0].Field).AsString;
FrmItemOs.Ecliente.Text:=(DbGrid1.Columns.Items[2].Field).AsString;
FrmItemOs.Edata.Text:=(DbGrid1.Columns.Items[4].Field).AsString;
FrmItemOs.ShowModal;
end;
end;

procedure TFrmGos.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date+30;
end;

end.
