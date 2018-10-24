#define init
skill_set_active(17, 0);
global.sprSkillIconHUD_17 = sprite_add("MutationHUD/sprSkillIconHUD_17.png", 1, 7, 8);

#define skill_name
return "laser brain x10"

#define skill_text
return "energy weapons deal massive damage"

#define skill_take 
sound_play(sndMutLaserBrain)
with(GameCont){
	wepmuts += 1
}

#define step
with Player{
	if race = "melting" && ultra_get(race,2){
		var melt = 10
	}
	else melt = 1
	with instances_matching([PlasmaBall,PlasmaBig,PlasmaHuge],"creator", id){
		if brain(){
			image_xscale = 12 * melt
			image_yscale = 12 * melt
		}
	}
	with instances_matching([EnergySlash,EnergyShank,EnergyHammerSlash,Lightning],"creator", id){
		if brain(){
			image_speed = .04/melt
		}
	}
	with instances_matching(Laser,"creator",id){
		if brain(){
			image_yscale = 12*melt
		}
	}
	with instances_matching(PlasmaImpact,"creator",id){
		if brain(){
			image_yscale = 4*melt
			image_xscale = 4*melt
			damage = 20*melt
		}
	}
	with instances_matching(LaserCannon,"creator",id){
		if brain(){
			ammo+=20*melt
		}
	}
	with instances_matching(Devastator,"creator",id){
		if brain(){
			speed *= .3/melt
		}
	}
}

#define brain()
if "brainx10" not in self{
	with instance_create(other.x,other.y,LaserBrain) image_angle = random(360)
	brainx10 = 1
	return 1
}
return 0

#define skill_icon
return global.sprSkillIconHUD_17
	
#define skill_button 
sprite_index = sprSkillIcon;
image_index = 17;

#define skill_tip
return "all these power..."

