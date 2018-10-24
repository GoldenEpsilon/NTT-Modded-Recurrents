#define init
skill_set_active(10, 0)
global.sprSkillIconHUD_10 = sprite_add("MutationHUD/sprSkillIconHUD_10.png", 1, 7, 8);

#define skill_name
return "back muscle x10"

#define skill_text
return "even higher max ammo"

#define skill_take 
sound_play(sndMutBackMuscle)

#define step
//jsnotes - this is the beginning of the end
with(Player)
{
	if ("musclex10" not in self){
		musclex10 = 1;
		typ_amax[1] += 4440;
		typ_amax[2] += 440;
		typ_amax[3] += 440;
		typ_amax[4] += 440;
		typ_amax[5] += 440;		
	}
	if ultra_get("melting", 2) == 1 && race = "melting" && "musclex100" not in self{
		musclex100 = 1;
		typ_amax[1] += 44400 - 4440;
		typ_amax[2] += 4400 - 440;
		typ_amax[3] += 4400 - 440;
		typ_amax[4] += 4400 - 440;
		typ_amax[5] += 4400 - 440;
	}
}


#define skill_icon
return global.sprSkillIconHUD_10

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 10;

#define skill_tip
return "incredible strength"

