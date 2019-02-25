#define init
global.spr_gnDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABIAAAALCAMAAABFyS02AAAAJFBMVEUAAAAAAAAcIiYuNz42BhA/GRNMVl1fLyZiCh1seoSvHRL///+8erNVAAAAAXRSTlMAQObYZgAAAE9JREFUeNp1jkEOACEIA4VKQf//4N2geDH2QpiUlvaSLP3z7AaSMJFIKCCcYwy69DkTmdtGnCGtUB46osdyWblQLoXu+MyqRgWgp/H+69YH35ACFWuWuOcAAAAASUVORK5CYII=", 0, 5);
global.spr_gnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAALCAMAAABFyS02AAAAJFBMVEUAAAAAAAAuNz42BhA/GRNMVl1fLyZiCh1seoSKlp6vHRL///8vuyngAAAAAXRSTlMAQObYZgAAAEhJREFUeAF1jlsOhEAIBLdmeN//wIvRRBK1i69KB/i9B3pgCgcih6RqI2Ymdw8vzcY4cprtKxsTjdDL1YpmtOaueVEDeP71nT+bVQFxbiYT8wAAAABJRU5ErkJggg==", 1, 5, 5);
global.msk_gnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAALCAMAAABFyS02AAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABZJREFUeAFjoAwwggABIUYEIEIjpQAADZwAIElgby8AAAAASUVORK5CYII=", 1, 5, 5);
global.out_gnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAALCAMAAABFyS02AAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAChJREFUeAFjAAJGRiACEnDAiABwEQwxRjSAXYwRAxCjCt0onO7CdD0AO3wAj91BPXwAAAAASUVORK5CYII=", 1, 5, 5);

global.gnDartDrawer = noone;

#define weapon_name
return "GUN DARTS";
#define weapon_sprt
return global.spr_gnDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 10;
#define weapon_cost
return 5;
#define weapon_swap
return sndSwapSword;
#define weapon_area
return 6;
#define weapon_text
return "BUT WHY DOES IT EXIST";

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_gnDart
	mask_index = global.msk_gnDart;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 14;
	
	damage = 10;
	knockback = 2;
	
	DartType = 0;
	DartOalpha = 0;
	
	if (creator.ammo[1] >= 8) {
		DartAmmo = 32;
		creator.ammo[1] -= 8;
	} else {
		DartAmmo = 0;
	}

	Dartdecay = 600;

	script_bind_step(gnDartStep, 0, id);
	
	on_hit = script_ref_create(gnDartHurt);
	on_wall = script_ref_create(gnDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(1,1.2));
sound_play_pitchvol(sndSwapPistol, random_range(1.2,1.6), 0.25);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.gnDartDrawer) {
		global.gnDartDrawer = instance_create(0, 0, CustomObject);
		with(global.gnDartDrawer){
			script_bind_draw(gnDartDraw, depth+0.1);
		}
	}
	
	wkick = 1000;
	
	// should stop the crossbow reload sound from playing
	if ("reloadsoundfix" not in self) {
		reloadsoundfix = 0;
	}
	if ((reload < 1) && (reloadsoundfix < 5)) {
		sound_play_pitchvol(sndCrossReload, 100, 0);
		reloadsoundfix += 1;
	}
	
} else if (wkick = 998) {wkick = 0}

#define gnDartStep(Me)
with(Me) {
	if (!instance_exists(creator)) {
		creator = player_find(creatorindex);
	}

	if (DartType) {
		if (DartOalpha < 1) {
			DartOalpha += 0.1;
		}
		
		Dartdecay -= 1;
		if (Dartdecay <= 0) {
			repeat(3) with instance_create(x,y,Dust) {
				speed = random(3);
				direction = random(360);
			}
			instance_destroy();
		} else if (instance_exists(creator) && (creator.ammo[3] <= 50 + 44 * skill_get(10))) {
			if (instance_exists(Portal)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 2) {speed += 0.25;}
			}
			if (distance_to_object(creator) < 40 + 20*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 5;
					if (creator.ammo[1] <= 255 + 555 * skill_get(10) - round(DartAmmo / 4)) {
						creator.ammo[1] += round(DartAmmo / 4);
					}
					instance_destroy();
				}
			}
		} else {
			if ((instance_exists(creator)) && (Dartdecay > 150)) {Dartdecay = 150;}
		
			if (speed > 0) {
				speed -= 1;
			} else speed = 0;
		}
	} else {
		repeat(2) if (random(2) <= 1) {
			if (DartAmmo > 0) {
			with instance_create(x,y,Bullet2) {
				creator = other.creator;
				team = other.team;
				
				direction = other.direction + 90 * choose(-1,1);
				image_angle = direction
				
				image_xscale = 0.75;
				image_yscale = 0.75;
				
				speed = 8;
			}
			sound_play_gun(sndMachinegun, 0.5, 0.6);
			DartAmmo -= 1;
			} 
			sound_play_pitchvol(sndEmpty, random_range(1,1.2), 0.25);
		}
	
		if (speed < 0.1) {
			DartType = 5;
			speed = 0;
		} else speed -= 0.75;
		
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			if instance_exists(target) {
				direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/5;
				image_angle = direction;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define gnDartHurt
if ((!DartType) && (other.team != team)) {
	projectile_hit(other, damage, knockback, direction);
	DartType = 5;
	speed = 0;
}

#define gnDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartType = 5;
speed = 0;

#define gnDartDraw
with instances_matching(CustomProjectile, "DartType", 5) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_gnDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "gun darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 5, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_gnDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_gnDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
}