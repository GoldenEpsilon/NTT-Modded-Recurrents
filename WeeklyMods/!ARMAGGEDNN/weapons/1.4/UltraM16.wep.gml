global.um16 = sprite_add_weapon("spr/ULTRA_M16.png",3,4)
#define weapon_name
return loc("!argdn:UM16", "ULTRA M16");

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_cost
return 2;

#define weapon_load
return 2;

#define weapon_sprt
return global.um16;

#define weapon_area
return 19;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_text
return "can't better";

#define weapon_rads
return 6;

#define weapon_fire
var __angle = gunangle;
sound_play(sndUltraPistol);
repeat (2) with (instance_create(x, y, Shell)) motion_add(__angle + other.right * 100 + random(50) - 25, 2 + random(2));
with instance_create(x,y,Bullet1) {
	sprite_index = sprUltraBullet
	damage = 10
	motion_add(__angle + (random(4) - 4) * other.accuracy, 18);
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(3, -7, 5);

