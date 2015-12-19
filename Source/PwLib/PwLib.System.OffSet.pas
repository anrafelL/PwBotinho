unit PwLib.System.OffSet;

interface

type
  DWORD = Cardinal;

const
  Real_Base_Address: DWORD = $C7662C;
  Base_Address: DWORD = $C76DCC;
  Base_AddressFZ: DWORD = $C77280;
  Base_AddressEXP: DWORD = $C77A40;
  SendPacket_Address: DWORD = $725700;
  ChatBase_Address: DWORD = $C7BDE0;
  LastChat_Address: DWORD = $C7BDEC;
  Base_Zoom: DWORD = $408212;
  Base_Emot: DWORD = $52E49E;
  // Custom
  CHARSTRUCT1_OffSet: DWORD = $2C;
  SkillPoints_offset: DWORD = $4B8;
  Sex_Offset: DWORD = $6BC;
  Casting_Offset: DWORD = $7A4;
  Name_offset: DWORD = $6B0;
  CHARID_Offset: DWORD = $494;
  LVL_Offset: DWORD = $4A0;
  Class_offset: DWORD = $6B8;
  HP_OffSet: DWORD = $4A8;
  MaxHP_OffSet: DWORD = $4F4;
  EXP_OffSet: DWORD = $4B0;
  MP_OffSet: DWORD = $4AC;
  MaxMP_OffSet: DWORD = $4F8;
  STR_offset: DWORD = $4EC;
  DEX_offset: DWORD = $4F0;
  VIT_offset: DWORD = $4E4;
  MAG_offset: DWORD = $4E8;
  Spirit_offset: DWORD = $4B4;
  Gold_offset: DWORD = $578;
  FlySpeed_Offset: DWORD = $50C;
  FlyCounter_Offset: DWORD = $A04;
  FlyID_Offset: DWORD = $5B0;
  MoveMode_OffSet: DWORD = $6C4;
  CHI_Offset: DWORD = $4BC;
  MAXCHI_Offset: DWORD = $574;
  Jump_Offset: DWORD = $E38;
  CastID_Offset: DWORD = $7A0;
  CharState_Offset: DWORD = $740;
  Reputation_Offset: DWORD = $620;
  Culti_Offset: DWORD = $4A4;
  X_Offset: DWORD = $3C;
  Y_Offset: DWORD = $44;
  Z_Offset: DWORD = $40;
  HPCD_OffSet: DWORD = $B64;
  MPCD_OffSet: DWORD = $B6C;

  Target_OffSet: DWORD = $D3C;
  PetBase_Offset: DWORD = $1388;
  PetHP_OffSet: DWORD = $38;
  PetHunger_OffSet: DWORD = $8;

  ACTIONSTRCT1_Offset: DWORD = $2C;
  ACTIONSTRCT2_Offset: DWORD = $1370;
  ACTIONSTRCT3_Offset: DWORD = $30;
  ACTIONSTRCT4A_Offset: DWORD = $4;
  ACTIONSTRCT4B_Offset: DWORD = $8;

  ActionFlag_Offset: DWORD = $18;
  ActionRead_Offset: DWORD = $4;
  ActionRead2_Offset: DWORD = $8;
  ActionRead3_Offset: DWORD = $1C;
  ActionWrite_Offset: DWORD = $C;
  ActionWrite2_Offset: DWORD = $14;
  ActionSkill_Offset: DWORD = $50;
  ActionMoveX_Offset: DWORD = $20;
  ActionMoveY_Offset: DWORD = $28;
  ActionMoveZ_Offset: DWORD = $24;
  ActionHeight_OffSet: DWORD = $68;
  ActionHeightFlag_OffSet: DWORD = $64;
  ActionHeightFlag2_OffSet: DWORD = $6C;
  ActionDoneFlag_Offset: DWORD = $8;
  ActionValue_Offset: DWORD = $2C;
  ActionValue2_Offset: DWORD = $40;
  ActionSetError_Offset: DWORD = $4C;
  ActionFinished_Offset: DWORD = $8;
  ActionStart_Offset: DWORD = $14;
  ActionNotStart_Offset: DWORD = $24;
  ActionObject_Offset: DWORD = $20;
  ObjectAction_Offset: DWORD = $38;

  PLAYERSTRUCT1_OffSet: DWORD = $1C;
  PLAYERSTRUCT2_OffSet: DWORD = $1C;

  PlayerBase_Offset: DWORD = $94;
  PlayerCount_Offset: DWORD = $14;
  PlayerID_Offset: DWORD = $494;
  PlayerLVL_Offset: DWORD = $4A0;
  PlayerName_Offset: DWORD = $6B0;
  PlayerHP_Offset: DWORD = $4A8;
  PlayerMAXHP_Offset: DWORD = $4F4;
  PlayerClass_Offset: DWORD = $6B8;
  PlayerGenie_Offset: DWORD = $3E4;
  GenieStamina_Offset: DWORD = $B8;

  NPCSTRUCT1_OffSet: DWORD = $18;
  NPCSTRUCT2_OffSet: DWORD = $20;

  NPCBase_Offset: DWORD = $58;
  NPCPAI_Offset: DWORD = $2F0;
  NPCCount_Offset: DWORD = $14;
  NPCID_Offset: DWORD = $120;
  NPCName_Offset: DWORD = $278;
  NPCLVL_Offset: DWORD = $128;
  NPCHP_Offset: DWORD = $130;
  NPCMAXHP_Offset: DWORD = $17C;
  NPCSpecial_Offset: DWORD = $26C;
  TARSTARGET_OffSet: DWORD = $304;

  ITEMSTRUCT1_OffSet: DWORD = $18;
  ITEMSTRUCT2_OffSet: DWORD = $24;

  ItemBase_Offset: DWORD = $1C;
  ItemID_Offset: DWORD = $110;
  ItemSN_Offset: DWORD = $114;
  ItemName_Offset: DWORD = $168;
  ItemType_Offset: DWORD = $150;

  INVENTORYSTRUCT1_OffSet: DWORD = $F10;

  InventoryBase_Offset: DWORD = $C;
  InventoryCount_Offset: DWORD = $14;
  InventoryID_Offset: DWORD = $C;
  InventoryStackAmount_Offset: DWORD = $18;
  InventoryMAXStackAmount_Offset: DWORD = $18;
  InventorySellPrice_Offset: DWORD = $1C;
  InventoryBuyPrice_Offset: DWORD = $20;
  InventoryDescription_Offset: DWORD = $4C;

  EQUIPPEDINVENTORSTRUCT1_OffSet: DWORD = $F18;
  SkillBase:  DWORD = $139C;


implementation

end.
