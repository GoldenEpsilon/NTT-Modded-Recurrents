#define init
global.sprSnpP0 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAJCAMAAAAB6ixHAAAAJ1BMVEUAAAAAAAAcIiYuNz4/GRNMVl1UOhhfLyZseoSBaSKKlp7LpzrfyYYumh8+AAAAAXRSTlMAQObYZgAAAFZJREFUeNpNjgEKwCAMxFbPW131/+/drVhmUCkhYK/C/knUcBAxto4BYkQCkrZL915xg5nK7nI6uklTW/prg5PEWrLSyiTz4xtozyzdLderf4418zl4AdUYAfhuk2ubAAAAAElFTkSuQmCC", 3, 1);
global.sprSnpP1 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAJCAMAAAAB6ixHAAAAJFBMVEUAAAAAAAAcIiYuNz4/GRNMVl1fLyZseoSBaSKKlp7fyYb///9fdH+WAAAAAXRSTlMAQObYZgAAAFRJREFUeNpNjgkKACEMA409tP7/wZu1FR1EQhhI2wE3kQovEaPqGGIyYiNmhjLdFUUXgKY6Oz71pNM99e+GwWSt3AM1ljksfc6aU6pt189tGfN7+AC+WwG5RXCmogAAAABJRU5ErkJggg==", 3, 1);
global.sprSnpP2 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAJCAMAAAAB6ixHAAAAJ1BMVEUAAAAAAAAcIiYuNz4/GRNMVl1fLyZseoSBaSKKlp7LpzrfyYb///8VzMgnAAAAAXRSTlMAQObYZgAAAFRJREFUeNpNjgkKwDAIBGO8Yvv//3YjSh1iWJZBXA39CVSYRHjV4azskbCqUplm0vJmIphi6PAwyYbb9XVDiZ9X4QKCJhnvgnMYMWuoK+txW8X8Bh++uAG69pTKEQAAAABJRU5ErkJggg==", 3, 1);
global.sprSnpP3 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAJCAMAAAAB6ixHAAAAJ1BMVEUAAAAAAAAcIiYuNz4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr///+2EgEzAAAAAXRSTlMAQObYZgAAAFRJREFUeNpNjgEKwCAMxDzbW139/3/X1YoGkSMEtG1wVlDjxn2U9iGU4YmQRJVmiqILEKVauDhqix7t1n/rxJzkeg+RaU4AzyuCVlrRUl9/q5nXxQfOYgHcms3CrAAAAABJRU5ErkJggg==", 3, 1);
global.sprSnpP4 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAJCAMAAAAB6ixHAAAAJ1BMVEUAAAAAAAAcIiYuNz4/GRNMVl1UOhhfLyZseoSKlp7LpzrfyYb///+T+pZ5AAAAAXRSTlMAQObYZgAAAFVJREFUeNpNjgEOwCAIA4cFFff//64wiV6UkEsDPIWcjlRz4T639gnD9ARmJjs5hla4IWaIDjo+/qQxWzqybmtxwEsbWmNALu4dwCqtkufVnnPmXy4+zlsB6ahL8cQAAAAASUVORK5CYII=", 3, 1);

global.sprSnpPmsk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAMAAAAoyzS7AAAAA1BMVEUAAACnej3aAAAACklEQVQI12NgAAAAAgAB4iG8MwAAAABJRU5ErkJggg==", 1, 0, 0);

global.SnpPGlower = noone;

#define weapon_name
return "FLASHLIGHT";

#define weapon_sprt

with(self) if (instance_exists(Player)) && ("wep" in self) && ((wep = "flashlight") || (bwep = "flashlight")) && ("SnpPframe" in self){
	if (SnpPframe = 0) return global.sprSnpP0;
	else if (SnpPframe = 1) return global.sprSnpP1;
	else if (SnpPframe = 2) return global.sprSnpP2;
	else if (SnpPframe = 3) return global.sprSnpP3;
	else if (SnpPframe = 4) return global.sprSnpP4;
}
else return global.sprSnpP0;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 16;

#define weapon_text
return "DYNAMIC INTERIA TECHNOLOGY";

#define weapon_fire

if ((ammo[5] >= 5) || (SnpPpause > 0)) {
	if (SnpPcount = 0) {ammo[5] -= 5;}
	SnpPpause = 15;
	SnpPcount += ((30 + 10*skill_get(17)) - SnpPcount)/(25 - 15*((maxhealth-my_health)/maxhealth)*skill_get(22));
}

#define step

