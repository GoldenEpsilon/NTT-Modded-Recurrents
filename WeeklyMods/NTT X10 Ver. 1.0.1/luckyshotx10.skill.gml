#define init
skill_set_active(6, 0)
global.sprSkillIconHUD_6 = sprite_add("MutationHUD/sprSkillIconHUD_6.png", 1, 7, 8);

#define skill_name
return "lucky shot x10"

#define skill_text
return "all kills regenerate ammo en mass"

#define skill_take 
sound_play(sndMutLuckyShot)

#define step
//jsnotes - fun fact, this used to only give you .2 times the regular ammo, and it would claim to give you 5 times the ammo
with instances_matching_le(enemy,"my_health",0){
	if "luckyshotx10" not in self{
		luckyshotx10 = 1
		if instance_exists(Player) && random(1) < .85{
			with player_find(irandom(instance_number(Player)-1)){
				var melt = 1
				if race = "melting" && ultra_get(race,2){
					melt = 10
				}
				var t = choose(1,2,3,4,5);
				sound_play(sndLuckyShotProc)
				ammo[t] = min(typ_amax[t], ammo[t]+(typ_ammo[t]*melt))
				with instance_create(x,y,BloodLust){
					sprite_index = sprLuckyShot
					creator = other
				}
				with instance_create(x,y,PopupText){
					text = (other.ammo[t] = other.typ_amax[t] ? "MAX " + other.typ_name[t] : "+"+string(other.typ_ammo[t]*melt)+ " " +other.typ_name[t] )
					target = other.index
				}
			}
		}
	}
}

#define skill_icon
return global.sprSkillIconHUD_6
	
#define skill_button 
sprite_index = sprSkillIcon;
image_index = 6;

#define skill_tip
return "sea of ammo"