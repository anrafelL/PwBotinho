unit PwLib.System.Win;

interface

uses Windows, Registry, ShellApi, Classes, SysUtils, Messages;

type
  TWinSystem = class(TObject)
  public
    class function getPerfectWorldDir: string;
    class procedure unFreezer(const Pid: THandle); static;
    // Ações da Janelas
    class function GetHWndByPID(const hPID: THandle): THandle; static;
    class procedure WinMove(const Handle: THandle; const x, y: Integer); static;
    class procedure WinClose(const Handle: THandle); static;
    class procedure WinRestore(const Handle: THandle); static;
    class procedure WinMinimize(const Handle: THandle); static;
    class procedure WinMaximize(const Handle: THandle); static;
    class procedure WinSetTopMost(const Handle: THandle); static;
    class procedure WinUnSetTopMost(const Handle: THandle); static;
    class procedure WinHide(const Handle: THandle); static;
    class procedure WinShow(const Handle: THandle); static;
    class procedure WinSetPosAndSize(const Handle: THandle;
      const x, y, w, h: Integer); static;
    class procedure WinSetCaption(const Handle: THandle;
      const NewName: string); static;
    class function WinGetCaption(const Handle: THandle): string; static;
    class procedure AppKill(const Pid: DWORD);
  end;

implementation

{ TWinSystem }

uses PwLib.MemReadWrite, PwLib.System.OffSet, PwBotinho.System.Share;

class procedure TWinSystem.AppKill(const Pid: DWORD);
begin
  shellExecute(0, 'open', PChar('cmd.exe'),
    PChar(Format('/k taskkill -f /PID %d&Exit', [Pid])), nil, SW_HIDE);
end;

class function TWinSystem.GetHWndByPID(const hPID: THandle): THandle;
type
  PEnumInfo = ^TEnumInfo;

  TEnumInfo = record
    ProcessID: DWORD;
    HWND: THandle;
  end;

  function EnumWindowsProc(Wnd: DWORD; var EI: TEnumInfo): Bool; stdcall;
  var
    Pid: DWORD;
    className: String;
    buf: array [0 .. MAX_PATH - 1] of char;
    Len: NativeUint;
  begin
    GetWindowThreadProcessId(Wnd, @Pid);
    Len := GetClassName(Wnd, @buf[0], MAX_PATH - 1);
    setString(className, buf, Len);
    if (Pid = EI.ProcessID) and (className = 'ElementClient Window') then
    begin
      EI.HWND := Wnd;
      EI.ProcessID := Pid;
      Result := False;
    end
    else
      Result := True;
  end;

  function FindMainWindow(Pid: DWORD): DWORD;
  var
    EI: TEnumInfo;
  begin
    EI.ProcessID := Pid;
    EI.HWND := 0;
    EnumWindows(@EnumWindowsProc, Integer(@EI));
    Result := EI.HWND;
  end;

begin
  if hPID <> 0 then
    Result := FindMainWindow(hPID)
  else
    Result := 0;

end;

class function TWinSystem.getPerfectWorldDir: string;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if Reg.KeyExists('CLIENT_PATH') then
    begin
      if Reg.OpenKeyReadOnly('CLIENT_PATH') then
        Result := Reg.ReadString('')
      else
        MessageBoxA(0,
          PAnsiChar('Não foi possível abrir a chave para leitura.'),
          PAnsiChar('PwBotinho 2.0 Alpha'), MB_OK + MB_ICONERROR);
    end
    else
      MessageBoxA(0,
        PAnsiChar('Não foi possível localizar o diretório do Perfect World'),
        PAnsiChar('PwBotinho 2.0 Alpha'), MB_OK + MB_ICONERROR);
  finally
    Reg.Free;
  end;
end;

class procedure TWinSystem.unFreezer(const Pid: THandle);
const
  p: Integer = 1;
var
  M: TMemManager;
  ProcessHandle: THandle;
begin
  ProcessHandle := TMemManager.memOpen(Pid);
  M := TMemManager.Create(ProcessHandle);
  try
    if not M.Write(Base_AddressFZ, @p, sizeOf(Integer)) then
      raise Exception.CreateFmt(err_memory_write, [IntToHex(Base_AddressFZ, 8),
        NativeUint(@p)]);
  finally
    M.Free;
  end;
end;

class procedure TWinSystem.WinClose(const Handle: THandle);
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

class function TWinSystem.WinGetCaption(const Handle: THandle): string;
var
  a: array [0 .. 255] of WChar;
begin
  Windows.GetWindowText(Handle, @a[0], 256);
  Result := String(a);
end;

class procedure TWinSystem.WinHide(const Handle: THandle);
begin
  ShowWindow(Handle, SW_HIDE);
end;

class procedure TWinSystem.WinMaximize(const Handle: THandle);
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

class procedure TWinSystem.WinMinimize(const Handle: THandle);
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

class procedure TWinSystem.WinMove(const Handle: THandle; const x, y: Integer);
begin

end;

class procedure TWinSystem.WinRestore(const Handle: THandle);
begin
  ShowWindow(Handle, SW_RESTORE);
  SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
  SetforegroundWindow(Handle);
end;

class procedure TWinSystem.WinSetCaption(const Handle: THandle;
  const NewName: string);
begin
  setWindowText(Handle, PChar(NewName));
end;

class procedure TWinSystem.WinSetPosAndSize(const Handle: THandle;
  const x, y, w, h: Integer);
begin

end;

class procedure TWinSystem.WinSetTopMost(const Handle: THandle);
begin

end;

class procedure TWinSystem.WinShow(const Handle: THandle);
begin
  ShowWindow(Handle, SW_SHOW);
  WinRestore(Handle);
end;

class procedure TWinSystem.WinUnSetTopMost(const Handle: THandle);
begin

end;

end.
