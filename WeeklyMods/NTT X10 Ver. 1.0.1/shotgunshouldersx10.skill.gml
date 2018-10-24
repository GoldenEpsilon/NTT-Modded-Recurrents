#define init
skill_set_active(15, 0)
global.shotty = [Bullet2, Slug, HeavySlug, UltraShell]
global.sprSkillIconHUD_15 = sprite_add("MutationHUD/sprSkillIconHUD_15.png", 1, 7, 8);

#define skill_name
return "shotgun shoulders x10"

#define skill_text
return "shells bounce up to 40 times"

#define skill_take 
sound_play(sndMutShotgunFingers)
with(GameCont){
wepmuts += 1
}

#define step
with Player{
	var melt = 1
	if race = "melting" && ultra_get(race,2){
		melt = 10
	}
	with instances_matching([Slug,Bullet2,HeavySlug,UltraShell,HyperSlug],"creator",id){
		if mod_current not in self{
			variable_instance_set(self,mod_current,1)
			wallbounce = 40*melt
		}
	}
	with instances_matching(FlameShell,"creator",id){
		if "x10shoulders" not in self{
			x10shoulders = 40 * melt
		}
		if x10shoulders{
			x10shoulders-=current_time_scale
			speed = 15
			wallbounce = 1
		}
	}
}

/*
with(Bullet2) 
{
	if ("x10" not in self){
	x10 = 1
	wallbounce = 40;
	}
}
with(HeavySlug) 
{
	if ("x10" not in self){
	x10 = 1
	wallbounce = 40;
	}
}
with(UltraShell) 
{
	if ("x10" not in self){
	x10 = 1
	wallbounce = 40;
	}
}
with(Slug) 
{
	if ("x10" not in self){
	x10 = 1
	wallbounce = 40;
	}
}
with(HyperSlug) 
{
	if ("x10" not in self){
	x10 = 1
	wallbounce = 40;
	}
}
*/

#define skill_icon
return global.sprSkillIconHUD_15

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 15;

#define skill_tip
return "shells are your bffs"