// Define Sprites
#define init
global.spr_idle = sprite_add("sprCrownIdle.png",1,8,8);
global.spr_walk = sprite_add("sprCrownWalk.png",6,8,8);
global.spr_icon = sprite_add("sprCrownSelect.png",1,12,16);
//Set Sprites
#define crown_object
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;

#define crown_button
sprite_index = global.spr_icon;

#define step

with Player
{
	//detect run start
	if  "HasEx" not in self
	{
		var i = 0;
		repeat(5)
		{
			i++
			typ_ammo[i] = ceil(typ_ammo[i]/2)
		}
		HasEx = "
		_____\    _______
       /      \  |      /\
      /_______/  |_____/  \
     |   \   /        /   /
      \   \         \/   /
       \  /          \__/_
        \/ ____    /\
          /  \    /  \
         /\   \  /   /
           \   \/   /
            \___\__/
		"
	}
	//if wep != 0 wep = wep_check(wep)
	//if bwep != 0 bwep = wep_check(bwep)
	var re = reload, be = breload
	wait(0)
	if !instance_exists(self) continue
	if "meleeammo" not in self meleeammo = 4
	var _w = weapon_get_type(wep);
	var _c = weapon_get_cost(wep);
	if ammo[_w] < _c || (_w = 0 && meleeammo <= 0) || (_c == 0 and ammo[_w] == 0) or GameCont.rad < weapon_get_rads(wep)
	{
		wep = determine_wep()
		if skill_get("prismatic iris") > 0 mod_script_call_self("skill", "prismatic iris", "color", wep, mod_variable_get("skill", "prismatic iris", "color"))
		reload = 1
		if weapon_get_type(wep) != 0
		{
			meleeammo = 12
			ammo[weapon_get_type(wep)] += max(2*typ_ammo[weapon_get_type(wep)], 2*weapon_get_cost(wep))
		}
		else
		{
			if meleeammo <= 0
			{
				meleeammo = 12
				wep = determine_wep()
			}
		}
	}
	if weapon_get_type(wep) = 0
	{
		if reload > re
			meleeammo--
	}
	//atcive shooters
	if race = ("steroids")
	{
    	if "bmeleeammo" not in self bmeleeammo = 4
    	var _w = weapon_get_type(bwep);
    	var _c = weapon_get_cost(bwep);
    	if ammo[_w] < _c || (_w = 0 && bmeleeammo <= 0) || (_c == 0 and ammo[_w] == 0) or GameCont.rad < weapon_get_rads(bwep)
    	{
    		bwep = determine_wep()
    		breload = 1
			if skill_get("prismatic iris") > 0{
			    var w = wep
			    var q = mod_script_call_self("skill", "prismatic iris", "color", bwep, mod_variable_get("skill", "prismatic iris", "color"))
			    if q{
			        bwep = wep;
			        wep = w
			    }
			}
			
    		if weapon_get_type(bwep) != 0
    		{
    			bmeleeammo = 12
    			ammo[weapon_get_type(bwep)] += max(typ_ammo[weapon_get_type(bwep)], 2*weapon_get_cost(bwep))
    		}
    		else
    		{
    			if bmeleeammo <= 0
    			{
    				bmeleeammo = 12
    				bwep = determine_wep()
    			}
    		}
    	}
    	if weapon_get_type(bwep) = 0{
    		if breload > be
    		    bmeleeammo--
    	}
	}
	/*if bwep != 0
	{
		with instance_create(x,y,WepPickup)
		{
			wep = other.bwep
			curse = other.bcurse
		}
		bwep = 0
	}*/
}

#define wrap(w)
return {
    wep : "wrapper",
    wrapped : w,
    meleeammo : 90
}

#define wep_check(w)
if !is_object(w) or w.wep != "wrapper" return wrap(w)
if w.meleeammo <= 0 or ammo[weapon_get_type(w)] < weapon_get_cost(w.wrapped) or GameCont.rad < weapon_get_rads(w.wrapped) or (weapon_get_cost(w.wrapped) == 0 and ammo[weapon_get_type(w.wrapped)] == 0){
    var q = get_wep()
    if q == w.wrapped w = get_wep()
    var e = wrap(q)
    var t = weapon_get_type(q)
    if t != 0 ammo[t] += max(2*typ_ammo[t], 2*weapon_get_cost(q))
    sound_play( weapon_get_swap(q));
    instance_create(x,y,WepSwap)
    with instance_create(x,y,PopupText)
    {
    	text   = weapon_get_name(q) + "!";
    	target = other.index
    	with instance_create(x,y,CustomObject)
    	{
    		if fork()
    		{
    			wait(2)
    			if !instance_exists(self) exit
    			target  = other.target
    			on_step = text_step
    			exit
    		}
    	}
    }
    return e
}
return w

