/*features that have been added by Toastline:
-option to have a random range in burstammo and burstdelay
-"finaltouch," "meetlevel," "maxlevel," and "leveladd" scripts in pgw mods
-"levelstyle" script which says whether a brand's levels depend on the player level or the game difficulty level
-weapon info now has (x#) to show burst count
-weapon info now shows ammo cost and type, with cost greyed out if your capacity is too low
-character's accuracy is taken into account when firing
-Robot gets better tech
-added support for Lightning rails
-Fish's Gun Warrant works
-Long Arms works
-maybe a couple of other things? D:
-hopefully no new glitches
*/
#define init
global.DEBUG = 1;
global.drawManager = noone;
//ammo type names
global.atnames=["Melee","Bullet","Shotgun","Bolt","Explosive","Energy"]
//chance that a weapon will use this system; currently not used
global.pwchance=100

// proc-gen weapons
global.sprites = [];
global.brands = [];
global.weptypes = [];
global.handles = [];
global.bodies = [];
global.muzzles = [];



#define chat_command
if(argument0 == "procwep_spawn")
{
	var __args = string_split(argument1, ", ");
	var __brand = __args[0];
	var __lvl = real(__args[1]);
	
	with(instance_create(Player.x, Player.y, WepPickup))
	{
		procwep_brand = __brand;
		procwep_lvl = __lvl;
		
		for(var i = 0; i < array_length_1d(global.brands); i += 1)
		{
			if(global.brands[i].name == procwep_brand)
			procwep_mod = global.brands[i].modname;
		}
	}
	
	return 1;
}else if(argument0 == "procwep_chance")//note: this is not used yet because I can't figure out how to do thing
{
	//var __args = string_split(argument1, ", ");
	//var __brand = __args[0];
	//var __lvl = real(__args[1]);
	
	//if is_real(argument1){
		global.pwchance=real(argument1)
		return 1;
	//}
}

#define procwep_fire(w, a)
// procwep LWO, angle
var type = w.body.weptype;
var p = w.handle.projectile.name;
var s = w.projspeed;
var d = w.damage;
var spread = w.spread/(1+skill_get(19)); // eagle eyes
var _mod = w.modname;
var _elemental = w.elemental.name;
var _burstammo = w.burstammo;
var _burstdelay = w.burstdelay;
var _lightning= w.lightning;//this will be an array containing the min/max lightning length, for if the weapon fires lightning
repeat(1+_burstammo)
{
	//lol
	if (infammo=0)
		ammo[w.ammotype] -= w.ammocost; // temporary fix for a 9900 bug
	
	if(fork())
	{
		motion_add(gunangle+180, w.knockback);
		sound_play_gun(w.sound, 0.4, 0.3);

		repeat(w.pellets)
		{
			var _proj = instance_create(x, y, p);
			with(_proj)
			{
				team = other.team;
				creator = other;
				
				speed = s;
				ospeed=s; // original speed, just in case you need that in the script call below
				otype=type; // type, for the same reason
				ospread=spread; //spread too
				if(object_index == Lightning){ 
					ammor=_lightning;//lightning range too
					ammo=irandom_range(ammor[0],ammor[1])
				}
				
				if(type == "SHOTGUN") or (type == "AUTOSHOTGUN")
				{
					speed /= 1+random(0.5);
				}
				//changed from a+ to creator.gunangle+, so that you can change the angle like with the assault shotgun in the base game
				direction = creator.gunangle+random_range(-1, 1)*spread*other.accuracy;
				image_angle = direction;
				damage *= d;
				
				
				
				
				mod_script_call("mod", "pgw_" + _mod, "procwep_" + string_lower(string_replace_all(_elemental, " ", "_")) + "_create");
				
				if(object_index == Laser || object_index == Lightning) event_perform(ev_alarm, 0);
			}
			
			if(_mod != ""
			&& _elemental != ""
			&& fork())
			{
				var _x = _proj.x;
				var _y = _proj.y;
				
				while(instance_exists(_proj))
				{
					_x = _proj.x;
					_y = _proj.y;
					
					with(_proj)
					{
						mod_script_call("mod", "pgw_" + _mod, "procwep_" + string_lower(string_replace_all(_elemental, " ", "_")) + "_step");
					}
					
					wait(1);
				}
				
				if(instance_exists(self))
				{
					mod_script_call("mod", "pgw_" + _mod, "procwep_" + string_lower(string_replace_all(_elemental, " ", "_")) + "_destroy", _x, _y);
				}
				
				exit;
			}
		}
		
		exit;
	}
	
	wait(_burstdelay);
}

