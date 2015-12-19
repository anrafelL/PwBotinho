unit PwBotinho.Lib.BotBase;

// Unit contém a classe base do bot que liga todas as outras classes

interface

uses
  winApi.Windows, Classes, SysUtils, PwLib.Player.Base,
  Vcl.ExtCtrls, Types, PwBotinho.Lib.AutoPOT, System.Generics.Collections,
  uFrmAutoPOT;

type
  TWinInfo = class
  private
    FHandle: THandle;
    FWndOrigRect, FWndNewRect: TRect;
    FWndOrigCaption: string;
    procedure setCaption(const Value: string);
    function getCaption: string;
  protected
    procedure updateInfo;
  public
    property Handle: THandle read FHandle;
    property Caption: string read getCaption write setCaption;
    procedure Mnimize;
    procedure Maximize;
    procedure Close;
    procedure Hide;
    procedure Show;
    procedure retoreOriginalCaption;
    procedure setPos(const X, Y: Integer);
    procedure setWH(const Width, Height: Integer);
    procedure setPosAndWH(const X, Y, W, H: Integer);
    constructor Create(const WindowHandle: THandle);
    destructor Destroy; Override;
  end;

  PWinInfo = ^TWinInfo;

type
  TKeyControl = class
  private
    FKeyID: NativeUInt;
    FHandle: THandle;
    FIsActive: Boolean;
    FTimer: TTimer;
    FTimeInterval: Cardinal;
    FBotIsActive: Boolean;
    procedure setActive(const Value: Boolean);
    procedure setInterval(const Value: Cardinal);
    procedure setKeyId(const Value: NativeUInt);
  protected
    procedure OnTime(Sender: TObject);
  public
    property BotActive: Boolean read FBotIsActive write FBotIsActive;
    property KeyID: NativeUInt read FKeyID write setKeyId;
    // property Key: Cardinal read FKey write setKey;
    property Interval: Cardinal read FTimeInterval write setInterval;
    property Active: Boolean read FIsActive write setActive;

    constructor Create(const WindowHandle: THandle); overload;

    constructor Create(const WindowHandle: THandle; const KeyID: NativeUInt;
      const Interval: Cardinal); overload;

    constructor Create(const WindowHandle: THandle; const KeyID: NativeUInt;
      const Interval: Cardinal; const Active: Boolean); overload;

    destructor Destroy; Override;
  end;

  PKeyControl = ^TKeyControl;

type
  TErrorSystem = procedure(Sender: TObject; _Message: String;
    ErrorCode: Cardinal) of Object;
  TKeyControlArray = array of TKeyControl;

type
  TBotBase = class(TComponent)
  private
    FId: Cardinal;
    FPid: Cardinal;
    FProcessHandle: Cardinal;
    FIsActive: Boolean;
    FIsFreezed: Boolean;
    FPlayerInfo: TPlayerBase;
    FWindowInfo: TWinInfo;
    FKeyControl: TKeyControlArray;
    FAutoBot: TFrmAutoPotion;
    FTimer: TTimer;
    FAppErrorNotify: TErrorSystem;
    FOnDestroy: TNotifyEvent;
    procedure setActive(const Value: Boolean);
    procedure setFreezed(const Value: Boolean);
  protected
    // procedure AppClosed(Sender: TObject; id: Cardinal);
    procedure OnTime(Sender: TObject);
    procedure setError(Sender: TObject; _Message: String; ErrorCode: Cardinal);
  public
    procedure showPlayerInfo;
    procedure showAutoPot;
    procedure MinimizeWindow;
    procedure RestoreWindow;
    procedure MaximizeWindow;
    procedure CloseWindow;
    procedure CloseApp;
    procedure setWindowCaption(const Caption: string);
    property Active: Boolean read FIsActive write setActive;
    property Player: TPlayerBase read FPlayerInfo;
    property Window: TWinInfo read FWindowInfo;
    property Freeze: Boolean read FIsFreezed write setFreezed;
    property Id: Cardinal read FId;
    property Key: TKeyControlArray read FKeyControl write FKeyControl;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    // O ProcessId é o PID que vai iniciar todo o BOT
    constructor Create(const ProcessId: Cardinal);
    destructor Destroy; Override;
  end;

  PBotBase = ^TBotBase;

implementation

{ TBotBase }

uses PwLib.System.Win, uFrmPlayerInfo, PwBotinho.System.Share;

procedure TBotBase.CloseApp;
begin
  TWinSystem.AppKill(self.FPid);
end;

procedure TBotBase.CloseWindow;
begin
  self.FWindowInfo.Close;
end;

constructor TBotBase.Create(const ProcessId: Cardinal);
var
  I: Integer;
  Error: Cardinal;
