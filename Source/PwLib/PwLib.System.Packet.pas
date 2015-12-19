unit PwLib.System.Packet;

interface

type
  DWORD = Cardinal;
//uses Windows;

type
  TPacket = class
  public
    class procedure logOut(const toAccount, pid: DWORD);
    class procedure selectTarget(const targetID, pid: DWORD);
    class procedure regularAttack(const afterSkill, pid: DWORD);
    class procedure resToTown(const pid: DWORD);
    class procedure resWithScroll(const pid: DWORD);
    class procedure pickUpItem(const uniqueItemId, itemTypeId, pid: DWORD);
    class procedure deselectTarget(const pid: DWORD);
    class procedure updateInvPosition(const invPosition, pid: DWORD);
    class procedure swapItemInInv(const invIndex1, invIndex2, pid: DWORD);
    class procedure splitStarkItemInInv(const invIndexSource,
      invIndexDestination, amount, pid: DWORD);
    class procedure dropItemOnFloor(const invIndexSource, amount, pid: DWORD);
    class procedure swapEquip(const equipIndex1, equipIndex2, pid: DWORD);
    class procedure swapEquipWithInv(const invIndex, equipIndex, pid: DWORD);
    class procedure dropGold(const amount, pid: DWORD);
    class procedure updateStats(const pid: DWORD);
    class procedure increaseStatsBy(const con, int, str, agi, pid: DWORD);
    class procedure inviteParty(const playerId, pid: DWORD);
    class procedure acceptPartyInvite(const playerId, partyInviteCounter,
      pid: DWORD);
    class procedure refusePartyInvite(const playerId, pid: DWORD);
    class procedure leaveParty(const pid: DWORD);
    class procedure evictFromParty(const playerId, pid: DWORD);
    class procedure startNpcDialogue(const npcId, pid: DWORD);
    class procedure useItem(const index, itemTypeId, pid: DWORD;
      equip: DWORD = 0);
    class procedure useSkill(const skillId, targetID, pid: DWORD);
    class procedure cancelAction(const pid: DWORD);
    class procedure startMeditating(const pid: DWORD);
    class procedure stopMeditating(const pid: DWORD);
    class procedure useEmotion(const emoteIndex, pid: DWORD);
    class procedure beIntimate(const pid: DWORD);
    class procedure swapItemInBank(const bankIndex1, bankIndex2, pid: DWORD);
    class procedure splitStarkItemInBank(const bankIndexSource,
      bankIndexDestination, amount, pid: DWORD);
    class procedure swapItemBankAndInv(const bankIndex, invIndex, pid: DWORD);
    class procedure splitStackItemInBankToInv(const bankIndexSource,
      invIndexDestination, amount, pid: DWORD);
    class procedure splitStackItemInInvToBank(const invIndexSource,
      bankIndexDestination, amount, pid: DWORD);
    class procedure setPartySearchSettings(const recruit, jobId, lvl, slogan,
      pid: DWORD);
    class procedure shiftPartyCaptain(const playerId, pid: DWORD);
    class procedure useSkillWithoutCastTime(const skillId, targetID,
      pid: DWORD);
    class procedure initiateSettingUpCatShop(const pid: DWORD);
    class procedure toggleFashionDisplay(const pid: DWORD);
    class procedure acceptRez(const pid: DWORD);
    class procedure increaseFlySpeed(const start, pid: DWORD);
    class procedure askMaleToCarry(const playerId, pid: DWORD);
    class procedure askFemaleToBeCarried(const playerId, pid: DWORD);
    class procedure acceptRequestByFemaleToBeCarried(const playerId,
      pid: DWORD);
    class procedure acceptRequestByMaleToCarryYou(const playerId, pid: DWORD);
    class procedure releaseCarryMode(const pid: DWORD);
    class procedure summonPet(const petIndex, pid: DWORD);
    class procedure recallPet(const pid: DWORD);
    class procedure setPetMode(const petMode, pid: DWORD);
    class procedure setPetFollow(const pid: DWORD);
    class procedure setPetStop(const pid: DWORD);
    class procedure setPetAttack(const targetID, pid: DWORD);
    class procedure setPetUseSkill(const targetID, skillId, pid: DWORD);
    class procedure setPetStandardSkill(const skillId, pid: DWORD);
    class procedure useGenieSkill(const skillId, targetID, pid: DWORD);
    class procedure feedEquippedGenie(const invIndex, amount, pid: DWORD);
    class procedure acceptQuest(const questId, pid: DWORD);
    class procedure handInQuest(const questId, optionIndex, pid: DWORD);
    class procedure sellItem(const itemTypeId, invIndex, amount, pid: DWORD);
    class procedure buyItem(const itemTypeId, shopIndex, amount, pid: DWORD);
    class procedure repairAll(const pid: DWORD);
    class procedure repairItem(const itemTypeId, isEquipped, locationIndex,
      pid: DWORD);
    class procedure upgradeSkill(const skillId, pid: DWORD);
  end;

