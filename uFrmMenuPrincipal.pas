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
    A1: TMenuItem;
    Relatrios1: TMenuItem;
    Atestado1: TMenuItem;
    Atestado2: TMenuItem;
    Agendamentos1: TMenuItem;
    Sistema1: TMenuItem;
    Usuario1: TMenuItem;
    Panel1: TPanel;
    CadastrodeResidente1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Paciente1Click(Sender: TObject);
    procedure Marcadas1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure LaudoPsicolgico1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure CadastrodeResidente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPai: TFrmPai;

implementation

{$R *.dfm}

uses UFrmCadPaciente, uFrmConsultasMarcadas, uFrmLogin, uFrmRelatorios,
  uFrmUsuario, UfrmCadConsulta, unTabelas, UfrCadResidente;

procedure TFrmPai.A1Click(Sender: TObject);
var
  CadConsultas : TFrmCadConsultas;
begin
  CadConsultas := TFrmCadConsultas.Create(Self);
  CadConsultas.Show;
end;

procedure TFrmPai.Agendamentos1Click(Sender: TObject);
var
  Relatorios : TFrmRelAtestado;
begin
  Relatorios := TFrmRelAtestado.Create(Self);
  Relatorios.Show;
end;

procedure TFrmPai.CadastrodeResidente1Click(Sender: TObject);
var
  CadResidente : TFrmCadResidente;
begin
  CadResidente := TFrmCadResidente.Create(Self);
  CadResidente.Show;
end;

procedure TFrmPai.LaudoPsicolgico1Click(Sender: TObject);
begin
  MessageDlg('Tela ainda em construção', mtInformation, [mbOK], 0);
end;

procedure TFrmPai.Marcadas1Click(Sender: TObject);
var
  ConsultasMarcadas : TFrmConsultasMarcadas;
begin
  ConsultasMarcadas := TFrmConsultasMarcadas.Create(Self);
  ConsultasMarcadas.Show;
end;

procedure TFrmPai.Paciente1Click(Sender: TObject);
var
  CadastroPaciente : TFrmCadastroPaciente;
begin
  CadastroPaciente := TFrmCadastroPaciente.Create(Self);
  CadastroPaciente.Show;
end;

procedure TFrmPai.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Date : ' + datetostr(date);
  StatusBar1.Panels[2].Text := 'Hora : ' + TimeToStr(Time);
end;

procedure TFrmPai.Usuario1Click(Sender: TObject);
var
  Usuario : TFrmUsuario;
begin
  Usuario := TFrmUsuario.Create(Self);
  Usuario.Show;
end;

end.
