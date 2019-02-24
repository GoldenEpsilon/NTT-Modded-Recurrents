global.th = sprite_add_weapon("spr/lasergun.png",6,7)
global.snd = sound_add("snd/laser.ogg")
global.bull = sprite_add_weapon("spr/laser.png",7,7)
#define weapon_name
return "XML5 LASERGUN";

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_cost
return 3;

#define weapon_load
return 3;

#define weapon_sprt
return global.th;

#define weapon_area
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_text
return "";

#define weapon_fire
var __angle = gunangle;

sound_play(sound_add("snd/laser.ogg"));
with (instance_create(x, y, Bullet1)) {
	motion_add(__angle + (random(12) - 6), 18);
	sprite_index = global.bull
	image_xscale = 0.75
	image_yscale = 0.75
	damage = 4
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(2, -6, 3);
#define step
