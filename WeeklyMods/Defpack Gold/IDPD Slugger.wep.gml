#define init
global.sprIDPDSlugger = sprite_add_weapon("IDPD Slugger.png", -2, 4);

#define weapon_name
return "I.D.P.D. SLUGGER";

#define weapon_sprt
return global.sprIDPDSlugger;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 33;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 8;

#define weapon_text
return "ENEMY INTELLIGENCE";

#define weapon_fire

wkick = 5
sound_play(sndGruntFire)
with instance_create(x,y,PopoSlug)
{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random(12)-6,12)
image_angle = direction
damage *= 5
speed *= 2
image_xscale *= 1.5
image_yscale *= 1.5
team = other.team}
