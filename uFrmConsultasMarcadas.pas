unit uFrmConsultasMarcadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Data.SqlExpr, Data.Win.ADODB,
  Vcl.ExtCtrls;

type
  TFrmConsultasMarcadas = class(TForm)
    Panel1: TPanel;
    EdtMascCpf: TMaskEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    QryConsMarc: TADOQuery;
    QryConsMarcNome: TStringField;
    QryConsMarcCPFCNPJ: TStringField;
    QryConsMarcDATAcons: TDateTimeField;
    DsConsMarc: TDataSource;
    Label1: TLabel;
    QryConsMarcHora: TStringField;
    QryConsMarcResidente: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultasMarcadas: TFrmConsultasMarcadas;

implementation

{$R *.dfm}

uses unTabelas;

procedure TFrmConsultasMarcadas.Button1Click(Sender: TObject);
var
  pt1,pt2,pt3,pt4,pt5 ,CpfCnpj, data: string;

begin
  pt1 := Copy(EdtMascCpf.Text,1,3);
  pt2 := Copy(EdtMascCpf.Text,5,3);
  pt3 := Copy(EdtMascCpf.Text,9,3);
  pt4 := Copy(EdtMascCpf.Text,13,2);
  CpfCnpj :=  pt1+pt2+pt3+pt4;

  QryConsMarc.SQL.Clear;
  if CpfCnpj <> '' then
  begin
    QryConsMarc.SQL.Add('Select * from dbo.Consultas where CPFCNPJ = '''+ CpfCnpj+'''');
    QryConsMarc.Open;
  end
  else
  begin
    QryConsMarc.SQL.Add('Select * from dbo.Consultas');
    QryConsMarc.Open;
  end;
end;

procedure TFrmConsultasMarcadas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryConsMarc.Close;
  QryConsMarc.Close;
end;

end.