implementation

{ TPacket }

uses PwLib.System.Inject, PwLib.MemReadWrite;

class procedure TPacket.acceptPartyInvite(const playerId, partyInviteCounter,
  pid: DWORD);
var
  Packet: string;
begin
  // Accept an invite from playerId. partyInviteCounter is a counter that
  // is kept based on the amount of party invites you've had. See post
  // on how to find that value.
  Packet := concat('1C00', _hex(playerId), _hex(partyInviteCounter));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.acceptQuest(const questId, pid: DWORD);
var
  Packet: string;
begin
  // Accept a new quest
  Packet := concat('2500', '07000000', '04000000', _hex(questId));
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.acceptRequestByFemaleToBeCarried(const playerId,
  pid: DWORD);
var
  Packet: string;
begin
  // When female asks you to carry her use this to accept
  Packet := concat('6000', _hex(playerId), '00000000');
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.acceptRequestByMaleToCarryYou(const playerId,
  pid: DWORD);
var
  Packet: string;
begin
  // When male asks you if you want to be carried, use this to accept.
  Packet := concat('6100', _hex(playerId), '00000000');
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.acceptRez(const pid: DWORD);
var
  Packet: string;
begin
  Packet := '5700';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.askFemaleToBeCarried(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // WHen female use this to ask a female playerId to be carried
  Packet := concat('5F00', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.askMaleToCarry(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // WHen female use this to ask a male playerId to carry you
  Packet := concat('5E00', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.beIntimate(const pid: DWORD);
var
  Packet: string;
begin
  // Uses the kissing / intimate emote when cuddling.
  Packet := concat('3000', '1D00');
  TPacketSend.sendPacket(Packet, 4, pid);
end;

class procedure TPacket.buyItem(const itemTypeId, shopIndex, amount,
  pid: DWORD);
var
  Packet: string;
begin
  (*
    Buy $amount of items of type itemTypeId, located at shopIndex
    shopIndex is calculated as follows:
    Each tab in the shop has 32 available spaces, index of each space
    starts at 0, index of each tab starts at 0. $shopIndex would then be
    shopIndex = tabIndex * 32 + spaceIndex
    This function could be expanded to include buying multiple items
    simultaneously. This would require setting nBytes equal to
    8 + 12 * nDifferent items. Add the extra items on the same way
    as the first item.
  *)
  Packet := concat('2500', '02000000', //
    '10000000', // nBytes following
    '00000000', //
    '01000000', // nDifferent items being bought
    _hex(itemTypeId), _hex(shopIndex), _hex(amount));
  TPacketSend.sendPacket(Packet, 30, pid);
end;

class procedure TPacket.cancelAction(const pid: DWORD);
var
  Packet: string;
begin
  // Cancels for example your current skillCast
  Packet := '2A00';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.deselectTarget(const pid: DWORD);
var
  Packet: string;
begin
  // Deselects the currently selected target
  Packet := '0800';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.dropGold(const amount, pid: DWORD);
var
  Packet: string;
begin
  // Drops $amount of gold to floor
  Packet := concat('1400', _hex(amount));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.dropItemOnFloor(const invIndexSource, amount,
  pid: DWORD);
var
  Packet: string;
begin
  // Drops the stack located at invIndexSource in your inventory
  // onto the floor.
  // The index for a standard unexpanded inventory runs from
  // 0, top left, to 31, bottom right
  Packet := concat('0E00', _hex(invIndexSource, 2), _hex(amount, 4));
  TPacketSend.sendPacket(Packet, 5, pid);
end;

class procedure TPacket.evictFromParty(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // Evicts playerId from party
  Packet := concat('1F00', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.feedEquippedGenie(const invIndex, amount, pid: DWORD);
var
  Packet: string;
begin
  (*
    Feeds the equipped genie the amount indicated from
    inv index
  *)
  Packet := concat('7500', _hex(invIndex, 2), _hex(amount));
  TPacketSend.sendPacket(Packet, 7, pid);
end;

class procedure TPacket.handInQuest(const questId, optionIndex, pid: DWORD);
var
  Packet: string;
begin
  (*
    Hand in quest, select reward optionIndex,
    which runs from 0 for first option, to more.
  *)
  Packet := concat('2500', '06000000', '08000000', _hex(questId),
    _hex(optionIndex));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.increaseFlySpeed(const start, pid: DWORD);
var
  Packet: string;
begin
  (*
    If start=1, start faster flying.
    If start=0, stop faster flying
  *)
  Packet := concat('5A00', _hex(start));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.increaseStatsBy(const con, int, str, agi, pid: DWORD);
var
  Packet: string;
begin
  // Use this after level up to increase your stats.
  Packet := concat('1600', _hex(con), _hex(int), _hex(str), _hex(agi));
  TPacketSend.sendPacket(Packet, 18, pid);
end;

class procedure TPacket.initiateSettingUpCatShop(const pid: DWORD);
var
  Packet: string;
begin
  (*
    ;Starts setting up cat shop. This function is needed
    ;before setting up the catshop.
  *)
  Packet := '5400';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.inviteParty(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // Invite playerId to your party.
  Packet := concat('1B00', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.leaveParty(const pid: DWORD);
var
  Packet: string;
begin
  // Leave your current party
  Packet := '1E00';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.logOut(const toAccount, pid: DWORD);
var
  Packet: string;
begin
  // Envia um pacote fazer o logout do char do servidor
  // Se toAccount = 1, volta para a tela de seleção
  // Se toAccount = 0, sai completamente e fecha o aplicativo.
  Packet := concat('0100', _hex(toAccount));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.pickUpItem(const uniqueItemId, itemTypeId, pid: DWORD);
var
  Packet: string;
begin
(*
	;Picks up an item. uniqueItemId is the unique id belonging
	;to the individual item on the ground. itemTypeId is the id for
	;the type of item it is. This would be the same as the last
	;part in the url on pwdatabase. example:
	;http://www.pwdatabase.com/pwi/items/3044
	;the itemTypeId for gold is 3044.
  *)
  Packet := concat('0600',_hex(uniqueItemId), _hex(itemTypeId));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.recallPet(const pid: DWORD);
var
  Packet: string;
begin
  // recalls your currently summoned pet
  Packet := '6500';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.refusePartyInvite(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // Refuses a party invite from playerId
  Packet := concat('1D00', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.regularAttack(const afterSkill, pid: DWORD);
var
  Packet: string;
begin
  // Inicia com o ataque regular. afterSkill é 1 se você iniciar o atacando depois de usar
  // uma skill
  Packet := concat('0300', _hex(afterSkill, 2));
  TPacketSend.sendPacket(Packet, 3, pid);
end;

class procedure TPacket.releaseCarryMode(const pid: DWORD);
var
  Packet: string;
begin
  // Stop carrying / being carried
  Packet := '6200';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.repairAll(const pid: DWORD);
var
  Packet: string;
begin
  // Repair all items
  Packet := concat('2500', '03000000', '06000000', 'FFFFFFFF', '0000');
  TPacketSend.sendPacket(Packet, 16, pid);
end;

class procedure TPacket.repairItem(const itemTypeId, isEquipped, locationIndex,
  pid: DWORD);
var
  Packet: string;
begin
  (*
    repairs the item of type itemTypeId at locationIndex, if
	  isEquipped=1, location refers to equipment. If isEquipped=0,
	  location refers to inventory.
  *)
  packet := Concat('2500', '03000000','06000000',_hex(itemTypeId),
  _hex(isEquipped,2), _hex(locationIndex,2));
  TPacketSend.sendPacket(Packet, 16, pid);
end;

class procedure TPacket.resToTown(const pid: DWORD);
var
  Packet: string;
begin
  // Renascer na cidade depois de morrer
  Packet := '0400';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.resWithScroll(const pid: DWORD);
var
  Packet: string;
begin
  // Renasce quando morto, custa um res scroll
  Packet := '0500';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.selectTarget(const targetID, pid: DWORD);
var
  Packet: string;
begin
  // Seleciona o NPC/Mob/Player denominado pelo targetId
  Packet := concat('0200', _hex(targetID));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.sellItem(const itemTypeId, invIndex, amount,
  pid: DWORD);
var
  Packet: string;
begin
  (*
    Sell $amount of items of type itemTypeId, located at invIndex
    This function could be expanded to include selling multiple items
    simultaneously. This would require setting nBytes equal to
    4 + 12 * nDifferent items. Add the extra items on the same way
    as the first item.
  *)
  Packet := concat('2500', //
    '02000000', //
    '10000000', // nBytes following
    '01000000', // nDiffrents items being sold
    _hex(itemTypeId), _hex(invIndex), _hex(amount));
  TPacketSend.sendPacket(Packet, 26, pid);
end;

class procedure TPacket.setPartySearchSettings(const recruit, jobId, lvl,
  slogan, pid: DWORD);
var
  Packet: string;
begin
  (*
    Changes party searching settings.
    recruit=1 means recruiting party
    recruit=0 means searching for party
    jobId=0 & lvl=0 & no slogan -> slogan=0x0
    jobId<>0 & lvl<>0 & no slogan -> slogan=0x40
    jobId=0 & lvl=0 & slogan -> slogan=0x80
    jobId<>0 & lvl<> 0 & slogan -> slogan=0xC0
  *)
  Packet := concat('3F00', _hex(jobId, 2), _hex(lvl, 2), _hex(recruit, 2),
    _hex(slogan, 2), '00000000');
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.setPetAttack(const targetID, pid: DWORD);
var
  Packet: string;
begin
  // Sets pet to do standard attacks on the target.
  Packet := concat('6700', _hex(targetID), '01', '00000000');
  TPacketSend.sendPacket(Packet, 11, pid);
end;

class procedure TPacket.setPetFollow(const pid: DWORD);
var
  Packet: string;
begin
  // Pet follows the owner
  Packet := concat('6700', '00000000', '02000000', '00000000');
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.setPetMode(const petMode, pid: DWORD);
var
  Packet: string;
begin
  (*
    Sets the pet to the specified mode:
    petMode=0 -> defensive
    petMode=1 -> attack
    petMode=2 -> manual
  *)
  Packet := concat('6700', '00000000', '03000000', _hex(petMode));
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.setPetStandardSkill(const skillId, pid: DWORD);
var
  Packet: string;
begin
  (*
    Sets skillId to be the skill the pet uses whenever
    it is cooled down
  *)
  Packet := concat('6700', '00000000', '05000000', _hex(skillId));
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.setPetStop(const pid: DWORD);
var
  Packet: string;
begin
  // Pet stops doing whatever it was doing
  Packet := concat('6700', '00000000', '02000000', '01000000');
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.setPetUseSkill(const targetID, skillId, pid: DWORD);
var
  Packet: string;
begin
  // Uses skillId on the targetId. Walks up to target if out of range.
  Packet := concat('6700', _hex(targetID), '04000000', _hex(skillId), '00');
  TPacketSend.sendPacket(Packet, 15, pid);
end;

class procedure TPacket.shiftPartyCaptain(const playerId, pid: DWORD);
var
  Packet: string;
begin
  // Shifts party captain position to playerId
  Packet := concat('4800', _hex(playerId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.splitStackItemInBankToInv(const bankIndexSource,
  invIndexDestination, amount, pid: DWORD);
var
  Packet: string;
begin
  // Splits a stack in your bank located at bankIndexSource
  // Take off $amount from the stack and place them at invIndexDestination
  Packet := concat('', '', _hex(bankIndexSource, 2),
    _hex(invIndexDestination, 2), _hex(amount, 4));
  TPacketSend.sendPacket(Packet, 7, pid);
end;

class procedure TPacket.splitStackItemInInvToBank(const invIndexSource,
  bankIndexDestination, amount, pid: DWORD);
var
  Packet: string;
begin
  (*
    Splits a stack in your inventory located at invIndexSource
    Take off $amouunt from the stack and place them at bankIndexDestination
  *)
  Packet := concat('3C00', '03', _hex(invIndexSource, 2),
    _hex(bankIndexDestination, 2), _hex(amount, 4));
  TPacketSend.sendPacket(Packet, 7, pid);
end;

class procedure TPacket.splitStarkItemInBank(const bankIndexSource,
  bankIndexDestination, amount, pid: DWORD);
var
  Packet: string;
begin
  (*
    Splits a stack in your bank located at bankIndexSource
    Take off $amouunt from the stack and place them at bankIndexDestination
    The index for a standard unexpanded bank runs from
    0, top left, to 15, bottom right
  *)
  Packet := concat('3900', '03', _hex(bankIndexSource, 2),
    _hex(bankIndexDestination, 2), _hex(amount, 4));
  TPacketSend.sendPacket(Packet, 7, pid);
end;

class procedure TPacket.splitStarkItemInInv(const invIndexSource,
  invIndexDestination, amount, pid: DWORD);
var
  Packet: string;
begin
  // Splits a stack in your inventory located at invIndexSource
  // Take off $amouunt from the stack and place them at invIndexDestination
  // The index for a standard unexpanded inventory runs from
  // 0, top left, to 31, bottom right
  Packet := concat('0D00', _hex(invIndexSource, 2),
    _hex(invIndexDestination, 2), _hex(amount, 4));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.startMeditating(const pid: DWORD);
var
  Packet: string;
begin
  // Starts meditating for faster HP/MP regen
  Packet := '2E00';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.startNpcDialogue(const npcId, pid: DWORD);
var
  Packet: string;
begin
  // Opens up an NPC's main menu. Is necessary before
  // accepting/handing in quests, buy/sell/repair
  Packet := concat('2300', _hex(npcId));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.stopMeditating(const pid: DWORD);
var
  Packet: string;
begin
  // Stop meditating for faster HP/MP regen
  Packet := '2F00';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.summonPet(const petIndex, pid: DWORD);
var
  Packet: string;
begin
  (*
    summons pet at index petIndex. petIndex runs from
    0 to 9, depending on how many slots you have unlocked
  *)
  Packet := concat('6400', _hex(petIndex));
  TPacketSend.sendPacket(Packet, 6, pid);
end;

class procedure TPacket.swapEquip(const equipIndex1, equipIndex2, pid: DWORD);
var
  Packet: string;
begin
  // Swaps the items in the two given equipment locations
  // The index for equipment runs from
  // 0, weapon, to 24, speaker?. This also includes fashion
  // Obviously there aren't a lot of equipment types you can swap
  // besides rings.
  Packet := concat('1000', _hex(equipIndex1, 2), _hex(equipIndex2, 2));
  TPacketSend.sendPacket(Packet, 4, pid);
end;

class procedure TPacket.swapEquipWithInv(const invIndex, equipIndex,
  pid: DWORD);
var
  Packet: string;
begin
  // Swaps the items in the invIndex location with the
  // item in the equipment location
  // The index for equipment runs from
  // 0, weapon, to 24, speaker?. This also includes fashion
  // The index for a standard unexpanded inventory runs from
  // 0, top left, to 31, bottom right
  Packet := concat('1100', _hex(invIndex, 2), _hex(equipIndex, 2));
  TPacketSend.sendPacket(Packet, 4, pid);
end;

class procedure TPacket.swapItemBankAndInv(const bankIndex, invIndex,
  pid: DWORD);
var
  Packet: string;
begin
  // Swaps a stack in your bank located at bankIndex
  // with one in your inventory located at invIndex
  Packet := concat('3A00', '03', _hex(bankIndex, 2), _hex(invIndex, 2));
  TPacketSend.sendPacket(Packet, 5, pid);
end;

class procedure TPacket.swapItemInBank(const bankIndex1, bankIndex2,
  pid: DWORD);
var
  Packet: string;
begin
  (*
    swaps the location of two stacks in bank. bankIndex runs
    from 0, topleft,  to 15, bottomright, in a standard non
    upgraded bank.
  *)
  Packet := concat('3800', '03', _hex(bankIndex1, 2), _hex(bankIndex2, 2));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.swapItemInInv(const invIndex1, invIndex2, pid: DWORD);
var
  Packet: string;
begin
  // Swaps the items in the two given inventory locations
  // The index for a standard unexpanded inventory runs from
  // 0, top left, to 31, bottom right
  Packet := concat('0C00', _hex(invIndex1, 2), _hex(invIndex2, 2));
  TPacketSend.sendPacket(Packet, 4, pid);
end;

class procedure TPacket.toggleFashionDisplay(const pid: DWORD);
var
  Packet: string;
begin
  // Switches between fashion and regular appearance.
  Packet := '5500';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.updateInvPosition(const invPosition, pid: DWORD);
var
  Packet: string;
begin
  // This packet is sent whenever you pick up HH/TT items
  // Unsure as to why. Also happens when you find a
  // quest item or equipment.
  Packet := concat('0900', _hex(invPosition, 2));
  TPacketSend.sendPacket(Packet, 3, pid);
end;

class procedure TPacket.updateStats(const pid: DWORD);
var
  Packet: string;
begin
  // Is sent whenever a new item is equipped or stat
  // screen is opened or you level up.
  Packet := '1500';
  TPacketSend.sendPacket(Packet, 2, pid);
end;

class procedure TPacket.upgradeSkill(const skillId, pid: DWORD);
var
  Packet: string;
begin
  //Upgrades the requested skill by one level
  packet := Concat('2500', '09000000', '04000000',_hex(skillId));
  TPacketSend.sendPacket(Packet, 14, pid);
end;

class procedure TPacket.useEmotion(const emoteIndex, pid: DWORD);
var
  Packet: string;
begin
  // uses the emotion located at index emoteIndex 0 to 26
  Packet := concat('3000', _hex(emoteIndex, 4));
  TPacketSend.sendPacket(Packet, 4, pid);
end;

class procedure TPacket.useGenieSkill(const skillId, targetID, pid: DWORD);
var
  Packet: string;
begin
  // Uses skillId on the target
  Packet := concat('7400', _hex(skillId, 4), '0001', _hex(targetID));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.useItem(const index, itemTypeId, pid: DWORD;
  equip: DWORD);
var
  Packet: string;
begin
  (*
    uses the item located at index. By default inventory index
    is used. If equip=1, then equipment index is used. This
    is necessary when toggling fly mode, as your fly gear
    is then used.
    itemTypeId is the id for
    the type of item it is. This would be the same as the last
    part in the url on pwdatabase. example:
    http://www.pwdatabase.com/pwi/items/3044
    the itemTypeId for gold is 3044.
  *)
  Packet := concat('2800', _hex(equip, 2), '01', _hex(index, 2), '00',
    _hex(itemTypeId));
  TPacketSend.sendPacket(Packet, 10, pid);
end;

class procedure TPacket.useSkill(const skillId, targetID, pid: DWORD);
var
  Packet: string;
begin
  (*
    uses the specified skill on the target. Pass your own
    Id if you wish to use buffs. When teleporting targetId
    is the targeted city.
  *)
  Packet := concat('2900', _hex(skillId), '0001', _hex(targetID));
  TPacketSend.sendPacket(Packet, 12, pid);
end;

class procedure TPacket.useSkillWithoutCastTime(const skillId, targetID,
  pid: DWORD);
var
  Packet: string;
begin
  (*
    uses the specified skill on the target. This function is used
    instead of the regular skill use one for skills such as
    change to fox/tiger form or the speed buff skills. Pass your own
    Id if you wish to use buffs.
  *)
  Packet := concat('5000', _hex(skillId), '0001', _hex(targetID));
  TPacketSend.sendPacket(Packet, 12, pid);
end;

end.

