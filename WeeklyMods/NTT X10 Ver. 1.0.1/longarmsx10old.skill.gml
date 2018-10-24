#define init
skill_set_active(13, 0)
global.sprSkillIconHUD_13 = sprite_add("MutationHUD/sprSkillIconHUD_13.png", 1, 7, 8);

#define skill_name
return "long arms x10"

#define skill_text
return "++++++++++ melee range"

#define skill_take 
sound_play(sndMutLongArms)
with(GameCont){
wepmuts += 1
}

#define step
/*
with(Slash){
    if("x10" not in self)
    {
        x10 = 1;
        speed += 30;
    }
}
*/

//var _spd,_dir;
//_spd = skill_get(13) * 30;
//_dir = other.aimDirection;
//with(instance_create(x+lengthdir_x(_spd,_dir),y+lengthdir_y(_spd,_dir),Slash))
with(Slash)
{
	if instance_exists(creator) && creator.object_index = Player
    {
		if ("x10" not in self)
		{
			//with instance_create(x+lengthdir_x(1*20,other.creator.aimDirection),y+lengthdir_y(1*20,other.creator.aimDirection),Slash)
			x10 = 1
			with instance_create(x,y,Slash)
			{
				motion_add(other.creator.aimDirection,2+30)
				image_angle = direction
				team = other.creator.team
				creator = other.creator;
				x10 = 1
			}
		}
	}
}
/*
with(EnergySlash){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
*/
with(EnergySlash)
{
	if instance_exists(creator) && creator.object_index = Player
    {
		if ("x10" not in self)
		{
			//with instance_create(x+lengthdir_x(1*20,other.creator.aimDirection),y+lengthdir_y(1*20,other.creator.aimDirection),Slash)
			x10 = 1
			with instance_create(x,y,EnergySlash)
			{
				motion_add(other.creator.aimDirection,2+30)
				image_angle = direction
				team = other.creator.team
				creator = other.creator;
				x10 = 1
			}
		}
	}
}

with(EnergyShank){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
with(EnergyHammerSlash){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
with(LightningSlash){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
with(GuitarSlash){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
with(BloodSlash){
    if("x10" not in self){
        x10 = 1;
        speed += 30;
    }
}
with(Shank){
    if("x10" not in self){
        x10 = 1;
        speed += 27;
    }
}

#define skill_icon
return global.sprSkillIconHUD_13

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 13;

#define skill_tip
return "all the reach"

