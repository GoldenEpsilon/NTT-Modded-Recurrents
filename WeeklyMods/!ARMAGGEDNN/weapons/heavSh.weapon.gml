global.sprHSH = sprite_add_weapon("spr/sprHSH.png", 8, 7);
#define weapon_name
return loc("!argdn:HeavySh", "HEAVY SHOVEL");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 48;

#define weapon_sprt
return global.sprHSH;

#define weapon_area
return 6;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "hard dig";
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play(sndShovel);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), Slash)) {
	sprite_index = sprHeavySlash;
	damage = 22;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle + 60 * accuracy), Slash)) {
	sprite_index = sprHeavySlash;
	damage = 22;
	motion_add(__angle + 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle - 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle - 60 * accuracy), Slash)) {
	sprite_index = sprHeavySlash;
	damage = 22;
	motion_add(__angle - 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