#define procwep_draw(wx, wy, h, b, m, a, r, color, d3d)
// x, y, handle, body, muzzle, angle, right, color, d3d
if(visible || d3d)
{
	//var _hx = sprite_get_xoffset(h);
	var _hl = sprite_get_width(h)-1-sprite_get_xoffset(h);
	var _bl = sprite_get_width(b)-1-sprite_get_xoffset(b);
	var t = current_frame*0.4;
	
	if(d3d)
	{
		d3d_set_fog(1, color, 0, 1);
	}
	
	// muzzle
	if(object_index == WepPickup && !d3d && (floor(image_index) == 1 || floor(image_index) == 5)) d3d_set_fog(1, color, 0, 1);
	draw_sprite_ext(m, t, wx+lengthdir_x(_hl+_bl, a), wy+lengthdir_y(_hl+_bl, a),
	image_xscale, image_yscale*r, a, color, image_alpha);
	if(!d3d) d3d_set_fog(0, 0, 0, 0);
	
	// body
	if(object_index == WepPickup && !d3d && (floor(image_index) == 1 || floor(image_index) == 4)) d3d_set_fog(1, color, 0, 1);
	draw_sprite_ext(b, t, wx+lengthdir_x(_hl, a), wy+lengthdir_y(_hl, a),
	image_xscale, image_yscale*r, a, color, image_alpha);
	if(!d3d) d3d_set_fog(0, 0, 0, 0);
	
	// handle
	if(object_index == WepPickup && !d3d && (floor(image_index) == 1 || floor(image_index) == 3)) d3d_set_fog(1, color, 0, 1);
	draw_sprite_ext(h, t, wx, wy,
	image_xscale, image_yscale*r, a, color, image_alpha);
	if(!d3d) d3d_set_fog(0, 0, 0, 0);
	
	if(d3d)
	{
		d3d_set_fog(0, 0, 0, 0);
	}
}

#define procwep_draw_stats(w, ow, _x, _y)
// 'w' is weapon to display stats of, 'ow' is weapon to compare stats to
// equaling 'ow' to 'w' makes them not compare stats
if(is_object(w) && w.wep == "procwep")
{
	if(!is_object(ow))
	{
		ow = w;
	}
	
	draw_set_halign(0);
	draw_set_font(fntSmall);
	
	var d = w.procwep.damage;				// damage
	var _d = ow.procwep.damage;
	var r = w.procwep.reload;				// reload
	var _r = ow.procwep.reload;
	var s = w.procwep.spread;				// spread
	var _s = ow.procwep.spread;
	var k = w.procwep.knockback;			// knockback
	var _k = ow.procwep.knockback;
	var p = w.procwep.pellets;				// pellets
	var bt = w.procwep.burstammo;			// burst!
	var _bt = ow.procwep.burstammo;
	var lv = w.procwep.lvl;					// lvl
	var br = w.procwep.brand;				// brand
	var wt = w.procwep.weptype.name;		// weptype
	var eln = w.procwep.elemental.name;		// elemental name
	var elc = w.procwep.elemental.color;	// elemental color
	var cs = w.procwep.ammocost*(bt+1);		// ammo cost!
	var _cs = ow.procwep.ammocost*(_bt+1);
	var at = w.procwep.ammotype;			//ammo type!
	var _at = ow.procwep.ammotype;	
	var am = Player.typ_amax[at];			//how much ammo capacity there is! if ammo cost is too high to be fired with current ammo max, it will be colored.
	
	draw_text_nt(floor(_x), floor(_y),
	"LV." + string(lv) + "#"
	+ (eln != "" ? elc + eln + " " : "") + "@w" + br + " " + wt + "#"
	+ "DMG MULT: " + (d > _d ? "@g" : (d < _d ? "@r" : "")) + string(d) + (p > 1 ? " @yx" + string(p) : "")+ (bt > 0 ? " @y(x" + string(bt+1)+")" : "") + " @w" + (w != ow ? "(" + string(_d) + ")" : "") + "#"
	+ "RELOAD SPD: " + (r < _r ? "@g" : (r > _r ? "@r" : "")) + string(r) + " @w" + (w != ow ? "(" + string(_r) + ")" : "") + "#"
	+ "SPREAD: " + (s < _s ? "@g" : (s > _s ? "@r" : "")) + string(s) + " @w" + (w != ow ? "(" + string(_s) + ")" : "") + "#"
	+ "RECOIL: " + (k < _k ? "@g" : (k > _k ? "@r" : "")) + string(k) + " @w" + (w != ow ? "(" + string(_k) + ")" : "") + "#"
	+ "COST: " + (cs > am ? "@d" : "") + string(cs) + " @w" + global.atnames[at] + " ("+string(_cs)+" "+global.atnames[_at]+")#"
	//+string(w.procwep.handle.lvl)+","+string(w.procwep.body.lvl)+","+string(w.procwep.muzzle.lvl)
	
	
	);
}

