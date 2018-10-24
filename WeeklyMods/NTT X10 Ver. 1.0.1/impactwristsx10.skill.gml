#define init
skill_set_active(20, 0)
global.sprSkillIconHUD_20 = sprite_add("MutationHUD/sprSkillIconHUD_20.png", 1, 7, 8);

#define skill_name
return "impact wrist x10"

#define skill_text
return "corpses fly#&#hit like a truck"

#define skill_take 
sound_play(sndMutImpactWrists)

#define step
with instances_matching(Corpse,"impactx10",null){
	impactx10 = 1
	if size < 5 impactx10s = 100 + (900*ultra_get("melting",2))
}
with instances_matching_gt(Corpse,"impactx10s",0){
	impactx10s-=current_time_scale
	speed = 20
}

//Original Impact Wrist that was pretty broken
/*with(Corpse)
{
	if "impactx10" not in self
	{
		impactx10 = 1
		speed += 80
	}
}*/

#define skill_icon
return global.sprSkillIconHUD_20

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 20;

#define skill_tip
return "homerun"

