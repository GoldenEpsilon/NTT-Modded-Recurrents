#define init

#define weapon_name
return loc("!argdn:EInSword", "INSPECTOR SWORD");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 2;

#define weapon_load
return 28;

#define weapon_sprt
return sprEnergyBaton;

#define weapon_area
return 12;

#define weapon_swap
return sndSwapEnergy;

#define weapon_text
return "zzzwwoonggg";

#define weapon_fire
var __angle = gunangle;
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(skill_get(13) * 20, __angle), y + lengthdir_y(skill_get(13) * 20, __angle), EnergySlash)) {
	sprite_index = sprPopoSlash
	motion_add(__angle, 2 + 3 * skill_get(13));
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 1);

