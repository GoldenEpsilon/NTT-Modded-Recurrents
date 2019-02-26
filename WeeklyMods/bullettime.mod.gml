#define init
global._rs = room_speed;
global._cts = current_time_scale;
room_speed = 60;
global.cts = 0.5;

#define cleanup
room_speed = global._rs;
current_time_scale = global._cts;

#define step
current_time_scale = global.cts;

with(Player)
{
	if(distance_to_object(Portal) > 0)
	{
		var _list = [LHBouncer, EnemyBullet1, EnemyBullet2, EnemyBullet3, EnemyBullet4, FireBall, EFlakBullet, ToxicGas, TrapFire, JockRocket, PopoSlug, PopoPlasmaBall, PopoRocket, IDPDBullet, HorrorBullet, Disc, FiredMaggot];
		var _nts = current_time_scale;
		
		for(var i = 0; i < array_length_1d(_list); i += 1)
		{
			with(_list[i])
			{
				if(team != other.team
				&& distance_to_object(other) <= 8*speed
				&& point_distance(x, y, other.x, other.y) >= point_distance(x+hspeed, y+vspeed, other.x, other.y))
				{
					_nts = min(_nts, max(0.05, global.cts*(distance_to_object(other)/(8*speed))));
				}
			}
		}
		
		current_time_scale = _nts;
	}
}
