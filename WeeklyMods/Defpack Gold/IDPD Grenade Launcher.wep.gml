#define init
global.sprIDPDNader = sprite_add_weapon("IDPD Nader.png", 3, 3);

#define weapon_name
return "I.D.P.D. GRENADE LAUNCHER";

#define weapon_sprt
return global.sprIDPDNader;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndMinigun;

#define weapon_area
return 8;

#define weapon_text
return "BLUE BOMBING";

#define weapon_fire

wkick = 5
sound_play(sndGrenade)
with instance_create(x+lengthdir_x(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),PopoNade)
{motion_add(other.gunangle+random(20)-10*other.accuracy,11)
image_angle = direction
team = other.team}
