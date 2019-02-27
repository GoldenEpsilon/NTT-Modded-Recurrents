#define init
global.sprBouncerPistol = sprite_add_weapon("Bouncer Pistol.png", -2, 2);

#define weapon_name
return "BOUNCER PISTOL"

#define weapon_sprt
return global.sprBouncerPistol;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 9;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 3;

#define weapon_text
return "WOBBLE WOBBLE";

#define weapon_fire

sound_play(sndBouncerSmg)
wkick = 2

with instance_create(x+lengthdir_x(9,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(9,point_direction(x,y,mouse_x[index],mouse_y[index])),BouncerBullet)
{
	team = other.team
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(14)-7)*other.accuracy,6)
}
