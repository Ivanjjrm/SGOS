unit UGOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Uprincipal, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TGos = class(TForm)
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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Gos: TGos;

implementation

{$R *.dfm}

uses Uos, UitemOs;

procedure TGos.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TGos.BitBtn3Click(Sender: TObject);
begin
FrmNovaOs.ShowModal;
end;

procedure TGos.BitBtn4Click(Sender: TObject);
begin
ItemOs.ShowModal;
end;

procedure TGos.BitBtn8Click(Sender: TObject);
begin
IBQuerygrid.active := false;
IBQuerygrid.sql.clear;
IBQuerygrid.sql.add('SELECT O.ID_OS,O.ID_CAD_FK,P.NOME,O.TOTAL,O.DATA_ABERTA, '+
'O.DATA_FECHADA,O.STATUS FROM OS AS O INNER JOIN PESSOA AS P ON P.ID_CAD = O.ID_CAD_FK '+
' WHERE (O.DATA_ABERTA BETWEEN :dtincio AND :dtfim) ');
IBQuerygrid.ParamByName('dtincio').AsDate := DateTimePicker1.Date;
IBQuerygrid.ParamByName('dtfim').AsDate := DateTimePicker2.Date;
IBQuerygrid.active:= true;
end;

procedure TGos.FormShow(Sender: TObject);
begin
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date+30;
end;

end.