begin
  self.FPid := ProcessId;
  self.FWindowInfo := TWinInfo.Create(TWinSystem.GetHWndByPID(self.FPid));
  if (self.FWindowInfo.Handle <> 0) and
    (self.FWindowInfo.Handle <> INVALID_HANDLE_VALUE) then
  begin
    self.FIsFreezed := True;
    self.FPlayerInfo := TPlayerBase.Create(self.FPid);
    FAutoBot := TFrmAutoPotion.Create(self, self.FWindowInfo.Handle,
      FPlayerInfo);
    self.FId := self.FPlayerInfo.Id;
    setLength(FKeyControl, 10);
    for I := 0 to 9 do
    begin
      self.FKeyControl[I] := TKeyControl.Create(self.FWindowInfo.Handle);
      self.FKeyControl[I].Active := False;
      self.FKeyControl[I].BotActive := False;
      self.FKeyControl[I].KeyID := 0;
      self.FKeyControl[I].Interval := 1000;
    end;
    (* self.FAutoBot := TAutoPotControl.Create(@FPlayerInfo,
      self.FWindowInfo.Handle); *)
    self.setActive(False);
    // self.setFreezed(False);
    // Checar se o aplicativo ainda existe na memória
    self.FTimer := TTimer.Create(self);
    self.FTimer.OnTimer := self.OnTime;
    self.FTimer.Interval := 1100;
    self.FTimer.Enabled := True;
  end
  else
  begin
    raise Exception.Create('Erro Interno');
    Error := winApi.Windows.GetLastError;
  end;
end;

destructor TBotBase.Destroy;
var
  I: Integer;
begin
  self.setActive(False);
  for I := 0 to 9 do
    self.FKeyControl[I].Free;
  setLength(FKeyControl, 0);
  self.FPlayerInfo.Free;
  self.FWindowInfo.Free;
  self.FAutoBot.Free;
  if @FOnDestroy <> nil then
    FOnDestroy(self);
  inherited;
end;

procedure TBotBase.MaximizeWindow;
begin
  self.FWindowInfo.Maximize;
end;

procedure TBotBase.MinimizeWindow;
begin
  self.FWindowInfo.Mnimize;
end;

procedure TBotBase.OnTime(Sender: TObject);
begin
  if TShareProc.CheckIfProcessExists(FPid) then
  begin
    try
      if self.FIsActive then
        TWinSystem.unFreezer(Fpid);
    except
       Destroy;
    end;
  end else
  Destroy;
end;

procedure TBotBase.RestoreWindow;
begin
  self.FWindowInfo.Show;
end;

procedure TBotBase.setActive(const Value: Boolean);
var
  I: Integer;
begin
  FIsActive := Value;
  for I := 0 to 9 do
    self.FKeyControl[i].BotActive := FIsActive;
end;

procedure TBotBase.showAutoPot;
begin
  self.FAutoBot.Show;
end;

procedure TBotBase.setError(Sender: TObject; _Message: String;
  ErrorCode: Cardinal);
begin
  if @self.FAppErrorNotify <> nil then
    FAppErrorNotify(Sender, _Message, ErrorCode);
end;

procedure TBotBase.setFreezed(const Value: Boolean);
begin
  FIsFreezed := Value;
  if not FIsFreezed then
    TWinSystem.unFreezer(self.FPid);
end;

procedure TBotBase.setWindowCaption(const Caption: string);
begin
  if (Trim(Caption) <> '') then
    self.FWindowInfo.setCaption(Caption);
end;

procedure TBotBase.showPlayerInfo;
var
  FrmPlayer: TFrmPlayer;
begin
  FrmPlayer := TFrmPlayer.Create(self);
  try
    with FrmPlayer do
    begin
      with self.FPlayerInfo do
      begin
        sLabelFx1.Caption := Nome;
        Caption := 'Informações de ' + Nome;
        sLabelFx2.Caption := 'Nv.: ' + IntToStr(Nv);
        sLabel1.Caption := 'Classe: ' + Classe;
        sLabel2.Caption := 'Cultivo: ' + Cultivo;
        sLabel7.Caption := Format('%u/%u', [HP, HPMax]);
        sLabel8.Caption := Format('%u/%u', [MP, MPMax]);
        sLabel9.Caption := Format('%u/%u', [Chi, ChiMax]);
        with sGauge1 do
        begin
          MaxValue := HPMax;
          Progress := HP;
        end;
        with sGauge2 do
        begin
          MaxValue := MPMax;
          Progress := MP;
        end;
        with sGauge3 do
        begin
          MaxValue := ChiMax;
          Progress := Chi;
        end;
        sLabel6.Caption := 'Alma: ' + IntToStr(Alma);
        sLabel10.Caption := 'Fama: ' + IntToStr(Fama);
        sLabel11.Caption := 'Exp.: ' + IntToStr(Xp);
        sLabel12.Caption := 'Próx. Nv.: ' + IntToStr(NextXP);
        sLabel13.Caption := 'Dinheiro: ' + IntToStr(Gold);
        sLabel14.Caption := 'Pontos: ' + IntToStr(PontosSkill);
        sLabel15.Caption := 'ID: ' + IntToStr(Id);
        sLabel16.Caption := IntToStr(Con);
        sLabel17.Caption := IntToStr(Int);
        sLabel18.Caption := IntToStr(Str);
        sLabel19.Caption := IntToStr(Dex);
        sImage1.ImageIndex := SexoId;
        sImage2.ImageIndex := 2;
        sImage3.ImageIndex := 3;
        sImage4.ImageIndex := 4;
        sImage5.ImageIndex := 5;
      end;
    end;
    FrmPlayer.ShowModal;
  finally
    FrmPlayer.Free;
  end;
