#define init
skill_set_active(26, 0)
global.sprSkillIconHUD_26 = sprite_add("MutationHUD/sprSkillIconHUD_26.png", 1, 7, 8);

#define skill_name
return "hammer head x10"

#define skill_text
return "break through 200 walls"

#define skill_take 
sound_play(sndMutHammerhead)

#define step
with GenCont with Player{
	if race = "melting" && ultra_get("melting",2){
		hammerhead = 2000
	}
	else hammerhead = 200
}
with Player if place_meeting(x,y,Wall){
	instance_create(x,y,Hammerhead)
}

#define skill_icon
return global.sprSkillIconHUD_26

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 26;

#define skill_tip
return "bonk's legacy lives on"
