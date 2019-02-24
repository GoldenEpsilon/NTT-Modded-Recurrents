global.sprite = sprite_add_weapon("spr/GraveGun.png",4,7)
#define weapon_name
return loc("!argdn:gravez", "GRAVE GUN");

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_cost
return 2;

#define weapon_load
return 5;

#define weapon_sprt
return global.sprite;

#define weapon_area
return -1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_text
return "uhhhhh";

#define weapon_fire
var __angle = gunangle;
sound_play(sndGrenade);
with (instance_create(x, y, Bandit)) {
	kills -= 1;
	raddrop = -1;
	my_health = 0;
	motion_add(__angle + (random(9) - 6) * other.accuracy, 16);
	image_angle = direction;
}
weapon_post(5, -10, 2);