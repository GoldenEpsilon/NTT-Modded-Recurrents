#define init
global.bspeeds = [
					[Bandit, 4],
					[BanditBoss, 8],
					[Raven, 4],
					[Molefish, 4],
					[Grunt, 8],
					[Shielder, 8],
					[Inspector, 15],
					[JungleBandit, 12],
					[LilHunter, 10],
					[EliteGrunt, 10],
					[EliteShielder, 7],
					[EnemyHorror, 12]
				];

#define step
// with enemies that actually use a gun (I think there are some exceptions I will have to account for)
with(instances_matching_ne(enemy, "gunangle", undefined)){
	// getting bullet speed from array of data based on enemy type
	if("bullet_speed" not in self){
		for(i = 0; i < array_length_1d(global.bspeeds); i++){
			if(object_index = global.bspeeds[i][0]){
				bullet_speed = global.bspeeds[i][1];
				i = array_length_1d(global.bspeeds);
			}
		}
	}
	// if it actually got a speed
	else{
		if(instance_exists(Player)){
			var _p = instance_nearest(x, y, Player);	// closest Player to enemy
			var _dir = point_direction(x, y, _p.x, _p.y);	// direction from enemy to Player
			var _time = point_distance(x, y, _p.x + hspeed, _p.y + _p.vspeed) / bullet_speed; // time to get to point
			gunangle = point_direction(x, y, _p.x + _p.hspeed * _time, _p.y + _p.vspeed * _time);
		}
	}
}