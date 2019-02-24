global.sprit = sprite_add_weapon("spr/boltm.png", 4, 5)
#define weapon_name
return loc("!argdn:BoltNight", "BOLTED NIGHTMARE");
#define weapon_type
return 1;
#define weapon_auto
return 1;
#define weapon_cost
return 3;
#define weapon_load
return 1;
#define weapon_sprt
return global.sprit;
#define weapon_area
return 13;
#define weapon_swap
return sndSwapMachinegun;
#define weapon_text
return "omg";
#define weapon_fire
var __angle = gunangle;
sound_play(sndMinigun);
with (instance_create(x, y, Bolt)) {
	motion_add(__angle + (random(26) - 13) * other.accuracy, 16);
	image_angle = direction;
	team = other.team;
	creator = other;
}
motion_add(__angle - 380, 0.5);
weapon_post(4, -7, 4);

