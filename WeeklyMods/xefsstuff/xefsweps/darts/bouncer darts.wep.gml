#define init
global.spr_bcDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAG1BMVEUAAAAAAAAaFyYtKzY2BhBOS11iCh2vHRL///+elZtSAAAAAXRSTlMAQObYZgAAADVJREFUeNptjEEOACAIw6wT+P+PhZh4QJft0JExPgIqXJTKcRo0zdKEO8UFyspX0O9t3/+/2jwZANaMYcryAAAAAElFTkSuQmCC", 0, 4);
global.spr_bcDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAG1BMVEUAAAAAAAAaFyYtKzY2BhBOS11iCh2vHRL///+elZtSAAAAAXRSTlMAQObYZgAAADJJREFUeNpti9EKADAIArtc9f9/PLaHQTRB8BTtJ+hUYK8lsxAcX66VHpLCxdjnv6WhDSiHAIzqhheHAAAAAElFTkSuQmCC", 1, 5, 4);
global.msk_bcDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABBJREFUeAFjoBwwQgEDNQAAAtwACXPJAB4AAAAASUVORK5CYII=", 1, 5, 4);
global.out_bcDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACRJREFUeAFjAAFGRgYkwAgCCFFGJADlIgA6nxHIx6MB03x0+wEYrABWIh3c/gAAAABJRU5ErkJggg==", 1, 5, 4);

global.bcDartDrawer = noone;

#define weapon_name
return "BOUNCER DARTS";
#define weapon_sprt
return global.spr_bcDartico;
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
return 10;
#define weapon_text
return "HARD TO CATCH";

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_bcDart
	mask_index = global.msk_bcDart;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 15;
	
	damage = 12;
	knockback = 2;
	
	DartType = 0;
	DartOalpha = 0;
	
	DartLast = noone;
	DartlaTm = 0;
	
	Dartdecay = 600;

	script_bind_step(bcDartStep, 0, id);
	
	on_hit = script_ref_create(bcDartHurt);
	on_wall = script_ref_create(bcDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(1.6,1.8));
sound_play_pitchvol(sndBouncerBounce, random_range(0.8,1), 0.5);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.bcDartDrawer) {
		global.bcDartDrawer = instance_create(0, 0, CustomObject);
		with(global.bcDartDrawer){
			script_bind_draw(bcDartDraw, depth+0.1);
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

#define bcDartStep(Me)
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
			if (distance_to_object(creator) < 50 + 25*skill_get(3)) {
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
				speed -= 0.3;
			} else speed = 0;
		}
		
	} else {
		if (DartlaTm) {
			if (DartlaTm = 1) {
				DartLast = noone;
			}
			DartlaTm -= 1;
		}
	
		if (speed < 0.1) {
			DartType = 7;
			speed = 0;
		} else speed -= 0.5;
		
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			if instance_exists(target) {
				direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/15;
				image_angle = direction;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define bcDartHurt
if ((!DartType) && (other.team != team) && DartLast != other) {
	projectile_hit(other, damage, knockback, direction);
	direction += 180 + random_range(-60, 60);
	image_angle = direction;
	sound_play_pitchvol(sndChickenThrow, speed/10, speed/30);
	speed *= 0.8;
	
	DartLast = other;
	DartlaTm = 5;
}

#define bcDartWall
move_bounce_solid(true);
image_angle = direction;
sound_play_pitchvol(sndChickenThrow, speed/10, speed/30);
speed *= 0.9;

#define bcDartDraw
with instances_matching(CustomProjectile, "DartType", 7) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_bcDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "bouncer darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 5, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_bcDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_bcDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
}