#define procwep_gen
/*
	takes the following variables as bias input:
	* 'procwep_mod' - mod name string
	* 'procwep_brand' - brand name string
	* 'procwep_weptype' - weapon type name string
	* 'procwep_lvl' - level number
*/
//if !variable_instance_exists(self,"pgwconverted")
//if random(100)<global.pwchance
{

	var _brand, _mod, _weptype, _lvl;
	var _shouldTrace = 0;

	if("procwep_mod" not in self
	|| ("procwep_mod" in self && procwep_mod == -1))
	{
		_mod = -1;
	}
	else
	{
		_mod = procwep_mod;
	}

	do
	{
		if("procwep_brand" not in self
		|| ("procwep_brand" in self && procwep_brand == -1))
		{
			_brand = global.brands[irandom(array_length_1d(global.brands)-1)];
		}
		else
		{
			for(var i = 0; i < array_length_1d(global.brands); i += 1)
			{
				if(global.brands[i].name == procwep_brand)
				{
					_brand = global.brands[i];
				}
			}
		}
	}
	while(_mod != -1 && _brand.modname != _mod);
	if(_shouldTrace)
	{
		trace("[" + string(current_frame) + "] " + string(_brand));
	}

	if("procwep_weptype" not in self
	|| ("procwep_weptype" in self && procwep_weptype == -1))
	{
		// make sure to find weptypes compatible with the brand
		var __weptypes = [];
		for(var i = 0; i < array_length_1d(global.handles); i += 1)
		{
			if(global.handles[i].brand == _brand.name)
			{
				if(_shouldTrace) trace("FOUND: " + string(global.handles[i].brand) + " // " + string(_brand.name));
				
				for(var _i = 0; _i < array_length_1d(global.weptypes); _i += 1)
				{
					if(global.weptypes[_i].name == global.handles[i].weptype)
					{
						__weptypes[array_length_1d(__weptypes)] = global.weptypes[_i];
					}
				}
			}
		}
		if(array_length_1d(__weptypes) > 0)
		{
			_weptype = __weptypes[irandom(array_length_1d(__weptypes)-1)];
		}
		else
		{
			if(_shouldTrace)
			{
				trace("ERROR: No compatible weptypes available!");
			}
			
			errored = 1;
		}
	}
	else
	{
		var __weptypes = [];
		for(var _i = 0; _i < array_length_1d(global.weptypes); _i += 1)
		{
			if(global.weptypes[_i].name == procwep_weptype)
			{
				__weptypes[array_length_1d(__weptypes)] = global.weptypes[_i];
			}
		}
		if(array_length_1d(__weptypes) > 0)
		{
			_weptype = __weptypes[irandom(array_length_1d(__weptypes)-1)];
		}
		else
		{
			if(_shouldTrace)
			{
				trace("ERROR: No compatible weptypes available!");
			}
			
			errored = 1;
		}
	}

	if("procwep_lvl" not in self
	|| ("procwep_lvl" in self && procwep_lvl == -1))
	{
		//maybe a mod's max level goes above 10!!
		var mmaxlevel=10;
		var lstyle=0;
		if mod_script_exists("mod","pgw_" + _brand.modname,"maxlevel")
			mmaxlevel=mod_script_call("mod","pgw_" + _brand.modname,"maxlevel");
		
		if mod_script_exists("mod","pgw_" + _brand.modname,"levelstyle")
			lstyle=mod_script_call("mod","pgw_" + _brand.modname,"levelstyle");
		//robot's gotta get better weapons, geez
		bonus=0;
		with Player
			if race='robot'
				other.bonus=1;
		
		//YV's mansion chests also give a bonus
		if GameCont.area=107
			bonus+=6
				
		if lstyle=0
			_lvl = min(mmaxlevel, max(1, irandom(bonus+GameCont.level+irandom_range(-1, 1))));
		else
			_lvl = min(mmaxlevel, bonus+GameCont.hard);//max(1, irandom(bonus+GameCont.hard)));
	}
	else
	{
		var lstyle=0;
		if mod_script_exists("mod","pgw_" + _brand.modname,"levelstyle")
			lstyle=mod_script_call("mod","pgw_" + _brand.modname,"levelstyle");
			
		//basically, this makes it so that if the modded large weapon crates call this, and the level style is 1, then calculate level appropriately
		if lstyle=0 or !variable_instance_exists(self,"softcaller")
			_lvl = procwep_lvl;
		else{
			var mmaxlevel=10;
			if mod_script_exists("mod","pgw_" + _brand.modname,"maxlevel")
				mmaxlevel=mod_script_call("mod","pgw_" + _brand.modname,"maxlevel");
			
			bonus=0;
			//add however much bonus a modded large weapon chest gives
			if variable_instance_exists(self,"softcaller")
				bonus+=softcaller
			//robot's gotta get better weapons, geez
			with Player
				if race='robot'
					other.bonus=1;
			_lvl = min(mmaxlevel, bonus+GameCont.hard);//max(1, irandom(bonus+GameCont.hard)));
		}
		
		
	}

	var errored = 0;
	var meetlevel;
	if mod_script_exists("mod","pgw_" + _brand.modname,"meetlevel")
		meetlevel=mod_script_call("mod","pgw_" + _brand.modname,"meetlevel");
	else 
		meetlevel=1//parts must be at the handle's level 
		
	var leveladd=0;	
	if mod_script_exists("mod","pgw_" + _brand.modname,"leveladd")
		leveladd=mod_script_call("mod","pgw_" + _brand.modname,"leveladd");
	//trace(array_length_1d(global.handles))
	var _brandHandles = [];
	for(var i = 0; i < array_length_1d(global.handles); i += 1)
	{
		if(curse
		|| (global.handles[i].brand == _brand.name
		&& global.handles[i].weptype == _weptype.name
		&& global.handles[i].lvl <= _lvl))
		{
			_brandHandles[array_length_1d(_brandHandles)] = i;
			//trace(global.handles[i].prefix[0]+":"+string(global.handles[i].lvl))
		}
	}
	//trace("konpree")
	var _handle = -1;
	if(array_length_1d(_brandHandles) > 0)
	{
		_handle = global.handles[_brandHandles[irandom(array_length_1d(_brandHandles)-1)]];
		
		var _brandBodies = [];
		for(var i = 0; i < array_length_1d(global.bodies); i += 1)
		{
			if(curse
			|| (global.bodies[i].brand == _brand.name
			&& global.bodies[i].weptype == _weptype.name
			&& ((global.bodies[i].lvl == _handle.lvl && meetlevel=1) || (global.bodies[i].lvl+leveladd*_handle.lvl <= _lvl && meetlevel=0))
			))
			{
				_brandBodies[array_length_1d(_brandBodies)] = i;
			}
		}
		var _body = -1;
		if(array_length_1d(_brandBodies) > 0)
		_body = global.bodies[_brandBodies[irandom(array_length_1d(_brandBodies)-1)]];
		else { if(_shouldTrace) trace("ERROR: No gun bodies available!"); errored = 1; }

		var _brandMuzzles = [];
		for(var i = 0; i < array_length_1d(global.muzzles); i += 1)
		{
			if(curse
			|| (global.muzzles[i].brand == _brand.name
			&& global.muzzles[i].weptype == _weptype.name
			&& ((global.muzzles[i].lvl == _handle.lvl && meetlevel=1) || (global.muzzles[i].lvl+leveladd*(_body.lvl+_handle.lvl) <= _lvl && meetlevel=0))
			))
			{
				_brandMuzzles[array_length_1d(_brandMuzzles)] = i;
			}
		}
		var _muzzle = -1;
		if(array_length_1d(_brandMuzzles) > 0)
		_muzzle = global.muzzles[_brandMuzzles[irandom(array_length_1d(_brandMuzzles)-1)]];
		else { if(_shouldTrace) trace("ERROR: No gun muzzles available!"); errored = 1; }
	}
	else { if(_shouldTrace) trace("ERROR: No gun handles available!"); errored = 1; }

	if(errored)
	{
		if(_shouldTrace)
		{
			trace("Mod: " + _brand.modname);
			trace("Brand: " + _brand.name);
			trace("Type: " + _weptype.name);
			trace("Level: " + string(_lvl));
		}
	}
	else
	{
		wep = {
			wep: "procwep",
			procwep: {
				brand: _brand.name,
				modname: _brand.modname,
				name: _handle.prefix[irandom(array_length_1d(_handle.prefix)-1)] + _body.name[irandom(array_length_1d(_body.name)-1)],
				weptype: _weptype,
				lvl: GameCont.level,
				handle: _handle,
				body: _body,
				muzzle: _muzzle,
				handlespr: _handle.spr[irandom(array_length_1d(_handle.spr)-1)],
				bodyspr: _body.spr[irandom(array_length_1d(_body.spr)-1)],
				muzzlespr: _muzzle.spr[irandom(array_length_1d(_muzzle.spr)-1)],
				sound: _handle.projectile.sound[irandom(array_length_1d(_handle.projectile.sound)-1)],
				reload: max(irandom_range(_handle.reloadtime[0], _handle.reloadtime[1]) - floor(GameCont.hard*0.025), 1),
				damage: random_range(_handle.dmgmult[0], _handle.dmgmult[1]) + GameCont.hard*0.025,
				spread: random_range(_muzzle.spread[0], _muzzle.spread[1]),
				knockback: random_range(_muzzle.knockback[0], _muzzle.knockback[1]) + GameCont.hard*0.1,
				projspeed: random_range(_handle.projectile.speed[0], _handle.projectile.speed[1]) + GameCont.hard*0.01,
				pellets: irandom_range(_handle.projectile.pellets[0], _handle.projectile.pellets[1]) + (_handle.weptype == "SHOTGUN" ? floor(GameCont.hard*0.1) : 0),
				ammocost: irandom_range(_body.ammocost[0], _body.ammocost[1]),
				ammotype: _body.ammotype,
				elemental: (_body.elementalchance > 0 && random(1) <= _body.elementalchance ? _body.elemental[irandom(array_length_1d(_body.elemental)-1)] : {name: "", color: ""}),
				hasReloaded: 1,
				reloadTimer: 0,
				hasGivenAmmo: 0,
				lightning: [14,14]
			}
		};
		
		//burstammo and burstdelay now have randomization
		if is_array(_muzzle.burstammo)
			wep.procwep.burstammo=irandom_range(_muzzle.burstammo[0], _muzzle.burstammo[1])
		else
			wep.procwep.burstammo=_muzzle.burstammo
		
		if is_array(_muzzle.burstdelay)
			wep.procwep.burstdelay=irandom_range(_muzzle.burstdelay[0], _muzzle.burstdelay[1])
		else
			wep.procwep.burstdelay=_muzzle.burstdelay
		
		lstyle=0;
		if mod_script_exists("mod","pgw_" + _brand.modname,"levelstyle")
			lstyle=mod_script_call("mod","pgw_" + _brand.modname,"levelstyle");
		//if using the GameCont.hard style, mark the weapon's level appropriately
		if lstyle=1{
			leveladd=0;	
			if mod_script_exists("mod","pgw_" + _brand.modname,"leveladd")
				leveladd=mod_script_call("mod","pgw_" + _brand.modname,"leveladd");
			if leveladd=0
				wep.procwep.lvl=max(wep.procwep.handle.lvl,wep.procwep.body.lvl,wep.procwep.muzzle.lvl)
			else
				wep.procwep.lvl=wep.procwep.handle.lvl+wep.procwep.body.lvl+wep.procwep.muzzle.lvl
			}
		
		//the mod can now do some last-minute tweaks after the weapon has been generated
		if mod_script_exists("mod", "pgw_" + _brand.modname, "finaltouch")
			wep.procwep=mod_script_call("mod","pgw_" + _brand.modname,"finaltouch" ,wep.procwep);
	}
}
//else
	//errored =0
