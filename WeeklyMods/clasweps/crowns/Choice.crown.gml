#define init // Global Variables, These Load When Mod Loads
global.gce = 0;
global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAB8klEQVRIS92WO0sDQRCA57AxaCNGUBAFC60EkQg+EFEQETWFnZ11CpGLP8HCIkkhEvBfiA8srCQoQqIIdnaKoOBZqahYRGbDnHtzu3ubmDRudzePb3ZmdhhneWW9DOx0dnXzX1bfT48PIT1HBtTqmHuVQT6gXs4JRhABqLdzGdJ4QMrNhIpsVVFLJed/AfK5DePFU24GbHRkJ4EUofH2vbokaz0OEIDrNDkAvc0Aix0VnaoB5JwMeSB9sYqkIQCK/k8ANNaliKKvCoDOVLXg/+XUHD6X7VKEkeiKKReP5526y1hk2YGpo1DPVFhtF+m6RPc4bCDKUREV/d3nL3K6Td+iKAkB0Hn6tvr5l+0PP7IQIGoM2AzQyJfcEovD7pgHiYVWGHBftT69YlzIXgpfUDp6g53vJFwU9vWjAqMfnUzCTelcGCJkbqsdltITMDwyJf5dFU/hIHvmQ9H56t5MQM4hfg0IgNYEGUyMC+PZ+SE4Ob4WAJRdblaqjM7xyDr5XDpwCy3g/cMTN1IBUEaH6xgBmH88GDle1QSgYso3R1ttilAoKxOAV5k7QJuUmxVqPHplm2LU5EQ2piKrALINDyi0tvChxW/F+1w35BCEy1fkXhQFMD0+H4BKpu3OFKUOEFgdSaleK6Ry+ZUjqRWkWt9/AF3khA5SVz/3AAAAAElFTkSuQmCC",1,12,16);
global.spr_idle = sprite_add("ChoiceBuddyIdle.png",1,8,8);
global.spr_walk = sprite_add("ChoiceBuddyWalk.png",6,8,8);
//Set Sprites
#define crown_object
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;

#define step
if instance_exists(GenCont){
with(Player){
if bcurse = 1{ // if attempting to be slick
if curse = 1{ 
bwep = 0;
bcurse = 0;
if (my_health > 2) my_health -= 1;
}else{
wep = 0; // destroy non cursed weapon
sound_play(sndHyperCrystalTaunt);
}
}else{
bwep = 0;
}
with(WepPickup){
instance_destroy()
}
}
}

with (ChestOpen) if ("spawned_extra_pickups" not in self){
if sprite_index = sprAmmoChestOpen{
repeat(2){
    instance_create(x,y-3,AmmoPickup)
}
}
if sprite_index = sprHealthChestOpen{
repeat(2){
    instance_create(x,y-3,HPPickup)
}
}
if sprite_index = sprWeaponChestOpen{
		with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard),curse,0)
			instance_destroy()
		}
}
if sprite_index = sprWeaponChestBigOpen{
repeat(2){
		with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard),curse,0)
			instance_destroy()
		}
	}
}
if sprite_index = sprCursedChestOpen{
		with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard+2),1,0);
			instance_destroy()
	}
}
if sprite_index = sprCursedChestBigOpen{
repeat(4){
		with instance_create(x,y,WepPickup){
			scrGimmeWep(x,y,1,(GameCont.hard+2),1,0);
			instance_destroy()
		}
	}
}
if sprite_index = sprGoldChestOpen{
if GameCont.loops = 0{
isloop = 0
}else{
isloop = 1
}
		weapon_drop_gold(x,y,isloop,0);
}
spawned_extra_pickups = 1;
}

with(RadChest){
if ("radsdoubled" not in self){
raddrop *=2
radsdoubled = 1;
}
}

#define crown_name // Crown Name
return "CROWN OF CHOICE";

#define crown_take
sound_play(sndMenuCrown);
sound_play(sndMutPatience);

#define crown_text // Description
return "ONLY 1 @yWEAPON @sPER @pPORTAL#@sMORE @wVALUABLE @yCHESTS";

#define crown_button // Icon
sprite_index = global.button;

#define crown_tip // Loading Tip
return choose("DECISIONS DECISIONS","DECISIONS DECISIONS","YOUR @wSECONDARY WEAPON#@sGETS DELETED ON LEVEL START","DON'T TRY TO BE SLICK");

#define crown_avail // L0
return GameCont.loops = 0

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


#define batch_compare // thank you sani for this script! i appreciate it!
    for(var i = 1;i<argument_count;i++){
        if argument[0] = argument[i] return false;
    }
    return true;

#define weapon_drop_gold(xx,yy,isLoop,isCursed) // sani also made this script as well!
    with(instance_create(xx,yy,WepPickup)){
        curse = isCursed;
        ar = [];
        for(var i = 0;i<=126;i++){
            if weapon_get_gold(i) = 1{
                if !(isLoop) && batch_compare(i,wep_golden_nuke_launcher, wep_golden_disc_gun, wep_golden_bazooka, wep_golden_assault_rifle, wep_golden_splinter_gun, wep_golden_plasma_gun,){
                    ar[array_length_1d(ar)] = i;
                }
            }
        }
        wep = ar[irandom(array_length_1d(ar) - 1)]
    }