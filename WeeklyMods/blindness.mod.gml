#define init
global.famine = 0;
global.pestilence = 0;
global.war = 0;
global.death = 0;
global.conquest = 1;

#define step
with(enemy){
	if("my_health" in self){	
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
	}
}

with(prop){
	if("my_health" in self){	
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
	}
}

with(Pickup){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(Floor){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(Corpse){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
			spr_shadow = mskNone
}

with(DiscTrail){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
			spr_shadow = mskNone
}

with(LastIntro){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(NothingInactive){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(Tangle){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(Ally){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(CustomObject){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
			spr_shadow = mskNone
}

with(projectile){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
}

with(Effect){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with(chestprop){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
}

with(Scorch){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with(ScorchTop){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with(ScorchGreen){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with(CharredGround){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}