if (argument0) {
	if "SnpPspeed" not in self {
		SnpPframe = 0;
		SnpPspeed = 0;
		SnpPpause = -1;
		SnpPcount = 0;
		SnpPlength = 0;
	}
	
	if (SnpPcount/10 < 1) {SnpPspeed += SnpPcount/10;}
	else {SnpPspeed += 1;}
	if (SnpPspeed >= 4) {
		SnpPspeed -= 4;
		sound_play_pitchvol(sndEmpty, 4 + SnpPcount/10, 0.5 + 0.25 * SnpPcount);
	}
	SnpPframe = round(SnpPspeed)
	
	if (SnpPpause = 0) {
		weapon_post(1 + SnpPcount/2.5, SnpPcount/2.5, SnpPcount/5);
		sound_play_pitchvol(sndExplosion, 1 - SnpPcount/50, 0.25 + SnpPcount/25);
		if (SnpPcount > 25) {
			sound_play_pitchvol(sndPlasma, 5 - SnpPcount/25, 1 + SnpPcount/25);
			sound_play_pitchvol(sndLightningRifle, 2 - SnpPcount/40, 0.5 + SnpPcount/40);
		}
		else {
			sound_play_pitchvol(sndPlasmaUpg, 5 - SnpPcount/25, 1 + SnpPcount/25);
			sound_play_pitchvol(sndLightningRifleUpg, 2 - SnpPcount/40, 0.5 + SnpPcount/40);
		}
		
		SnpPlength = 0;
		while ((!collision_line(x, y, x+lengthdir_x(SnpPlength,gunangle), y+lengthdir_y(SnpPlength,gunangle), Wall, 0, 1)) && (SnpPlength < 500)) {
			SnpPlength += 5;
		}
		
		var flamemaker = 0;
		while (flamemaker < SnpPlength) {
			flamemaker += 5;
			with instance_create(x+lengthdir_x(flamemaker,gunangle),y+lengthdir_y(flamemaker,gunangle),Flame) {
				team = other.team;
				direction = random(360);
				speed = random(2);
				image_xscale = 0.8 + 0.5*(other.SnpPcount/30);
				image_yscale = 0.8 + 0.5*(other.SnpPcount/30);
				damage = 1.5 + (other.SnpPcount/50);
			}
		}
		
		with instance_create(x,y,CustomProjectile) {
			SnpPlength = other.SnpPlength;
			SnpPcharge = other.SnpPcount;
			team = other.team
			image_angle = other.gunangle;
			mask_index = global.sprSnpPmsk;
			image_xscale = other.SnpPlength;
			image_yscale = 2+(SnpPcharge/10);
			owner = other;
			lifetime = 5;
			script_bind_step(SnpPstep, 0, id);
			
			on_hit = script_ref_create(hurt);
			on_wall = script_ref_create(nothing);
		}
		with instance_create(x,y,CustomProjectile) {
			SnpPlength = other.SnpPlength;
			SnpPcharge = other.SnpPcount;
			team = other.team
			image_angle = other.gunangle;
			mask_index = global.sprSnpPmsk;
			image_xscale = other.SnpPlength;
			image_yscale = -2-(SnpPcharge/10);
			owner = other;
			lifetime = 5;
			script_bind_step(SnpPstep, 0, id);
			
			on_hit = script_ref_create(hurt);
			on_wall = script_ref_create(nothing);
		}
		
		if !instance_exists(global.SnpPGlower) {
			global.SnpPGlower = instance_create(0, 0, CustomObject);
			with(global.SnpPGlower){
				script_bind_draw(draw_SnpPglow, depth-0.1);
			}
		}
		
		SnpPcount = 0;
	}
	if (SnpPpause >= -1) {
		SnpPpause -= 1;
	}
}
else if (wep != "flashlight") {
	SnpPpause = -1;
	SnpPcount = 0;
}

#define SnpPstep(Me)
with(Me){
	
	if (lifetime <= 0) {
		instance_destroy();
	} else {
		lifetime -= 1;
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define draw_SnpPglow
with(CustomProjectile) if ("SnpPcharge" in self) {
	draw_set_blend_mode(bm_add);
	draw_set_alpha(0.1);
	draw_line_width_colour(x, y, x+lengthdir_x(SnpPlength,image_angle), y+lengthdir_y(SnpPlength,image_angle), (8+(SnpPcharge/4))*(lifetime/5)*3, c_red, c_red);
	
	draw_set_alpha(0.5);
	draw_line_width_colour(x, y, x+lengthdir_x(SnpPlength,image_angle), y+lengthdir_y(SnpPlength,image_angle), (7.5+(SnpPcharge/4))*(lifetime/5), c_red, c_red);
	
	draw_set_alpha(5);
	draw_line_width_colour(x, y, x+lengthdir_x(SnpPlength,image_angle), y+lengthdir_y(SnpPlength,image_angle), (6+(SnpPcharge/4))*(lifetime/5), c_orange, c_orange);
	draw_line_width_colour(x, y, x+lengthdir_x(SnpPlength,image_angle), y+lengthdir_y(SnpPlength,image_angle), (4+(SnpPcharge/4))*(lifetime/5), c_white, c_white);
	
	draw_set_blend_mode(bm_normal);
	draw_set_alpha(1);
}

#define hurt
if (lifetime = 5) projectile_hit(other, SnpPcharge*2, 0, 0)

#define nothing