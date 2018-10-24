#define init
skill_set_active(11, 0)
global.sprSkillIconHUD_11 = sprite_add("MutationHUD/sprSkillIconHUD_11.png", 1, 7, 8);

#define skill_name
return "scarier face x10"

#define skill_text
return "enemies will have#a heart attack"

#define skill_take 
sound_play(sndMutScarierFace)

#define step
with instances_matching(enemy,mod_current,null){
	variable_instance_set(self,mod_current,1)
	if "my_health" in self{
		if ultra_get("melting", 2){
			if GameCont.loops > 0{
				my_health = ceil(my_health * 0.2);	
			}
			else{
				my_health = ceil(my_health * 0.008);
			}
		}
		else{
			if GameCont.loops > 0{
				my_health = ceil(my_health * 0.4);	
			}
			else{
				my_health = ceil(my_health * 0.08);
			}
		}
	}
}

#define skill_icon
return global.sprSkillIconHUD_11
	
#define skill_button 
sprite_index = sprSkillIcon;
image_index = 11;

#define skill_tip
return "mirrors will shatter"

