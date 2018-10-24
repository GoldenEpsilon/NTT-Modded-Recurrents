#define init
skill_set_active(22, 0)
global.sprSkillIconHUD_22 = sprite_add("MutationHUD/sprSkillIconHUD_22.png", 1, 7, 8);

#define skill_name
return "stress x10"

#define skill_text
return "much, much higher#rate of fire#as hp gets lower"

#define skill_take 
sound_play(sndMutStress)

#define step
//jsnotes - luigi was going off of u19 stress, which apparently was *3.5 rather than *10, it was p nutso before, now its special
with Player{
	if reload > 0{
		reload -= (1-(my_health/maxhealth))*10*current_time_scale
	}
	if race = "steroids" && breload > 0{
		breload -= (1-(my_health/maxhealth))*8*current_time_scale
	}
}

#define skill_icon
return global.sprSkillIconHUD_22

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 22;

#define skill_tip
return "@qtrembling"