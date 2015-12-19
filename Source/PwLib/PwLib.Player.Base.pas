unit PwLib.Player.Base;

interface

uses
  Windows, SysUtils, Classes, StrUtils, Graphics, Jpeg, PwLib.MemReadWrite,
  Generics.Collections, IniFiles;

type
  PSkill = ^TSkill;

  TSkill = record
  private
    FSkillName: string;
    SkillId: NativeUInt;
  end;

type
  PSkillList = ^TSkillList;

  TSkillList = class(TObject)
  private
    FSkillList: TList<TSkill>;
    FClassName: String;
    FCultivationId: NativeUInt;
  protected
    procedure ReadSkillFile;
  public
    constructor Create(const ClassName: string; CultivationId: NativeUInt;
      var SkillList: TList<TSkill>);
    destructor destroy; override;
  end;

type
  PPLayerBase = ^TPlayerBase;

  TPlayerBase = class(TObject)
  private
    FProcessHandle: THandle;
    FMemManager: TMemManager;
    FIsFace: Boolean;
    FPid: THandle;
    FSkillList: TList<TSkill>;
    function getAlma: NativeUInt;
    function getClasse: string;
    function getCon: NativeUInt;
    function getCultivo: string;
    function getDex: NativeUInt;
    function getFama: NativeUInt;
    function getHP: NativeUInt;
    function getHPMax: NativeUInt;
    function getId: NativeUInt;
    function getInt: NativeUInt;
    function getMP: NativeUInt;
    function getMPMax: NativeUInt;
    function getNextXP: NativeUInt;
    function getNv: NativeUInt;
    function getSexo: string;
    function getStr: NativeUInt;
    function getX: Single;
    function getXP: NativeUInt;
    function getY: Single;
    function getZ: Single;
    function getChi: NativeUInt;
    function getChiMax: NativeUInt;
    function getGold: NativeUInt;
    function getSkillPoints: NativeUInt;
    function getName: String;
    function getFace: String;
    function getState: String;
    function getTargetId: NativeUInt;
    function getSexoID: NativeUInt;
  public
    constructor Create(const Pid: THandle);
    destructor destroy; Override;
    property Face: String read getFace;
    property Nome: String read getName;
    property HP: NativeUInt read getHP;
    property MP: NativeUInt read getMP;
    property HPMax: NativeUInt read getHPMax;
    property MPMax: NativeUInt read getMPMax;
    property Classe: string read getClasse;
    property Cultivo: string read getCultivo;
    property SexoID: NativeUInt read getSexoID;
    property Sexo: string read getSexo;
    property Alma: NativeUInt read getAlma;
    property Fama: NativeUInt read getFama;
    property XP: NativeUInt read getXP;
    property NextXP: NativeUInt read getNextXP;
    property Nv: NativeUInt read getNv;
    property Id: NativeUInt read getId;
    property Con: NativeUInt read getCon;
    property Str: NativeUInt read getStr;
    property Int: NativeUInt read getInt;
    property Dex: NativeUInt read getDex;
    property Chi: NativeUInt read getChi;
    property ChiMax: NativeUInt read getChiMax;
    property Gold: NativeUInt read getGold;
    property PontosSkill: NativeUInt read getSkillPoints;
    // property State: String read getState;
    property X: Single read getX;
    property Y: Single read getY;
    property Z: Single read getZ;
    property targetId: NativeUInt read getTargetId;
  end;

implementation

{ TPlayerBase }

uses PwLib.System.OffSet, PwBotinho.System.Share;

constructor TPlayerBase.Create(const Pid: THandle);
begin
  if Pid > 0 then
  begin
    self.FProcessHandle := TMemManager.memOpen(Pid);
    FSkillList := TList<TSkill>.Create;
    if self.FProcessHandle > 0 then
    begin
      FPid := Pid;
      FMemManager := TMemManager.Create(FProcessHandle);
    end;
  end;
end;

// Teste
destructor TPlayerBase.destroy;
begin
  // FSkillList.free;
  FMemManager.Free;
  inherited;
end;

function TPlayerBase.getAlma: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      Spirit_offset);
end;

function TPlayerBase.getChi: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + CHI_Offset);
end;

function TPlayerBase.getChiMax: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      MAXCHI_Offset);
end;

function TPlayerBase.getClasse: string;
var
  R: DWORD;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Class_offset);
  case R of
    0:
      Result := 'Guerreiro';
    1:
      Result := 'Mago';
    2:
      Result := 'Espiritualista';
    3:
      Result := 'Feiticeira';
    4:
      Result := 'Bárbaro';
    5:
      Result := 'Mercenário';
    6:
      Result := 'Arqueiro';
    7:
      Result := 'Sacerdote';
    8:
      Result := 'Arcano';
    9:
      Result := 'Místico';
  end;
end;

function TPlayerBase.getCon: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + VIT_offset);
end;

