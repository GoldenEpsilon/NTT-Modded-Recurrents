global.sprASH = sprite_add_weapon("spr/sprASH.png",14,7);
#define weapon_name
return loc("!argdn:AutoSh", "AUTO SHOVEL");

#define weapon_type
return 0;

#define weapon_auto
return 1;

#define weapon_cost
return 0;

#define weapon_load
return 15;

#define weapon_sprt
return global.sprASH;

#define weapon_area
return 4;

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
	damage = 6;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle + 60 * accuracy), Slash)) {
	damage = 6;
	motion_add(__angle + 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

