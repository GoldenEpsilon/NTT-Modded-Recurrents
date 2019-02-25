#define init
global.spr_yrDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAM1BMVEUAAAAuNz42BhA/GRNMVl1fLyZiCh1seoSvHRIAAAARS6wWYd8aFyYfcv8tKzZOS13fyYbsFMLQAAAACXRSTlMAAAAAAAAAAABzZJuhAAAASUlEQVR42l3NSRLAIAgEwIkEImDg/78NerFMn5hiwwUQMxFTF5TnxqQTdmmh7rpiZMZ4c7gpU+Us4TmsBgjt1+9y7kuT4/76un3+2gN1wh78MAAAAABJRU5ErkJggg==", 0, 4);
global.spr_yrDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAFVBMVEUAAAAAAAARS6wWYd8aFyYtKzZOS13zH8KQAAAAAXRSTlMAQObYZgAAAC5JREFUeAFjwAIYGRlRuMzMqHwmZqACRhCASjOxsDKysrGxsTKiycP1Y5iPCwAAG8gAYaVwZOIAAAAASUVORK5CYII=", 1, 5, 4);
global.msk_yrDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABBJREFUeAFjoBwwQgEDNQAAAtwACXPJAB4AAAAASUVORK5CYII=", 1, 5, 4);
global.out_yrDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACRJREFUeAFjAAJGRkYGJMAIAmhcRoQoIzIAcfEJoOnHNB/dfgAXBABQKpXywwAAAABJRU5ErkJggg==", 1, 5, 4);

global.yrDartDrawer = noone;

#define weapon_name
return "HYPER DARTS";
#define weapon_sprt
return global.spr_yrDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 8;
#define weapon_cost
return 5;
#define weapon_swap
return sndSwapSword;
#define weapon_area
return 14;
#define weapon_text
return "FETCH";

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_yrDart
	mask_index = global.msk_yrDart;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 18;
	
	damage = 15;
	knockback = 2;
	
	DartType = 0;
	
	DartWarpTm = 30;
	DartOalpha = 0;

	Dartdecay = 600;

	script_bind_step(yrDartStep, 0, id);
	
	on_hit = script_ref_create(yrDartHurt);
	on_wall = script_ref_create(yrDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(2,2.2));
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.yrDartDrawer) {
		global.yrDartDrawer = instance_create(0, 0, CustomObject);
		with(global.yrDartDrawer){
			script_bind_draw(yrDartDraw, depth+0.1);
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

#define yrDartStep(Me)
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
			DartWarpTm -= 1;
			direction = point_direction(x,y,creator.x,creator.y);
			if (speed < 2) {speed += 0.05;}
			if (DartWarpTm <= 0) {
				x = creator.x;
				y = creator.y;
				DartWarpTm = 60;
				sound_play_pitchvol(sndHyperLauncher, random_range(1.8,2), 0.25);
			}
			
			if (instance_exists(Portal)) {
				x = creator.x;
				y = creator.y;
				sound_play_pitchvol(sndHyperLauncher, random_range(1.8,2), 0.25);
			}
			if (distance_to_object(creator) < 40 + 20*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 5;
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
			DartType = 2;
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

#define yrDartHurt
if ((!DartType) && (other.team != team)) {
	projectile_hit(other, damage, knockback, direction);
	DartType = 2;
	speed = 0;
}

#define yrDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartType = 2;
speed = 0;

#define yrDartDraw
with instances_matching(CustomProjectile, "DartType", 2) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_yrDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "hyper darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 5, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_yrDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_yrDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
}