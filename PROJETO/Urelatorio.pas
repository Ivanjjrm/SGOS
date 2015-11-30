unit Urelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, ppViewr, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, ppComm, ppEndUsr,ppReport;

type
  TFrmRelatorio = class(TForm)
    ppViewer1: TppViewer;
    Panel1: TPanel;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreviewWhole: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ppDesigner1: TppDesigner;
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

{$R *.dfm}


procedure TFrmRelatorio.spbPreviewFirstClick(Sender: TObject);
begin
ppViewer1.FirstPage
end;

procedure TFrmRelatorio.spbPreviewLastClick(Sender: TObject);
begin
ppViewer1.PriorPage;
end;

procedure TFrmRelatorio.spbPreviewNextClick(Sender: TObject);
begin
ppViewer1.NextPage;
end;

procedure TFrmRelatorio.spbPreviewPriorClick(Sender: TObject);
begin
ppViewer1.LastPage;
end;

end.
