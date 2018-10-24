#define step
/*


with Van
{
	walls = 100
	image_xscale = 2.8;
	image_yscale = 2.8;
	trace(drivespeed)
	if "truckx10" not in self
	{
		truckx10 = 1
		drivespeed = 30
	}
}
*/

//jsnotes - im not feeling this, but ill leave it be, laze modder

with VanSpawn
{
    if GameCont.loops > 0 && GameCont.loops < 4
    {
        if("x10" not in self)
        {
            x10 = 1;
            repeat(GameCont.loops * 10)
            {
                with instance_create(x,y,VanSpawn)
				{
                    x10 = 1;
                }
            }
        }
    }
	if GameCont.loops > 3
	{
		image_xscale = 2.5;
		image_yscale = 2.5;	
	}
}

with Van
{
	if GameCont.loops > 3
	{
		meleedamage = 200
		walls = 100
		with script_bind_draw("partyx10",0)
		{
			creator = other
			right = other.image_xscale
		}
		image_xscale = 2.5;
		image_yscale = 2.5;
		if "truckx10" not in self
		{
			truckx10 = 1
			drivespeed = 18
		}
		image_alpha = 0
	}
}

#define partyx10
with creator
{
    draw_sprite_ext(sprite_index,image_index,x,y,2.5*right,2.5,image_angle,c_white,1);
}   
instance_destroy()