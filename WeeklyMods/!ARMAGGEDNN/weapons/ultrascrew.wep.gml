global.ult = sprite_add_weapon("spr/ultradriver.png", 3, 2)
global.shank = sprite_add("spr/ushank.png",2, 1, 7)
#define weapon_name
return loc("!argdn:UltScrew", "ULTRA SCREWDRIVER");
#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 10;

#define weapon_sprt
return global.ult;

#define weapon_area
return 14;

#define weapon_swap
return sndSwapSword;

#define weapon_text
return "umm.. ok?";

#define weapon_rads
return 6;

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13);
sound_play(sndScrewdriver);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 10, __angle), y + lengthdir_y(__long_arms * 10, __angle), Shank)) {
	damage = 30
	sprite_index = global.shank
	motion_add(__angle + (random(10) - 5) * other.accuracy, 3 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 4);
weapon_post(-8, 12, 1);
