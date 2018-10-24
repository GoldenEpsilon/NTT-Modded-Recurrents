#define init 
skill_set_active(12, 0)
global.sprSkillIconHUD_12 = sprite_add("MutationHUD/sprSkillIconHUD_12.png", 1, 7, 8);

#define skill_name
return "euphoria x10"

#define skill_text
return "turtle speed enemy bullets"

#define skill_take 
sound_play(sndMutEuphoria)

#define step
with instances_matching(projectile,"euphoriax10",null){
	euphoriax10 = 1
	if team != 2{
		if ultra_get("melting",2){
			speed *= .008
		}
		else speed *= .08
	}
}
#define skill_icon
return global.sprSkillIconHUD_12

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 12;

#define skill_tip
return "superhot"

