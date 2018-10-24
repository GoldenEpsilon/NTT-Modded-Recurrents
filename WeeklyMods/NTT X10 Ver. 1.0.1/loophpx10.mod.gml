/*
#define step
with enemy
{
    if "xtrahealth" not in self
        xtrahealth = my_health*GameCont.loops
        if my_health != maxhealth and xtrahealth > 0
        {
            var diff;
            diff = maxhealth - my_health
            xtrahealth -= diff
            my_health = maxhealth
        }
}
*/

#define var_matching
    if string(argument0) not in self{
        return 0;
    }else{
        var _tru;//_array;
        _tru = 0;
        //_array = argument1;
        for(var i = 0;i<array_length_1d(argument1);i++){
            if argument0 = argument1[i]{
                _tru = 1;
                break;
            }
        }
        return _tru;
    }
    
#define step
if GameCont.loops > 0{
	with instances_matching(enemy, "loophpx10", null){
		loophpx10 = 1
		if !instance_is(self,Nothing2){
			my_health += ((my_health*.5)*GameCont.loops)
			if var_matching("object_index",[BanditBoss, FrogQueen, ScrapBoss, HyperCrystal, LilHunter, TechnoMancer, Nothing, Last])
			{
				my_health += my_health*4
			}
			my_health = round(my_health)
		}
	}
}

//jsnotes - you know what, this is fine, im fairly convinced i dont need to change this
with(Nothing2)
{
	if "lifex10" not in self
	{
		lifex10 = GameCont.loops
	}
	if my_health <= 0
	{
		if lifex10 > 0
		{
			my_health = maxhealth
			lifex10 -= 1
		}
	}
}
//with Bandit trace(my_health)
