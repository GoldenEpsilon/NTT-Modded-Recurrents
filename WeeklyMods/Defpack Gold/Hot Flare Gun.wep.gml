#define init
global.sprHotFlareGun = sprite_add_weapon("Hot Flare Gun.png", 1, 2);
global.sprHotFlare = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAGCAYAAADgzO9IAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZSURBVBhXYwCB/2gAqyAMUFMCmz0MDAwMAF1Bf4E5znJ3AAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==/2gYDP4zy9eiYJAYWIKl8iwKJiyByygQgHGgmIEBAJ/NLykggvB1AAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==", 1, 3, 3);
#define weapon_name
return "HOT FLARE GUN";

#define weapon_sprt
return global.sprHotFlareGun;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 19;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 8;

#define weapon_text
return "TFW YOU REALLY LIKE A WEAPON
BUT ALMOST NOBODY ELSE DOES
SO YOU ADD A BETTER VERSION OF IT
AND ALL YOU DID
WAS JUST TRIPLING THE DPS
AND MAKE IT AUTOMATIC";

#define weapon_fire

wkick = 6
sound_play(sndFlare)
with instance_create(x+lengthdir_x(14,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(14,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
{
	sprite_index = global.sprHotFlare
	team = other.team
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(14)-7)*other.accuracy,9)
	typ = 6
	friction = 0.15
	offx = random(2)-1
	solid = true
	offy = random(2)-1
	solid = true
	do
	{
		move_bounce_solid(true)
		image_angle = direction
		if typ > 0
		{
			typ -= 1
		}
		else
		{
			friction = 0.3
		}
		if speed <= 0.01 && instance_exists(CustomObject)
		{
			sound_play(sndFlareExplode)
			repeat(30)
			{
				with instance_create(x,y,Flame)
				{
					motion_add(random(360),random(1)+4)
					team = 2
					damage *= 3
					sprite_index = sprFireLilHunter
				}
			}
		speed = 0
		}
		if place_meeting(x,y,hitme)
		{
			if other.team != team
				{
					sound_play(other.snd_hurt)
					sound_play(sndFlareExplode)
					repeat(40)
					{
						with instance_create(x,y,Flame)
						{
							motion_add(random(360),random(1)+5)
							team = 2
							damage *= 3
							sprite_index = sprFireLilHunter
						}
					}
					with other
					{
						my_health -= 20
						sprite_index = spr_hurt
						image_index = 0
						motion_add(other.direction,5)
					}
				}
			}
		if friction > 0.15
		repeat(2)
		{
			with instance_create(x,y,Flame)
			{
				motion_add(other.direction+random(20)-10,random(3))
				team = other.team
				damage *= 2
				sprite_index = sprFireLilHunter
			}
		}
		if speed = 0
		{
			instance_destroy()
		}
		wait(1)
	}
	while(instance_exists(self))
}
