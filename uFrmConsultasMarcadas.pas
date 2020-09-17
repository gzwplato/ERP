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
    QryConsMarcResidante: TMemoField;
    DsConsMarc: TDataSource;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    QryConsMarc.SQL.Add('Select * from dbo.Consultas where CPFCNPJ ='+ CpfCnpj);
    QryConsMarc.Open;
  end
  else
  begin
    QryConsMarc.SQL.Add('Select * from dbo.Consultas');
    QryConsMarc.Open;
  end;

  QryConsMarc.Close;

end;

procedure TFrmConsultasMarcadas.FormCreate(Sender: TObject);
begin
  QryConsMarc.Close;
end;

end.
