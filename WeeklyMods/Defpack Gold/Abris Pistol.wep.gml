#define init
global.sprSmallAbrisLauncher = sprite_add_weapon("Small Abris Launcher.png", -1, 2);

#define weapon_name
return "ABRIS PISTOL"

#define weapon_sprt
return global.sprSmallAbrisLauncher;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 13;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 5;

#define weapon_text
return "GET SOME COVER";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 2
repeat(4)
{
	instance_create(mouse_x[index]+random_range(-15,15),mouse_y[index]+random_range(-15,15),SmallExplosion)
}
