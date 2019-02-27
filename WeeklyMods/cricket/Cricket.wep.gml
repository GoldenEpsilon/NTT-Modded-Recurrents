#define init
trace("Cricket Bat");
global.sprCricket = sprite_add_weapon("sprCricket.png", 4, 4);

#define weapon_name
return "CRICKET BAT";

#define weapon_sprt
return global.sprCricket;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 15;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 2;

#define weapon_text
return "YOU'VE GOT RED ON YOU";

#define weapon_fire

sound_play(sndHammer)
wkick = 6

with instance_create(x,y,Slash)
{
	damage = 15
	longarms = 0
	direction = point_direction(Player.x,Player.y,mouse_x,mouse_y)
	if instance_exists(Player)
	motion_add(point_direction(x,y,mouse_x,mouse_y),2+longarms)
	image_angle = direction
	team = other.team
	image_xscale *= 1.2
	image_yscale *= 1.2
}
wepangle = -wepangle
motion_add(point_direction(Player.x,Player.y,mouse_x,mouse_y),20)


