#define init
skill_set_active(3, 0)
global.sprSkillIconHUD_3 = sprite_add("MutationHUD/sprSkillIconHUD_3.png", 1, 7, 8);
global.items = [Rad, BigRad, AmmoPickup, HPPickup]

#define skill_name
return "plutonium hunger x10"

#define skill_text
return "item black hole"

#define skill_take 
sound_play(sndMutPlutoniumHunger)

#define step
if instance_exists(Player){
	with instances_matching([Rad,BigRad,AmmoPickup,HPPickup],"visible",1){
		var p = instance_nearest(x,y,Player);
		var melt = 1;
		if p.race = "melting" && ultra_get(p.race,2){
			melt = 10
		}
		if point_seen(x,y,p.index) move_contact_solid(point_direction(x,y,p.x,p.y),10*melt*current_time_scale)
	}
}

#define skill_icon
return global.sprSkillIconHUD_3

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 3;

#define skill_tip
return "need those delicious rads"
