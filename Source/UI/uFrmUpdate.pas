unit uFrmUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdAntiFreezeBase, Vcl.IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls,
  sGauge, sGroupBox;

type
  TFrmUpdate = class(TForm)
    http: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    sGroupBox1: TsGroupBox;
    sGauge1: TsGauge;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUpdate: TFrmUpdate;

implementation

{$R *.dfm}

end.
