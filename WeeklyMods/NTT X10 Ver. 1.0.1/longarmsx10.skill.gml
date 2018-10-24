#define init
skill_set_active(13, 0)
global.sprSkillIconHUD_13 = sprite_add("MutationHUD/sprSkillIconHUD_13.png", 1, 7, 8);
global.meleeThingies = [Slash, EnergySlash, EnergyShank, EnergyHammerSlash, Shank, LightningSlash, BloodSlash, GuitarSlash]

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
var i;
with Player{
	var melt = 1
	if race = "melting" && ultra_get(race,2){
		melt = 10
	}
	with instances_matching(global.meleeThingies, "creator", id){
		if "longarmsx10" not in self{
			longarmsx10 = 1
			x+=lengthdir_x(20,direction)
			y+=lengthdir_y(20,direction)
		}
		speed = 30 * melt
	}
}


#define skill_icon
return global.sprSkillIconHUD_13

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 13;

#define skill_tip
return "all the reach"

