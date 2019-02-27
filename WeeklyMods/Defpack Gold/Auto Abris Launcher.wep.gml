#define init
global.sprAutoAbrisLauncher = sprite_add_weapon("Auto Abris Launcher.png", 0, 3);

#define weapon_name
return "AUTO ABRIS LAUNCHER"

#define weapon_sprt
return global.sprAutoAbrisLauncher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 9;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 10;

#define weapon_text
return "RECOVERY FUEL";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 3
repeat(1)
{
	instance_create(mouse_x[index]+random_range(20,20),mouse_y[index]+random_range(-20,20),Explosion)
}
repeat(4)
{
	instance_create(mouse_x[index]+random_range(20,20),mouse_y[index]+random_range(-20,20),SmallExplosion)
}
