#define init
global.spr = sprite_add_weapon("sprDoublePlasmaMinigun.png", 8, 5);

#define weapon_name
return "DOUBLE PLASMA MINIGUN";

#define weapon_sprt
return global.spr;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 2;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 24;

#define weapon_text
return "HOLY GRAIL OF FIREPOWER";

#define weapon_fire
repeat(2)
sound_play(sndPlasmaMinigun);

repeat(2)
{
	if(place_free(x+lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y)),y+lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y))))
	{
		x += lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y));
		y += lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y));
	}
	
	with instance_create(x,y,PlasmaBall)
	{
		motion_add(other.gunangle+(random(40)-20)*other.accuracy,9);
		image_angle = direction;
		creator = other.id;
		team = other.team;
	}
}

weapon_post(4, 6, 6);