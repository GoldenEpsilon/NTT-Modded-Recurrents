#define init
skill_set_active(16, 0)
global.sprSkillIconHUD_16 = sprite_add("MutationHUD/sprSkillIconHUD_16.png", 1, 7, 8);

#define skill_name
return "recycle gland x10"

#define skill_text
return "all hit bullets become ammo"

#define skill_take 
sound_play(sndMutRecycleGland)
with(GameCont){
wepmuts += 1
}

#define step
with Player{
	var melt = 1
	if race = "melting" && ultra_get(race,2){
		melt = 10
	}
	with instances_matching([Bullet1,BouncerBullet],"creator",id){
		if place_meeting(x+hspeed_raw,y+vspeed_raw,enemy){
			other.ammo[1]+=10*melt
			sound_play(sndRecGlandProc)
		}
	}
	with instances_matching([UltraBullet,HeavyBullet],"creator",id){
		if place_meeting(x+hspeed_raw,y+vspeed_raw,enemy){
			other.ammo[1]+=20*melt
			sound_play(sndRecGlandProc)
		}
	}
}


#define skill_icon
return global.sprSkillIconHUD_16

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 16;

#define skill_tip
return "infinite ammo cheat activated"
