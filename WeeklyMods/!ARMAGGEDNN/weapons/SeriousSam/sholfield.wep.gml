global.fuck = sprite_add_weapon("spr/sprSholfield.png",3,4)
global.sndd = sound_add("snd/sholf.ogg")
#define weapon_name
return "SHOLFIELD";
#define weapon_type
return 1;
#define weapon_auto
return 1;
#define weapon_cost
return 0;
#define weapon_load
return 12;
#define weapon_sprt
return global.fuck;
#define weapon_area
return 1;
#define weapon_swap
return sndSwapPistol;
#define weapon_text
return "infinite";
#define melee
return 0;
#define weapon_fire
var __angle = gunangle;
sound_play(global.sndd);
with (instance_create(x, y, Shell)) motion_add(__angle + other.right * 100 + random(50) - 25, 2 + random(2));
with (instance_create(x, y, Bullet1)) {
	motion_add(__angle, 16);
	damage = 3
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(2, -6, 4);
