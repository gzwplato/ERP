program DprojPrincipal;

uses
  Vcl.Forms,
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {FrmPai},
  UFrmCadPaciente in 'UFrmCadPaciente.pas' {FrmCadastroPaciente},
  uFrmConsultasMarcadas in 'uFrmConsultasMarcadas.pas' {FrmConsultasMarcadas},
  unTabelas in 'unTabelas.pas' {DataTabelas: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uFrmUsuario in 'uFrmUsuario.pas' {FrmUsuario},
  uFrmRelatorios in 'uFrmRelatorios.pas' {FrmRelAtestado},
  UfrmCadConsulta in 'UfrmCadConsulta.pas' {FrmCadConsultas},
  UfrCadResidente in 'UfrCadResidente.pas' {FrmCadResidente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDataTabelas, DataTabelas);
  Application.Run;
end.
