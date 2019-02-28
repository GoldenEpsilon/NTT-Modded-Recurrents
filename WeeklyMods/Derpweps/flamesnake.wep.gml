#define init
global.sprflamesnake = sprite_add_weapon("flamesnake.png", 3, 4);

#define weapon_name
return "FLAME SNAKE"

#define weapon_sprt
return global.sprflamesnake;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 32;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 9;

#define weapon_text
return choose("FLAMING");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndFlameCannon)
with instance_create(x,y,FlameBall)
{
	team = other.team
	creator = other
	damage = 8
	speed = 0.75
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
			repeat(2)
			{
					with instance_create(x,y,Flame)
					{
						team = other.team
						creator = other
						damage = 2
						direction = random(359)
						speed += random_range(1,3)
					}
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
