#define init
global.sprMasterScrewdriver = sprite_add_weapon("Master Screwdriver.png", 2, 5);

#define weapon_name
return "MASTER SCREWDRIVER";

#define weapon_sprt
return global.sprMasterScrewdriver;

#define weapon_type
return 0;

#define weapon_auto
return true;

#define weapon_load
return 1;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 13;

#define weapon_text
return "TOO POWERFUL TO FIX THINGS";

#define weapon_fire

sound_play(sndScrewdriver)
wkick = 8
wepangle = -wepangle
motion_add(point_direction(x,y,mouse_x[index],mouse_y[index]),10)
	with instance_create(x,y,Shank)
	{
		dmg = 12
		longarms = 0
		direction = point_direction(other.x,other.y,mouse_x[other.index],mouse_y[other.index])*other.accuracy
		if instance_exists(Player)
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),2+longarms)
		image_angle = direction
		team = other.team
		image_xscale *= 1.1
		image_yscale *= 1.3
	}