//pgwconverted=1

return errored^1;

#define procwep_reload(w)
sound_play_gun(w.procwep.handle.reloadsound, 0, 0.3);
var _brand = w.procwep.brand;
var _mod = w.procwep.modname;
mod_script_call("mod", "pgw_" + _mod, "procwep_" + string_lower(string_replace_all(_brand, " ", "_")) + "_reload", w);

#define game_start
with(Player)
{
	var _done = 0;
	
	while(!_done)
	{
		with(instance_create(x, y, WepPickup))
		{
			procwep = 1;
			//_done = procwep_gen(-1, -1, -1, 0);
			procwep_lvl = 0;
			_done = procwep_gen();
			
			if(_done)
			{
				other.wep = wep;
			}
			
			instance_destroy();
		}
	}
	if is_object(wep)
	ammo[wep.procwep.ammotype] = floor(typ_amax[wep.procwep.ammotype]/2);
	
	if(bwep != 0 && bwep != "")
	{
		_done = 0;
		
		while(!_done)
		{
			with(instance_create(x, y, WepPickup))
			{
				procwep = 1;
				//_done = procwep_gen(-1, -1, -1, 0);
				procwep_lvl = 0;
				_done = procwep_gen();
				
				if(_done)
				{
					other.bwep = wep;
				}
				
				instance_destroy();
			}
		}
	}
}

