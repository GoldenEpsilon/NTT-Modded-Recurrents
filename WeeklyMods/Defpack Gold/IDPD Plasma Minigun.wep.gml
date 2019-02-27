#define init
global.sprIDPDPlasmaMinigun = sprite_add_weapon("Elite IDPD Minigun.png", 6, 4);

#define weapon_name
return "I.D.P.D. PLASMA MINIGUN";

#define weapon_sprt
return global.sprIDPDPlasmaMinigun;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 6;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "JOKER SPOTTED";

#define weapon_fire

sound_play(sndEliteShielderFire)

wkick = 5
with instance_create(x+lengthdir_x(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-11,point_direction(x,y,mouse_x[index],mouse_y[index])),PopoPlasmaBall)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)*other.accuracy,2)
image_angle = direction
image_xscale *= 1.6
image_yscale *= 1.6
team = other.team}
