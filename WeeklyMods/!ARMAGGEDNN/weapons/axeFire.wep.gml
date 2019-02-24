global.axe = sprite_add_weapon("spr/fireaxe.png", 6, 9)
#define weapon_name
return loc("!argdn:FireAxe", "FIRE AXE");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 35;

#define weapon_sprt
return global.axe;

#define weapon_area
return 3;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "axe time";

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13);
sound_play(sndHammer);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, __angle), y + lengthdir_y(__long_arms * 20, __angle), Slash)) {
	sprite_index = sprHeavySlash;
	damage = 40;
	motion_add(__angle, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
		}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 12, 1);