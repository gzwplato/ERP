unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, Data.Win.ADODB;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    Label3: TLabel;
    QryLogin: TADOQuery;
    QryLoginUsuario: TStringField;
    QryLoginsenha: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarLogin : String;
  end;

  User = record
    usuario : string;
    senha : string;
  end;


var
  FrmLogin: TFrmLogin;
  login : User;
implementation

{$R *.dfm}

uses uFrmMenuPrincipal, UFrmCadPaciente, unTabelas;

procedure TFrmLogin.Button1Click(Sender: TObject);
begin
  ValidarLogin;
  FrmLogin.Hide;
  FrmPai.ShowModal;
  FrmLogin.Close;
end;

procedure TFrmLogin.EdtLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['1'..'9']) then
    raise Exception.Create('Esse campo aceita apenas letras');
end;

procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

function TFrmLogin.ValidarLogin: String;
begin
  QryLogin.Close;
  QryLogin.Open;
  while (QryLoginUsuario.AsString <> EdtLogin.Text)  and (QryLoginsenha.AsInteger <> StrToInt(EdtSenha.Text)) do
  begin
    if QryLogin.Eof then
    begin
      raise Exception.Create('Você não está cadastrado');
    end;
    QryLogin.Next
  end;


end;

end.
