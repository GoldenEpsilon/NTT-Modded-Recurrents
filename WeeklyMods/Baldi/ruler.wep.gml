
global.spr_machete = sprite_add_weapon("ruler.png", 3, 3);

#define weapon_name
return "ruler";

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 22;

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
	damage = 52 + (GameCont.level > 55) ? 55 : GameCont.level;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle *= -1;
motion_add(__angle, 2);
weapon_post(-4, 12, 1);

