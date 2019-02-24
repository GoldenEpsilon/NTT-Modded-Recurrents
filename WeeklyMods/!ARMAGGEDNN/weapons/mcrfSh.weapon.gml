global.sprISH = sprite_add_weapon("spr/sprISH.png", 8, 7);
#define weapon_name
return loc("!argdn:MinecraftSh", "IRON SHOVEL");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 20;

#define weapon_sprt
return global.sprISH;

#define weapon_area
return 1;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "hard dig";
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play(sndShovel);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), EnergyHammerSlash)) {
	sprite_index = sprHeavySlash;
	damage = 4;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

