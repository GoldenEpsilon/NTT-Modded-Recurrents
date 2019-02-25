#define init
global.sprBullet_Pike = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAADgAAAASCAMAAAA5b+18AAAAM1BMVEUAAAAdGyMvLjRITDxRUFh5fmuqr5cAAAAdGhcdGyMvLjQyLitITDxRUFh5fmuqr5f///8QsVbJAAAAB3RSTlMAAAAAAAAAVWTqWAAAANJJREFUeAG9k1FOxDAMRJ1COo1xxve/LbFRBIXslvLBi6VdRRm9OnXlBhjIfSrozj8kdzjg/xZEwAgGv296g2oDCQc5GwWaKqRsm2w/PPLBK3pXRCycniKQ2juWkJj03s3cDIwfEgL3sXm8xfrG4R67ucYZgEgYlUbVYwl5TFQVcCQWJTCLHpeYYaLa8hmdPqAhL6c1SClFyqPLKXHmqxGPXkfdqwSnIJlTF7qn1MFpADxqYVkbzyN3OeRV9mmcVBAwXMUiGH8+eYENLoJ7Gp9+yO+SdQ6rM3a1pAAAAABJRU5ErkJggg==", 25, 9);

#define weapon_name
return "BULLET TRIDENT";

#define weapon_sprt
return global.sprBullet_Pike;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_melee
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 18;

#define weapon_text
return "I'MA PULL YOU TO THIS BULLET AND PUT IT THROUGH YOU";

#define weapon_fire
wkick = -32;
sound_play_pitch(sndChickenThrow, 0.75);

#define step

if (argument0 || (race = "steroids" && wep != "bullet trident")) {
	if "BHcapturefield0" not in self {
		BHcapturefield0 = noone;
		BHcapturefield1 = noone;
		BHcapturefield2 = noone;
	}
	
	if (!instance_exists(BHcapturefield0)) BHcapturefield0 = instance_create(x + lengthdir_x(abs(wkick) + 50, gunangle), y + lengthdir_y(abs(wkick) + 50, gunangle), CustomObject);
	if (!instance_exists(BHcapturefield1)) BHcapturefield1 = instance_create(x + lengthdir_x(abs(wkick) + 35, gunangle - 20), y + lengthdir_y(abs(wkick) + 35, gunangle - 20), CustomObject);
	if (!instance_exists(BHcapturefield2)) BHcapturefield2 = instance_create(x + lengthdir_x(abs(wkick) + 35, gunangle + 20), y + lengthdir_y(abs(wkick) + 35, gunangle + 20), CustomObject);
	
	with (BHcapturefield0) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.x + lengthdir_x(abs(other.wkick) + 40, other.gunangle);
		y = other.y + lengthdir_y(abs(other.wkick) + 40, other.gunangle);
		
		Crange = (15 + 5 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id))/2.5);
		
		with (projectile) if (damage > 1 && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
			sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
			Bcapturer = other;
			team = other.team;
			if ("bIncd" not in self) {
				damage *= 2;
				bIncd = 1;
			}
		}
		
		with instances_matching(projectile, "Bcapturer", id) {
			direction = point_direction(x,y,other.x,other.y);
			image_angle += damage;
			speed = point_distance(x, y, other.x,other.y)/2;
		}
		
		script_bind_draw(draw_radius, depth, id);
	}
	
	with (BHcapturefield1) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.x + lengthdir_x(abs(other.wkick) + 35, other.gunangle - 20);
		y = other.y + lengthdir_y(abs(other.wkick) + 35, other.gunangle - 20);
		
		Crange = (7.5 + 2.3 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id))/2);
		
		with (projectile) if (damage > 1 && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
			sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
			Bcapturer = other;
			team = other.team;
			if ("bIncd" not in self) {
				damage *= 2;
				bIncd = 1;
			}
		}
		
		with instances_matching(projectile, "Bcapturer", id) {
			direction = point_direction(x,y,other.x,other.y);
			image_angle += damage;
			speed = point_distance(x, y, other.x,other.y)/2;
		}
		
		script_bind_draw(draw_radius, depth, id);
	}
	
	with (BHcapturefield2) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.x + lengthdir_x(abs(other.wkick) + 35, other.gunangle + 20);
		y = other.y + lengthdir_y(abs(other.wkick) + 35, other.gunangle + 20);
		
		Crange = (7.5 + 2.3 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id))/2);
		
		with (projectile) if (damage > 1 && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
			sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
			Bcapturer = other;
			team = other.team;
			if ("bIncd" not in self) {
				damage *= 2;
				bIncd = 1;
			}
		}
		
		with instances_matching(projectile, "Bcapturer", id) {
			direction = point_direction(x,y,other.x,other.y);
			image_angle += damage;
			speed = point_distance(x, y, other.x,other.y)/2;
		}
		
		script_bind_draw(draw_radius, depth, id);
	}

	if (wkick < 0) {
		wkick -= 0.75;
		wkick += (32 - abs(wkick))/10;
	}
	
}
else if ((wep != "bullet trident") && (bwep != "bullet trident")){
	with (projectile) if ("Bcapturer" in self && Bcapturer = other) {
		Bcapturer = -1;
	}
}

if button_pressed(index,"swap"){
	with (projectile) if (("Bcapturer" in self) && (Bcapturer = other.BHcapturefield0 || Bcapturer = other.BHcapturefield1 || Bcapturer = other.BHcapturefield2)) {
		Bcapturer = -1;
	}
	with (BHcapturefield0) {instance_destroy();}
	with (BHcapturefield1) {instance_destroy();}
	with (BHcapturefield2) {instance_destroy();}
}

#define draw_radius(Me)
with(Me) if instance_exists(owner) {
	drawtarget += (Crange - drawtarget)/10;
	draw_set_alpha(0.1 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_add);
	draw_set_alpha(0.2 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget-2,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_normal);
	draw_set_alpha(1);
}
instance_destroy();