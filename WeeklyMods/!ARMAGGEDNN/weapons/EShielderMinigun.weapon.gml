#define weapon_name
return loc("!argdn:EShMinig", "SHIELDER MINIGUN");

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 4;

#define weapon_sprt
return sprPopoPlasmaMinigun;

#define weapon_area
return 14;

#define weapon_swap
return sndSwapEnergy;

#define weapon_text
return "лол";

#define weapon_fire
var __angle = gunangle;
sound_play(sndPlasma);
with (instance_create(x + lengthdir_x(8, __angle), y + lengthdir_y(8, __angle), PopoPlasmaBall)) {
	motion_add(__angle + (random(16) - 8) * other.accuracy, 2);
	image_angle = direction;
	team = other.team;
	creator = other;
}
motion_add(__angle + 180, 3);
weapon_post(5, -3, 3);
resetSpeed = 0;

