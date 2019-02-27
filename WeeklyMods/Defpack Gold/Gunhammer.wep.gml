#define init
global.sprGunhammer = sprite_add_weapon("Gunhammer.png", 4, 8);

#define weapon_name
return "GUNHAMMER";

#define weapon_sprt
return global.sprGunhammer;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 24;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 5;

#define weapon_text
return "BULLET SMASHING";

#define weapon_fire

sound_play(sndHammer)
sound_play(sndPistol)
wkick = 8

repeat(5)
{
	with instance_create(x,y,Shell)
	{
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+other.right*100+random(50)-25,2+random(5))
	}
}
with instance_create(x,y,Slash)
{
dmg = 7
longarms = 0

direction = other.gunangle
if instance_exists(Player)
motion_add(point_direction(x,y,mouse_x,mouse_y),2+longarms)
image_angle = direction
team = other.team
image_xscale *= 1.2
image_yscale *= 1.2
damage *= 1.5
}
wepangle = -wepangle
motion_add(gunangle,20)
sound_play(sndPistol)
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(6)-3)*other.accuracy,16)
	image_angle = direction
	team = other.team
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-15*other.accuracy+(random(6)-3)*other.accuracy,16)
	image_angle = direction
	team = other.team
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+15*other.accuracy+(random(6)-3)*other.accuracy,16)
	image_angle = direction
	team = other.team
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-25*other.accuracy+(random(6)-3)*other.accuracy,16)
	image_angle = direction
	team = other.team
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Bullet1)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+25*other.accuracy+(random(6)-3)*other.accuracy,16)
	image_angle = direction
	team = other.team
}
