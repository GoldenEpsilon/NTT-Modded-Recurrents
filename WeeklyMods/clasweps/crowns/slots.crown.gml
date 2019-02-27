#define init // Global Variables, These Load When Mod Loads
global.slotgce = 0;
global.nopopo = 0;
global.slenemybuff = 0;
global.slenemynerf = 0;
global.button = sprite_add("Crown of Slots.png",1,12,16);

#define step
if(instance_exists(GenCont)){
	if(!global.slotgce){
		global.slotgce = 1;
		global.nopopo = 0;
		global.enemybuff = 0;
with(Player){
pslot = irandom(7)
nslot = irandom(6)
if pslot = 7{
if curse = 1||bcurse = 1{
sound_play(sndUncurse);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "CLEANSE!";
if curse = 1{
curse = 0
}else{
bcurse = 0
}
}else{
pslot = irandom(6)
}
}
if pslot = 0{
sound_play(sndWeaponChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yWEAPON @wDROP!";
with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard),curse,0)
			instance_destroy()
		}
}
if pslot = 1{
sound_play(sndAmmoChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yAMMO @wBOOST!";
ammo[1] = min(ammo[1] + 36, typ_amax[1])
ammo[2] = min(ammo[2] + 8, typ_amax[2])
ammo[3] = min(ammo[3] + 8, typ_amax[3])
ammo[4] = min(ammo[4] + 8, typ_amax[4])
ammo[5] = min(ammo[5] + 8, typ_amax[5])
}
if pslot = 2{
sound_play(sndHealthChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@rHEALTH @wBOOST!";
my_health = min(my_health + 4, maxhealth)
}
if pslot = 3{
sound_play(sndEXPChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gRAD @wDROPS!";
repeat(6){
instance_create(x+random_range(10,-10),y+random_range(10,-10),BigRad)}
}
if pslot = 4{
sound_play(sndRogueCanister);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "NO @BPOPO!";
global.nopopo = 1;
}
if pslot = 5{
sound_play(sndSpawnAlly);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@wREINFORCEMENTS!";
repeat(3){
instance_create(x+random_range(10,-10),y+random_range(10,-10),Ally)}
   }
   if pslot = 6{
   var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gWEAKER @sENEMIES";
	global.slenemynerf = 1;
}
      if nslot = 0{
sound_play(sndChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yDISARMED";
	if bcurse = 0{
bwep = 0;
}else if curse = 0{
wep = 0
}
}
   if nslot = 1{
sound_play(sndAmmoChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yAMMO @wREDUCTION";
ammo[1] = clamp(ammo[1] - 36, typ_amax[1], 0)
ammo[2] = clamp(ammo[2] - 8, typ_amax[2], 0)
ammo[3] = clamp(ammo[3] - 8, typ_amax[3], 0)
ammo[4] = clamp(ammo[4] - 8, typ_amax[4], 0)
ammo[5] = clamp(ammo[5] - 8, typ_amax[5], 0)
}
   if nslot = 2{
sound_play(sndBloodHurt);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "INSTANT @rDAMAGE";
my_health = clamp(my_health - 2, maxhealth, 1)
}
   if nslot = 3{
sound_play(sndBloodHurt);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gRAD @wREDUCTION";
GameCont.rad -= 75
}
   if nslot = 4{
sound_play(sndEliteIDPDPortalSpawn);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bIDPD @wAMBUSH";
	repeat(3){
instance_create(x+random_range(10,-10),y+random_range(10,-10),IDPDSpawn)}
}
   if nslot = 5{
   var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@rBUFFED @sENEMIES";
	global.slenemybuff = 1;
}
   if nslot = 6{
   if curse = 0 && bcurse = 0{
   sound_play(sndCursedChest);
   var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@d@qC@qU@qR@qS@qE";
	curse = 1;
	}else{
	var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gBless RNG";
	}
}
  }
    }
 }else{
	if(global.slotgce){
		global.slotgce = 0;
	}
}

if global.slenemybuff = 1{
with(enemy){
if "my_health" in self && "slotbuff" not in self{
maxhealth *= 1.25
my_health = maxhealth
slotbuff = 1;
}
}
if !instance_exists(GenCont){
global.slenemybuff = 0
}
}

if global.slenemynerf = 1{
with(enemy){
if "my_health" in self && "slotnerf" not in self{
maxhealth *= 0.75
my_health *= 0.75
slotnerf = 1;
}
}
if !instance_exists(GenCont){
global.slenemynerf = 0
}
}
if global.nopopo = 1{
with(IDPDSpawn){
instance_destroy()
}with(VanSpawn){
instance_destroy()
}
}

#define crown_name // Crown Name
return "CROWN OF SLOTS";

#define crown_text // Description
return "@wONE @gPOSITIVE @sAND#@rNEGATIVE @wEFFECT @sPER @wAREA";

#define crown_take
sound_play(sndMenuCrown);

#define crown_tip // Loading Tip
return choose("@wInteresting @sTimes...");

#define crown_button // Icon
sprite_index = global.button;

#define crown_avail // L1
return GameCont.loops > 0;

#define scrGimmeWep(_x, _y, _minhard, _maxhard, _curse, _nowep) // Thanks to Yokin for this script!
    var _list = ds_list_create(),
        s = weapon_get_list(_list, _minhard, _maxhard);

    ds_list_shuffle(_list);

    with(instance_create(_x, _y, WepPickup)){
        curse = _curse;
        ammo = 1;

        for(i = 0; i < s; i++) {
            var    w = ds_list_find_value(_list, i),
                c = 0;

             // Weapon Exceptions:
            if(is_array(_nowep) && array_find_index(_nowep, w) >= 0) c = 1;
            if(w == _nowep) c = 1;

             // Specific Weapon Spawn Conditions:
            if(!is_string(w)) switch(w){
                case wep_super_disc_gun:        if(curse <= 0)            c = 1; break;
                case wep_golden_nuke_launcher:  if(!UberCont.hardmode)    c = 1; break;
                case wep_golden_disc_gun:       if(!UberCont.hardmode)    c = 1; break;
                case wep_gun_gun:               if(GameCont.crown != 5)    c = 1; break;
            }

            if(c) continue;
            break;
        }

         // Set Weapon:
        if(!c) wep = w;
        else wep = wep_screwdriver; // Default
	rolled = 1;

        ds_list_destroy(_list);

        return id;
    }