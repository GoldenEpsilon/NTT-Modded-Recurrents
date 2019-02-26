global.elites[0] = EliteGrunt
global.elites[1] = EliteShielder
global.elites[2] = EliteInspector

#define step
with instances_matching(EGSkillIcon, "name", "SUPER PORTAL STRIKE"){
		
		name = "@wSUPER PORTAL STRIKE@s";
		text = "@sDOUBLE @bPORTAL STRIKE@s CAPACITY#@bIDPD@s CAN DROP @bPORTAL STRIKE@s PICKUPS@s"
	}
with instances_matching(EGSkillIcon, "name", "SUPER BLAST ARMOR"){
		
		name = "@wSUPER BLAST ARMOR@s";
		text = "@sMORE @bBLAST ARMOR@s COVERAGE#@bIDPD@s CAN DROP @bPORTAL STRIKE@s PICKUPS@s"
	}
if(ultra_get(12,1)){
	
	with instances_matching(enemy,"team",3){
		if ("rf" not in self){
			rf = 1
			}
		for(i = 0; i < array_length_1d(global.elites); i++){
			with(global.elites[i]){
				rf = 2
				}
			}
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 1*other.rf
			}
		}
	with LilHunter{
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 8
			}
		}
	with PopoFreak{
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 1
			}
		}
	with(RoguePickup){
		if distance_to_object(Player) <=16 || distance_to_object(Portal) <= 16{
			mask_index = mskNone;
			if distance_to_object(Player) <=4 || distance_to_object(Portal) <= 4{
				with(instances_matching(Player,"race","rogue")){
					var _ult = ultra_get("rogue",1);
					if rogueammo + 1 < 3 + (3 * _ult){
						with(instance_create(x,y,PopupText)){
							text = "+1 PORTAL STRIKE";
						}
						rogueammo++;
					}else{
						with(instance_create(x,y,PopupText)){
							text = "MAX PORTAL STRIKES";
						}
						rogueammo = 3 + (3 * _ult);
					}
				}
				sound_play(sndRogueCanister);
				instance_destroy();
			}
		}else mask_index = mskPickup;
		}
	}
if(ultra_get(12,2)){
	
	with instances_matching(enemy,"team",3){
		if ("rf" not in self){
			rf = 1
			}
		for(i = 0; i < array_length_1d(global.elites); i++){
			with(global.elites[i]){
				rf = 2
				}
			}
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 1*other.rf
			}
		}
	with LilHunter{
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 8
			}
		}
	with PopoFreak{
		with script_bind_end_step(resourceful,1,self,x,y){
			spawnchance = 1
			}
		}
	}
	//alt blastarmor
//with instances_matching(PopoExplosion,"team",2){
//	if ("creator" not in self) && instance_exists(Player){
//		creator = instance_nearest(x,y,Player)
//		direction = creator.gunangle
//		creatorx = creator.x
//		creatory = creator.y
//		var _dir = 0
//		repeat 3{
//			with instance_create(x+lengthdir_x(20,direction+_dir),y+lengthdir_y(20,direction+_dir),PopoExplosion){
//				creator = other.creator
//				team = 2
//				image_xscale*=1/3
//				image_yscale*=1/3
//				_dir += 360/3
//				}
//			}
//		instance_destroy()
//		}	
//	else if instance_exists(Player)
//		motion_set(point_direction(x,y,creator.x,creator.y)-70,12+(image_index/12))
//	}

#define resourceful
if !instance_exists(argument0) && spawnchance+(skill_get(4)) >= irandom(8){
	with instance_create(argument1,argument2,RoguePickup){
		motion_add(random(360),2)
		}
	}
instance_destroy()


