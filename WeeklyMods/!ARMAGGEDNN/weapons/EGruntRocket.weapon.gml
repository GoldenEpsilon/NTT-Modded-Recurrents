global.sprite2 = sprite_add_weapon("spr/sprPopoRocket.png", 2, 4);
#define weapon_name
return loc("!argdn:EGruRock", "POLICE ROCKET");

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_cost
return 2;

#define weapon_load
return 28;

#define weapon_sprt
return global.sprite2;

#define weapon_area
return 12;

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
	damage = 18;
	team = other.team;
	creator = other;
}
weapon_post(10, -30, 4);
