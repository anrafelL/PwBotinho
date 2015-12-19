unit PwLib.MemReadWrite;

interface

uses Windows, SysUtils, Classes, StrUtils, PwBotinho.System.Share;

type
  PMemManager = ^TMemManager;
  TMemManager = class(TObject)
  private
    FProcessHandle: THandle;
  public
    class procedure SwapEndiannessOfBytes(var Value: cardinal); static;
    class procedure DWORDToArrayOfBytes(source: cardinal;
      var dest: TCustomArrayOfByte); static;
    class function ByteArrayToSingle(const ByteArray: TCustomArrayOfByte)
      : Single; static;
    class procedure HexStrToArrayOfBytes(source: string;
      var dest: TCustomArrayOfByte); static;
    class function memOpen(pid: THandle; Access: DWORD = $1F0FFF; _inherited: Boolean = True): THandle; static;
    class procedure memClose(Handle: THandle); static;
    function Read(const Addr: DWORD): DWORD;
    function Write(const Addr: DWORD; Value: Pointer; Size: SIZE_T): BOOL;
    class function InvertByteStrHex(source: string): string; static;
    constructor Create(const ProcessHandle: THandle);
    destructor Destroy; override;
  end;


  function _hex(value: Cardinal; size: NativeUint = 8): string;
  function HexToInt(const HexStr: string): longint;

implementation


{ TMemManager }

constructor TMemManager.Create(const ProcessHandle: THandle);
begin
  if ProcessHandle > 0 then  
    FProcessHandle := ProcessHandle
  else
    raise Exception.Create('Process Handle Error!');
end;

destructor TMemManager.Destroy;
begin
   MemClose(FProcessHandle);
   inherited;
end;

class procedure TMemManager.memClose(Handle: THandle);
begin
  CloseHandle(Handle);
end;

class function TMemManager.memOpen(pid: THandle; Access: DWORD; _inherited: Boolean): THandle;
begin
    Result := OpenProcess(Access, _inherited, pid);
end;

function TMemManager.Read(const Addr: DWORD): DWORD;
var
  IsOk: BOOL;
  Buf: DWORD;
  ByteReads: SIZE_T;
begin
    Result := 0;
    IsOk := ReadProcessMemory(FProcessHandle, ptr(Addr), @Buf, sizeof(DWORD), ByteReads);
    if (IsOk = True and (Bytereads > 0)) then
      Result := Buf;
end;


function TMemManager.Write(const Addr: DWORD; Value: Pointer; Size: SIZE_T): BOOL;
var
  ReadsBytes: SIZE_T;
begin
  Result := WriteProcessMemory(FProcessHandle, ptr(Addr), Value, Size, ReadsBytes);
end;



function _hex(value: Cardinal; size: NativeUint = 8): string;
var
  tmp1, tmp2: string;
  i: NativeUint;
begin
  tmp1 := StrUtils.AnsiRightStr('00000000' + IntToHex(value, 8), size);
  for i := 0 to (Length(tmp1) div 2) - 1 do
    tmp2 := tmp2 + StrUtils.AnsiMidStr(tmp1, Length(tmp1) - 1 - 2 * i, 2);
  Result := tmp2;
end;

function HexToInt(const HexStr: string): longint;
var
  iNdx: integer;
  cTmp: Char;
begin
  Result := 0;
  for iNdx := 1 to Length(HexStr) do
  begin
    cTmp := HexStr[iNdx];
    case cTmp of
      '0' .. '9':
        Result := 16 * Result + (Ord(cTmp) - $30);
      'A' .. 'F':
        Result := 16 * Result + (Ord(cTmp) - $37);
      'a' .. 'f':
        Result := 16 * Result + (Ord(cTmp) - $57);
    else
      raise EConvertError.Create('Illegal character in hex string');
    end;
  end;
end;

class function  TMemManager.ByteArrayToSingle(const ByteArray
  : TCustomArrayOfByte): Single;
begin
  if Length(ByteArray) > 0 then
    Result := PSingle(@ByteArray[0])^
  else
    Result := 0.0;
end;

class procedure  TMemManager.DWORDToArrayOfBytes(source: cardinal;
var dest: TCustomArrayOfByte);
var
  s: string;
  QtdBytes: NativeUInt;
  i, J: Integer;
begin
  SetLength(dest, sizeof(source));
  s := IntToHex(source, 8);
  QtdBytes := sizeof(source);
  J := 1;
  for i := 0 to QtdBytes - 1 do
  begin
    dest[i] := Ord(StrToInt('$' + Copy(s, J, 2)));
    inc(J, 2);
  end;
end;

class function  TMemManager.InvertByteStrHex(source: string): string;
var
  i: Integer;
  b, c: TCustomArrayOfByte;
  len: Integer;
  str: string;
  s: string;
begin
  s := source;
  len := Length(s) div 2;
  SetLength(c, len);
  HexStrToArrayOfBytes(s, b);
  for i := 0 to len - 1 do
    c[(len - 1) - i] := b[i];
  for i := 0 to len - 1 do
    str := str + IntToHex(c[i], 2);
  Result := str;
end;

class procedure  TMemManager.SwapEndiannessOfBytes(var Value: cardinal);
var
  tmp: cardinal;
  i: Integer;
begin
  tmp := 0;
  for i := 0 to sizeof(Value) - 1 do
    inc(tmp, ((Value shr (8 * i)) and $FF) shl (8 * (sizeof(Value) - i - 1)));
  Value := tmp;
end;

class procedure TMemManager.HexStrToArrayOfBytes(source: string;
var dest: TCustomArrayOfByte);
var
  QtdBytes: NativeUInt;
  i, J: Integer;
begin
  QtdBytes := Length(source) div 2;
  SetLength(dest, QtdBytes);
  J := 1;
  for i := 0 to QtdBytes - 1 do
  begin
    dest[i] := Ord(StrToInt('$' + Copy(source, J, 2)));
    inc(J, 2);
  end;
end;

end.
