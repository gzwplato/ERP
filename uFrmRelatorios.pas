unit uFrmRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask;

type
  TFrmRelAtestado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MaskEdit1: TMaskEdit;
    MEDTipoPessoa: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Panel3: TPanel;
    SBTTipoPessoa: TSpeedButton;
    procedure SBTTipoPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAtestado: TFrmRelAtestado;

implementation

{$R *.dfm}

procedure TFrmRelAtestado.SBTTipoPessoaClick(Sender: TObject);
begin
  if MEDTipoPessoa.EditMask = '000.000.000-00'  then
  begin
     Label2.Caption := 'CNPJ';
     MEDTipoPessoa.EditMask := 'xx.xxx.xxx/0000-00';
     MEDTipoPessoa.Width := 100;
  end
  else
  begin
    Label2.Caption := 'CPF';
    MEDTipoPessoa.EditMask := '000.000.000-00';
    MEDTipoPessoa.Width := 84;
  end;
end;

end.
