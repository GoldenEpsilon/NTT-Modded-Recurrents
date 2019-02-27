#define init
global.sprClaymore = sprite_add_weapon("Claymore.png", 4, 4);
#define weapon_name
return "CLAYMORE";

#define weapon_sprt
return global.sprClaymore;

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
return 7;

#define weapon_text
return "ABSOLUTELY LUNATIC";

#define weapon_fire

sound_play(sndHammer)
wkick = 8

with instance_create(x,y,Slash)
{
	dmg = 22
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
motion_add(gunangle,20)
sound_play(sndExplosion)
instance_create(x+lengthdir_x(54+random_range(0.45,1.3),point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(54+random_range(0.45,1.3),point_direction(x,y,mouse_x[index],mouse_y[index])),Explosion)
instance_create(x+lengthdir_x(57,point_direction(x,y,mouse_x[index],mouse_y[index])-20),y+lengthdir_y(57,point_direction(x,y,mouse_x[index],mouse_y[index])-20),SmallExplosion)
instance_create(x+lengthdir_x(57,point_direction(x,y,mouse_x[index],mouse_y[index])+20),y+lengthdir_y(57,point_direction(x,y,mouse_x[index],mouse_y[index])+20),SmallExplosion)
