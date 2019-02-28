#define init
global.sprthediscbolt = sprite_add_weapon("thediscbolt.png", 3, 4);

#define weapon_name
return "THE DISC BOLT"

#define weapon_sprt
return global.sprthediscbolt;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 31;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 8;

#define weapon_text
return choose("HOW ARE YOU ALIVE");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndDiscgun)
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
					with instance_create(x,y,Disc)
					{
						team = other.team
						creator = other
						damage = 5
						direction = random(359)
						image_angle = direction
						speed += random_range(3,5)
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