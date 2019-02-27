#define init
global.sprHeavyMinigun = sprite_add_weapon("Heavy Minigun.png", 3, 4);

#define weapon_name
return "HEAVY MINIGUN";

#define weapon_sprt
return global.sprHeavyMinigun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 1;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 17;

#define weapon_text
return "HEAVY OCEAN";

#define weapon_fire

sound_play(sndMinigun)
wkick = 3
sound_play(sndMinigun)
with instance_create(x,y,Shell)
motion_add(point_direction(x,y,mouse_x,mouse_y)+other.right*100+random(80)-40,3+random(2))

with instance_create(x+lengthdir_x(sprite_height-7,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-7,point_direction(x,y,mouse_x[index],mouse_y[index])),HeavyBullet)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(26)-13)*other.accuracy,16)
image_angle = direction
team = other.team}
motion_add(point_direction(x,y,mouse_x,mouse_y)+180,0.9)
wkick = 4
