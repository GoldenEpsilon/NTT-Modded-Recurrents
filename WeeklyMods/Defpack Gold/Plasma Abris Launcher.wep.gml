#define init
global.sprPlasmaAbrisLauncher = sprite_add_weapon("Plasma Abris Launcher.png", 0, 3);

#define weapon_name
return "PLASMA ABRIS LAUNCHER"

#define weapon_sprt
return global.sprPlasmaAbrisLauncher;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 24;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 6;

#define weapon_text
return "HUMORON";

#define weapon_fire

sound_play(sndPlasma)
wkick = 4
repeat(3)
{
	with instance_create(mouse_x[index]+random_range(-20,20),mouse_y[index]+random_range(-20,20),PlasmaImpact)
	{
		scale = random_range(0.9,1.1)
		image_xscale =  scale
		image_yscale =  scale
		image_speed = scale / 2
	}
}
