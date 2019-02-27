#define init
global.sprIDPDMinigun = sprite_add_weapon("IDPD Minigun.png", 6, 5);

#define weapon_name
return "I.D.P.D. MINIGUN";

#define weapon_sprt
return global.sprIDPDMinigun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndMinigun;

#define weapon_area
return 8;

#define weapon_text
return "BLUE BULLETS";

#define weapon_fire

wkick = 4
sound_play(sndGruntFire)
with instance_create(x+lengthdir_x(sprite_height/3,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/3,point_direction(x,y,mouse_x[index],mouse_y[index])),IDPDBullet){
motion_add(other.gunangle+random(20)-10,8)
image_angle = direction
damage *= 1.3
speed *= 2
team = other.team}
