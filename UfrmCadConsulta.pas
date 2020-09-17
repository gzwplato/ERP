unit UfrmCadConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.Win.ADODB, Data.DB, Vcl.DBCtrls;

type
  TFrmCadConsultas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtCpf: TMaskEdit;
    Label2: TLabel;
    DtmDataNasci: TDateTimePicker;
    LblDatanasc: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    QryPaciente: TADOQuery;
    CmmdConsulta: TADOCommand;
    QryPacienteNome: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    EdtNomePaciente: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadConsultas: TFrmCadConsultas;

implementation

{$R *.dfm}

uses unTabelas, uFrmMenuPrincipal;

procedure TFrmCadConsultas.Button1Click(Sender: TObject);
var
  pt1,pt2,pt3,pt4,pt5 ,CpfCnpj, data: string;

begin
  pt1 := Copy(EdtCpf.Text,1,3);
  pt2 := Copy(EdtCpf.Text,5,3);
  pt3 := Copy(EdtCpf.Text,9,3);
  pt4 := Copy(EdtCpf.Text,13,2);
  CpfCnpj :=  pt1+pt2+pt3+pt4;

  QryPaciente.SQL.Clear;
  if CpfCnpj <> '' then
  begin
    QryPaciente.SQL.Add('Select * from dbo.CadastroPaciente where CPFCNPJ = '+ ''+CpfCnpj+'');
    QryPaciente.Open;
      if QryPacienteNome.AsString = '' then
      begin
        raise Exception.Create('Paciente não cadastrado!!');
      end
      else
      begin
        EdtNomePaciente.Text := QryPacienteNome.AsString
      end;



  end
  else
  begin
    MessageDlg('Informe o CPF para buscar paciente cadastrado!!!', mtInformation, [mbOK], 0);
  end;

  QryPaciente.Close;
end;

procedure TFrmCadConsultas.FormCreate(Sender: TObject);
begin
  QryPaciente.Close;
end;

end.
