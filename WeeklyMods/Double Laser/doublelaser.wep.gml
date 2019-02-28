#define init
global.spr = sprite_add_weapon("sprDoubleLaserMinigun.png", 8, 7);

#define weapon_name
return "DOUBLE LASER MINIGUN";

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
return 20;

#define weapon_text
return "DELICIOUS @gENERGY@s";

#define weapon_fire
repeat(2)
{
	if(skill_get(17) == 1)
	sound_play(sndLaserUpg);
	else
	sound_play(sndLaser);
}

repeat(2)
{
	if(place_free(x+lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y)),y+lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y))))
	{
		x += lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y));
		y += lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y));
	}
	
	with instance_create(x,y,Laser)
	{
		image_angle = point_direction(x,y,mouse_x,mouse_y)+(random(30)-15)*other.accuracy;
		team = other.team;
		event_perform(ev_alarm,0);
		creator = other.id;
	}
}

weapon_post(6, 8, 8);