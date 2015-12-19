unit uFrmSharedUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, acAlphaImageList;

type
  TFrmSharedUI = class(TForm)
    ImgList_PlayerInfoIcon: TsAlphaImageList;
    ImgList_MainMenuIcon: TsAlphaImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSharedUI: TFrmSharedUI;


implementation

{$R *.dfm}

end.
