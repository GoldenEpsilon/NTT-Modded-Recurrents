#define init
skill_set_active(19, 0)
global.sprSkillIconHUD_19 = sprite_add("MutationHUD/sprSkillIconHUD_19.png", 1, 7, 8);

#define skill_name
return "eagle eyes x10"

#define skill_text
return "pixel perfect accuracy & homing"

#define skill_take 
sound_play(sndMutEagleEyes)

#define step
with(Player)
{
	if "eagleeyesx10" not in self{
		accuracy *= .04
		eagleeyesx10 = 1
	}
	if race = "melting" && ultra_get(race,2) && "eagleeyesx100" not in self{
		accuracy /= .04
		accuracy *= .004
		eagleeyesx100 = 1
	}
}

//Homing code by Jsburg#1045
//jsnotes - damn right it is
with Player {
	with instances_matching(projectile,"creator",id){
		if object_index != Laser {
			var prevspeed = speed;
			var targetenemy;
			if (instance_exists(enemy)){
				var targetenemy = instance_nearest(x,y,enemy);
				if !collision_line(x,y,targetenemy.x,targetenemy.y,Wall,0,0){
					motion_add(point_direction(x,y,targetenemy.x,targetenemy.y),prevspeed/3)
					image_angle = direction
				}
			}
			speed = prevspeed;
		}
	}
	with instances_matching(Laser,"creator",id){
		if instance_exists(enemy){
			var thisguy = instance_nearest((x+xstart)/2,(y+ystart)/2,enemy);
			var ang = point_direction(xstart,ystart,thisguy.x,thisguy.y);
			if !collision_line(xstart,ystart,thisguy.x,thisguy.y,Wall,0,0){
				var difang = ang - .5*(angle_difference(ang,image_angle));
				image_xscale = 1
				x = xstart 
				y = ystart
				image_angle = difang
				alarm0 = 1
			}
		}
	}
}

//Old version
/*
with(projectile) if (team = 2 || object_index = Disc) {
	if (instance_exists(self)) {
		var prevspeed = speed;
		var targetenemy;
		if (instance_exists(enemy)) {
			targetenemy = instance_nearest(mouse_x,mouse_y,enemy)
			motion_add(point_direction(x,y,targetenemy.x,targetenemy.y),prevspeed/3)
			image_angle = direction
		}
		speed = prevspeed;
	}
}
*/

#define skill_icon
return global.sprSkillIconHUD_19

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 19;

#define skill_tip
return "we cs:go now boys"
