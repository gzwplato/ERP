unit UFrmCadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.Buttons, Data.DB, Data.Win.ADODB;

type
  TFrmCadastroPaciente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    LblDatanasc: TLabel;
    Label2: TLabel;
    SBTGerarDoc: TSpeedButton;
    EdtNome: TEdit;
    DtmDataNasci: TDateTimePicker;
    MmObs: TMemo;
    BtnEnviarDados: TButton;
    EdtTipoPessoa: TMaskEdit;
    BtnSair: TButton;
    CmdUsuario: TADOCommand;
    QryUsuario: TADOQuery;
    QryUsuarioNome: TStringField;
    QryUsuarioDATANASC: TWideStringField;
    QryUsuarioObservacao: TMemoField;
    Label3: TLabel;
    QryUsuarioCPFCNPJ: TStringField;
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipoPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEnviarDadosClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
    Tipo: string;
  end;

var
  FrmCadastroPaciente: TFrmCadastroPaciente;

implementation

{$R *.dfm}

uses unTabelas;


type
  RgPaciente = Record
    NomePaciente : string [35];
    Cpf : String [11];
End;

procedure TFrmCadastroPaciente.BtnEnviarDadosClick(Sender: TObject);
var
  pt1,pt2,pt3,pt4,pt5 ,CpfCnpj, data: string;

begin
  data := DateToStr(DtmDataNasci.Date);
  pt1 := Copy(EdtTipoPessoa.Text,1,3);
  pt2 := Copy(EdtTipoPessoa.Text,5,3);
  pt3 := Copy(EdtTipoPessoa.Text,9,3);
  pt4 := Copy(EdtTipoPessoa.Text,13,2);
  CpfCnpj :=  pt1+pt2+pt3+pt4;

  QryUsuario.Close;
  QryUsuario.Open;

  while not QryUsuario.Eof do
  begin
    if QryUsuarioCPFCNPJ.AsString = CpfCnpj then
      raise Exception.Create('CPF já cadastrado');
    QryUsuario.Next;
  end;


  if (EdtNome.Text = EmptyStr) or (EdtTipoPessoa.Text = '   .   .   -  ') or (EdtTipoPessoa.Text = '  .   .   /    -  ')  then
  begin
    raise Exception.Create('Todas as credenciais tende está preenchida') ;
  end

  else
  begin
    CmdUsuario.Parameters.ParamByName('Nome').Value := EdtNome.Text;
    CmdUsuario.Parameters.ParamByName('CPFCNPJ').Value := CpfCnpj;
    CmdUsuario.Parameters.ParamByName('DATANASC').Value := data;
    CmdUsuario.Parameters.ParamByName('Observacao').Value := MmObs.Text;
    CmdUsuario.Execute;
    MessageDlg('Cadastro Realizado com sucesso', mtInformation, [mbOK], 0);
    EdtNome.Clear;
    EdtTipoPessoa.Clear;
    MmObs.Clear;
  end;

end;

procedure TFrmCadastroPaciente.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroPaciente.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas letras');
end;

procedure TFrmCadastroPaciente.EdtTipoPessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if  not (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

procedure TFrmCadastroPaciente.FormCreate(Sender: TObject);
begin
  MmObs.Clear;
end;

end.
