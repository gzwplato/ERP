program DprojPrincipal;

uses
  Vcl.Forms,
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {FrmPai},
  UFrmCadPaciente in 'UFrmCadPaciente.pas' {FrmCadastroPaciente},
  uFrmConsultasMarcadas in 'uFrmConsultasMarcadas.pas' {FrmConsultasMarcadas},
  unTabelas in 'unTabelas.pas' {DataTabelas: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmUsuario in 'uFrmUsuario.pas' {Form1},
  uFrmRelatorios in 'uFrmRelatorios.pas' {FrmRelAtestado},
  UfrmCadConsulta in 'UfrmCadConsulta.pas' {FrmCadConsultas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPai, FrmPai);
  Application.CreateForm(TFrmCadastroPaciente, FrmCadastroPaciente);
  Application.CreateForm(TFrmConsultasMarcadas, FrmConsultasMarcadas);
  Application.CreateForm(TDataTabelas, DataTabelas);
  Application.CreateForm(TFrmCadConsultas, FrmCadConsultas);
  Application.Run;
end.
