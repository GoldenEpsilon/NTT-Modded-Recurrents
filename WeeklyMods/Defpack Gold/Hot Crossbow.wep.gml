#define init
global.sprFireCrossbow = sprite_add_weapon("Fire Crossbow.png", 2, 3);
global.sprFireBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABUAAAAFCAYAAACqwacNAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABISURBVChTY3BoYKAIQ8F/KIaI/f8PZsMEycb/366FscHgvzcPExwf0mLAwH8sMPH/JfwIfBqKYQbTxKXoYUQqhgK4gQ4NDAwALrZ6eop9sYUAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",0, -2, 3);

#define weapon_name
return "HOT CROSSBOW"

#define weapon_sprt
return global.sprFireCrossbow;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 28;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 6;

#define weapon_text
return "THE BOLTS COOL DOWN AFTER A TIME";

#define weapon_fire

	sound_play(sndCrossbow)
	wkick = 5
	repeat(8)
	{
		with instance_create(x+lengthdir_x(20,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(20,point_direction(x,y,mouse_x[index],mouse_y[index])),TrapFire)
		{
			motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-80,80),random_range(1,1.7))
			team = other.team
		}
	}
	with instance_create(x,y,Bolt)
	{
		sprite_index = global.sprFireBolt
		team = other.team
		check = 0
		timer = 6
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),19)
		damge = 26
		image_angle = direction
		do
		{
			image_angle = direction
			if speed > 0
			{
				timer -= 1
			}
				if speed <= 0 || place_meeting(x,y,enemy) || timer <= 0
				{
					if check = 0
					{
						check = 1
						sound_play(sndFlareExplode)
						with instance_create(x,y,Flare)
						{
							team = other.team
							instance_destroy()
						}
					}
				}
				else
				{
					repeat(5)
					{
						with instance_create(x+lengthdir_x(random_range(0,10),direction-180),y+lengthdir_y(random_range(0,10),direction-180),TrapFire)
						{
							team = other.team
						}
					}
				}
				if  timer <= 0
				{
					sprite_index = sprBolt
					damage = 7
					image_xscale = 0.6
					image_yscale = 0.8
					if speed > 15
					{
						speed = 15
					}
				}
		wait(1)
		}while(instance_exists(self))
	}
