#define init
skill_set_active(14, 0)
global.sprSkillIconHUD_14 = sprite_add("MutationHUD/sprSkillIconHUD_14.png", 1, 7, 8);

#define skill_name
return "boiling veins x10"

#define skill_text
return "no damage from explsions#and fire under 40hp"

#define skill_take 
sound_play(sndMutBoilingVeins)
with(GameCont){
	wepmuts += 1
}

#define step
//jsnotes - well that was way easier than before, thanks yal
with Player if "boilingveinsx10" not in self{
	boilingveinsx10 = 1
	boilcap = 40
}

#define skill_icon
return global.sprSkillIconHUD_14

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 14;

#define skill_tip
return "temperature is sky high"