#define step
if(!instance_exists(global.drawManager)
&& !instance_exists(GenCont))
{
	global.drawManager = instance_create(0, 0, CustomObject);
	
	with(global.drawManager)
	{
		name = "drawmanager";
		script_bind_draw(draw_ground_weps, 0);
		script_bind_draw(draw_player_bwep, -1);
		script_bind_draw(draw_player_wep, -3);
	}
}

with(WepPickup)
{
	if(!is_object(wep)
	/*|| "procwep" not in self*/)
	{
		procwep = 1;
		var _done = 0;
		
		while(!_done)
		{
			//_done = procwep_gen(-1, -1, -1, -1);
			_done = procwep_gen();
		}
	
		
	}
	else if(wep.wep == "procwep")
	{
		name = string_upper(wep.procwep.name);
		//name = wep.procwep.name;
	}
}

with(Player)
{
	// DEBUG
	if(global.DEBUG)
	{
		if(button_pressed(index, "key1"))
		{
			instance_create(mouse_x[index], mouse_y[index], AmmoChestMystery);
			
			repeat(10)
			{
				instance_create(mouse_x[index], mouse_y[index], RadChest);
			}
		}
		if(button_pressed(index, "key2"))
		{
			instance_create(mouse_x[index], mouse_y[index], IDPDChest);
			
			repeat(10)
			{
				instance_create(mouse_x[index], mouse_y[index], RadChest);
			}
		}
		if(button_pressed(index, "key3"))
		instance_create(mouse_x[index], mouse_y[index], BigWeaponChest);
		if(button_pressed(index, "key4"))
		with(instance_create(mouse_x[index], mouse_y[index], WepPickup)) curse = 1;
		if(button_pressed(index, "key5"))
		instance_create(mouse_x[index], mouse_y[index], WepPickup);
	}
	
	// init
	if("meleereload" not in self) meleereload = 0;
	
	if(reload <= 0
	&& is_object(wep)
	&& wep.wep == "procwep"
	&& !wep.procwep.hasReloaded)
	{
		wep.procwep.reloadTimer -= 1;
		
		if(wep.procwep.reloadTimer <= 0)
		{
			wep.procwep.hasReloaded = 1;
			procwep_reload(wep);
		}
	}
	
	if(race == "steroids"
	&& breload <= 0
	&& is_array(bwep)
	&& bwep.wep == "procwep"
	&& !bwep.procwep.hasReloaded)
	{
		bwep.procwep.reloadTimer -= 1;
		
		if(bwep.procwep.reloadTimer <= 0)
		{
			bwep.procwep.hasReloaded = 1;
			procwep_reload(bwep);
		}
	}
	
	if(instance_exists(WepPickup))
	{
		with(instance_nearest(x, y, WepPickup))
		{
			if(distance_to_object(other) <= 0
			&& is_object(wep)
			&& wep.wep == "procwep"
			&& !wep.procwep.hasGivenAmmo)
			{
				var ammoType = wep.procwep.ammotype;
				var p = other;
				other.ammo[ammoType] += other.typ_ammo[ammoType];
				wep.procwep.hasGivenAmmo = 1;
				
				if(other.ammo[ammoType] > other.typ_amax[ammoType])
				{
					other.ammo[ammoType] = other.typ_amax[ammoType];
				}
				
				with(instance_create(x, y, PopupText))
				{
					if(p.ammo[ammoType] > p.typ_amax[ammoType])
					{
						mytext = "MAX ";
					}
					else
					{
						mytext = "+" + string(p.typ_ammo[ammoType]) + " ";
					}
					
					mytext += p.typ_name[ammoType];
				}
			}
		}
	}
	
	/*if(ammo[wep.procwep.body.ammotype] < wep.procwep.ammocost)
	{
		wepangle = 45;
	}*/
	
	if(meleereload > 0) meleereload -= 1;
	
	if(button_pressed(index, "horn")
	&& meleereload <= 0)
	{
		meleereload = 25;
		sound_play(sndWrench);
		
		//with(instance_create(x, y, Slash))
		with instance_create(x+lengthdir_x(skill_get(13)*20,point_direction(x,y,mouse_x,mouse_y)),y+lengthdir_y(skill_get(13)*20,point_direction(x,y,mouse_x,mouse_y)),Slash)
		{
			team = other.team;
			creator = other;
			direction = other.gunangle;
			image_angle = direction;
			speed = 2+skill_get(13)*3;
			damage = 1;
		}
	}
}

