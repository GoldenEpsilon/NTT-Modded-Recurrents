#define init
global.sprToxicCannon = sprite_add_weapon("Toxic Cannon.png", 4, 4);
#define weapon_name
return "TOXIC CANNON";

#define weapon_sprt
return global.sprToxicCannon;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 95;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 8;

#define weapon_text
return "HOW LONG CAN YOU HOLD YOUR BREATH?";

#define weapon_fire

wkick = 6
sound_play(sndGrenade)
with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[index],mouse_y[index])),FrogQueenBall)
{
	speed = 2
	team = other.team
	direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
}
