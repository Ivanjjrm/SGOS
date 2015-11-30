unit Usplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFrmSplash = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

uses Uprincipal;

procedure TFrmSplash.Timer1Timer(Sender: TObject);
var
   f:TextFile;
   linha:String;
   caminho,camino1: string;
begin
ProgressBar1.Position:=10;
Sleep(200);
ProgressBar1.Position:=20;
Sleep(300);
ProgressBar1.Position:=30;
Sleep(400);
ProgressBar1.Position:=35;
Label1.Caption:='Verificando Conex�o com a base de Dados';
Sleep(1000);
ProgressBar1.Position:=45;
Sleep(400);

  caminho:= ParamStr(0);
  caminho:=ExtractFilePath(caminho);
  camino1 := (caminho+'ENDERECO.CFG');

   AssignFile(f,camino1);
   Reset(f);

   While not eof(f) do begin
     Readln(f,linha);

   End;
  try
begin
Form1.IBDatabase.DatabaseName:=linha;
Form1.Ibdatabase.Connected:= true;
Form1.IBTransaction.active := true;
end;
  except
  on e: Exception do
  begin
  Timer1.Enabled:=false;
    Showmessage('N�o foi possivel Conectar ao Banco de Dados!');
    form1.close;
  end;
end;

   Closefile(f);


ProgressBar1.Position:=50;
Sleep(300);
ProgressBar1.Position:=70;
Sleep(500);
ProgressBar1.Position:=100;
Sleep(400);
Timer1.Enabled:=false;
close;
end;

end.
