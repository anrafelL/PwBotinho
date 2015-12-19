unit PwBotinho.System.Share;

interface

uses Windows, Messages, Classes, System.Generics.Collections, Winapi.TlHelp32;

type
  TCustomArrayOfByte = array of Byte;
  PCustomArrayOfByte = ^TCustomArrayOfByte;

type
  TScreenShotType = (sstActiveWindow, sstActiveClientArea, sstPrimaryMonitor,
    sstDesktop);

type
  TVersion = record
    Major, Minor, Release, Build: Cardinal;
  end;

const
  // SYSTEM CONSTANT
  SE_DEBUG_NAME = 'SeDebugPrivilege';
  EXE_NAME = 'elementclient.exe';
  // controls
  DIR_CFG = 'config\pwBotinho.ini';
  DIR_OFFSET = 'config\custom_offset.ini';
  CMD_START = 'startbypatcher game:cpw console:1 nocheck';

resourcestring
  program_name = 'PwBotinho 2.0 Alpha';
  program_author = 'Swellington';
  err_memory_write =
    'Houve um erro de escrita no endere�o [%s] com valor [%d].';

  err_onRun = 'J� existe uma inst�ncia desta aplica��o sendo executada.';
  err_noNet = 'N�o h� nenhuma conex�o com a internet.';
  // Info String update
  link_update =
    'https://dl.dropboxusercontent.com/u/50976832/pwbotinho/Update/info.ini';
  no_update_available = 'Nenhuma atualiza��o dispon�vel';
  is_recent_update = 'Voc� j� est� usando a vers�o mais recente [%d.%d.%d.%d]';
  is_new_update = 'H� uma nova vers�o disponivel [%d.%d.%d.%d].' + #13 +
    'Deseja baixar?';
  err_update_read = 'N�o foi poss�vel realizar a atualiza��o';
  err_update_file = 'Houve um erro no arquivo, tente baixar manualmente.' + #13
    + 'link: %s';
  // bot error
  err_bot_create =
    'N�o foi poss�vel criar a classe ([%s]: %d). Algo saiu errado.';
  err_bot_player = 'N�o � poss�vel mostrar informa��es do personagem.';
  err_packet = 'Houve algum erro na inje��o do pacote. [%s]';

type
  TShareProc = class
    class procedure FreeAll(List: TList<TObject>); static;
    class procedure EnviarTecla(Handle: THandle; Idx: Integer); static;
    class function CheckIfProcessExists(const hPid: NativeUInt)
      : boolean; static;
      class procedure IniciarComWindows(const Value: Boolean); static;


  end;

implementation

{ TShareProc }

class function TShareProc.CheckIfProcessExists(const hPid: NativeUInt): boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if hPid = FProcessEntry32.th32ProcessID then
    begin
      Result := True;
      Break;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

class procedure TShareProc.EnviarTecla(Handle: THandle; Idx: Integer);
const
  KeyEY = VK_RETURN;
  KeyEN = VK_ESCAPE;
  KeyF1 = 112;
  KeyF2 = 113;
  KeyF3 = 114;
  KeyF4 = 115;
  KeyF5 = 116;
  KeyF6 = 117;
  KeyF7 = 118;
  KeyF8 = 119;
  KeyN1 = $31;
  KeyN2 = $32;
  KeyN3 = $33;
  KeyN4 = $34;
  KeyN5 = $35;
  KeyN6 = $36;
  KeyN7 = $37;
  KeyN8 = $38;
  KeyN9 = $39;

  procedure sendKey(const Key: DWORD);
  begin
    if (Key = KeyEY) then
      PostMessage(Handle, WM_CHAR, Ord(Char('Y')), 0)
    else
    begin
      PostMessage(Handle, WM_KEYDOWN, Key, 0);
      PostMessage(Handle, WM_KEYUP, Key, 0);
    end;
  end;

var
  Key: DWORD;
begin
  case Idx of
    0:
      Key := KeyF1;
    1:
      Key := KeyF2;
    2:
      Key := KeyF3;
    3:
      Key := KeyF4;
    4:
      Key := KeyF5;
    5:
      Key := KeyF6;
    6:
      Key := KeyF7;
    7:
      Key := KeyF8;
    8:
      Key := KeyN1;
    9:
      Key := KeyN2;
    10:
      Key := KeyN3;
    11:
      Key := KeyN4;
    12:
      Key := KeyN5;
    13:
      Key := KeyN6;
    14:
      Key := KeyN7;
    15:
      Key := KeyN8;
    16:
      Key := KeyN9;
    17:
      Key := KeyEY;
    18:
      Key := KeyEN;

  end;
  sendKey(Key);
end;

class procedure TShareProc.FreeAll(List: TList<TObject>);
var
  i: Integer;
begin
  while List.Count > 0 do
  begin
    if List.Items[0] <> nil then
      List.Items[0].Free;
  end;
end;

class procedure TShareProc.IniciarComWindows(const Value: Boolean);
begin
//
end;

end.
