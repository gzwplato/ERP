unit UfrCadResidente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Win.ADODB, Data.DB;

type
  TFrmCadResidente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtMatricula: TEdit;
    Button1: TButton;
    QryResidente: TADOQuery;
    CmmdRsidente: TADOCommand;
    EdtAtividade: TEdit;
    Label3: TLabel;
    QryResidenteNome: TStringField;
    QryResidenteRE: TIntegerField;
    QryResidenteAtividade: TStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadResidente: TFrmCadResidente;

implementation

{$R *.dfm}

uses unTabelas;

procedure TFrmCadResidente.Button1Click(Sender: TObject);
begin
  QryResidente.SQL.Clear;
  QryResidente.Close;
  QryResidente.SQL.Add('select * from dbo.CadastroResidente where RE =' + EdtMatricula.Text);
  QryResidente.open;
  QryResidente.First;
  while not QryResidente.eof do
  begin
    if QryResidenteRE.AsInteger = StrToInt(EdtMatricula.Text) then
    begin
      raise Exception.Create('RE já cadastrado');
    end;
  end;

  if (EdtNome.Text <> '')  and (EdtNome.Text <> '') and (EdtNome.Text <> '') then
  begin
    CmmdRsidente.Parameters.ParamByName('Nome').Value := EdtNome.Text;
    CmmdRsidente.Parameters.ParamByName('RE').Value := StrToInt(EdtMatricula.Text);
    CmmdRsidente.Parameters.ParamByName('Atividade').Value := EdtAtividade.Text;
    CmmdRsidente.Execute;
    MessageDlg('Cadastro Realizado com sucesso!', mtInformation, [mbOK], 0);
  end
  else
  begin
    MessageDlg('Todos os campos são obrigatorios!!!', mtWarning, [mbOK], 0);
  end;





end;

end.
