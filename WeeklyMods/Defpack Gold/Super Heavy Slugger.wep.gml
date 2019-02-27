#define init
global.sprSuperHeavySlugger = sprite_add_weapon("Super Heavy Slugger.png", 6, 4);

#define weapon_name
return "SUPER HEAVY SLUGGER";

#define weapon_sprt
return global.sprSuperHeavySlugger;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 34;

#define weapon_cost
return 20;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 8;

#define weapon_text
return "NO NEED TO GET OUT OF HERE";

#define weapon_fire

wkick = 12
sound_play(sndSuperSlugger)
motion_add(point_direction(x,y,mouse_x[index],mouse_y[index])+180,8)

with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),HeavySlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)*other.accuracy,11.5)
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),HeavySlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+10*other.accuracy+(random(8)-4)*other.accuracy,11.5)
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),HeavySlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+20*other.accuracy+(random(8)-4)*other.accuracy,11.5)
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),HeavySlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-10*other.accuracy+(random(8)-4)*other.accuracy,11.5)
image_angle = direction
team = other.team}
with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),HeavySlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-20*other.accuracy+(random(8)-4)*other.accuracy,11.5)
image_angle = direction
team = other.team}
