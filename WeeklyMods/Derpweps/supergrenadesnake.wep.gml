#define init
global.sprsupergrenadesnake = sprite_add_weapon("supergrenadesnake.png", 3, 4);

#define weapon_name
return "SUPER GRENADE SNAKE"

#define weapon_sprt
return global.sprsupergrenadesnake;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 222;

#define weapon_cost
return 18;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 18;

#define weapon_text
return choose("NUKE", "HOPE YOU HAVE VEINS");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndGrenade)
with instance_create(x,y,UltraGrenade)
{
	team = other.team
	creator = other
	damage = 35
	speed = 0.8
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
					with instance_create(x,y,MiniNade)
					{
						team = other.team
						creator = other
						damage = 8
						direction = random(359)
						speed += random_range(0.75,1.5)
					}
			}
			repeat(1)
			{
					with instance_create(x,y,ClusterNade)
					{
						team = other.team
						creator = other
						damage = 6
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
			instance_destroy()
			}
		}
		wait(1)
	}while(instance_exists(self))
}
