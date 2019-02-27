#define init
global.sprTripleLaserRifle = sprite_add_weapon("Triple Laser Rifle.png", 3, 2);

#define weapon_name
return "TRIPLE LASER RIFLE"

#define weapon_sprt
return global.sprTripleLaserRifle;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 13;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 6;

#define weapon_text
return "DUCK FEET";

#define weapon_fire

sound_play(sndLaserUpg)
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
team = other.team
event_perform(ev_alarm,0)
}
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-10*other.accuracy
team = other.team
event_perform(ev_alarm,0)
}
with instance_create(x,y,Laser)
{image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+10*other.accuracy
team = other.team
event_perform(ev_alarm,0)
}
