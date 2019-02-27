#define init
global.sprHeavyClaymore = sprite_add_weapon("Heavy Claymore.png", 4, 4);

#define weapon_name
return "MASTER CLAYMORE";

#define weapon_sprt
return global.sprHeavyClaymore;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 20;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 11;

#define weapon_text
return "BALLS TO THE WALL";

#define weapon_fire

sound_play(sndBlackSword)
wkick = 10

with instance_create(x,y,Slash)
{
	dmg = 10
	longarms = 0
	direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
	if instance_exists(Player)
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),2+longarms)
	image_angle = direction
	team = other.team
	image_xscale *= 1.4
	image_yscale *= 1.4
}
wepangle = -wepangle
motion_add(point_direction(x,y,mouse_x[index],mouse_y[index]),20)
sound_play(sndExplosion)
instance_create(x+lengthdir_x(51+random_range(0.42,1.1),point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),y+lengthdir_y(51+random_range(0.42,1.1),point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),GreenExplosion)
with instance_create(x+lengthdir_x(52,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-30),y+lengthdir_y(52,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-30),GreenExplosion)
{
	image_xscale /= 2
	image_yscale /= 2
}
with instance_create(x+lengthdir_x(52,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+30),y+lengthdir_y(52,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+30),GreenExplosion)
{
	image_xscale /= 2
	image_yscale /= 2
}
with instance_create(x+lengthdir_x(45,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-50),y+lengthdir_y(45,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-50),GreenExplosion)
{
	image_xscale /= 3
	image_yscale /= 3
}
with instance_create(x+lengthdir_x(45,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+50),y+lengthdir_y(45,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+50),GreenExplosion)
{
	image_xscale /= 3
	image_yscale /= 3
}
