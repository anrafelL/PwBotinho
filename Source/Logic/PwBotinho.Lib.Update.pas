unit PwBotinho.Lib.Update;

interface

uses Classes, SysUtils, IdComponent, idHTTP, Windows;

type
  TUpdateError = procedure(Sender: TObject; ErrorCode: NativeUInt;
    ErrorMsg: String) of Object;
  TUpdateBegin = TNotifyEvent;
  TUpdatePaused = TNotifyEvent;
  TUpdateCanceled = TNotifyEvent;
  TUpdateProgress = procedure(Sender: TObject; Progress, Max: UInt64) of Object;
  TUpdateFinish = TNotifyEvent;

type
  TUpdate = class(TComponent)
  private
    FIdHTTP: TidHTTP;
    FMaxFileSize: Int64;
    FLocalFilePath: string;
    FFileName: string;
    FAutoStart: Boolean;
    FOnBegin: TUpdateBegin;
    FOnFinish: TUpdateFinish;
    FOnCanceled: TUpdateCanceled;
    FOnPaused: TUpdatePaused;
    Flink: string;
    FOnProgress: TUpdateProgress;
    FOnError: TUpdateError;
    procedure UpdateError(Sender: TObject; ErrorCode: NativeUInt;
      ErrorMsg: string);
    procedure UpdateBegin(Sender: TObject);
    procedure UpdatePaused(Sender: TObject);
    procedure UpdateCanceled(Sender: TObject);
    procedure UpdateProgress(Sender: TObject; Progress, Max: UInt64);
    procedure UpdateFinish(Sender: TObject);
    procedure setFFileName(const Value: string);
    procedure setlink(const Value: string);
    procedure setLocalFilePath(const Value: string);
  protected
    procedure OnWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure OnWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure OnWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  public
    procedure DownloadNow;
    constructor Create(Link, FileName, LocalFilePath: string;
      AutoStart: Boolean; ProcError: TUpdateError; ProcBegin: TUpdateBegin;
      (*ProcPaused: TUpdatePaused; ProcCanceled: TUpdateCanceled;*)
      ProcProgress: TUpdateProgress; ProcFinish: TUpdateFinish); overload;
    constructor Create(Link, FileName, LocalFilePath: string;
      AutoStart: Boolean); overload;
    constructor Create; overload;
    destructor Destroy; override;
  published
    property LinkToDownload: string read Flink write setlink;
    property FileName: string read FFileName write setFFileName;
    property LocalFilePath: string read FLocalFilePath write setLocalFilePath;
    property OnError: TUpdateError read FOnError write FOnError;
    //property OnBegin: TUpdateBegin read FOnBegin write FOnBegin;
    //property OnPaused: TUpdatePaused read FOnPaused write FOnPaused;
    //property OnCanceled: TUpdateCanceled read FOnCanceled write FOnCanceled;
    property OnProgress: TUpdateProgress read FOnProgress write FOnProgress;
    property OnFinish: TUpdateFinish read FOnFinish write FOnFinish;
  end;

implementation

{ TUpdate }

constructor TUpdate.Create(Link, FileName, LocalFilePath: string;
  AutoStart: Boolean);
begin
  Create(Link, FileName, LocalFilePath, false, TUpdateError(nil),
    TUpdateBegin(nil),  TUpdateProgress(nil), TUpdateFinish(nil));
end;

constructor TUpdate.Create(Link, FileName, LocalFilePath: string;
  AutoStart: Boolean; ProcError: TUpdateError; ProcBegin: TUpdateBegin;
  (*ProcPaused: TUpdatePaused; ProcCanceled: TUpdateCanceled;*)
  ProcProgress: TUpdateProgress; ProcFinish: TUpdateFinish);
begin
  try
    Flink := Link;
    FFileName := FileName;
    FLocalFilePath := LocalFilePath;
    FAutoStart := AutoStart;
    FOnBegin := ProcBegin;
    FOnFinish := ProcFinish;
    //FOnCanceled := ProcCanceled;
    //FOnPaused := ProcPaused;
    FOnProgress := ProcProgress;
    FOnError := ProcError;
    FIdHTTP := TidHTTP.Create(self);
    if AutoStart = True then
      DownloadNow;
  except
    MessageBox(0, PChar('Houve um erro na criação da classe [TUpdate]'),
      PChar('PwBotinho Update System'), MB_OK + MB_ICONINFORMATION);
  end;
end;

constructor TUpdate.Create;
begin
  Create('', '', '', false);
end;

destructor TUpdate.Destroy;
begin
  FIdHTTP.Free;
  inherited;
end;

procedure TUpdate.DownloadNow;
var
  F: TFileStream;
  tmp_fileName: string;
begin
  F := TFileStream.Create('d:\arquivo.tmp', fmCreate);
  FIdHttp.Get(self.Flink, F);
  if not F.Size = self.FMaxFileSize then
    renameFile('d:\arquivo.tmp', 'd:\file.exe');
  F.Free;
end;

procedure TUpdate.OnWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  self.UpdateProgress(ASender, AWorkCount, FMaxFileSize);
end;

procedure TUpdate.OnWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  FMaxFileSize := AWorkCountMax;
  UpdateBegin(ASender);
end;

procedure TUpdate.OnWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  UpdateFinish(ASender);
end;

procedure TUpdate.setFFileName(const Value: string);
begin
  // checar se o nome do arquivo é valido
  FFileName := Value;
end;

procedure TUpdate.setlink(const Value: string);
begin
  // checar se o link é válido
  Flink := Value;
end;

procedure TUpdate.setLocalFilePath(const Value: string);
begin
  // checar se o caminho é válido
  FLocalFilePath := Value;
end;

procedure TUpdate.UpdateBegin(Sender: TObject);
begin
  if @self.FOnBegin <> nil then
    self.FOnBegin(Sender);
end;

procedure TUpdate.UpdateCanceled(Sender: TObject);
begin
  if @self.FOnCanceled <> nil then
    self.FOnCanceled(Sender);
end;

procedure TUpdate.UpdateError(Sender: TObject; ErrorCode: NativeUInt;
  ErrorMsg: string);
begin
  if @self.FOnError <> nil then
    FOnError(Sender, ErrorCode, ErrorMsg);
end;

procedure TUpdate.UpdateFinish(Sender: TObject);
begin
  if @self.FOnFinish <> nil then
    FOnFinish(Sender);
end;

procedure TUpdate.UpdatePaused(Sender: TObject);
begin
  if @self.FOnPaused <> nil then
    FOnPaused(Sender);
end;

procedure TUpdate.UpdateProgress(Sender: TObject; Progress, Max: UInt64);
begin
  if @self.FOnProgress <> nil then
    self.FOnProgress(Sender, Progress, Max);
end;

end.
