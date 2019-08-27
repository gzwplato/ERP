unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
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

uses uFrmMenuPrincipal, UFrmCadPaciente, UnFunctions;

procedure TFrmLogin.Button1Click(Sender: TObject);

begin
  ValidarLogin;
  FrmLogin.Hide;
  FrmPai.ShowModal;
  FrmLogin.Close;
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
    raise Exception.Create('Você não está cadastrado')
  else
    Exit;
end;

end.
