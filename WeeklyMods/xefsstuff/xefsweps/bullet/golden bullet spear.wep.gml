#define init
global.sprGold_Bullet_Spear = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACkAAAAKCAMAAAAehodcAAAAKlBMVEUAAAAWEx8vLjdfXmkAAAAWEx8vLjc2BhBAIgJfXmliCh2oaxnhnjL///8T7CvCAAAABHRSTlMAAAAAs5NmmgAAAIBJREFUeAGNkNsOgzAMQ4G5uWD///cupNN4WIVm67ykR4rS7SEAmofJsTewgSDRmZ4ZKN7q62iQhrhaOlEilQkh8JNMESwAlSmV6fLTz298NhOEplWQNHP6ImbttVUgOMZ6u40QWPT2UjEGGXFftO9NzcGr1OdezGxLU7xf//z5N5FABsqQbmWwAAAAAElFTkSuQmCC", 20, 5);

#define weapon_name
return "GOLDEN BULLET SPEAR";

#define weapon_sprt
return global.sprGold_Bullet_Spear;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_melee
return 0;

#define weapon_load
return 25;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 24;

#define weapon_text
return "COPPER COILS";

#define weapon_gold
return 1;

#define weapon_fire
wkick = -27;
sound_play_pitchvol(sndSwapGold, 1, 0.25);
sound_play_pitch(sndChickenThrow, 0.8);

#define step

if (argument0 || (race = "steroids" && wep != "golden bullet spear")) {
	if "BScapturefield" not in self {
		BScapturefield = noone;
	}
	
	if (!instance_exists(BScapturefield)) BScapturefield = instance_create(x + lengthdir_x(abs(wkick) + 30, gunangle), y + lengthdir_y(abs(wkick) + 30, gunangle), CustomObject);
	
	with (BScapturefield) if (instance_exists(other)) {
		if ("drawtarget" not in self) {
			drawtarget = 0;
			team = other.team;
			owner = other;
		}
	
		image_alpha = other.image_alpha;
		x = other.x + lengthdir_x(abs(other.wkick) + 30, other.gunangle);
		y = other.y + lengthdir_y(abs(other.wkick) + 30, other.gunangle);
		
		Crange = (15 + 5 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id))*0.75);
		
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
		wkick += (27 - abs(wkick))/10;
	}
	
}
else if ((wep != "golden bullet spear") && (bwep != "golden bullet spear")){
	with (projectile) if ("Bcapturer" in self && Bcapturer = other.BScapturefield) {
		Bcapturer = -1;
	}
	with (BScapturefield) {instance_destroy();}
}

if button_pressed(index,"swap"){
	with (projectile) if ("Bcapturer" in self && Bcapturer = other.BScapturefield) {
		Bcapturer = -1;
	}
	with (BScapturefield) {instance_destroy();}
}

#define draw_radius(Me)
with(Me) if instance_exists(owner) {
	if (drawtarget = 0) sound_play(sndSwapGold);
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