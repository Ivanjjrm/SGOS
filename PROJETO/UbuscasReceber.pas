unit UbuscasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TBuscaReceber = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BuscaReceber: TBuscaReceber;

implementation

{$R *.dfm}

procedure TBuscaReceber.BitBtn5Click(Sender: TObject);
begin
close;
end;

end.
