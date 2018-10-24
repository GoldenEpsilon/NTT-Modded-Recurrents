#define init
skill_set_active(23, 0)
global.sprSkillIconHUD_23 = sprite_add("MutationHUD/sprSkillIconHUD_23.png", 1, 7, 8);

#define skill_name
return "trigger fingers x10"

#define skill_text
return "kills reset your reload time"

#define skill_take 
sound_play(sndMutTriggerFingers)

#define step
with instances_matching_le(enemy,"my_health",0){
	if mod_current not in self{
		triggerfingersx10 = 1
		with(Player){
			reload *= 0.01;
			breload *= 0.01;
			wepshine = 7;
		}
	}
}



#define skill_icon
return global.sprSkillIconHUD_23

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 23;

#define skill_tip
return "brilliant idea!"
