#define init
global.sprBloodAbrisLauncher = sprite_add_weapon("Blood Abris Launcher.png", 2, 2);

#define weapon_name
return "BLOOD ABRIS LAUNCHER"

#define weapon_sprt
return global.sprBloodAbrisLauncher;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 19;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 7;

#define weapon_text
return "PROTECTION AT ALL COSTS";

#define weapon_fire

sound_play(sndBloodLauncher)
if ammo[4] = 0
{
	ammo[4] += 4
	sprite_index = spr_hurt
	image_index = 0
	my_health -= 1
	sound_play(snd_hurt)
}
else
{
	wkick = 4
	sound_play(sndBloodLauncherExplo)
	repeat(4)
	{
		instance_create(mouse_x[index]+random_range(20,25),mouse_y[index]+random_range(-20,25),MeatExplosion)
	}
}
