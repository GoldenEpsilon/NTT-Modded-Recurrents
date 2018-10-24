#define init
skill_set_active(7, 0)
global.sprSkillIconHUD_7 = sprite_add("MutationHUD/sprSkillIconHUD_7.png", 1, 7, 8);

#define skill_name
return "bloodlust x10"

#define skill_text
return "almost all kills#regenerate hp"

#define skill_take 
sound_play(sndMutBloodLust)

#define step
//jsnotes - good lord was this a mess beforehand, it didnt even make the cool particles
with instances_matching_le(enemy,"my_health",0){
	if "bloodlustx10" not in self{
		bloodlustx10 = 1
		if instance_exists(Player) && random(13) < 10{
			with player_find(irandom(instance_number(Player)-1)){
				my_health = min(++my_health,maxhealth)
				sound_play(sndBloodlustProc)
				with instance_create(x,y,BloodLust){
					creator = other
				}
				with instance_create(x,y,PopupText){
					text = (other.my_health = other.maxhealth ? "MAX HP" : "+1 HP")
					target = other.index
				}
			}
		}
	}
}

#define skill_icon
return global.sprSkillIconHUD_7
	
#define skill_button 
sprite_index = sprSkillIcon;
image_index = 7;

#define skill_tip
return "chug blood"
