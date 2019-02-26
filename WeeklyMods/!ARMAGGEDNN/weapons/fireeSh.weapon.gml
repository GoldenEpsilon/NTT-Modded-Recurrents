global.sprFSH = sprite_add_weapon("spr/sprFSH.png", 8, 7);
global.sprFSHS = sprite_add("spr/zFlameSlash.png", 3, 0, 24);
#define weapon_name
return loc("!argdn:InfernoSh", "FLAME SHOVEL");

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 2;

#define weapon_load
return 35;

#define weapon_sprt
return global.sprFSH;

#define weapon_area
return 11;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "flame dig";

#define weapon_melee
return 1;

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play(sndShovel);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), Slash)) {
	sprite_index = global.sprFSHS;
	damage = 14;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle + 60 * accuracy), Slash)) {
	sprite_index = global.sprFSHS;
	damage = 14;
	motion_add(__angle + 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle - 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle - 60 * accuracy), Slash)) {
	sprite_index = global.sprFSHS;
	damage = 14;
	motion_add(__angle - 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
sound_play(sndDoubleFireShotgun);
repeat (35) {
	with (instance_create(x, y, Flame)) {
		motion_add(__angle + (random(120) - 55) * other.accuracy, 7);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

with (enemy) {
	if place_meeting(x,y,Slash) {
		repeat (2) with instance_create(x,y,FlameShell) {
		}
	}
}
