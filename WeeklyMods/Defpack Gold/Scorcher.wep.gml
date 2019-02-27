#define init
global.sprScorcher = sprite_add_weapon("Scorcher.png", 1, 2);
global.sprUltraFlare = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAGCAYAAADgzO9IAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZSURBVBhXYwCB/2gAqyAMUFMCmz0MDAwMAF1Bf4E5znJ3AAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==/2gYDP4zy9eiYJAYWIKl8iwKJiyByygQgHGgmIEBAJ/NLykggvB1AAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==", 1, 3, 3);

global.UltraFire = sprite_add("Ultra Fire_strip7.png",7,8,8);
#define weapon_name
return "SCORCHER";

#define weapon_sprt
return global.sprScorcher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 9;

#define weapon_cost
return 4	;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 19;

#define weapon_text
return "BURN THE WORLD DOWN";

#define weapon_fire

wkick = 6
sound_play(sndFlare)

wkick = 5
if GameCont.rad >= 7
{
	GameCont.rad -= 7
	with instance_create(x+lengthdir_x(14,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(14,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
	{
		sprite_index = global.sprUltraFlare
		team = other.team
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(14)-7)*other.accuracy,12)
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
				repeat(50)
				{
					with instance_create(x,y,Flame)
					{
						motion_add(random(360),random(2)+3)
						team = 2
						damage *= 4
						sprite_index = global.UltraFire
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
						repeat(60)
						{
							with instance_create(x,y,Flame)
							{
								motion_add(random(360),random(1)+5)
								team = 2
								damage *= 4
								sprite_index = global.UltraFire
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
			repeat(3)
			{
				with instance_create(x,y,Flame)
				{
					motion_add(other.direction+random(20)-10,random(5))
					team = other.team
					damage *= 2
					sprite_index = global.UltraFire
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
}
else
{
	sound_play(sndUltraEmpty)
	ammo[4] += 4
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}
