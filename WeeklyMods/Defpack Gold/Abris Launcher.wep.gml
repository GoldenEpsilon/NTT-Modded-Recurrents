#define init
global.sprAbrisLauncher = sprite_add_weapon("Abris Launcher.png", 0, 3);

#define weapon_name
return "ABRIS LAUNCHER"

#define weapon_sprt
return global.sprAbrisLauncher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 24;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 8;

#define weapon_text
return "HIDE AND KILL";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 4
repeat(5)
{
	instance_create(mouse_x[index]+random_range(20,20),mouse_y[index]+random_range(-20,20),Explosion)
}
