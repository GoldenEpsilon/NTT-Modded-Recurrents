global.uapoll = sprite_add_weapon("spr/ucaber.png", 5, 5)

#define weapon_name
return loc("!argdn:Ullapoll", "ULLAPOLL CABER");

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 4;

#define weapon_load
return 45;

#define weapon_sprt
return global.uapoll;

#define weapon_area
return 1;

#define weapon_swap
return sndSwapSword;

#define weapon_melee
return true;

#define weapon_text
return "A sober person would throw it...";

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13);
sound_play(sndScrewdriver);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 10, __angle), y + lengthdir_y(__long_arms * 10, __angle), Shank)) {
	damage = 1
	image_speed = 1.2
	motion_add(__angle + (random(10) - 5) * other.accuracy, 3 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 4);
weapon_post(-8, 12, 1);

#define step
with enemy {
	if place_meeting(x,y,Shank)
		instance_create(x,y,Nuke)
		}
