unit uFrmConsultasMarcadas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Data.SqlExpr;

type
  TFrmConsultasMarcadas = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultasMarcadas: TFrmConsultasMarcadas;

implementation

{$R *.dfm}

end.