end;

{ TKeyControl }

constructor TKeyControl.Create(const WindowHandle: THandle);
begin
  Create(WindowHandle, 0, 1000);
end;

constructor TKeyControl.Create(const WindowHandle: THandle;
  const KeyID: NativeUInt; const Interval: Cardinal);
begin
  Create(WindowHandle, KeyID, Interval, False);
end;

constructor TKeyControl.Create(const WindowHandle: THandle;
  const KeyID: NativeUInt; const Interval: Cardinal; const Active: Boolean);
begin
  self.FBotIsActive := False;
  self.FHandle := WindowHandle;
  self.setKeyId(KeyID);
  self.setInterval(Interval);
  self.setActive(Active);
  self.FTimer := TTimer.Create(nil);
  self.FTimer.OnTimer := self.OnTime;
  self.FTimer.Enabled := self.FIsActive;
end;

destructor TKeyControl.Destroy;
begin
  self.setActive(False);
  self.FTimer.Free;
  self.FKeyID := 0;
  self.Interval := 0;
  inherited;
end;

procedure TKeyControl.OnTime(Sender: TObject);
begin
  if (self.FBotIsActive and self.FIsActive) then
    TShareProc.EnviarTecla(self.FHandle, self.FKeyID);
end;

procedure TKeyControl.setActive(const Value: Boolean);
begin
  FIsActive := Value;
  if FTimer <> nil then
    FTimer.Enabled := FIsActive;
end;

procedure TKeyControl.setInterval(const Value: Cardinal);
begin
  FTimeInterval := Value;
  if FTimer <> nil then
    FTimer.Interval := FTimeInterval;
end;

procedure TKeyControl.setKeyId(const Value: NativeUInt);
begin
  FKeyID := Value;
end;

{ TWinInfo }

procedure TWinInfo.Close;
begin
  TWinSystem.WinClose(self.FHandle);
end;

constructor TWinInfo.Create(const WindowHandle: THandle);
begin
  self.FHandle := WindowHandle;
  self.updateInfo;
end;

destructor TWinInfo.Destroy;
begin
  // restora o caption original
  self.retoreOriginalCaption;
  inherited;
end;

function TWinInfo.getCaption: string;
begin
  if self.FHandle <> 0 then
    result := TWinSystem.WinGetCaption(FHandle);
end;

procedure TWinInfo.Hide;
begin
  TWinSystem.WinHide(self.FHandle);
end;

procedure TWinInfo.Maximize;
begin
  TWinSystem.WinMaximize(self.FHandle);
end;

procedure TWinInfo.Mnimize;
begin
  TWinSystem.WinMinimize(self.FHandle);
end;

procedure TWinInfo.retoreOriginalCaption;
begin
  TWinSystem.WinSetCaption(self.FHandle, self.FWndOrigCaption);
end;

procedure TWinInfo.setCaption(const Value: string);
begin
  if Length(Trim(Value)) > 0 then
    TWinSystem.WinSetCaption(FHandle, Value);
end;

procedure TWinInfo.setPos(const X, Y: Integer);
begin
  setPosAndWH(X, Y, self.FWndNewRect.Width, self.FWndNewRect.Height);
end;

procedure TWinInfo.setPosAndWH(const X, Y, W, H: Integer);
begin
  // Set Realmente e Atualiza o rect
end;

procedure TWinInfo.setWH(const Width, Height: Integer);
begin
  setPosAndWH(self.FWndNewRect.Left, self.FWndNewRect.Top, Width, Height);
end;

procedure TWinInfo.Show;
begin
  TWinSystem.WinShow(FHandle);
end;

procedure TWinInfo.updateInfo;
var
  R: TRect;
begin
  getWindowRect(self.FHandle, R);
  self.FWndOrigRect := R;
  self.FWndNewRect := R;
  self.FWndOrigCaption := TWinSystem.WinGetCaption(self.FHandle);
end;

end.
