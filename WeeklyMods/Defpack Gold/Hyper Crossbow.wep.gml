#define init
global.sprHyperCrossbow = sprite_add_weapon("Hyper Crossbow.png", 2, 5);
global.sprHyperBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABoAAAAMCAYAAAB8xa1IAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADDSURBVDhPrZI9DoMwDIUzs3WqxNKtC2rHzt2ReoPunXsCDsQd3TxXjxpjIIha+hQS2+/lh3Tv0oQcQqL8FkRECZMAJtX1tdtw1QjA4ND2Cg3Bo30mMNOjwXmREcih4jhdZBpBcQvFSkLNSkCtRY04qY/nUdKCnM1zfmluKoxTcvQY418zvz3eCAYgv5OKnd4yjB6sa9+Wq+Mu10CtZXijJVgMAe6Sa3NA2BOKEzRF4n/9vXOMriGqKWHRiOJ7DMjXSNIHywRpOk5R/gwAAAAASUVORK5CYII=",0, -6, 3);

#define weapon_name
return "HYPER CROSSBOW"

#define weapon_sprt
return global.sprHyperCrossbow;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 8;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 9;

#define weapon_text
return "THOSE BOLTS ARE HUGE";

#define weapon_fire

	sound_play(sndCrossbow)
	sound_play(sndHyperRifle)
	wkick = 8
	with instance_create(x+lengthdir_x(22,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(22,point_direction(x,y,mouse_x[index],mouse_y[index])),Bolt)
	{
		move_bounce_solid(false)
		sprite_index = global.sprHyperBolt
		team = other.team
		check = 0
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),30)
		damge = 60
		image_angle = direction
		do
		{
			if place_meeting(x,y,Wall) || speed <= 0
			{
				if check = 0
				{
					check = 1
					repeat(12)
					{
						with instance_create(x,y,Splinter)
						{
							motion_add(other.direction-180+random_range(-40,40),35)
							team = other.team
							image_angle = direction
						}
					}
				}
			}
		wait(1)
		}while(instance_exists(self))
	}
