#define init
global.sprAbrisNukeLauncher = sprite_add_weapon("Abris Nuke Launcher.png", 1, 4);

#define weapon_name
return "SUPER ABRIS LAUNCHER"

#define weapon_sprt
return global.sprAbrisNukeLauncher;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 54;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 15;

#define weapon_text
return "BLESS WALLS";

#define weapon_fire

sound_play(sndGrenadeRifle)
sound_play(sndExplosionXL)
wkick = 12
repeat(21)
{
	instance_create(mouse_x[index]+random_range(20,20),mouse_y[index]+random_range(-20,20),Explosion)
}
repeat(14)
{
	instance_create(mouse_x[index]+random_range(20,20),mouse_y[index]+random_range(-20,20),SmallExplosion)
}
