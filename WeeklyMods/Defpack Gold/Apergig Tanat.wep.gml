#define init
global.sprApergigTanat = sprite_add_weapon("Apergig Tanat.png", -2, 4);

#define weapon_name
return "APERGIG TANAT";

#define weapon_sprt
return global.sprApergigTanat;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 160;

#define weapon_cost
return 40;

#define weapon_swap
return sndSwapGold;

#define weapon_area
return 8;

#define weapon_text
return choose("MMMMH THATS SOME GOOD SHIT
RIGHT THERE
(RIGHT THERE)",
"BELONGS INTO THE DEBASEMENT");

#define weapon_fire

sound_play(sndGoldShotgun)
wkick = 3
with instance_create(x,y,Bullet2)
{
	damage *= 513
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),10)
	image_xscale /= 2
	image_yscale /= 2
	team = other.team
}
