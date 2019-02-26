global.m16 = sprite_add_weapon("spr/m16.png",3,4)
#define weapon_name
return loc("!argdn:M16", "M16-RIFLE");

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 4;

#define weapon_sprt
return global.m16;

#define weapon_area
return 8;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_text
return "perfect";

#define weapon_fire
var __angle = gunangle;
sound_play(sndMachinegun);
with (instance_create(x, y, Shell)) motion_add(__angle + other.right * 100 + random(50) - 25, 2 + random(2));
with (instance_create(x, y, Bullet1)) {
	damage = 5;
	motion_add(__angle + (random(5) - 6) * other.accuracy, 18);
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(2, -6, 3);

