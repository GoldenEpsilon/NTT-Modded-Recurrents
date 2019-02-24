global.th = sprite_add_weapon("spr/sprPThompsone.png",5,3)
global.snd = sound_add("snd/tommy.ogg")
#define weapon_name
return "THOMSON MACHINEGUN";

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 4;

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

sound_play(sound_add("snd/tommy.ogg"));
with (instance_create(x, y, Shell)) motion_add(__angle + other.right * 100 + random(50) - 25, 2 + random(2));
with (instance_create(x, y, Bullet1)) {
	motion_add(__angle + (random(12) - 6), 18);
	image_xscale = 0.75
	image_yscale = 0.75
	damage = 2
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(2, -6, 3);
#define step
