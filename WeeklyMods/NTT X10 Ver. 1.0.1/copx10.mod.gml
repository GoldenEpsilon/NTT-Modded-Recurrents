#define step

//jsnotes - my inner thigh has some fucked up skin for some reason, it just broke out real hard with weird sores. its incredibly itchy rn

//E. Grunt L2 X10
//jsnotes - i made the bullet duping for both popos here, ignore the label, also i added a bunch of conditions to accomadate that

if (GameCont.loops > 1) && GameCont.loops != 3  && GameCont.loops < 6 && (instance_exists(EliteGrunt) || instance_exists(PopoFreak)) with (instances_matching(IDPDBullet, "copx10", null)) 
{
	copx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = EliteGrunt || c.object_index = PopoFreak
		{
			repeat (9)
			{
				with instance_create(x,y,IDPDBullet)
				{
					motion_add(other.direction+random(60)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					copx10 = 1;
				}
			}
		}
	}
}

//jsnotes - making the exact same changes to all this template code is rough

//E. Grunt Bunker Buster L2 X10
if (GameCont.loops > 1) && instance_exists(EliteGrunt) with (instances_matching(PopoRocket, "copx10", null)) 
{
	copx10 = 1;
	var c = creator;
	if (instance_exists(c))
	{
		if c.object_index = EliteGrunt
		{
			repeat (9)
			{
				with instance_create(x,y,PopoRocket)
				{
					motion_add(other.direction+random(60)-15,other.speed)
					image_angle = direction
					team = other.creator.team
					creator = other.creator;
					copx10 = 1;
				}
			}
		}
	}
}
//jsnotes - good fucking god what convinced luigi this was ok, whatever im not questioning design decisions, im just code monkeying
if GameCont.loops > 5 && instance_exists(PopoFreak){
	with instances_matching(IDPDBullet, "plasmaswap", null){
		plasmaswap = 1
		if instance_exists(creator) && instance_is(creator,PopoFreak){
			with instance_create(x,y,PopoPlasmaBall){
				creator = other.creator
				team = other.team
				motion_set(other.direction,other.direction)
				image_angle = direction
				if GameCont.loops > 5{
					image_xscale = 6
					image_yscale = 6
				}
			}
			instance_delete(self)
		}
	}

}

/*
//L2 E. Grunt's Bunker Buster (Old Code)
with(PopoRocket)
{
	if instance_exists(creator) && creator.object_index = EliteGrunt
	{
		if (GameCont.loops = 2)
		{
			if("x10" not in self)
            {
                x10 = 1;
                repeat (10)
				{
					with instance_create(x,y,PopoRocket)
					{
						motion_add(other.direction+random(60)-15,other.speed)
						image_angle = direction
						team = other.creator.team
						creator = other.creator;
						x10 = 1;
                    }
				}
			}
		}
	}
}
*/

//L2 E. Inspector Slash
if GameCont.loops > 1 with instances_matching(EnemySlash, "sprite_index", sprPopoSlash){
	image_speed = 0.02
}


//L2 E. Shielder Plasmas
if instance_exists(EliteShielder) && GameCont.loops > 1{
	with instances_matching(PopoPlasmaBall, "bigballs", null){
		bigballs = 1
		if instance_exists(creator) && instance_is(creator,EliteShielder){
			image_xscale = 6	
			image_yscale = 6
		}
	}
}

//jsnotes - sure this is fine
//L2 E. Inspector Telekenisis
with(EliteInspector)
{
	var d, _x, _y, tb = 9;
	if control = 1
	{
		if (GameCont.loops > 1)
		{
			with (Player)
			{
				d = point_direction(x, y, other.x, other.y);
				_x = x + lengthdir_x(1 + tb, d);
				_y = y + lengthdir_y(1 + tb, d);
				if (place_free(_x, y)) x = _x;
				if (place_free(x, _y)) y = _y;
			}
		}
	}
}



//L4 and beyond IDPD Freak Nades spewing
/*with(PopoNade)
{
	if instance_exists(creator) && creator.object_index = PopoFreak
	{
		if (GameCont.loops > 3)
		{
			if("x10" not in self)
            {
                x10 = 1;
                repeat (10)
				{
					instance_create(x,y,PopoNade)
					x10 = 1;
				}
			}		
		}
	}
}
*/