#define draw
if(!instance_exists(GenCont))
{
	with(WepPickup)
	{
		if(visible
		&& is_object(wep)
		&& wep.wep == "procwep")
		{
			if(instance_exists(Player))
			{
				var _np = instance_nearest(x, y, Player);
				if(instance_exists(_np)
				&& is_object(_np.wep)
				&& distance_to_object(_np) <= 0
				&& instance_nearest(_np.x, _np.y, WepPickup) == self
				&& _np.wep.wep == "procwep")
				{
					procwep_draw_stats(wep, _np.wep, x, y+16);
				}
			}
		}
	}
}
//draw_set_color(c_white)
//draw_text(mouse_x,mouse_y,string(GameCont.hard))

#define draw_ground_weps
with(WepPickup)
{
	with(Player)
	{
		draw_set_visible(index, 1);
	}
	
	if(visible
	&& is_object(wep)
	&& wep.wep == "procwep")
	{
		procwep_draw(x, y,
		wep.procwep.handlespr,
		wep.procwep.bodyspr,
		wep.procwep.muzzlespr,
		rotation, 1, image_blend, 0);
	}
}

with(ThrownWep)
{
	with(Player)
	{
		draw_set_visible(index, 1);
	}
	
	if(wep.wep == "procwep")
	{
		if(instance_exists(Player))
		{
			procwep_draw(x, y,
			wep.procwep.handlespr,
			wep.procwep.bodyspr,
			wep.procwep.muzzlespr,
			image_angle, 1, image_blend, 0);
		}
	}
}

#define draw_player_wep
with(Player)
{
	draw_set_visible(index, 1);
	
	if(is_object(wep)
	&& wep.wep == "procwep")
	{
		procwep_draw(x+lengthdir_x(wkick, gunangle), y+lengthdir_y(wkick, gunangle),
		wep.procwep.handlespr,
		wep.procwep.bodyspr,
		wep.procwep.muzzlespr,
		gunangle+("meleereload" in self ? meleereload*(meleereload/2) : 0), right, c_white, 0);
	}
}

