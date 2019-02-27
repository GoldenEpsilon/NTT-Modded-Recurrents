#define init
global.sprEnergyGun = sprite_add_weapon("Energy Gun.png", 2, 1);

#define weapon_name
return "ENERGY GUN"

#define weapon_sprt
return global.sprEnergyGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 33;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 10;

#define weapon_text
return "CATASTROPHIC";

#define weapon_fire

sound_play(sndLaser)
sound_play(sndLightningPistol)
sound_play(sndPlasma)
wkick = 9
repeat(2)
{
	with instance_create(x,y,Laser)
	{
		team = other.team
		image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-20,20)*other.accuracy
		event_perform(ev_alarm,0)
	}
}
with instance_create(x,y,PlasmaBall)
{
	team = other.team
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-7,7)*other.accuracy,12)
	image_angle = direction
}
repeat(4)
{
	with instance_create(x,y,Lightning)
	{
		team = other.team
		ammo = choose(9,12,15,18)
		image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-34,34)*other.accuracy
		event_perform(ev_alarm,0)
	}
}
