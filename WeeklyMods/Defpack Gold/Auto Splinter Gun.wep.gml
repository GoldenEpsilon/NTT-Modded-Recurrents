#define init
global.sprAutoSplinterGun = sprite_add_weapon("Auto Splinter Gun.png", 3, 4);

#define weapon_name
return "AUTO SPLINTER GUN";

#define weapon_sprt
return global.sprAutoSplinterGun;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 7;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 14;

#define weapon_text
return "TERROR ABSOLUTE";

#define weapon_fire
sound_play(sndSplinterGun)

with instance_create(x+lengthdir_x(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),Splinter)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(20)-10)*other.accuracy,20+random(4))
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),Splinter)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(10)-5)*other.accuracy,20+random(4))
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),Splinter)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(10)-5)*other.accuracy,20+random(4))
image_angle = direction
team = other.team}
