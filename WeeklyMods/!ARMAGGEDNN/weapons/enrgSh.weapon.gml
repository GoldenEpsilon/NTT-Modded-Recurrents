global.sprEnrgSh = sprite_add_weapon("spr/sprESH.png", 8, 7);
#define weapon_name
return loc("!argdn:EnergySh", "ENERGY SHOVEL");
#define weapon_type
return 5;
#define weapon_melee
return true;
#define weapon_auto
return 0;
#define weapon_cost
return 5;
#define weapon_load
return 24;
#define weapon_sprt
return global.sprEnrgSh;
#define weapon_area
return 12;
#define weapon_swap
return sndSwapEnergy;
#define weapon_text
return "energetic digging";
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
var __laser_brain = skill_get(17)
if (__laser_brain) {
	sound_play(sndEnergySwordUpg);
} else sound_play(sndEnergySword);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), EnergySlash)) {
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle - 60 * accuracy), y + lengthdir_y(__long_arms * 20, __angle - 60 * accuracy), EnergySlash)) {
	motion_add(__angle - 60, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 20, __angle + 60 * accuracy), EnergySlash)) {
	motion_add(__angle + 60, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 7);
weapon_post(-5, 26, 2);

