unit uFrmUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Win.ADODB;

type
  TFrmUsuario = class(TForm)
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
    ADOCommInsertUsusario: TADOCommand;
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
  FrmUsuario : TFrmUsuario;

implementation

{$R *.dfm}

uses unTabelas;

procedure TFrmUsuario.Button1Click(Sender: TObject);
begin
  EdtNome.Clear;
  EdtSenha.Clear;
  EdtMatricula.Clear;
  LblUsuario.Visible := false;
  EdtNome.Visible := false;
  LblMatricula.Top := 23;
  EdtMatricula.Top := 42;
end;

procedure TFrmUsuario.Button2Click(Sender: TObject);
begin
  EdtNome.Clear;
  EdtSenha.Clear;
  EdtMatricula.Clear;
  LblMatricula.Top := 111;
  EdtMatricula.Top := 127;
  LblUsuario.Visible := true;
  EdtNome.Visible := true;
  LblMatricula.Visible := true;
  EdtMatricula.Visible := true;
end;

procedure TFrmUsuario.Button3Click(Sender: TObject);
begin
  EdtNome.Clear;
  EdtSenha.Clear;
  EdtMatricula.Clear;
  LblUsuario.Visible := false;
  EdtNome.Visible := false;
  LblMatricula.Top := 23;
  EdtMatricula.Top := 42;
end;

procedure TFrmUsuario.EdtMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
   if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

procedure TFrmUsuario.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['1'..'9']) then
    raise Exception.Create('Esse campo aceita apenas letras');
end;

procedure TFrmUsuario.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key in['a'..'z']) or (Key in['A'..'Z']) then
    raise Exception.Create('Esse campo aceita apenas números');
end;

procedure TFrmUsuario.SpeedButton1Click(Sender: TObject);
begin
  ADOCommInsertUsusario.Parameters.ParamByName('Usuario').Value := EdtNome.Text;
  ADOCommInsertUsusario.Parameters.ParamByName('senha').Value := StrToInt(EdtSenha.Text);
  ADOCommInsertUsusario.Parameters.ParamByName('matricula').Value := StrToInt(EdtMatricula.Text);
  ADOCommInsertUsusario.Execute;
end;

end.
