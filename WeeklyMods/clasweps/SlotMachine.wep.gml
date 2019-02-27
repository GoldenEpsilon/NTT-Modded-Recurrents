#define init
global.sprite = sprite_add_weapon("SlotMachine.png", 2, 4);
global.slot = 0

#define weapon_name
return "SLOT MACHINE";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 30;

#define weapon_rads
return 30;

#define weapon_melee
return false;

#define weapon_swap
return sndSwapMotorized;

#define weapon_area
return 7;

#define weapon_text
return choose("Hopefully this pays off","Gambling 24/7","Up all night to get lucky","Why haven't you dropped this yet?","oh god im in debt");

#define weapon_fire
weapon_post(-3, -8, 0);
sound_play_pitchvol(sndSwapMotorized,2,0.6)
if crown_current != 10{
slot = irandom(5)
if slot = 0{
if irandom(20) > 1{
sound_play(sndWeaponChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yWEAPON @wDROP!";
with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard),curse,0)
			instance_destroy()
		}
}else{
sound_play(sndBigWeaponChest);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bRARE WEAPON!!!";
with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,10,(GameCont.hard + 15),curse,0)
			instance_destroy()
		}
	}
}
if slot = 1{
if irandom(20) > 1{
sound_play(sndAmmoChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yAMMO @wBOOST!";
ammo[1] = min(ammo[1] + 36, typ_amax[1])
ammo[2] = min(ammo[2] + 8, typ_amax[2])
ammo[3] = min(ammo[3] + 8, typ_amax[3])
ammo[4] = min(ammo[4] + 8, typ_amax[4])
ammo[5] = min(ammo[5] + 8, typ_amax[5])
}else{
sound_play(sndAmmoChest);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bAMMO WARRANT!!!";
ammo[1] = min(ammo[1] + 108, typ_amax[1])
ammo[2] = min(ammo[2] + 24, typ_amax[2])
ammo[3] = min(ammo[3] + 24, typ_amax[3])
ammo[4] = min(ammo[4] + 24, typ_amax[4])
ammo[5] = min(ammo[5] + 24, typ_amax[5])
  }
} if slot = 2{
if irandom(20) > 1{
sound_play(sndHealthChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@rHEALTH @wBOOST!";
my_health = min(my_health + 4, maxhealth)
}else{
sound_play(sndHealthChestBig);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bOVERHEAL!!!";
my_health = maxhealth + 2;
}
}
if slot = 3{
if irandom(15) > 1{
sound_play(sndEXPChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gRAD @wDROPS!";
repeat(6){
instance_create(x+random_range(10,-10),y+random_range(10,-10),BigRad)}
}else{
sound_play(sndEXPChest);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bRAD OVERFLOW!!!";
repeat(18){
instance_create(x+random_range(10,-10),y+random_range(10,-10),BigRad)}
  }
}
if slot = 4{
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = choose("@sNothing.","@sTHANKS FOR THE RADS","@sONLY DISSAPOINTMENT","@sDAY RUINED","@sGOTTEM XD","@sRIP SAVINGS");
}
if slot = 5{
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = choose("@sNothing.","@sTHANKS FOR THE RADS","@sONLY DISSAPOINTMENT","@sDAY RUINED","@sGOTTEM XD","@sRIP SAVINGS");
}
}else{		//if you have crown of luck its fucking R i g g e d
slot = irandom(3)
if slot = 0{
if irandom(20) > 3{
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yWEAPON @wDROP!";
with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard),curse,0)
			instance_destroy()
		}
}else{
var dir = instance_create(x, y, PopupText);
sound_play_pitch(sndGoldPickup,1.25)
sound_play(sndBigWeaponChest);
	dir.target = index;
	dir.mytext = "@bRARE WEAPON!!!";
with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,10,(GameCont.hard + 15),curse,0)
			instance_destroy()
		}
	}
}
if slot = 1{
if irandom(20) > 3{
sound_play(sndAmmoChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@yAMMO @wBOOST!";
ammo[1] = min(ammo[1] + 36, typ_amax[1])
ammo[2] = min(ammo[2] + 8, typ_amax[2])
ammo[3] = min(ammo[3] + 8, typ_amax[3])
ammo[4] = min(ammo[4] + 8, typ_amax[4])
ammo[5] = min(ammo[5] + 8, typ_amax[5])
}else{
sound_play(sndAmmoChest);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bAMMO WARRANT!!!";
ammo[1] = min(ammo[1] + 108, typ_amax[1])
ammo[2] = min(ammo[2] + 24, typ_amax[2])
ammo[3] = min(ammo[3] + 24, typ_amax[3])
ammo[4] = min(ammo[4] + 24, typ_amax[4])
ammo[5] = min(ammo[5] + 24, typ_amax[5])
  }
} if slot = 2{
if irandom(20) > 3{
sound_play(sndHealthChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@rHEALTH @wBOOST!";
my_health = min(my_health + 4, maxhealth)
}else{
sound_play(sndHealthChestBig);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bOVERHEAL!!!";
my_health = maxhealth + 2;
}
}
if slot = 3{
if irandom(22) > 3{
sound_play(sndEXPChest);
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@gRAD @wDROPS!";
repeat(6){
instance_create(x+random_range(10,-10),y+random_range(10,-10),BigRad)}
}else{
sound_play(sndEXPChest);
sound_play_pitch(sndGoldPickup,1.25)
var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "@bRAD OVERFLOW!!!";
repeat(18){
instance_create(x+random_range(10,-10),y+random_range(10,-10),BigRad)}
  }
}
}

#define scrGimmeWep(_x, _y, _minhard, _maxhard, _curse, _nowep) // Thanks to Yokin for this script!
    var _list = ds_list_create(),
        s = weapon_get_list(_list, _minhard, _maxhard);

    ds_list_shuffle(_list);

    with(instance_create(_x, _y, WepPickup)){
        curse = _curse;
        ammo = 0;

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


#define batch_compare // thank you sani for this script! i appreciate it!
    for(var i = 1;i<argument_count;i++){
        if argument[0] = argument[i] return false;
    }
    return true;