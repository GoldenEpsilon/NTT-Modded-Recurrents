#define step

//EnemyBullet1 contains Big Bandit, Big Dog, and Lil Hunter X10 code. Lil Hunter has LHBouncer as close range attack.

//Big Bandit Spawn X10
with BanditBoss
{
    if GameCont.loops > 0
    {
        if("x10" not in self)
        {
            x10 = 1;
            repeat(4)
            {
                with instance_create(x,y,BanditBoss)
				{
                    x10 = 1;
                }
            }
        }
    }
}

/*
More optimized Big Bandit spawning code by YAL. This is only here for pure educational purpose and reference

with(BanditBoss)
{
	if (GameCont.loops > 0) with (instances_matching(BanditBoss, "x10", null)) 
	{
		x10 = true;
		repeat (4) with (instance_create(x, y, BanditBoss)) x10 = true;
	}
}
*/

//Big Bandit X10
with EnemyBullet1
{
    if instance_exists(creator) && creator.object_index = BanditBoss
    {
        if GameCont.loops > 0
        {
            if("banditbossx10" not in self)
            {
                banditbossx10 = 1;
                repeat (9)
                {
                    with instance_create(x,y,EnemyBullet1)
                    {
                        motion_add(other.creator.gunangle+random(30)-15,8)
                        image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
                        banditbossx10 = 1;
                    }
                }
            }
        }
    }
	
	//Big Dog X10
    if instance_exists(creator) && creator.object_index = ScrapBoss
    {
        if GameCont.loops > 0
        {
            if("scrapbossx10" not in self)
            {
                scrapbossx10 = 1;
				repeat(10)
				{
					with instance_create(x+lengthdir_x(24,creator.gunangle),y+lengthdir_y(16,creator.gunangle),EnemyBullet1)
					{
						motion_add(other.creator.gunangle,20)
						image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
						scrapbossx10 = 1;
					}
					creator.gunangle += 480/120;
				}
			}
		}
	}
	
	//Lil Hunter X10
	if instance_exists(creator) && creator.object_index = LilHunter
	{
		if GameCont.loops > 0
		{
			if ("hunterx10" not in self)
			{
				hunterx10 = 1;
				repeat(GameCont.loops * 10)
				{
					/*x10 = 1;
					repeat(10)
					{
						with instance_create(x,y,EnemyBullet1)
						{
							motion_add(other.creator.gunangle - 30,5+random(6))
							image_angle = direction;
							team = other.creator.team;
							creator = other.creator;
							x10 = 1;
						}
					}*/
					with instance_create(x,y,EnemyBullet1)
					{
						motion_add(other.creator.gunangle - 30,5+random(6))
						image_angle = direction;
						other.creator.gunangle += 6;
						team = other.creator.team;
						hunterx10x10 = 1;
					}
				}
			}
		}
	}
}

//Lil Hunter close range attack X10
with(LHBouncer)
{
	if GameCont.loops > 0
	{
		speed = 3 + (GameCont.loops * 1.2);
		if("hunterx10" not in self)
        {
			hunterx10 = 1;
			repeat (GameCont.loops * 10)
			{
				with instance_create(x,y,LHBouncer)
				{
					motion_add(other.creator.gunangle+random(360)-15,8)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					hunterx10 = 1;
				}
			}
		}
	}
}

//Throne 1 & 2 X10 start
with BigGuardianBullet
{
	//Throne 1 Cannon shot
    if instance_exists(creator) && creator.object_index = Nothing
    {
        if GameCont.loops > 0
        {
            if("thronex10" not in self)
            {
                thronex10 = 1;
                repeat (GameCont.loops * 10)
                {
                    with instance_create(x,y,BigGuardianBullet)
                    {
                        motion_add(other.direction+random(30)-15,other.speed)
                        image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
                        thronex10 = 1;
                    }
                }
            }
        }
    }
	//Throne 2 Cannon Shots
	if instance_exists(creator) && creator.object_index = Nothing2
    {
        if GameCont.loops > 1
        {
            if("throne2x10" not in self)
            {
                throne2x10 = 1;
                repeat (GameCont.loops * 5) //Originally 10 instead of 5, but I had to reduce due to game engine struggling
                {
                    with instance_create(x,y,BigGuardianBullet)
                    {
                        motion_add(other.direction+random(30)-15,other.speed)
                        image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
                        throne2x10 = 1;
                    }
                }
            }
        }
    }
}

with EnemyBullet2
{
	//Throne 1 Spread attack
    if instance_exists(creator) && creator.object_index = Nothing
    {
        if GameCont.loops > 0
        {
            if("thronex10" not in self)
            {
                thronex10 = 1;
                repeat (GameCont.loops * 10)
                {
                    with instance_create(x,y,EnemyBullet2)
                    {
						sprite_index = sprExploGuardianBullet
                        motion_add(other.direction+random(30)-15,other.speed)
                        image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
                        thronex10 = 1;
                    }
                }
            }
        }
    }
}

with Throne2Ball
{
	//Throne 2 Long Laser attack
    if instance_exists(creator) && creator.object_index = Nothing2
    {
        if GameCont.loops > 1
        {
            if("throne2x10" not in self)
            {
                throne2x10 = 1;
                repeat (GameCont.loops * 5) //Originally 10 instead of 5, but I had to reduce due to game engine struggling
                {
                    with instance_create(x,y,Throne2Ball)
                    {
                        motion_add(other.direction+random(360)-15,other.speed)
                        image_angle = direction
                        team = other.creator.team
                        creator = other.creator;
                        throne2x10 = 1;
                    }
                }
            }
        }
    }
}
//Throne 1 & 2 X10 ends

//Mom X10
with(FrogQueen)
{
	if GameCont.loops > 0
	{
		if(speed > 0)
		{
		move_contact_solid(direction, (speed * (GameCont.loops * 10))); // Replace # with how much speed you want to add
		}
	}
}

//Captain X10
with(LastBall)
{
	if instance_exists(creator) && creator.object_index = Last
	{
		if (GameCont.loops = 1)
		{
			if("captainx10" not in self)
            {
                captainx10x10 = 1;
                repeat (10)
				{
					with instance_create(x,y,LastBall)
					{
						motion_add(other.direction+random(30)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						captainx10 = 1;
                    }
				}
			}
		}
		if (GameCont.loops = 2)
		{
			if("captainx10" not in self)
            {
                captainx10 = 1;
                repeat (50)
				{
					with instance_create(x,y,LastBall)
					{
						motion_add(other.direction+random(300)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						captainx10 = 1;
                    }
				}
			}
		}
	}
}

with(IDPDBullet)
{
	if instance_exists(creator) && creator.object_index = Last
	{
		if (GameCont.loops = 1)
		{
			if("captainx10" not in self)
            {
                captainx10 = 1;
                repeat (10)
				{
					with instance_create(x,y,IDPDBullet)
					{
						motion_add(other.direction+random(30)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						captainx10 = 1;
                    }
				}
			}
		}
		if (GameCont.loops = 2)
		{
			if("captainx10" not in self)
            {
                captainx10 = 1;
                repeat (50)
				{
					with instance_create(x,y,IDPDBullet)
					{
						motion_add(other.direction+random(30)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						captainx10 = 1;
                    }
				}
			}
		}
	}
}

//Technomancer
with(NecroReviveArea)
{
	if("x10" not in self)
	{
		x10 = 1;
		image_xscale = 6;
		image_yscale = 6;
		repeat(10)
		{
			instance_create(x,y,Necromancer)
		}
	}
}



