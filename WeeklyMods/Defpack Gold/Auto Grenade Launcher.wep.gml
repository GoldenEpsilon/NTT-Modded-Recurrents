#define init
global.sprAutoNader = sprite_add_weapon("Auto Nader.png", 1, 1);

#define weapon_name
return "AUTO GRENADE LAUNCHER";

#define weapon_sprt
return global.sprAutoNader;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 16;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 10;

#define weapon_text
return "GOES WELL WITH STRESS";

#define weapon_fire
sound_play(sndGrenade)

wkick = 5
with instance_create(x,y,Grenade)
{
image_blend = c_gray
sticky = 0
motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(6)-3)*other.accuracy,10)
image_angle = direction
team = other.team}
