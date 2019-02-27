// /loadmod mods/crazytraps.mod.gml

#define init
global.gce = 0;
global.projectiles = [];
for(var i = 0; i < 9999; i += 1)
{
	if(object_get_parent(i) == projectile)
	{
		global.projectiles[array_length_1d(global.projectiles)] = i;
		//trace(object_get_name(i));
	}
}

//#define game_start
//GameCont.area = 3;

#define step
if(instance_exists(GenCont))
{
	global.gce = 1;
}
else if(global.gce)
{
	global.gce = 0;
	
	with(Wall)
	{
		var alone = 0;
		for(var i = 0; i < 360; i += 90)
		{
			if(place_free(x+lengthdir_x(16, i), y+lengthdir_y(16, i)))
			{
				alone += 0.25;
			}
		}
		
		if(alone == 1)
		instance_create(x, y, Trap);
	}
	
	while(instance_number(Trap) < 3)
	{
		with(Wall)
		{
			var alone = 0;
			for(var i = 0; i < 360; i += 90)
			{
				if(place_free(x+lengthdir_x(16, i), y+lengthdir_y(16, i)))
				{
					alone += 0.25;
				}
			}
			
			if(alone != 1
			&& random(1) < 0.01)
			instance_create(x, y, Trap);
		}
	}
}

with(Trap)
{
	if("projType" not in self) projType = global.projectiles[random(array_length_1d(global.projectiles)-1)];
}

with(TrapFire)
{
	if(distance_to_object(Trap) <= 16)
	{
		var _trap = instance_nearest(x, y, Trap);
		
		if("projType" in _trap)
		{
			if(distance_to_object(Floor) <= 0)
			{
				with(instance_create(x, y, _trap.projType))
				{
					speed = max(speed, other.speed);
					direction = other.direction;
					image_angle = direction;
					creator = other.creator;
					//team = other.team;
					team = -999;
				}
			}
			
			instance_destroy();
		}
	}
}
