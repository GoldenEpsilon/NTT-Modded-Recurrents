#define init
global.sprthesuperdiscbolt = sprite_add_weapon("thesuperdiscbolt.png", 3, 4);

#define weapon_name
return "THE SUPER DISC BOLT"

#define weapon_sprt
return global.sprthesuperdiscbolt;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 61;

#define weapon_cost
return 9;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 8;

#define weapon_text
return choose("CANT DIE");

#define weapon_fire
weapon_post(10,-25,6)
sound_play(sndDiscgun)
with instance_create(x,y,Disc)
{
	team = other.team
	creator = other
	damage = 40
	timer = 0
	timer2 = 0
	image_xscale *= 2.0
	image_yscale *= 2.0
	speed = 0.5
	motion_add(other.gunangle,11)
	image_angle = direction
	do
	{
		timer -= 1
		if timer <= 0 && speed > 0
		{
			repeat(3)
			{
					with instance_create(x,y,Disc)
					{
						team = other.team
						creator = other
						damage = 10
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