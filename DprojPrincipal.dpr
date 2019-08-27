program DprojPrincipal;

uses
  Vcl.Forms,
  uFrmMenuPrincipal in 'uFrmMenuPrincipal.pas' {FrmPai},
  UFrmCadPaciente in 'UFrmCadPaciente.pas' {FrmCadastroPaciente},
  UnFunctions in 'Unit\UnFunctions.pas',
  uFrmConsultasMarcadas in 'uFrmConsultasMarcadas.pas' {FrmConsultasMarcadas},
  unTabelas in 'unTabelas.pas' {DataTabelas: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPai, FrmPai);
  Application.CreateForm(TFrmCadastroPaciente, FrmCadastroPaciente);
  Application.CreateForm(TFrmConsultasMarcadas, FrmConsultasMarcadas);
  Application.CreateForm(TDataTabelas, DataTabelas);
  Application.Run;
end.