#define draw_player_bwep
with(Player)
{
	draw_set_visible(index, 1);
	
	if(is_array(bwep)
	&& bwep.wep == "procwep")
	{
		if(race == "steroids")
		{
			procwep_draw(x+lengthdir_x(wkick, gunangle), y-4+lengthdir_y(wkick, gunangle),
			bwep.procwep.handlespr,
			bwep.procwep.bodyspr,
			bwep.procwep.muzzlespr,
			gunangle, -right, c_white, 0);
		}
		else
		{
			procwep_draw(x, y,
			bwep.procwep.handlespr,
			bwep.procwep.bodyspr,
			bwep.procwep.muzzlespr,
			90+20*right, right, c_gray, 0);
		}
	}
}

#define draw_gui
draw_set_halign(0);
draw_set_font(fntM);

with(Player)
{
	with(Player)
	{
		draw_set_visible(index, 0);
	}
	draw_set_visible(index, 1);
	
	if(is_object(wep)
	&& wep.wep == "procwep")
	{
		for(var i = 0; i < 360; i += 90)
		{
			procwep_draw(24+lengthdir_x(1, i)-(curp() > 1 ? 18 : 0), 22+lengthdir_y(1, i),
			wep.procwep.handlespr,
			wep.procwep.bodyspr,
			(sprite_get_width(wep.procwep.handlespr) + sprite_get_width(wep.procwep.bodyspr) + sprite_get_width(wep.procwep.muzzlespr) < 24 ? wep.procwep.muzzlespr : mskNone),
			0, 1, (curse ? c_purple : c_white), 1);
		}
		
		procwep_draw(24-(curp() > 1 ? 18 : 0), 22,
		wep.procwep.handlespr,
		wep.procwep.bodyspr,
		(sprite_get_width(wep.procwep.handlespr) + sprite_get_width(wep.procwep.bodyspr) + sprite_get_width(wep.procwep.muzzlespr) < 24 ? wep.procwep.muzzlespr : mskNone),
		0, 1, c_black, 1);
		
		// mouse over weapon to see stats
		if(mouse_x[index]-view_xview[index] >= 24-16
		&& mouse_x[index]-view_xview[index] < 24+16
		&& mouse_y[index]-view_yview[index] >= 22-8
		&& mouse_y[index]-view_yview[index] < 22+8)
		{
			procwep_draw_stats(wep, wep, 4, 56);
			draw_set_halign(0);
			draw_set_font(fntM);
			draw_set_color(c_white);
			draw_text_shadow(4, 46, wep.procwep.name);
		}
	}
	
	if(is_array(bwep)
	&& bwep.wep == "procwep")
	{
		for(var i = 0; i < 360; i += 90)
		{
			procwep_draw(24+44+lengthdir_x(1, i)-(curp() > 1 ? 18 : 0), 22+lengthdir_y(1, i),
			bwep.procwep.handlespr,
			bwep.procwep.bodyspr,
			(sprite_get_width(bwep.procwep.handlespr) + sprite_get_width(bwep.procwep.bodyspr) + sprite_get_width(bwep.procwep.muzzlespr) < 24 ? bwep.procwep.muzzlespr : mskNone),
			0, 1, (bcurse ? c_purple : c_white), 1);
		}
		
		procwep_draw(24+44-(curp() > 1 ? 18 : 0), 22,
		bwep.procwep.handlespr,
		bwep.procwep.bodyspr,
		(sprite_get_width(bwep.procwep.handlespr) + sprite_get_width(bwep.procwep.bodyspr) + sprite_get_width(bwep.procwep.muzzlespr) < 24 ? bwep.procwep.muzzlespr : mskNone),
		0, 1, c_black, 1);
		
		// mouse over weapon to see stats
		if(mouse_x[index]-view_xview[index] >= 24+44-16
		&& mouse_x[index]-view_xview[index] < 24+44+16
		&& mouse_y[index]-view_yview[index] >= 22-8
		&& mouse_y[index]-view_yview[index] < 22+8)
		{
			procwep_draw_stats(bwep, wep, 4, 56);
			draw_set_halign(0);
			draw_set_font(fntM);
			draw_set_color(c_white);
			if(is_array(bwep) && bwep.wep == "procwep") draw_text_shadow(4, 46, bwep.procwep.name);
		}
	}
	
	
	
	
	
	// other players
	if(curp() > 1)
	{
		var hor = 0;
		var ver = 0;
		for(var p = 0; p < curp(); p += 1)
		{
			if(p != index)
			{
				hor += game_width-93;
				if(hor > game_width)
				{
					hor = 0;
					ver += game_height-46;
				}
				
				with(Player)
				{
					if(index == p)
					{
						if(is_object(wep)
						&& wep.wep == "procwep")
						{
							for(var i = 0; i < 360; i += 90)
							{
								procwep_draw(hor+24+lengthdir_x(1, i)-18, ver+22+lengthdir_y(1, i),
								wep.procwep.handlespr,
								wep.procwep.bodyspr,
								(sprite_get_width(wep.procwep.handlespr) + sprite_get_width(wep.procwep.bodyspr) + sprite_get_width(wep.procwep.muzzlespr) < 24 ? wep.procwep.muzzlespr : mskNone),
								0, 1, (curse ? c_purple : c_white), 1);
							}
							
							procwep_draw(hor+24-18, ver+22,
							wep.procwep.handlespr,
							wep.procwep.bodyspr,
							(sprite_get_width(wep.procwep.handlespr) + sprite_get_width(wep.procwep.bodyspr) + sprite_get_width(wep.procwep.muzzlespr) < 24 ? wep.procwep.muzzlespr : mskNone),
							0, 1, c_black, 1);
						}
						
						if(is_array(bwep)
						&& bwep.wep == "procwep")
						{
							for(var i = 0; i < 360; i += 90)
							{
								procwep_draw(hor+24+44+lengthdir_x(1, i)-18, ver+22+lengthdir_y(1, i),
								bwep.procwep.handlespr,
								bwep.procwep.bodyspr,
								(sprite_get_width(bwep.procwep.handlespr) + sprite_get_width(bwep.procwep.bodyspr) + sprite_get_width(bwep.procwep.muzzlespr) < 24 ? bwep.procwep.muzzlespr : mskNone),
								0, 1, (bcurse ? c_purple : c_white), 1);
							}
							
							procwep_draw(hor+24+44-18, ver+22,
							bwep.procwep.handlespr,
							bwep.procwep.bodyspr,
							(sprite_get_width(bwep.procwep.handlespr) + sprite_get_width(bwep.procwep.bodyspr) + sprite_get_width(bwep.procwep.muzzlespr) < 24 ? bwep.procwep.muzzlespr : mskNone),
							0, 1, c_black, 1);
						}
						
						// mouse over weapon to see stats
						if(mouse_x[other.index]-view_xview[other.index] >= hor+24-16
						&& mouse_x[other.index]-view_xview[other.index] < hor+24+16
						&& mouse_y[other.index]-view_yview[other.index] >= ver+22-8
						&& mouse_y[other.index]-view_yview[other.index] < ver+22+8)
						{
							procwep_draw_stats(wep, other.wep, hor+4, ver-(ver ? 34 : -60));
							if(hor) draw_set_halign(2);
							draw_set_font(fntM);
							draw_set_color(c_white);
							draw_text_shadow(hor+(hor ? 90 : 0), ver-(ver ? 44 : -48), wep.procwep.name);
							draw_set_halign(0);
						}
						else if(mouse_x[other.index]-view_xview[other.index] >= hor+24+44-16
						&& mouse_x[other.index]-view_xview[other.index] < hor+24+44+16
						&& mouse_y[other.index]-view_yview[other.index] >= ver+22-8
						&& mouse_y[other.index]-view_yview[other.index] < ver+22+8)
						{
							procwep_draw_stats(bwep, other.wep, hor+4, ver-(ver ? 34 : -60));
							draw_set_halign(2);
							draw_set_font(fntM);
							if(is_array(bwep) && bwep.wep == "procwep") draw_text_shadow(hor+(hor ? 90 : 0), ver-(ver ? 44 : -48), bwep.procwep.name);
							draw_set_halign(0);
						}
					}
				}
			}
		}
	}
	
	with(Player)
	{
		draw_set_visible(index, 1);
	}
}

#define curp
// returns the number of players in this lobby
var r = 0;
for(var _curp = 0; _curp < maxp; _curp += 1)
{
	if(player_get_alias(_curp) != "")
	{
		r += 1;
	}
}
return r;



// API {

#define procwep_add_sprite(spr)
var l = array_length_1d(global.sprites);
global.sprites[l] = sprite_add(spr[0], spr[1], spr[2], spr[3]);
return global.sprites[l];

#define procwep_add_brand(bra)
var l = array_length_1d(global.brands);
global.brands[l] = bra;
return global.brands[l];

#define procwep_add_weptype(typ)
var l = array_length_1d(global.weptypes);
global.weptypes[l] = typ;
return global.weptypes[l];

#define procwep_add_handle(han)
var l = array_length_1d(global.handles);
global.handles[l] = han;
return global.handles[l];

#define procwep_add_body(bod)
var l = array_length_1d(global.bodies);
global.bodies[l] = bod;
return global.bodies[l];

#define procwep_add_muzzle(muz)
var l = array_length_1d(global.muzzles);
global.muzzles[l] = muz;
return global.muzzles[l];

//}
