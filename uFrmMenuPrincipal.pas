unit uFrmMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.Buttons;

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
    Relatrios1: TMenuItem;
    Atestado1: TMenuItem;
    Atestado2: TMenuItem;
    Agendamentos1: TMenuItem;
    LaudoPsicolgico1: TMenuItem;
    Sistema1: TMenuItem;
    Usuario1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Paciente1Click(Sender: TObject);
    procedure Marcadas1Click(Sender: TObject);
    procedure Atestado1Click(Sender: TObject);
    procedure Agendamentos1Click(Sender: TObject);
    procedure Atestado2Click(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure LaudoPsicolgico1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
  uFrmUsuario;

procedure TFrmPai.A1Click(Sender: TObject);
begin
  MessageDlg('Tela ainda em construção', mtInformation, [mbOK], 0);
end;

procedure TFrmPai.Agendamentos1Click(Sender: TObject);
begin
  FrmRelatorios.Caption := 'Relatório de Agendamento';
  FrmRelatorios.ShowModal;
  FrmRelatorios.Visible := true;
end;

procedure TFrmPai.Atestado1Click(Sender: TObject);
begin
  FrmRelatorios.Caption := 'Relatório de Declaração';
  FrmRelatorios.ShowModal;
  FrmRelatorios.Visible := true;
end;

procedure TFrmPai.Atestado2Click(Sender: TObject);
begin
  FrmRelatorios.Caption := 'Relatório de Atestado';
  FrmRelatorios.ShowModal;
  FrmRelatorios.Visible := true;
end;

procedure TFrmPai.LaudoPsicolgico1Click(Sender: TObject);
begin
  MessageDlg('Tela ainda em construção', mtInformation, [mbOK], 0);
end;

procedure TFrmPai.Marcadas1Click(Sender: TObject);
begin
  FrmConsultasMarcadas.ShowModal;
  FrmConsultasMarcadas.Visible := true;
end;

procedure TFrmPai.Paciente1Click(Sender: TObject);
begin
  FrmCadastroPaciente.ShowModal;
  FrmCadastroPaciente.Visible := true;
end;

procedure TFrmPai.SpeedButton2Click(Sender: TObject);
begin
  FrmPai.Close;
end;

procedure TFrmPai.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Date : ' + datetostr(date);
  StatusBar1.Panels[2].Text := 'Hora : ' + TimeToStr(Time);
end;

procedure TFrmPai.Usuario1Click(Sender: TObject);
begin
  FrmUsuario.ShowModal;
end;

end.
