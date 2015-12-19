unit uFrmPlayerInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, idHTTP,
  Vcl.Imaging.GIFImg, RegularExpressions, sLabel, sGauge, sSkinManager, Vcl.ImgList,
  acAlphaImageList, acImage;

type
  TFrmPlayer = class(TForm)
    sLabelFX1: TsLabelFX;
    sLabel1: TsLabel;
    sGauge1: TsGauge;
    sGauge2: TsGauge;
    sGauge3: TsGauge;
    sLabel2: TsLabel;
    sLabelFX2: TsLabelFX;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    sImage1: TsImage;
    sImage2: TsImage;
    sImage3: TsImage;
    sImage4: TsImage;
    sImage5: TsImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPlayer: TFrmPlayer;

implementation

{$R *.dfm}

uses uFrmSharedUI;


end.
