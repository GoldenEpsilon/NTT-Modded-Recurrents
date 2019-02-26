#define step
with enemy
{
	if "my_health" in self && my_health <= 0
	{
		if team = 3
		{
			if object_index != Van
			{
				with instance_create(x,y,Van)
				{
					alarm0 = -1
					if "carmageddon" not in self
					{
						carmageddon = 1
					}
				}
			}
		}
		else
		{
			instance_create(x,y,Car)
		}
	}
}
with instances_matching(Van, "carmageddon", 1)
{
	my_health -= 2
}
with instances_matching(enemy, "object_index",BanditBoss, FrogQueen, ScrapBoss, HyperCrystal, LilHunter, TechnoMancer, Nothing, Nothing2, Last)
{
	if my_health <= 0
	{
		repeat(10)
		{
			instance_create(x,y,Car)
		}
	}
}

with(Car)
{
	with Player
	{
		if skill_get(20) = 1
		{
			other.friction = -10
		}
		else
		{
			other.friction = -5
		}
	}
}
/*
with Car
{
	friction = -7
}*/

//Original Carmageddon code that spawned CarThrow instead of just Car.
/*
with enemy
{
	if my_health <= 0
	{
		instance_create(x,y,CarThrow)
	}
}

with instances_matching(enemy, "object_index",BanditBoss, FrogQueen, ScrapBoss, HyperCrystal, LilHunter, TechnoMancer, Nothing, Nothing2, Last)
{
	if my_health <= 0
	{
		repeat(10)
		{
			instance_create(x,y,CarThrow)
		}
	}
}
*/