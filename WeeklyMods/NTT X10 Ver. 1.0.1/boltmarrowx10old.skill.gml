#define init
skill_set_active(21, 0)
global.obj[0] = Bolt;
global.obj[1] = Disc;
global.obj[2] = Splinter;
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
    for(var i = 0;i<array_length_1d(global.obj);i++){
        with(global.obj[i]){
            if distance_to_object(enemy) <= 240 && distance_to_object(enemy) > speed && speed > 0{
                if(fork()){
                    while(instance_exists(self)){
                        if instance_exists(enemy){
                            var nearestenemy,dir,spd,_id;
                            nearestenemy = instance_nearest(x,y,enemy);
                            dir = point_direction(nearestenemy.x,nearestenemy.y,x,y);
                            speed = 0;
                            move_snap(nearestenemy.x+lengthdir_x(hspeed,dir),nearestenemy.y+lengthdir_y(vspeed,dir));
                            direction = dir + 180;
                            image_angle = direction;
                            wait 2;
                            if instance_exists(self){
                                speed = spd;
                            }
                        }else exit;
                    }
                    exit;
                }
            }
        }
    }

with(HeavyBolt)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
				}
			}
		}
}
with(ToxicBolt)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
				}
			}
		}
}
with(Splinter)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
				}
			}
		}
}
with(Disc)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
				}
			}
		}
}
with(Seeker)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
				}
			}
		}
}
with(UltraBolt)
{
	if speed > 0
		{
			dir = instance_nearest(x,y,enemy)
			if dir != noone
			{
				if point_distance(x,y,dir.x,dir.y) < 240
				{
					x = dir.x-hspeed
					y = dir.y-vspeed
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
return "What is this 'aim' you speak of?"
