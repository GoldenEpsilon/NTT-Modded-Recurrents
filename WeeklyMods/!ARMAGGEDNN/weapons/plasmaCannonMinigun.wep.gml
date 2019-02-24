#define weapon_name
return loc("!argdn:PCMinigun", "PLASMA CANNON MINIGUN");
#define weapon_type
return 5;
#define weapon_auto
return 1;
#define weapon_cost
return 9;
#define weapon_load
return 6;
#define weapon_sprt
return sprPlasmaMinigun;
#define weapon_area
return 10;
#define weapon_swap
return sndSwapEnergy;
#define weapon_text
return "";
#define weapon_fire
var __angle = gunangle;
var __laser_brain = skill_get(17)
if (__laser_brain) {
	sound_play(sndPlasmaUpg);
} else sound_play(sndPlasma);
with (instance_create(x + lengthdir_x(8, __angle), y + lengthdir_y(8, __angle), PlasmaBig)) {
	motion_add(__angle + (random(16) - 8) * other.accuracy, 2);
	image_angle = direction;
	team = other.team;
	creator = other;
}
motion_add(__angle + 180, 3);
weapon_post(5, -3, 3);
resetSpeed = 0;