#define game_start

#define crown_name // Crown Name
return "CROWN OF EXCHANGE";

#define crown_text // Description
return "CHANGE YOUR @wWEAPON@s#WHEN RUNNING OUT OF @yAMMO@s#halved @yammo @sincome";

#define crown_tip // Loading Tip
return "A FAIR DEAL";

#define crown_avail // L1+
if(GameCont.loops <= 0) return 1;

#define get_wep()
var _i = 0
var _l = ds_list_create();
var dif = GameCont.areanum + 2*array_length(instances_matching(Player,"race","robot"))
weapon_get_list(_l, clamp(dif - 2, 0, 8), dif + 1);
if mod_variable_get("skill", "prismatic iris", "color") == 5{
    var n = 0
    ds_list_shuffle(_l);
    _i = ds_list_find_value(_l,1);
    while ds_list_size(_l) > 1 and weapon_get_type(_i) == 1{
        ds_list_delete(_l, 1);
        _i = ds_list_find_value(_l,1);
    }
}
else{
    ds_list_shuffle(_l);
    _i = ds_list_find_value(_l,1);
}
ds_list_destroy(_l);
return _i

#define determine_wep()
var _i = get_wep()
sound_play( weapon_get_swap(_i));
instance_create(x,y,WepSwap)
with instance_create(x,y,PopupText)
{
	text   = weapon_get_name(_i) + "!";
	target = other.index
	with instance_create(x,y,CustomObject)
	{
		if fork()
		{
			wait(2)
			target  = other.target
			on_step = text_step
		}
	}
}
return _i

#define text_step
with instances_matching(PopupText,"target",target)
{
	if text = "EMPTY" {instance_destroy();exit}
	if text = "NOT ENOUGH BULLETS" {instance_destroy();exit}
	if text = "NOT ENOUGH SHELLS" {instance_destroy();exit}
	if text = "NOT ENOUGH BOLTS" {instance_destroy();exit}
	if text = "NOT ENOUGH EXPLOSIVES" {instance_destroy();exit}
	if text = "NOT ENOUGH ENERGY" {instance_destroy();exit}
}
instance_destroy()

#define crown_take
sound_play_crown()

#define crown_lose
with Player
{
	var i = 0;
	repeat(5)
	{
		i++
		typ_ammo[i] *= 2
	}
}

#define sound_play_crown()
with instance_create(0,0,CustomObject)// /gml mod_script_call("crown","exchange","sound_play_crown")
{
sound_play_pitchvol(sndStatueDead,2,.4)
sound_play_pitchvol(sndStatueCharge,.8,.2)
	timer = 0
	on_step = snd_step
	on_cleanup = snd_destroy
}

#define snd_step
timer += current_time_scale
// /gml mod_script_call("crown","exchange","sound_play_crown")
if timer = 1  sound_play_pitchvol(sndCrownLife,1,1)
if timer = 23
{
	sound_set_track_position(sndCrownLife,2)
	sound_play_pitchvol(sndCrownLife,1,1)
}
if timer = 9 sound_play_pitchvol(sndSwapShotgun,.96,1)
if timer = 20 sound_play_pitchvol(sndSwapPistol,.96,1)
if timer = 24 sound_play_pitchvol(sndSwapExplosive,.96,1)
if timer = 30 sound_play_pitchvol(sndSwapEnergy,.96,1)
if timer = 34 sound_play_pitchvol(sndSwapShotgun,.96,1)
if timer = 42 sound_play_pitchvol(sndSwapMachinegun,.96,1)
if timer = 45 sound_play_pitchvol(sndSwapSword,1,1)
if timer >= 100 instance_destroy()

#define snd_destroy
sound_set_track_position(sndCrownLife,0)
