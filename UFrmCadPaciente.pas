unit UFrmCadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.Buttons;

type
  TFrmCadastroPaciente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    LblDatanasc: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SBTGerarDoc: TSpeedButton;
    EdtNome: TEdit;
    DateTimePicker1: TDateTimePicker;
    MmObs: TMemo;
    BtnEnviarDados: TButton;
    EdtTipoPessoa: TMaskEdit;
    SpeedButton2: TSpeedButton;
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipoPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEnviarDadosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadastroPaciente: TFrmCadastroPaciente;

implementation

{$R *.dfm}


type
  RgPaciente = Record
    NomePaciente : string [35];
    Cpf : String [11];
    Cnpj : String [15];
End;

procedure TFrmCadastroPaciente.BtnEnviarDadosClick(Sender: TObject);
begin
  if (EdtNome.Text = EmptyStr) or (EdtTipoPessoa.Text = '   .   .   -  ') or (EdtTipoPessoa.Text = '  .   .   /    -  ')  then
    raise Exception.Create('Todas as credenciais tende está preenchida')
  else
    //dados serão inseridos no banco
    // MessageDlg('Dados salvos com sucesso', [mtInformation], [mbOK]);
    ShowMessage('Dados salvos com sucesso');
    EdtNome.Clear;
    EdtTipoPessoa.Clear;
    MmObs.Clear;
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

procedure TFrmCadastroPaciente.SpeedButton1Click(Sender: TObject);
begin
  if EdtTipoPessoa.EditMask = '000.000.000-00'  then
  begin
    EdtTipoPessoa.Clear;
    SpeedButton1.Glyph.LoadFromFile('C:\Users\1547\Documents\ERP\Icones\Friends.bmp');
    Label2.Caption := 'CNPJ';
    EdtTipoPessoa.EditMask := '00.000.000/0000-00';
    EdtTipoPessoa.Width := 100;
  end
  else
    begin
    EdtTipoPessoa.Clear;
    SpeedButton1.Glyph.LoadFromFile('C:\Users\1547\Documents\ERP\Icones\Boy.bmp');
    Label2.Caption := 'CPF';
    EdtTipoPessoa.EditMask := '000.000.000-00';
    EdtTipoPessoa.Width := 84;
  end;
end;

procedure TFrmCadastroPaciente.SpeedButton2Click(Sender: TObject);
begin
  FrmCadastroPaciente.Close;
end;

end.
