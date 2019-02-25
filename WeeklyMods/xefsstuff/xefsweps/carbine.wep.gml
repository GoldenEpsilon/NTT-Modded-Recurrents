#define init
global.sprCarbine = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABkAAAALCAMAAAC9KdbBAAAAHlBMVEUAAAAAAAAyOT4/GRNMVl1fLyZseoSBaSLLpzr///9j08ebAAAAAXRSTlMAQObYZgAAAExJREFUeNqVzUESwCAIA8CmQeD/LzZTi3h1PciEAZ5LQBdVLbk7jhKph+ghM3PzA/4FJMfQ/5oA8nVSqaCu9NHUALmjhiDZ6WEtuDEBwzIBSSIzLEMAAAAASUVORK5CYII=", 4, 4);

global.sprBeamW = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADIAAAABCAMAAACrDw2AAAAAFVBMVEX/////////////////////AAD///9zKUCsAAAABXRSTlM/bn+/7zamyyUAAAAVSURBVAjXY2DDDViYEYAJDBiAgBEAGpEA1RO3ShgAAAAASUVORK5CYII=",1,0,0);

#define weapon_name
return "CARBINE";

#define weapon_sprt
return global.sprCarbine;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 9;

#define weapon_text
return "THE WEAPON THAT CONQUERED THE CONTINENT";

#define step

if (argument0) && (ammo[1] >= 3) && (reload <= 0){

	carbineanglemax = 60 - (30*skill_get(19))
	carbineanglespeed = real((2 + (4*((maxhealth-my_health)/maxhealth)*skill_get(22))) / (skill_get(19)+1));
	
	if "carbineangle" not in self carbineangle = carbineanglemax;
	if "carbineanglefired" not in self carbineanglefired = 30;
	if "boosttime" not in self boosttime = -1;
	
	if button_check(index,"fire") && (carbineangle > 0){
		carbineangle -= carbineanglespeed
		if carbineangle < 0 carbineangle = 0;
		if (beamlight != 1) && (carbineangle <= carbineanglemax * 0.8) beamlight += 0.25
	}
	
	if boosttime >= 0 {
		boosttime += 1
		if boosttime >= 5 {
			boosttime = -1;
		}
	}

	if (carbineangle <= 1) && (tripped = 0){
		sound_play_pitchvol(sndEmpty, 1.25, 1.25);
		boosttime = 0;
		tripped = 1;
	}
	
	if button_released(index,"fire") && (carbineangle <= carbineanglemax * 0.8){
		ammo[1] -= 3;
		if boosttime < 0 wkick = 5;
		else wkick = 10;
		carbineanglefired = carbineangle / 2;
		repeat(5){
			with instance_create(x+lengthdir_x(18, gunangle),y+lengthdir_y(15, gunangle),Bullet1){
				team = 2;
				creator = other;
				if (other.boosttime < 0){
					sound_play_gun(sndSlugger, 0.25, 0.3);
					speed = 12.5;
					damage = 6;
				}
				else {
					sound_play_gun(sndHeavySlugger, 0.25, -0.2);
					speed = 17.5;
					damage = 8;
					image_xscale = 1.1;
					image_yscale = 1.1;
				}
				direction = other.gunangle + other.carbineangle;
				image_angle = direction;
			}
		carbineangle -= carbineanglefired;
		}
	}
	
	if !button_check(index,"fire"){
		carbineangle = carbineanglemax;
		tripped = 0;
		beamlight = 0.25;
	}

	script_bind_draw(draw_weplines, depth);
}

#define draw_weplines
with(Player) if (wep = "carbine") && (carbineangle != carbineanglemax){
	if boosttime != 0{
		draw_sprite_ext(global.sprBeamW, 1, x+lengthdir_x(15, gunangle), y+lengthdir_y(15, gunangle), 1, 1, gunangle+carbineangle, player_get_color(index), beamlight)
		draw_sprite_ext(global.sprBeamW, 1, x+lengthdir_x(15, gunangle), y+lengthdir_y(15, gunangle), 1, 1, gunangle-carbineangle, player_get_color(index), beamlight)
	}
	else {
		draw_sprite_ext(global.sprBeamW, 1, x+lengthdir_x(15, gunangle), y+lengthdir_y(15, gunangle), 1, 1, gunangle, c_white, beamlight)
	}
}
instance_destroy();