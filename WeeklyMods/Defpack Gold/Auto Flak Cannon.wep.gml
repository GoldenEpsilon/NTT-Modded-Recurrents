#define init
global.sprAFC = sprite_add_weapon("Auto Flak Cannon.png", 2, 2);

#define weapon_name
return "AUTO FLAK CANNON";

#define weapon_sprt
return global.sprAFC;

#define weapon_type
return 2;

#define weapon_auto
return true;

#define weapon_load
return 12;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 12;

#define weapon_text
return "NOT ENOUGH WATER";

#define weapon_fire

sound_play(sndFlakCannon)
with instance_create(x+lengthdir_x(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),FlakBullet)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(12)-6)*other.accuracy,11+random(2))
	image_angle = direction
	team = other.team
}
wkick = 3
