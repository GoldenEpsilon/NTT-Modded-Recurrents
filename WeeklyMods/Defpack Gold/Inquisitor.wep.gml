#define init
global.sprInquisitor = sprite_add_weapon("Inquisitor.png", 0, 3);

#define weapon_name
return "INQUISITOR"

#define weapon_sprt
return global.sprInquisitor;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 45;

#define weapon_cost
return 20;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 13;

#define weapon_text
return "SOME MAY CALL IT ION CANNON";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 4
repeat(9)
{
	with instance_create(mouse_x[index]+random_range(-70,70),mouse_y[index]+random_range(-70,70),PlasmaImpact)
	{
		scale = random_range(1.3,1.8)
		image_xscale =  scale
		image_yscale =  scale
		image_speed = scale / 5
	}
}
repeat(2)
{
	with instance_create(mouse_x[index],mouse_y[index],PlasmaBig)
	{
		team = other.team
		instance_destroy()
	}
}
