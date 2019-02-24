#define step
	with instances_matching(Flame,"damage",2){ 
		damage = 1
		//trace(damage)
		}
	with enemy if place_meeting(x,y,Flame) and random(4*(size*2))<1{
		with instance_create(x,y,Flame){
			team = 2;
			damage = 1;
			motion_add(random(360),random(3))
			}
		}