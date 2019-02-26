global.sprLSH = sprite_add_weapon("spr/sprLSH.png", 8, 7);
#define weapon_name
return loc("!argdn:LightninSh", "ELECTRIC SHOVEL");
#define weapon_type
return 0;
#define weapon_auto
return 0;
#define weapon_cost
return 0;
#define weapon_load
return 48;
#define weapon_sprt
return global.sprLSH;
#define weapon_area
return 16;
#define weapon_swap
return sndSwapHammer;
#define weapon_text
return "storm digger";
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
var __laser_brain = skill_get(17)
if (__laser_brain) {
	sound_play(sndEnergySwordUpg);
} else sound_play(sndEnergySword);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), LightningSlash)) {
	if (__laser_brain) {
		damage = 17 + (__laser_brain - 1) * 2;
	} else damage = 12;
	motion_add(__angle, 3 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle + 60 * accuracy), LightningSlash)) {
	if (__laser_brain) {
		damage = 17 + (__laser_brain - 1) * 2;
	} else damage = 12;
	motion_add(__angle + 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle - 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle - 60 * accuracy), LightningSlash)) {
	if (__laser_brain) {
		damage = 17 + (__laser_brain - 1) * 2;
	} else damage = 12;
	motion_add(__angle - 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