function TPlayerBase.getCultivo: string;
var
  R: DWORD;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Culti_Offset);
  case R of
    0:
      Result := 'Leal';
    1:
      Result := 'Astuto';
    2:
      Result := 'Lúcido';
    3:
      Result := 'Enigmático';
    4:
      Result := 'Ameaçador';
    5:
      Result := 'Sinistro';
    6:
      Result := 'Nirvana';
    7:
      Result := 'Mahayana';
    20:
      Result := 'Nobre';
    21:
      Result := 'Iluminado';
    22:
      Result := 'Imortal';
    30:
      Result := 'Diabólico';
    31:
      Result := 'Infernal';
    32:
      Result := 'Demoníaco';
  end;
end;

function TPlayerBase.getDex: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + DEX_offset);
end;

function TPlayerBase.getFace: String;
begin
end;

function TPlayerBase.getFama: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      Reputation_Offset);
end;

function TPlayerBase.getGold: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Gold_offset);
end;

function TPlayerBase.getHP: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + HP_OffSet);
end;

function TPlayerBase.getHPMax: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      MaxHP_OffSet);
end;

function TPlayerBase.getId: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      CHARID_Offset);
end;

function TPlayerBase.getInt: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + MAG_offset);
end;

function TPlayerBase.getMP: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + MP_OffSet);
end;

function TPlayerBase.getMPMax: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      MaxMP_OffSet);
end;

function TPlayerBase.getName: String;
var
  R: Pointer;
  IsOk: BOOL;
  ByteReads: SIZE_T;
  buf: array [0 .. 30] of wchar;
begin
  try
    with FMemManager do
      R := Pointer(Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
        Name_offset));
    IsOk := ReadProcessMemory(FProcessHandle, R, @buf, sizeof(UnicodeString) *
      15, ByteReads);
    if IsOk then
      SetString(Result, buf, ByteReads);
  except
    Result := 'ERROR';
  end;
end;

function TPlayerBase.getNextXP: NativeUInt;
begin
  with FMemManager do
    Result := Read(Base_AddressEXP + (getNv * 4));
end;

function TPlayerBase.getNv: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + LVL_Offset);
end;

function TPlayerBase.getSexo: string;
var
  R: DWORD;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Sex_Offset);
  case R of
    0:
      Result := 'Masculino';
    1:
      Result := 'Feminino';
  end;
end;

function TPlayerBase.getSexoID: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Sex_Offset);
end;

function TPlayerBase.getSkillPoints: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      SkillPoints_offset);
end;

function TPlayerBase.getState: String;
var
  R: DWORD;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + CharState_Offset);
  Result := '';
end;

function TPlayerBase.getStr: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + STR_offset);
end;

function TPlayerBase.getTargetId: NativeUInt;
var
  b: Pointer;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) +
      Target_OffSet);
end;

function TPlayerBase.getX: Single;
var
  R: DWORD;
  A: TCustomArrayOfByte;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + X_Offset);
  TMemManager.SwapEndiannessOfBytes(R);
  TMemManager.DWORDToArrayOfBytes(R, A);
  Result := (TMemManager.ByteArrayToSingle(A) + 4000.1) / 10.0;
end;

function TPlayerBase.getXP: NativeUInt;
begin
  with FMemManager do
    Result := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + EXP_OffSet);
end;

function TPlayerBase.getY: Single;
var
  R: DWORD;
  A: TCustomArrayOfByte;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Y_Offset);
  TMemManager.SwapEndiannessOfBytes(R);
  TMemManager.DWORDToArrayOfBytes(R, A);
  Result := (TMemManager.ByteArrayToSingle(A) + 5500.1) / 10.0;
end;

function TPlayerBase.getZ: Single;
var
  R: DWORD;
  A: TCustomArrayOfByte;
begin
  with FMemManager do
    R := Read(Read(Read(Base_Address) + CHARSTRUCT1_OffSet) + Z_Offset);
  TMemManager.SwapEndiannessOfBytes(R);
  TMemManager.DWORDToArrayOfBytes(R, A);
  Result := TMemManager.ByteArrayToSingle(A) / 10.0;
end;

{ TSkillList }

constructor TSkillList.Create(const ClassName: string;
  CultivationId: NativeUInt; var SkillList: TList<TSkill>);
begin
  FSkillList := SkillList;
  FClassName := ClassName;
  FCultivationId := CultivationId;
end;

destructor TSkillList.destroy;
begin
  FSkillList.Free;
  inherited;
end;

procedure TSkillList.ReadSkillFile;
var
  F: TextFile;
  R: Integer;
  Linha: string;
  S: TSkill;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0)+'Skill\\'+FClassName+'.txt'));
  {$I-}
    Reset(F);
  {$I+}
  R := IOResult;
  if R <> 0 then
    raise Exception.Create('Houve um erro no processamento ['+IntToStr(r)+']');
  while (not Eof(F)) do
  begin
      ReadLn(F, Linha);
      if trim(Linha) <> ''  then
      begin
        S.SkillId := StrToInt(Copy(Linha,0,Pos('|',Linha)-1));
        S.FSkillName := Trim(Copy(Linha, Pos('|', Linha)+1, Length(Linha)));
        FSkillList.Add(S);
      end;
  end;
  CloseFile(F);
end;

end.
