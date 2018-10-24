#define init
skill_set_active(4, 0)
global.sprSkillIconHUD_4 = sprite_add("MutationHUD/sprSkillIconHUD_4.png", 1, 7, 8);

#define skill_name
return "rabbit paw x10"

#define skill_text
return "100% ITEM DROPS"

#define skill_take 
sound_play(sndMutRabbitPaw)

#define step
if instance_exists(Player){
	if ultra_get("melting",2){
		with Player if race = "melting" && "pawx10" not in self{
			pawx10 = 1
			for(var i = 1;i<=5;i++) 
			{
				typ_ammo[i] *= 10;
			}
		}
	}
	with instances_matching_le(enemy,"my_health",0){
		if "pawx10" not in self{
			pawx10 = 1
			with player_find(irandom(instance_number(Player)-1))
			{
				if irandom(maxhealth) > my_health and random(3) < 2{
					instance_create(other.x,other.y,HPPickup)
				}
				else{
					instance_create(other.x,other.y,AmmoPickup)
				}
			}
		}
	}
}

#define skill_icon
return global.sprSkillIconHUD_4

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 4;

#define skill_tip
return "[7][7][7]"
