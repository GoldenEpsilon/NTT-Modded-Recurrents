#define init
global.sprTest = sprite_add_weapon("sprBouncerMinigun.png", 4, 4)

#define weapon_name
return "BOUNCER MINIGUN";

#define weapon_sprt
return global.sprTest

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 2;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 10;

#define weapon_text
return choose(
	"BUBBLE BLOWIN' DOUBLE BABY"
);

#define weapon_fire
repeat(2)
sound_play(sndMinigun);
sound_play(sndBouncerSmg);
repeat(1)
{
	if(place_free(x+lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y)),y+lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y))))
	{
		x += lengthdir_x(1,point_direction(mouse_x,mouse_y,x,y));
		y += lengthdir_y(1,point_direction(mouse_x,mouse_y,x,y));
	}
	
	with instance_create(x,y,Shell)
	motion_add(other.gunangle+other.right*100+random(80)-40,3+random(2));

	with instance_create(x,y,BouncerBullet)
	{
		motion_add(other.gunangle+(random(20)-10)*other.accuracy,5);
		image_angle = direction;
		creator = other.id;
		team = other.team;
	}
}
motion_add(gunangle+180,2);
weapon_post(4, 7, 8);