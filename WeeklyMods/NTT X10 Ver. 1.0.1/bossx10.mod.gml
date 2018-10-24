#define step

//EnemyBullet1 contains Big Bandit, Big Dog, and Lil Hunter X10 code. Lil Hunter has LHBouncer as close range attack.

//Big Bandit Spawn X10

with(BanditBoss)
{
	if (GameCont.loops > 0) with (instances_matching(BanditBoss, "x10", null)) 
	{
		x10 = true;
		repeat (4) with (instance_create(x, y, BanditBoss)) x10 = true;
	}
}

//jsnotes - i hate this entire file, thanks

//Big Bandit, Big Dog, Lil Hunter(Long Ranged) X10
if (GameCont.loops > 0) with (instances_matching(EnemyBullet1, "bossx10", null)) 
{
	bossx10 = 1;
	var c = creator;
	if (instance_exists(c)) switch (c.object_index) 
	{
		case BanditBoss: 
		{
			repeat (9) with instance_create(x,y,EnemyBullet1) 
			{
				motion_add(c.gunangle+random(30)-15,8)
				image_angle = direction
				team = c.team
				creator = c;
				bossx10 = 1;
			}
		} 
		break;
		case ScrapBoss: 
		{
			repeat (9) 
			{
				with instance_create(x+lengthdir_x(24,c.gunangle),y+lengthdir_y(16,c.gunangle),EnemyBullet1)
				{
					motion_add(c.gunangle,4)
					image_angle = direction
					team = c.team
					creator = c;
					bossx10 = 1;
				}
				c.gunangle += 480/120;
			}
		} 
		break;
		case LilHunter: 
		{
			repeat (9) with instance_create(x,y,EnemyBullet1) 
			{
				motion_add(other.creator.gunangle - 30,5+random(6))
				image_angle = direction;
				other.creator.gunangle += 6;
				team = other.creator.team;
				bossx10 = 1;
			}
		} 
		break;
	}
}

//Lil Hunter close range attack X10
if GameCont.loops > 0 && instance_exists(LilHunter)
{
	with(LHBouncer)
	{
		speed = 3 + (GameCont.loops * 1.2);
		if("hunterx10" not in self)
        {
			hunterx10 = 1;
			repeat (GameCont.loops * 10)
			{
				with instance_create(x,y,LHBouncer)
				{
					motion_add(random(360)-15,8)
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

//Throne 1 Cannon
if (GameCont.loops > 0) && instance_exists(Nothing) with (instances_matching(BigGuardianBullet, "thronex10", null)) 
{
	thronex10 = 1;
	var t = creator;
	if (instance_exists(t))
	{
		if t.object_index = Nothing
		{
			repeat (GameCont.loops*2) with instance_create(x,y,BigGuardianBullet) 
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

//Throne 2 Cannon
if (GameCont.loops > 1) && instance_exists(Nothing2) with (instances_matching(BigGuardianBullet, "throne2x10", null)) 
{
	throne2x10 = 1;
	var t = creator;
	if (instance_exists(t))
	{
		if t.object_index = Nothing2
		{
			repeat (GameCont.loops*2) with instance_create(x,y,BigGuardianBullet) 
			{
                motion_add(other.direction+random(60)-15,other.speed)
				image_angle = direction
				team = other.creator.team
				creator = other.creator;
				throne2x10 = 1;
			}
		}
	}
}

//Throne 2 Laser Cannon
if (GameCont.loops > 1) && instance_exists(Nothing2) with (instances_matching(Throne2Ball, "throne2x10", null)) 
{
	throne2x10 = 1;
	var t = creator;
	if (instance_exists(t))
	{
		if t.object_index = Nothing2
		{
			repeat (GameCont.loops * 2) with instance_create(x,y,Throne2Ball) 
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

//Throne 1 Main Gun
if (GameCont.loops > 0) && instance_exists(Nothing) with (instances_matching(EnemyBullet2, "thronex10", null)) 
{
	thronex10 = 1;
	var t = creator;
	if (instance_exists(t))
	{
		if t.object_index = Nothing
		{
			repeat (GameCont.loops*2) with instance_create(x,y,EnemyBullet2) 
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

/*
//old codes for throne 1 and 2 which lagged hard
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
*/

/*
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
*/

//Mom X10
with(FrogQueen)
{
	if GameCont.loops > 0
	{
		if(speed > 0)
		{
		move_contact_solid(direction, (speed * (GameCont.loops * 10))*current_time_scale); // Replace # with how much speed you want to add
		}
	}
}

//Captain X10
//Captain's X10 Cannon Start
if (GameCont.loops = 1) with (instances_matching(LastBall, "captainx10", null)) 
{
	captainx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = Last
		{
            repeat (9)
			{
				with instance_create(x,y,LastBall)
				{
					motion_add(other.direction+random(60)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					captainx10 = 1;
				}
			}
		}
	}
}

if (GameCont.loops = 2) with (instances_matching(LastBall, "captainx10", null)) 
{
	captainx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = Last
		{
            repeat (49)
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
//Captain's X10 Cannon End

//Captain's Bullet Spread Start
if (GameCont.loops = 1) with (instances_matching(IDPDBullet, "captainx10", null)) 
{
	captainx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = Last
		{
            repeat (9)
			{
				with instance_create(x,y,IDPDBullet)
				{
					motion_add(other.direction+random(40)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					captainx10 = 1;
				}
			}
		}
	}
}

if (GameCont.loops = 2) with (instances_matching(IDPDBullet, "captainx10", null)) 
{
	captainx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = Last
		{
            repeat (49)
			{
				with instance_create(x,y,IDPDBullet)
				{
					motion_add(other.direction+random(80)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					captainx10 = 1;
				}
			}
		}
	}
}
//Captain's Bullet Spread end

/*
//Old Captain Code. Lagged like hell
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
*/

/*
with HyperCrystal
{
	crystals = max(10*GameCont.loops,3)
}
*/

//Technomancer
with(NecroReviveArea)
{
	if alarm0 < 5
	{
		image_xscale = 6;
		image_yscale = 6;
		if("technox10" not in self)
		{
			technox10 = 1;

			repeat(GameCont.loops*2)
			{
				instance_create(x,y,Necromancer)
				instance_create(x,y,Freak)
				instance_create(x,y,RhinoFreak)
				instance_create(x,y,ExploFreak)
				instance_create(x,y,PopoFreak)
			}
		}
	}
}



