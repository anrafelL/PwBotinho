program PwBotinho;

uses
  Vcl.Forms,
  Winapi.Windows,
  uFrmMain in 'Source\Ui\uFrmMain.pas' {FrmMain},
  PwLib.MemReadWrite in 'Source\PwLib\PwLib.MemReadWrite.pas',
  PwLib.Player.Base in 'Source\PwLib\PwLib.Player.Base.pas',
  PwLib.System.Inject in 'Source\PwLib\PwLib.System.Inject.pas',
  PwLib.System.OffSet in 'Source\PwLib\PwLib.System.OffSet.pas',
  PwLib.System.Packet in 'Source\PwLib\PwLib.System.Packet.pas',
  PwLib.System.Win in 'Source\PwLib\PwLib.System.Win.pas',
  PwBotinho.System.Share in 'Source\Share\PwBotinho.System.Share.pas',
  uFrmAutoPOT in 'Source\Ui\uFrmAutoPOT.pas' {frmAutoPotion},
  uFrmUpdate in 'Source\Ui\uFrmUpdate.pas' {FrmUpdate},
  uFrmCfg in 'Source\Ui\uFrmCfg.pas' {FrmConfig},
  uFrmPlayerInfo in 'Source\Ui\uFrmPlayerInfo.pas' {FrmPlayer},
  PwBotinho.Lib.BotBase in 'Source\Logic\PwBotinho.Lib.BotBase.pas',
  PwBotinho.Lib.IntegerTree in 'Source\Logic\PwBotinho.Lib.IntegerTree.pas',
  PwBotinho.Lib.StoreCfg in 'Source\Logic\PwBotinho.Lib.StoreCfg.pas',
  uFrmSharedUI in 'Source\Share\uFrmSharedUI.pas' {FrmSharedUI},
  PwBotinho.Lib.Update in 'Source\Logic\PwBotinho.Lib.Update.pas',
  PwBotinho.Lib.AutoPOT in 'Source\Logic\PwBotinho.Lib.AutoPOT.pas';
  ///uFrmExtraFunction in 'Source\UI\uFrmExtraFunction.pas' {Form6};

{$R *.res}

var
  Handle: THandle;
  hMutex: THandle;

begin
  hMutex := Winapi.Windows.CreateMutex(nil, true, 'PW_BOTINHO_INIT');
  if hMutex <> 0 then
  begin
     if GetLastError = ERROR_ALREADY_EXISTS then
     begin
       MessageBox(Application.Handle,
       Pchar('Programa já está sendo executado'), nil, MB_OK);
       halt;
     end;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSharedUI, FrmSharedUI);
  //Application.CreateForm(TForm6, Form6);
  application.Run;
end.
