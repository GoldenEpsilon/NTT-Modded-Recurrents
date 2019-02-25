#define step
if(!instance_exists(GenCont))
{
	with(Player)
	{
		if("lastAmmo" not in self)
		{
			lastAmmo = [];
			for(var i = 1; i <= 5; i += 1)
			{
				lastAmmo[i] = ammo[i];
			}
		}
		else
		{
			for(var i = 1; i <= 5; i += 1)
			{
				if(lastAmmo[i] < ammo[i])
				{
					with(Player)
					{
						if(self != other)
						{
							ammo[i] -= other.lastAmmo[i]-other.ammo[i];
							lastAmmo[i] = ammo[i];
						}
					}
				}
				
				lastAmmo[i] = ammo[i];
			}
		}
		
		for(var i = 1; i <= 5; i += 1)
		{
			ammo[i] = min(ammo[i], typ_amax[i]);
		}
	}
}
