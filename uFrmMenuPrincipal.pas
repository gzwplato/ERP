unit uFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TFrmPai = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Consultas1: TMenuItem;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Marcadas1: TMenuItem;
    Paciente1: TMenuItem;
    Consulta1: TMenuItem;
    Exames1: TMenuItem;
    Procedimentos1: TMenuItem;
    Image1: TImage;
    LblNomeempresa: TLabel;
    A1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Paciente1Click(Sender: TObject);
    procedure Marcadas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPai: TFrmPai;

implementation

{$R *.dfm}

uses UFrmCadPaciente, UnFunctions, uFrmConsultasMarcadas, uFrmLogin;

procedure TFrmPai.Marcadas1Click(Sender: TObject);
var
  ChamaTela : TFrmConsultasMarcadas;
begin
    ChamaTela := TFrmConsultasMarcadas.Create(Self);
  try
    ChamaTela.ShowModal;
    ChamaTela.Visible := true;
  finally
    FreeAndNil(ChamaTela);
  end;
end;

procedure TFrmPai.Paciente1Click(Sender: TObject);
var
  ChamaTela : TFrmCadastroPaciente;
begin
  ChamaTela := TFrmCadastroPaciente.Create(Self);
  try
    ChamaTela.ShowModal;
    ChamaTela.Visible := true;
  finally
    FreeAndNil(ChamaTela);
  end;
end;

procedure TFrmPai.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Date : ' + datetostr(date);
  StatusBar1.Panels[2].Text := 'Hora : ' + TimeToStr(Time);
end;

end.
