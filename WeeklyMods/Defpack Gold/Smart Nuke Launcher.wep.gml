#define init
global.sprSmartNukeLauncher = sprite_add_weapon("Smart Nuke Launcher.png", 2, 4);
global.sprSmartNuke = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACkSURBVDhPpZCxDoMwDESzd2JC6tCxS9WBhbl7f4ZP6AfxhwytzuSiw3KjRFh6JPh8F0J6fdIpwmYP+yOXF1tgfTNWKkTlA8x8WzaGMEjfPceAy7QYw3s10OOeXMd7ATqMJQCnYwir35PnYzbCAJ7O4VoAgAfGwxfoFXRPqlfw/6A7wJvYU6oBQAQT8/oPMzMAVQSUClHRbHM6rEIrYbOHsNlOSj++wwSjicdh1wAAAABJRU5ErkJggg==",0, 8, 8);
global.sprBlueExplosion = sprite_add("Blue Explosion_strip9.png",9,24,24)

#define weapon_name
return "SMART NUKE LAUNCHER";

#define weapon_sprt
return global.sprSmartNukeLauncher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 40;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 11;

#define weapon_text
return "AT HIS MERCY";

#define weapon_fire

wkick = 10
sound_play(sndRocket)
with instance_create(x+lengthdir_x(8,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(8,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(4)-2)*other.accuracy,1)
	team = other.team
	image_xscale *= 0.95
	image_yscale *= 0.95
	sprite_index = global.sprSmartNuke
	visible = true
	timer = 20
	speed = 4
	image_angle = direction
	typ = 2 //0 = nothing, 1 = deflectable, 2 = destructable
	snd = sndRocketFly
	sound_play(snd)
	do
	{
		image_angle = direction
		with instance_create(x,y,Smoke)
		{
			image_xscale *= 0.7
			image_yscale *= 0.7
		}
		timer -= 1
			if timer < 0
			{
				timer = 0
			}
			with instance_create(x,y,TrapFire)
			{
				team = other.team
				sprite_index = sprFireLilHunter
			}
			if speed > 2
			{
				speed = 2
			}
			if timer = 0
			{
				if instance_exists(enemy)
				{
					if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
					{
						if distance_to_object(instance_nearest(mouse_x,mouse_y,enemy)) < 500
						{
								motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(mouse_x,mouse_y,enemy).y),0.17)
								image_angle = direction
						}
					}
				}
			}
		motion_add(direction,0.3)
		image_angle = direction
		if place_meeting(x,y,enemy) || place_meeting(x,y,Wall)
		{
			sound_stop(snd)
			sound_play(sndExplosionXL)
			ang = random(360)
			repeat(7)
			{
				with instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),Explosion)
				{
					sprite_index = global.sprBlueExplosion
					repeat(100)
					{
						instance_create(x,y,Dust)
					}
				}
				ang += 360/8
			}
			repeat(5)
			{
				with instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),SmallExplosion)
				{
					sprite_index = global.sprBlueExplosion
					image_xscale = 0.5
					image_yscale = 0.5
					repeat(100)
					{
						instance_create(x,y,Dust)
					}
				}
				ang += 360/8
			}
			instance_destroy()
		}
		wait(1)
	}while(instance_exists(self));
}
