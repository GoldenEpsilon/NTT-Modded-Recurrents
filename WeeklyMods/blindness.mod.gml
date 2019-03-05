#define init
loc_set("Skills:12:Text","@sSLOWER @wENEMY BULLETS@s#@wBULLETS @sARE EASIER TO SEE")
loc_set("Skills:19:Text","@sBETTER @wACCURACY#@wFOG @sIS LESS @wDENSE")
loc_set("Skills:28:Text","EXTRA @wCHEST@s SPAWN#SEE @wCHESTS @sAND @wPICKUPS @sTHROUGH @wFOG")

#define step
with(enemy){
	if("my_health" in self){	
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) + (ultra_get(3,2) * 0.6) - (distance_to_object(Player) *0.01)
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
if !skill_get(28){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
    }
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
if !ultra_get(3,1){
			image_alpha = 1.1+(skill_get(19)*0.3)+(skill_get(12)*0.6) - (distance_to_object(Player) *0.01)
	}else{
	image_alpha = 1
	}
}

with(Effect){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with(chestprop){
if !skill_get(28){
	if instance_exists(Player){
			image_alpha = 1.1+(skill_get(19)*0.3) - (distance_to_object(Player) *0.01)
	}
			spr_shadow = mskNone
    }
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

with(BulletHit){
			image_alpha = 1.1+(skill_get(19)*0.2) - (distance_to_object(Player) *0.01)
}

with instances_matching(EGSkillIcon, "name", "MONSTER STYLE"){
	
text = "PUSH NEARBY @wENEMIES@s AWAY#WHEN NOT USING @wTELEKINESIS@s#SEE @wENEMIES @sFROM @wMUCH FURTHER"

	}

with instances_matching(EGSkillIcon, "name", "PROJECTILE STYLE"){
	
text = "@wTELEKINESIS @sHOLDS YOUR @wPROJECTILES@s#SEE @wBULLETS ANYWHERE"

	}