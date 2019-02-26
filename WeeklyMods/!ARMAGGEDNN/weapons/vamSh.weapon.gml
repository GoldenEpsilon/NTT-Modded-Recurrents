global.sprVSH = sprite_add_weapon("spr/sprVSH.png", 8, 7);
global.sprVSHS = sprite_add("spr/zVampirSlash.png", 3, 0, 24);
#define weapon_name
return loc("!argdn:VampiricSh", "VAMPIRIC SHOVEL");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 90;

#define weapon_sprt
return global.sprVSH;

#define weapon_area
return 20;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "vampir dig";

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play(sndShovel);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), Slash)) {
	sprite_index = global.sprVSHS;
	damage = 32;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle + 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle + 60 * accuracy), Slash)) {
	sprite_index = global.sprVSHS;
	damage = 32;
	motion_add(__angle + 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
with (instance_create(x + lengthdir_x(__long_arms * 15, __angle - 60 * accuracy), y + lengthdir_y(__long_arms * 15, __angle - 60 * accuracy), Slash)) {
	sprite_index = global.sprVSHS;
	damage = 32;
	motion_add(__angle - 60 * other.accuracy, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

#define step(primary)
if (primary) {
	with enemy {
		if my_health <= 0
			instance_create(x,y,HPPickup)
				}
			}