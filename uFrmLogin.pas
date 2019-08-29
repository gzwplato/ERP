unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
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

uses uFrmMenuPrincipal, UFrmCadPaciente;

procedure TFrmLogin.Button1Click(Sender: TObject);
begin
  ValidarLogin;
  FrmLogin.Hide;
  FrmPai.ShowModal;
  FrmLogin.Close;
end;

procedure TFrmLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['1'..'9']) then
    raise Exception.Create('Esse campo aceita apenas letras');
end;

procedure TFrmLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

function TFrmLogin.ValidarLogin: String;
begin
  login.usuario := 'matheus';
  login.senha := '123';
  if  (Edit1.Text <> login.usuario) or (Edit2.Text <> login.senha) then
    raise Exception.Create('Você não está cadastrado ou suas credenciais estão incorretas')
  else
    Exit;
end;

end.
