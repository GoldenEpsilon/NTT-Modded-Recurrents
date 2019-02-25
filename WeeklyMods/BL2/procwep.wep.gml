#define init
global.mskProcwep = sprite_add_weapon("res/pgw/mskProcwep.png", 2, 2);

#define weapon_name
return "";

#define weapon_type(_wep)
//return 0;
return is_object(_wep) ? _wep.procwep.ammotype : 0;

#define weapon_melee(_wep)
return 0;

#define weapon_sprt
return global.mskProcwep;

#define weapon_cost(_wep)
//return 0;
return is_object(_wep) ? _wep.procwep.ammocost*(1+_wep.procwep.burstammo) : 0;

#define weapon_auto(_wep)
//return 1;
return is_object(_wep) ? _wep.procwep.weptype.auto : 0;

#define weapon_fire(_wep)
var w = _wep.procwep;
//if(ammo[w.ammotype] >= w.ammocost*(1+w.burstammo))
{
	mod_script_call("mod", "pgw", "procwep_fire", w, gunangle);
	reload += w.reload;
	//ammo[w.body.ammotype] -= w.ammocost; // temporary fix for a 9900 bug
	wkick = -ceil(w.knockback/2);
	w.hasReloaded = 0; w.reloadTimer = 15;
}
