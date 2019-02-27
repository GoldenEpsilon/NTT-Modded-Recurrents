#define init
global.sprLightningGunhammer = sprite_add_weapon("Lightning Gunhammer.png", 4, 8);

#define weapon_name
return "LIGHTNING GUNHAMMER";

#define weapon_sprt
return global.sprLightningGunhammer;

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
return "THUNDERWAVE";

#define weapon_fire

sound_play(sndHammer)
wkick = 8


with instance_create(x,y,LightningSlash)
{
dmg = 7
longarms = 0

direction = point_direction(other.x,other.y,mouse_x[other.index],mouse_y[other.index])
if instance_exists(other)
motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),2+longarms)
image_angle = direction
team = other.team
damage *= 0.8
}
wepangle = -wepangle
motion_add(gunangle,20)
sound_play(sndLightningPistolUpg)

with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Lightning)
{
	image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(30)-15)*other.accuracy
	team = other.team
	ammo = 7
	event_perform(ev_alarm,0)
	visible = 0
	with instance_create(x,y,LightningSpawn)
	image_angle = other.image_angle
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Lightning)
{
image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(30)-15)+27*other.accuracy
	team = other.team
	ammo = 7
	event_perform(ev_alarm,0)
	visible = 0
	with instance_create(x,y,LightningSpawn)
	image_angle = other.image_angle
}
with instance_create(x+lengthdir_x(sprite_height/2,wepangle),y+lengthdir_y(sprite_height/2,wepangle),Lightning)
{
	image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(30)-15)-27*other.accuracy
	team = other.team
	ammo = 7
	event_perform(ev_alarm,0)
	visible = 0
	with instance_create(x,y,LightningSpawn)
	image_angle = other.image_angle
}
