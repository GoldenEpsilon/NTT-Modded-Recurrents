#define init
global.sprTripleLaserGun = sprite_add_weapon("Triple Laser Gun.png", -4, 4);

#define weapon_name
return "TRIPLE LASER PISTOL"

#define weapon_sprt
return global.sprTripleLaserGun;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 23;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 6;

#define weapon_text
return "LIKE A RIGHTEOUS BISON";

#define weapon_fire

sound_play(sndLaserUpg)
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
team = other.team
event_perform(ev_alarm,0)
}
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-4*other.accuracy
team = other.team
event_perform(ev_alarm,0)
}
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+4*other.accuracy
team = other.team
event_perform(ev_alarm,0)
}
