#define init
global.sprLightningAbrisLauncher = sprite_add_weapon("Lightning Abris Launcher.png", 3, 5);

#define weapon_name
return "LIGHTNING ABRIS LAUNCHER"

#define weapon_sprt
return global.sprLightningAbrisLauncher;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 80;

#define weapon_cost
return 18;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 14;

#define weapon_text
return "WHAT A BRIS";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 9
	with instance_create(mouse_x[index],mouse_y[index],LightningBall)
	{
		team = other.team
	}
	with instance_create(mouse_x[index]-30,mouse_y[index]-30,LightningBall)
	{
		team = other.team
	}
	with instance_create(mouse_x[index]-30,mouse_y[index]+30,LightningBall)
	{
		team = other.team
	}
	with instance_create(mouse_x[index]+30,mouse_y[index]+30,LightningBall)
	{
		team = other.team
	}
	with instance_create(mouse_x[index]+30,mouse_y[index]+30,LightningBall)
	{
		team = other.team
	}
