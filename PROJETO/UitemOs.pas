unit UitemOs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, UGOS;

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
    EsubTotal: TEdit;
    Label7: TLabel;
    Edesc: TEdit;
    Label8: TLabel;
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
    DBLookupComboBoxEquipamento: TDBLookupComboBox;
    Label12: TLabel;
    Bevel2: TBevel;
    Eidos: TEdit;
    IBQueryEquip: TIBQuery;
    IBQueryServ: TIBQuery;
    DataSourceEquip: TDataSource;
    DataSourceServ: TDataSource;
    Eiditem: TEdit;
    IBQueryGrid: TIBQuery;
    DataSourceGrid: TDataSource;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItemOs: TFrmItemOs;

implementation

{$R *.dfm}

procedure TFrmItemOs.BitBtn5Click(Sender: TObject);
begin
Close;
end;

procedure TFrmItemOs.FormShow(Sender: TObject);
begin
IBQuerygrid.sql.clear;
        IBQuerygrid.sql.add('SELECT * FROM ITEM_OS WHERE ID_OS_FK =:id');
        IBQuerygrid.ParamByName('id').AsInteger := Strtoint(Eidos.text);
        IBQuerygrid.active:= true;
end;

end.
