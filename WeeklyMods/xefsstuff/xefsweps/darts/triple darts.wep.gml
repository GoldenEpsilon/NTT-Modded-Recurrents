#define init
global.spr_tpDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABAAAAAJCAMAAAAM9FwAAAAAJFBMVEUAAAAuNz42BhA/GRNfLyZiCh2vHRIAAAAaFyYtKzZOS13fyYYDmi4+AAAAB3RSTlMAAAAAAAAAVWTqWAAAAD1JREFUeNpljEkSACEMAuMWCP9/sBq9zNic6KKw4sO+VHfDJcVulAISTo9gLMEVIIWOkEi8i/cjwaX3Zn8m0/8Ct0xBe0wAAAAASUVORK5CYII=", 0, 4);
global.spr_tpDartBundle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAJCAMAAAAM9FwAAAAAG1BMVEUAAAAAAAAaFyYcIiYtKzYuNz5MVl1OS11seoRLYXd4AAAAAXRSTlMAQObYZgAAADVJREFUCNdtjUsSACAIQhU/eP8TZ1ObJh87YEBkQJvXIPVyckfLK6tyOwqQQFiEzY1vY3h5WEE2ANrUNSyFAAAAAElFTkSuQmCC", 1, 5, 4);
global.spr_tpDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAHCAMAAADgW+cVAAAAFVBMVEUAAAAAAAAaFyYtKzZMVl1OS11seoTTdXOcAAAAAXRSTlMAQObYZgAAACVJREFUeAFjwASMQIDCZ2VlhAIwl5kJCJnZWNjYWBjR5BH6cQEAFE8AWw2XmkcAAAAASUVORK5CYII=", 1, 5, 3);
global.msk_tpDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABBJREFUeAFjoBwwQgEDNQAAAtwACXPJAB4AAAAASUVORK5CYII=", 1, 5, 4);
global.out_tpDartBundle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAJCAMAAAAM9FwAAAAAFVBMVEUAAAAaFyYtKzZMVl1OS11seoT///9rvQ1PAAAABnRSTlMAAAAAAABupgeRAAAALElEQVR4AWNgYGFhAwIGOGBiZIMCmDgbCoDzESJshFRgmAEEaHxWZlYUdwAAyDoCm5uGgMMAAAAASUVORK5CYII=", 1, 5, 4);
global.out_tpDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAHCAMAAADgW+cVAAAADFBMVEUAAABiCh2vHRL///9aITZ8AAAAA3RSTlMAAAD6dsTeAAAAIUlEQVQI12NgYGAGAgYEYEYC6HxmNC6GABb9CPMZmRgYADDaAN9OZfKzAAAAAElFTkSuQmCC", 1, 5, 3);

global.tpDartDrawer = noone;

#define weapon_name
return "TRIPLE DARTS";
#define weapon_sprt
return global.spr_tpDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 10;
#define weapon_cost
return 9;
#define weapon_swap
return sndSwapSword;
#define weapon_area
return 13;
#define weapon_text
return "MIGHT POKE AN EYE OUT";

#define weapon_fire
tempindex = index;
tpDartSplit = gunangle - (15 - 10*skill_get(19));
repeat(3) {
	with instance_create(x,y,CustomProjectile) {
		creator = other;
		creatorindex = creator.tempindex;
		team = other.team;

		sprite_index = global.spr_tpDart
		mask_index = global.msk_tpDart;
		
		direction = other.tpDartSplit;
		image_angle = direction;
		speed = 15;
		
		damage = 10;
		knockback = 2;
		
		DartType = 0;
		DartOalpha = 0;

		Dartdecay = 600;

		script_bind_step(tpDartStep, 0, id);
		
		on_hit = script_ref_create(tpDartHurt);
		on_wall = script_ref_create(tpDartWall);
	}
	tpDartSplit += (15 - 10*skill_get(19));
}


sound_play_pitch(sndChickenThrow, random_range(1.5,1.7));
sound_play_pitchvol(sndDiscBounce, random_range(1.2,1.4), 0.25);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.tpDartDrawer) {
		global.tpDartDrawer = instance_create(0, 0, CustomObject);
		with(global.tpDartDrawer){
			script_bind_draw(tpDartDraw, depth+0.1);
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

#define tpDartStep(Me)
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
		} else if (instance_exists(creator) && (creator.ammo[3] <= 52 + 44 * skill_get(10))) {
			if (instance_exists(Portal)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 2) {speed += 0.25;}
			}
			if (distance_to_object(creator) < 50 + 25*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 3;
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
			DartType = 3;
		} else speed -= 0.75;
		
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

#define tpDartHurt
if ((!DartType) && (other.team != team)) {
	projectile_hit(other, damage, knockback, direction);
	DartType = 3;
	speed = 0;
}

#define tpDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartType = 3;
speed = 0;

#define tpDartDraw
with instances_matching(CustomProjectile, "DartType", 3) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_tpDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "triple darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 9, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_tpDartBundle,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_tpDartBundle,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
}