//jsnotes - wow, what a mod
#define step
with HyperCrystal{
	with Player if place_meeting(x,y,other){
		candie = 1
		x10spirit = 0
		my_health = 0
	}
	if crystals with crystal if instance_exists(self){
		with instances_matching(EnemyLaser,"creator",id){
			if "bigasfuck" not in self{
				bigasfuck = 1
				image_yscale = 3
			}
		}
	}
}

/*
with (instances_matching(EnemyLaser, "hcx10", null)) 
{
	hcx10 = 1;
	var c = creator;
	if (instance_exists(c)) switch (c.object_index) 
	{
		case LaserCrystal: 
		{
			with instance_create(x,y,EnemyLaser)
			{
				hcx10 = 1;
				team = other.creator.team
				creator = other.creator;
				image_xscale = 20;
				image_yscale = 20;
			}
		}
	}
}
*/

/*
with (instances_matching(EnemyLaser, "hcx10", null)) 
{
	hcx10 = 1;
	var c = creator;
	if (instance_exists(c)) switch (c.object_index) 
	{
		case LaserCrystal: 
		{
            repeat (9)
			{
				with instance_create(x,y,EnemyLaser)
				{
					motion_add(other.direction+random(40)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					hcx10 = 1;
				}
			}
		}
	}
}
*/