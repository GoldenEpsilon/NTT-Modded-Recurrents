
#define init
	global.newLevel = instance_exists(GenCont);

race_id = 16
	
//A-Skin
global.spr_idle[0] = sprite_add("dummy_idle.png", 4, 16, 16);
	global.spr_walk[0] = sprite_add("dummy_walk.png", 6, 16, 16);
	global.spr_hurt[0] = sprite_add("dummy_hurt.png", 3, 16, 16);
	global.spr_dead[0] = sprite_add("dummy_die.png", 6, 16, 16);
	global.spr_sit1[0] = sprite_add("dummy_sot.png", 3, 16, 16);
	global.spr_sit2[0] = sprite_add("dummy_sot1.png", 1, 16, 16);

//MenuSprites
	global.spr_slct = sprite_add("dummy_select.png", 1, 0, 0);
	global.spr_port = sprite_add("dummy_portrait.png",	race_skins(), 40, 243);
	
#define race_name
	return "DUMMY";

#define race_text
	return "SPAWNS DUMMIES";
	
#define race_menu_button
	sprite_index = global.spr_slct;
	
#define create
spr_idle = global.spr_idle[bskin];
	spr_walk = global.spr_walk[bskin];
	spr_hurt = global.spr_hurt[bskin];
	spr_dead = global.spr_dead[bskin];
	spr_sit1 = global.spr_sit1[bskin];
	spr_sit2 = global.spr_sit2[bskin];
	
#define race_portrait
	return global.spr_port;

#define race_ultra_name
switch (argument0) {
case 1: return "INCOMPLETE";
case 2: return "INCOMPLETE";
default: return "";
}

#define race_ttip
return ("You dummy!");

#define race_skins
	return 1;
	
#define race_skin_button
	sprite_index = global.spr_skin;
	image_index = argument0;
	
#define step
	///  ACTIVE : Spawns Dummies  \\\
	if(canspec){
	if(button_pressed(index, "spec")){
		if instance_exists(TutorialTarget){
			with(TutorialTarget){
			if "maxhealth" in self{
				my_health = -100
				maxhealth = -100
				}
			}
		}
		else if !instance_exists(TutorialTarget){
		instance_create(x, y, TutorialTarget){
		creator = other;
			with(TutorialTarget){
			if "maxhealth" in self{
			maxhealth = 100
			my_health = 100
			}
		}
			}
		}
	}
}