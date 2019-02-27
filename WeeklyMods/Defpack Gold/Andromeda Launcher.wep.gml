#define init
global.sprAndromedaLauncher = sprite_add_weapon("Andromeda Launcher.png", 0, 3);
global.sprAndromedaBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACLSURBVEhL3ZXRCcAgDESzRaEDdI6O1s1tgkmrcK1NFIQevK/gy+GH0rpsXewHXaRkPCXPyzNQ6qFe/jWDC/iWWwYViC23/KNAX6DU4EjHhGaGesKBUsGWt0qoJxwoFaYXEFrLBfWEA6Ue1BMOlHpgRUcJvl8k9TC9wPSnWCT+EoM/o7rEW5E8v88QnexX3Z4Uujk7AAAAAElFTkSuQmCCAAAAAAAAAAAAAA==",2, 7, 7);

#define weapon_name
return "ANDROMEDA LAUNCHER"

#define weapon_sprt
return global.sprAndromedaLauncher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 60;

#define weapon_cost
return 12;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 5;

#define weapon_text
return "TAKE IT IN YOUR HEART NOW, LOVER";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 4
with instance_create(x+lengthdir_x(10,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(10,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
{
	team = other.team
	damage = 1
	dc = 0
	breaktimer = 10
	timer = room_speed*12
	sprite_index = global.sprAndromedaBullet
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),5)
	image_angle = direction
	image_speed = 0
	typ = 3
	do
	{
		fac = random_range(0.8,1.2)
		image_xscale = fac
		image_yscale = fac
		if speed > 0
		{
			if place_meeting(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction),Wall)
			{
				with instance_nearest(x,y,Wall)
				{
					instance_create(x,y,FloorExplo)
					instance_destroy()
				}
			}
			if irandom(3) = 3
			{
				instance_create(x+random_range(-4,4),y+random_range(-4,4),Debris)
			}
			speed -= 0.09
			image_index = 0
		}
		else
		{
			speed = 0
			image_speed = 0.7
			image_index = 1
			if breaktimer > 0
			{
				breaktimer -= 1
			}
			else
			{
				with instance_nearest(x,y,Wall)
				{
					instance_create(x,y,FloorExplo)
					instance_destroy()
				}
				breaktimer = 6
			}
			if dc = 0
			{
				repeat(10)
				{
					instance_create(x+random_range(-4,4),y+random_range(-4,4),Debris)
				}
				dc = 1
			}
			if instance_exists(Dust)
			{
				with instance_nearest(x,y,Dust)
				{
					instance_destroy()
				}
			}
			if timer > 0
			{
				timer -= 1
				with Debris
				{
					corecheck = 0
					if corecheck = 0
					{
						core = instance_nearest(x,y,CustomObject)
						corecheck = 1
					}
					if instance_exists(core)
					{
							motion_set(point_direction(x,y,core.x,core.y)-90*random_range(0.8,1.1),random_range(4,7))
					}
				}
			}
			else
			{
				instance_destroy()
			}
		}
		wait(1)
	}while instance_exists(self)
}
