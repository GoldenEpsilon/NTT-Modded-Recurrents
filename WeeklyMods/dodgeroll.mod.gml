// /loadlive mods/dodgeroll.mod.gml

#define step
with(Player)
{
	if("msk" not in self) msk = mask_index;
	mask_index = msk;
	
	if(roll)
	{
		mask_index = mskNone;
		
		var w = instance_nearest(floor(x/16)*16, floor(y/16)*16, Wall);
		if(point_in_rectangle(x, y, w.x, w.y, w.x+16, w.y+16))
		{
			motion_set(point_direction(w.x+8, w.y+8, x, y), maxspeed);
		}
	}
}
