#define weapon_name
return loc("!argdn:EGruRock", "IDPD ROCKET");

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 2;

#define weapon_load
return 30;

#define weapon_sprt
return sprPopoRocket;

#define weapon_area
return 9;

#define weapon_swap
return sndSwapExplosive;

#define weapon_text
return "rock n' load";

#define weapon_fire
var __angle = gunangle;
sound_play(sndRocket);
with (instance_create(x, y, PopoRocket)) {
	motion_add(__angle + (random(4) - 2) * other.accuracy, 12);
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(10, -30, 4);
