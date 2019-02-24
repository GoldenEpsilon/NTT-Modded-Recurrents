#define init
global.sprite = sprMachinegun

#define weapon_name
return "AUTO BULLET SHOTGUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 4;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "BLAM BLAM BLAMMO";

#define weapon_fire

repeat(6)
{
	weapon_post(4,-2,2)
	sound_play(sndHeavyMachinegun);
	sound_play(sndShotgun);
	with instance_create(x,y,Bullet1)
	{
		speed = random_range(10,14);
		direction = other.gunangle + (random_range(-18, 18) * other.accuracy);
		image_angle = direction;
		team = other.team;
	}
}
