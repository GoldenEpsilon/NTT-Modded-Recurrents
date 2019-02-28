#define init
global.sprthesuperbolt = sprite_add_weapon("thesuperbolt.png", 3, 4);

#define weapon_name
return "THE SUPER BOLT"

#define weapon_sprt
return global.sprthesuperbolt;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 69;

#define weapon_cost
return 9;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 14;

#define weapon_text
return choose("BOLTS AND SPLINTERS EVERYWHERE");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndHeavyCrossbow)
with instance_create(x,y,HeavyBolt)
{
	team = other.team
	creator = other
	damage = 100
	timer = 0
	timer2 = 0
	image_xscale *= 1.25
	image_yscale *= 1.25
	speed = 1.1
	motion_add(other.gunangle,11)
	image_angle = direction
	do
	{
		timer -= 1
		if timer <= 0 && speed > 0
		{
			repeat(1)
			{
					with instance_create(x,y,Bolt)
					{
						team = other.team
						creator = other
						damage = 15
						direction = random(359)
						image_angle = direction
						speed += random_range(7,10)
					}
			}
			repeat(2)
			{
					with instance_create(x,y,Splinter)
					{
						team = other.team
						creator = other
						damage = 8
						direction = random(359)
						image_angle = direction
						speed += random_range(7,10)
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