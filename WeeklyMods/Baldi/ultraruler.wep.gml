
global.spr_machete = sprite_add_weapon("ultraruler.png", 3, 3);

#define weapon_name
return "ultraruler";

#define weapon_type
return 0;

#define weapon_auto
return 1;

#define weapon_cost
return 0;

#define weapon_load
return 12;
	
#define weapon_rads
return 7;

#define weapon_sprt
return global.spr_machete;

#define weapon_area
return -1;

#define weapon_swap
return sndSwapSword;

#define weapon_text
return "SHARP AND POINTY";

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(mut_long_arms);
sound_play(sndChickenSword);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), Slash)) {
	damage = 82 + (GameCont.level > 85) ? 85 : GameCont.level;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle *= -1;
motion_add(__angle, 6);
weapon_post(-4, 12, 1);

