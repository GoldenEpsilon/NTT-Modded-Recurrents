#define init
global.sprHeavyAbrisLauncher = sprite_add_weapon("Heavy Abris Launcher.png", 1, 3);

#define weapon_name
return "HEAVY ABRIS LAUNCHER"

#define weapon_sprt
return global.sprHeavyAbrisLauncher;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 29;

#define weapon_cost
return 7;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 13;

#define weapon_text
return "THEY WON'T SEE THAT ONE COMIN'";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 8
repeat(6)
{
	instance_create(mouse_x[index]+random_range(3,3),mouse_y[index]+random_range(-3,3),GreenExplosion)
}
