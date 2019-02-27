#define init
global.sprGatlingSmartBazooka = sprite_add_weapon("Gatling Hot Bazooka.png", 4, 4);
global.sprSmartRocket = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAsAAAAGCAYAAAAVMmT4AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABHSURBVChTY4CC/1BMEIAV+nnHwjTgwwz/dbXN/kuJq/0X9F7zX77oP5yGYRAfQzG3YQFYAkbDMIgPVwzCxDoDBFA42AEDAwCBKEMDhOCIHwAAAABJRU5ErkJgggAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",0, -2, 3);
global.sprBlueExplosion = sprite_add("Blue Explosion_strip9.png",9,24,24)

#define weapon_name
return "GATLING SMART BAZOOKA";

#define weapon_sprt
return global.sprGatlingSmartBazooka;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 8;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 15;

#define weapon_text
return "BRAINFLEX";

#define weapon_fire

sound_play(sndRocket)
	wkick = 6
	with instance_create(x,y,CustomObject)
	{motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-24,24)*other.accuracy,14)
	team = other.team
	timer = 15
	sprite_index = global.sprSmartRocket
	speed = 4
	image_angle = direction
	do
	{
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
			if speed > 4
			{
				speed = 4
			}
			if timer = 0
			{
				motion_add(direction,0.2)
				if instance_exists(enemy)
				{
					if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
					{
						if distance_to_object(instance_nearest(x,y,enemy)) < 500
						{
								motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y),0.4)
								image_angle = direction
						}
					}
				}
			if place_meeting(x,y,Wall) || place_meeting(x,y,enemy)
			{
				with instance_create(x,y,Explosion)
				{
					sprite_index = global.sprBlueExplosion
				}
				repeat(3)
				{
					with instance_create(x,y,SmallExplosion)
					{
						sprite_index = global.sprBlueExplosion
					}
				}
				instance_destroy()
			}
			}
		wait(1)
	}while(instance_exists(self))
	}
