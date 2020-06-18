unit unTabelas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataTabelas = class(TDataModule)
    ADOMasterSysMed: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataTabelas: TDataTabelas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
