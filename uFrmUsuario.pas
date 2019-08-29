unit uFrmUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    EdtNome: TEdit;
    EdtSenha: TEdit;
    EdtMatricula: TEdit;
    LblUsuario: TLabel;
    LblNovasenha: TLabel;
    LblMatricula: TLabel;
    SpeedButton1: TSpeedButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario : TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LblUsuario.Visible := false;
  EdtNome.Visible := false;
  LblMatricula.Top := 23;
  EdtMatricula.Top := 42;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LblMatricula.Top := 111;
  EdtMatricula.Top := 127;
  LblUsuario.Visible := true;
  EdtNome.Visible := true;
  LblMatricula.Visible := true;
  EdtMatricula.Visible := true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LblUsuario.Visible := false;
  EdtNome.Visible := false;
  LblMatricula.Top := 23;
  EdtMatricula.Top := 42;
end;

procedure TForm1.EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
   if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

procedure TForm1.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['1'..'9']) then
    raise Exception.Create('Esse campo aceita apenas letras');
end;

procedure TForm1.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if EdtNome.Visible = false then
    MessageDlg('Senha Alterada com sucesso', mtInformation, [mbOK], 0)
  else
    MessageDlg('Usuário Adicionado', mtInformation, [mbOK], 0)
end;

end.
