#define init
global.sprthebolt = sprite_add_weapon("thebolt.png", 3, 4);

#define weapon_name
return "THE BOLT"

#define weapon_sprt
return global.sprthebolt;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 33;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 7;

#define weapon_text
return choose("BOLTS EVERYWHERE");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndCrossbow)
with instance_create(x,y,Bolt)
{
	team = other.team
	creator = other
	damage = 25
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
			repeat(2)
			{
					with instance_create(x,y,Splinter)
					{
						team = other.team
						creator = other
						damage = 4
						direction = random(359)
						image_angle = direction
						speed += random_range(6,8)
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