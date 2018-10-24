#define init
skill_set_active(21, 0)
global.boltfriends = [Bolt, HeavyBolt, ToxicBolt, Splinter, UltraBolt]
global.sprSkillIconHUD_21 = sprite_add("MutationHUD/sprSkillIconHUD_21.png", 1, 7, 8);

#define skill_name
return "bolt marrow x10"

#define skill_text
return "heat seeking bolts"

#define skill_take 
sound_play(sndMutBoltMarrow)
with(GameCont){
	wepmuts += 1
}

#define step

if instance_exists(enemy){
	with Player{
		var melt = 1;
		if race = "melting" && ultra_get("melting",2) melt = 10
		for(var i = 0;i<array_length_1d(global.boltfriends);i++){
			with instances_matching(global.boltfriends[i],"creator",id){
				var killthisman = instance_nearest(x,y,enemy);
				var sped = speed //makes homing ranges unique for each type of bolt
				if i = 3 {sped += 5} //splinters get a bonus to homing range
				//jsnotes - fuck me im gonna have to add cases for x100 in everything arent i
				if distance_to_object(killthisman) <= sped * 10 * melt{ //default bolt speed is 24 there is no effective change in range for them
					x = killthisman.x - hspeed + killthisman.hspeed;
					y = killthisman.y - vspeed + killthisman.vspeed;
					with instance_create(x,y,BoltTrail){
						image_angle = point_direction(x,y,other.xprevious,other.yprevious)
						image_xscale = point_distance(x,y,other.xprevious,other.yprevious)
					}
					xprevious = x
					yprevious = y
				}
			}
		}
		with instances_matching(Disc,"creator",id){
			var killthismantoo = instance_nearest(x,y,enemy);
			if !collision_line(x,y,killthismantoo.x,killthismantoo.y,Wall,0,0){ //checks for LOS on enemy
				motion_add(point_direction(x,y,killthismantoo.x,killthismantoo.y), 1*melt);
				speed -= .5; //gives discs a slightly circular movement
				dist -= .25; //makes discs last longer while homing
				if speed >= 10 for (var d=-1;d<=1;d+=2){ //bonus visual for high speed discs
					with instance_create(x + lengthdir_x(6,direction + 90 * d), y + lengthdir_y(6,direction + 90 * d), BoltTrail){
						image_angle = other.direction
						image_xscale = other.speed
					}
				}
			}
		}
		//jsnotes - sorry sani, im lazy and its 3am, im not coding new seeker behavior.
		with instances_matching(Seeker,"creator",self){
			if "speedbonus" not in self { //prevents errors
				speedbonus = 0;
			}
			var killthismanaswell = instance_nearest(x,y,enemy);
			if !collision_line(x,y,killthismanaswell.x,killthismanaswell.y,Wall,0,0) && speed > 0{
				motion_add(point_direction(x,y,killthismanaswell.x,killthismanaswell.y),3);
				speedbonus += .5 * current_time_scale * melt;
				speedbonus = min(speedbonus,distance_to_object(killthismanaswell)) //prevents seekers from over shooting at high speeds
				x += lengthdir_x(speedbonus,direction); //speed doesnt work on seekers so i made my own movement
				y += lengthdir_y(speedbonus,direction);
				if "rocketing" not in self{ //makes a "take off" sound
					sound_play(sndRocket)
					rocketing = 1
				}
			}
		}
	}
}

#define skill_icon
return global.sprSkillIconHUD_21

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 21;

#define skill_tip
return choose("'aim' has no meaning here", "rocket powered seekers", "orbiting discs")
