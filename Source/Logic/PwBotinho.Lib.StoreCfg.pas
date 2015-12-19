unit PwBotinho.Lib.StoreCfg;

interface

uses Inifiles, SysUtils, Classes;

type
  TErrorEventCFG = procedure(Sender: TObject; Message: String; Code: NativeUint)
    of Object;

type
  TStoreCFG = class
  private
    FIni: TInifile;
    FStartWithWindow: Boolean;
    FAutoCheckUpdate: Boolean;
    FMinimizeToTray: Boolean;
    FStayOnTop: Boolean;
    FRenameWindowWithCharName: Boolean;
    FOnError: TErrorEventCFG;
    FClientPath: string;
  protected
    procedure POnError(Sender: TObject; Message: String; Code: NativeUint);
  public
    procedure Save;
    procedure Load;
    constructor Create;
    destructor Destroy; Override;
    // property
    property StartWithWindows: Boolean read FStartWithWindow
      write FStartWithWindow;
    property StayOnTop: Boolean read FStayOnTop write FStayOnTop;
    property AutoCheckUpdate: Boolean read FAutoCheckUpdate
      write FAutoCheckUpdate;
    property RenameWindowWithCharName: Boolean read FRenameWindowWithCharName
      write FRenameWindowWithCharName;
    property MinimizeToTray: Boolean read FMinimizeToTray write FMinimizeToTray;
    property ClientPath: string read FClientPath write FClientPath;
    property OnError: TErrorEventCFG read FOnError write FOnError;

  end;

implementation

{ TStoreCFG }

const
  SESSION_NAME = 'CONFIGURACAO';

constructor TStoreCFG.Create;
begin
  try
    FStartWithWindow := False;
    FAutoCheckUpdate := False;
    FMinimizeToTray := False;
    FStayOnTop := False;
    FRenameWindowWithCharName := False;
    FClientPath := '';
    FIni := TInifile.Create(ExtractFilePath(ParamStr(0)) + '\config.ini');
  except
    POnError(Self, 'Erro na criação da classe TStoreCFG', 100);
  end;
end;

destructor TStoreCFG.Destroy;
begin
  FIni.Free;
  inherited;
end;

procedure TStoreCFG.Load;
begin
  if FIni <> nil then
  begin
    with FIni do
    begin
      FStartWithWindow := ReadBool(SESSION_NAME, 'IniciarComWindows', False);
      FAutoCheckUpdate := ReadBool(SESSION_NAME, 'AutoChecarAtualizao', False);
      FMinimizeToTray := ReadBool(SESSION_NAME, 'MinimizarParaBandeja', False);
      FStayOnTop := ReadBool(SESSION_NAME, 'SempreNoTopo', False);
      FRenameWindowWithCharName := ReadBool(SESSION_NAME,
        'RenomearWindowComNomeDoChar', False);
      FClientPath := ReadString(SESSION_NAME, 'ClientPath', '');
    end;
  end;
end;

procedure TStoreCFG.POnError(Sender: TObject; Message: String;
  Code: NativeUint);
begin
  if @FOnError <> nil then
    FOnError(Sender, Message, Code);
end;

procedure TStoreCFG.Save;
begin
  with FIni do
  begin
    WriteBool(SESSION_NAME, 'IniciarComWindows', FStartWithWindow);
    WriteBool(SESSION_NAME, 'AutoChecarAtualizao', FAutoCheckUpdate);
    WriteBool(SESSION_NAME, 'MinimizarParaBandeja', FMinimizeToTray);
    WriteBool(SESSION_NAME, 'SempreNoTopo', FStayOnTop);
    WriteBool(SESSION_NAME, 'RenomearWindowComNomeDoChar',
      FRenameWindowWithCharName);
    WriteString(SESSION_NAME, 'ClientePath', FClientPath);
  end;
end;

end.
