#define init
global.sprPocketProtector = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAANCAMAAABBwMRzAAAAJ1BMVEUAAAAdGhcyLisAAAAdGhcdGyMvLjQyLitITDxRUFh5fmuqr5f///9pq60rAAAAA3RSTlMAAAD6dsTeAAAAVElEQVR42l2OWwrAQAjErNlXd+9/3zqCLTQfYhjQMTN3R7iwhHF3tIQjxuiI0NnwzJ02Sb9g7ZjlBpyYn5/zepNvqDXv7QVeed3P/P8/oavfByLLPwYlAnRxFemnAAAAAElFTkSuQmCC", 0, 6.5);

#define weapon_name
return "BULLET SHIELD";

#define weapon_sprt
return global.sprPocketProtector;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_melee
return 0;

#define weapon_load
return 5;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 8;

#define weapon_text
return "POCKET PROTECTOR";

#define weapon_fire
wkick = 2;
sound_play_pitchvol(sndEmpty, 2 + 0.255*BPboost/10, 1.25);
sound_play_pitchvol(sndGunGun, 2 + 0.5*BPboost/10, 0.25);

BPboost += (10 - BPboost)/15;

#define step

if ("BPangle" not in self) {
	BPangle = random(360);
	BPboost = 0;
	BPflicker = 1;
}

BPangle += 1 + BPboost/5;
pbxt1 = x + lengthdir_x(25 - BPboost, BPangle);
pbyt1 = y + lengthdir_y(25 - BPboost, BPangle);

pbxt2 = x + lengthdir_x(25 - BPboost, BPangle + 180);
pbyt2 = y + lengthdir_y(25 - BPboost, BPangle + 180);

if (BPboost > 0) {BPboost -= 0.01;}

if (argument0) {
	if (BPflicker) {BPflicker = choose(1, 0.5);}
	else {BPflicker = 1;}
	script_bind_draw(draw_ghost, depth, id);
}
else {
	if "BPcapturefield1" not in self {
		BPcapturefield1 = noone;
		BPcapturefield2 = noone;
	}
	
	if (!instance_exists(BPcapturefield1)) BPcapturefield1 = instance_create(pbxt1, pbyt1, CustomObject);
	if (!instance_exists(BPcapturefield2)) BPcapturefield2 = instance_create(pbxt2, pbyt2, CustomObject);
	
	with (BPcapturefield1) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.pbxt1;
		y = other.pbyt1;
		
		Crange = (10 + other.BPboost + 2.5 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id)));
		
		with (projectile) if (damage > 1 && (team != other.team || ("Bcapturer" in self && Bcapturer = -1)) && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
			sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
			Bcapturer = other;
			team = other.team;
			alphabak = image_alpha;
			image_alpha = 0.5 / (1 + array_length(instances_matching(projectile, "Bcapturer", other.id)));
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
	
	with (BPcapturefield2) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.pbxt2;
		y = other.pbyt2;
		
		Crange = (10 + other.BPboost + 2.5 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id)));
		
		with (projectile) if (damage > 1 && (team != other.team || ("Bcapturer" in self && Bcapturer = -1)) && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
			sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
			Bcapturer = other;
			team = other.team;
			alphabak = image_alpha;
			image_alpha = 0.5 / (1 + array_length(instances_matching(projectile, "Bcapturer", other.id)));
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
}

if button_pressed(index,"swap"){
	with (projectile) if (("Bcapturer" in self) && (Bcapturer = other.BPcapturefield1 || (Bcapturer = other.BPcapturefield2))) {
		Bcapturer = -1;
		image_alpha = alphabak;
	}
	with (BPcapturefield1) {instance_destroy();}
	with (BPcapturefield2) {instance_destroy();}
}

#define draw_ghost(Me)
with(Me) {
	draw_set_alpha(0.3 * image_alpha * BPflicker);
	draw_circle_colour(pbxt1+random_range(-0.25,0.25),pbyt1+random_range(-0.25,0.25),8 + BPboost + 2.5 * skill_get(13),player_get_color(index),player_get_color(index),0);
	draw_circle_colour(pbxt2+random_range(-0.25,0.25),pbyt2+random_range(-0.25,0.25),8 + BPboost + 2.5 * skill_get(13),player_get_color(index),player_get_color(index),0);
	draw_set_alpha(1);
}
instance_destroy();

#define draw_radius(Me)
with(Me) if instance_exists(owner) {
	drawtarget += (Crange - drawtarget)/10;
	draw_set_alpha(0.075 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_add);
	draw_set_alpha(0.15 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget-2,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_normal);
	draw_set_alpha(1);
}
instance_destroy();