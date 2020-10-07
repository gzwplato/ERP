unit UfrmCadConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.Win.ADODB, Data.DB, Vcl.DBCtrls , shellApi;

type
  TFrmCadConsultas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtCpf: TMaskEdit;
    Label2: TLabel;
    DtmDatacons: TDateTimePicker;
    LblDatanasc: TLabel;
    Button1: TButton;
    Button2: TButton;
    QryPaciente: TADOQuery;
    CmmdConsulta: TADOCommand;
    QryPacienteNome: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    EdtNomePaciente: TEdit;
    QryResidente: TADOQuery;
    QryResidenteNome: TStringField;
    DsResidente: TDataSource;
    QryResidenteAtividade: TStringField;
    MaskHora: TMaskEdit;
    Label4: TLabel;
    Residente: TLabel;
    DbLResidente: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TFrmCadConsultas.Button2Click(Sender: TObject);
var
  pt1,pt2,pt3,pt4,pt5 ,Cpf , linkurl,linkuri, result ,data : string;
begin
  pt1 := Copy(EdtCpf.Text,1,3);
  pt2 := Copy(EdtCpf.Text,5,3);
  pt3 := Copy(EdtCpf.Text,9,3);
  pt4 := Copy(EdtCpf.Text,13,2);
  Cpf :=  pt1+pt2+pt3+pt4;
  data := DateToStr(DtmDatacons.Date);
  CmmdConsulta.Parameters.ParamByName('Nome').Value := EdtNomePaciente.Text;
  CmmdConsulta.Parameters.ParamByName('CPFCNPJ').Value := Cpf;
  CmmdConsulta.Parameters.ParamByName('DATAcons').Value := data;
  CmmdConsulta.Parameters.ParamByName('Residente').Value := DbLResidente.Text;
  CmmdConsulta.Parameters.ParamByName('Hora').Value := MaskHora.Text;
  CmmdConsulta.Execute;

  linkurl := 'https://web.whatsapp.com/send?phone' ;
  linkuri := '&text=';
  result := linkurl + '85985172588' + linkuri + 'Sua conculta é com Dr.' + DbLResidente.Text +' dia '+ data + 'no Horário de' + MaskHora.Text;

  ShellExecute(Handle,'open', pchar(result), nil, nil, SW_SHOWMINIMIZED);

  MessageDlg('Consulta Cadastrada', mtInformation, [mbOK], 0);

  EdtCpf.Clear;
  EdtNomePaciente.Clear;
  MaskHora.Clear;
end;

procedure TFrmCadConsultas.DBLookupComboBox1Click(Sender: TObject);
begin
  QryResidente.Open;
end;

procedure TFrmCadConsultas.FormCreate(Sender: TObject);
begin
  QryPaciente.Close;
  QryResidente.Open;
end;

end.
