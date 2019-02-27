#define init
global.sprIDPDBazooka = sprite_add_weapon("Elite IDPD Rifle.png", 0, 4);

#define weapon_name
return "I.D.P.D. BAZOOKA";

#define weapon_sprt
return global.sprIDPDBazooka;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 26;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 12;

#define weapon_text
return "CLEAN MISSILE";

#define weapon_fire

wkick = 7
sound_play(sndRocket)
with instance_create(x,y,PopoRocket)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(4)-2)*other.accuracy,14)
team = other.team
image_angle = direction
image_xscale *= 1.3
image_yscale *= 1.3}
