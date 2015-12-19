unit PwLib.System.Inject;

interface

uses Windows, SysUtils, StrUtils;

type
  TPacketSend = class
    class procedure sendPacket(packet: string; packetSize: DWORD;
      hPid: THandle);
    class function SetPrivilege(privilegeName: string; enable: Boolean)
      : Boolean;
  end;

implementation

{ TPacketSend }

uses PwLib.System.OffSet, PwLib.MemReadWrite, PwBotinho.System.Share;

class procedure TPacketSend.sendPacket(packet: string; packetSize: DWORD;
  hPid: THandle);
var
  opcode: string;
  hProcessHandle: THandle;
  hRemoteThread: THandle;
  hThreadID: DWORD;
  ByteReads: SIZE_T;
  Result: Integer;
  I: Integer;
  FunctionAddress: Pointer;
  PacketAddress: Pointer;
  buffer: array of byte;
begin
  try
  if TPacketSend.SetPrivilege(SE_DEBUG_NAME, true) then
  begin
    hProcessHandle := TMemManager.memOpen(hPid);
    FunctionAddress := VirtualAllocEx(hProcessHandle, nil, $46, $1000, $40);
    PacketAddress := VirtualAllocEx(hProcessHandle, nil, packetSize,
      $1000, $40);

    opcode := Concat(
    '60',                               //PUSHAD
    'B8',  _hex(SendPacket_Address),    //MOV   EAX, sendPacket_Address
    '8B0D',_hex(Real_Base_Address),     //MOV   ECX, DWORD PTR [Real_base_Address]
    '8B4920',                           //MOV   ECX, DWORD PTR [ECX+20]
    'BF',  _hex(DWORD(PacketAddress)),  //MOV   EDI, packetAddress
    '6A',  _hex(packetSize, 2),         //PUSH  packetSize
    '57',                               //PUSH  EDI
    'FFD0',                             //CALL  EAX
    '61',                               //POPAD
    'C3');                              //RET

    // Opcode
    setLength(buffer, Length(opcode) div 2);
    for I := 1 to Length(buffer) do
      buffer[I - 1] := HexToInt(AnsiMidStr(opcode, (I - 1) * 2 + 1, 2));

    WriteProcessMemory(hProcessHandle, FunctionAddress, @buffer[0],
      Length(buffer), ByteReads);

    // Packet
    setLength(buffer, Length(packet) div 2);
    for I := 1 to Length(buffer) do
      buffer[I - 1] := HexToInt(AnsiMidStr(packet, (I - 1) * 2 + 1, 2));


    WriteProcessMemory(hProcessHandle, PacketAddress, @buffer[0],
      Length(buffer), ByteReads);

    hRemoteThread := CreateRemoteThread(hProcessHandle, nil, 0, FunctionAddress,
      nil, 0, hThreadID);
    repeat
      Result := WaitForSingleObject(hRemoteThread, 50);
    until Result <> 258;

    CloseHandle(hRemoteThread);
    VirtualFreeEx(hProcessHandle, FunctionAddress, 0, $8000);
    VirtualFreeEx(hProcessHandle, PacketAddress, 0, $8000);
    TMemManager.memClose(hProcessHandle);
  end;
  except
    On E: Exception do
    begin
      //TPwBotSys.genLog(err_packet);
      MessageBox(0, PChar(err_packet), PChar(program_name), MB_OK+MB_ICONINFORMATION);
    end;
  end;
end;

class function TPacketSend.SetPrivilege(privilegeName: string;
  enable: Boolean): Boolean;
var
  tpPrev, tp: TTokenPrivileges;
  token: THandle;
  dwRetLen: DWORD;
begin
  Result := False;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or
    TOKEN_QUERY, token);
  tp.PrivilegeCount := 1;
  if LookupPrivilegeValue(nil, pchar(privilegeName), tp.Privileges[0].LUID) then
  begin
    if enable then
      tp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      tp.Privileges[0].Attributes := 0;
    dwRetLen := 0;
    Result := AdjustTokenPrivileges(token, False, tp, SizeOf(tpPrev), tpPrev,
      dwRetLen);
  end;
  CloseHandle(token);
end;

initialization

TPacketSend.SetPrivilege(SE_DEBUG_NAME, true);

end.
