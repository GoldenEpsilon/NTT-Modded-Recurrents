#define init
global.sprplasmasnake = sprite_add_weapon("plasmasnake.png", 3, 4);

#define weapon_name
return "PLASMA SNAKE"

#define weapon_sprt
return global.sprplasmasnake;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 35;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 9;

#define weapon_text
return choose("THANKS");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndPlasmaBig)
with instance_create(x,y,PlasmaBig)
{
	team = other.team
	creator = other
	damage = 5
	timer = 0
	timer2 = 0
	image_xscale *= 1.0
	image_yscale *= 1.0
	motion_add(other.gunangle,11)
	//sprite_index = global.sprMutant8BIdle
	image_angle = direction
	do
	{
		timer -= 1
		if timer <= 0 && speed > 0
		{
			repeat(1)
			{
				instance_create(x,y,PlasmaImpact)
			}
		}
		if speed <= 0
		{
			timer2 -= 1
			if timer2 <= 0
			{
				repeat(35)
				{
					with instance_create(x,y,PlasmaBall)
					{
						direction = random(359)
						speed += random_range(0.3,1)
					}
				}
			instance_destroy()
			}
		}
		wait(1)
	}while(instance_exists(self))
}
