#define init
global.spr_hvDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAAFVBMVEUAAAAAAAA2BhA/GRNfLyZiCh2vHRKd2D17AAAAAXRSTlMAQObYZgAAAEJJREFUeNqFjkEKADAIw6at/v/J0w08OHA5pkFcP+TSBUBCrJYUUAUD8RjKku5gzp55xUcHMM2harNWv7enT/rfExu9OgF9GwydbwAAAABJRU5ErkJggg==", 0, 5);
global.spr_hvDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAAHlBMVEUAAAAAAAA2BhA/GRNMVl1fLyZiCh1seoSKlp6vHRJP95WDAAAAAXRSTlMAQObYZgAAAD9JREFUCNd9jkkOACAMAkW7/v/DLo2eWgmnCRBa+wnIGCTDAsctvd4OO0J0HFS8y2BWUrNlI9Tpart6UvxONAF9dwD7gne9bgAAAABJRU5ErkJggg==", 1, 7, 5);
global.msk_hvDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABFJREFUeAFjGBDAiAoYBggAAAh9ABADwZ23AAAAAElFTkSuQmCC", 1, 7, 5);
global.out_hvDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACxJREFUeAFjgABGRgYMwAgG2EUZIUyEPkYMABHFBAhRTHFiTcHqEjzuxuFLAESmAImP+AaqAAAAAElFTkSuQmCC", 1, 7, 5);

global.hvDartDrawer = noone;

#define weapon_name
return "HEAVY DARTS";
#define weapon_sprt
return global.spr_hvDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 20;
#define weapon_cost
return 8;
#define weapon_swap
return sndSwapSword;
#define weapon_area
return 14;
#define weapon_text
return "GET STUCK IN";

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_hvDart
	mask_index = global.msk_hvDart;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 15;
	
	damage = 30;
	knockback = 8;
	
	DartType = 0;
	
	DartStuck = false;
	DartStuTo = noone;
	DartSHurt = 30;
	DartStAng = 0;
	DartStDst = 0;
	
	DartOalpha = 0;

	Dartdecay = 600;

	script_bind_step(hvDartStep, 0, id);
	
	on_hit = script_ref_create(hvDartHurt);
	on_wall = script_ref_create(hvDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(0.7,0.9));
sound_play_pitchvol(sndMeleeFlip, random_range(0.9,1.1), 0.5);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.hvDartDrawer) {
		global.hvDartDrawer = instance_create(0, 0, CustomObject);
		with(global.hvDartDrawer){
			script_bind_draw(hvDartDraw, depth+0.1);
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

#define hvDartStep(Me)
with(Me) {
	if (!instance_exists(creator)) {
		creator = player_find(creatorindex);
	}

	if (DartStuck) {
		DartSHurt -= 1;
		
		if instance_exists(DartStuckTo) {
			x = DartStuckTo.x + lengthdir_x(DartStDst,DartStAng);
			y = DartStuckTo.y + lengthdir_y(DartStDst,DartStAng);
		} else {
			DartStuck = false;
		}
	
	} else if (DartType) {
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
		} else if (instance_exists(creator) && (creator.ammo[3] <= 47 + 44 * skill_get(10))) {
			if (instance_exists(Portal)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 2) {speed += 0.25;}
			}
			if (distance_to_object(creator) < 40 + 20*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 8;
					instance_destroy();
				}
			}
		} else {
			if ((instance_exists(creator)) && (Dartdecay > 150)) {Dartdecay = 150;}
		
			if (speed > 0) {
				speed -= 0.5;
			} else speed = 0;
		}
	} else {
		if (speed < 0.1) {
			DartType = 4;
		} else speed -= 0.75;
		
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			if instance_exists(target) {
				direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/20;
				image_angle = direction;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define hvDartHurt
if ((!DartType) && (other.team != team)) {
	if ((DartStuck) && (DartSHurt <= 0)) {
		projectile_hit(other, 5, 0, 0);
		DartSHurt = 30;
	} else if (!DartStuck) {
		projectile_hit(other, damage, knockback, direction);
		DartStuck = true;
		DartStuckTo = other;
		DartStAng = point_direction(other.x, other.y, x, y);
		DartStDst = distance_to_object(other);
		speed = 0;
	}
}

#define hvDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartType = 4;
speed = 0;

#define hvDartDraw
with instances_matching(CustomProjectile, "DartType", 4) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_hvDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "heavy darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 8, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/10;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_hvDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.5) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/10;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_hvDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.5) * right;
	}
}