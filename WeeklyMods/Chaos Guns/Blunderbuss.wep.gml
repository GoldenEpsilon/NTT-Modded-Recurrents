
#define init 
global.blunderbuss = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAL0AAAAOCAYAAAB6iR3rAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAACAUlEQVRoQ+2WMXLDMAwE/YdU+UDaPMHp0rhO50mRJs/IzxUAOnosECJBiUJsRztzY5EUcTyIhQ87OzsdGYZBFEGkF/OIuXavdbAD+WxvxiYgJBhxybYxYT0kwrzYBPyt19sPHvowHN9P0sRxOKWn15hnBFMZUdnutYfEzXyv0LvxqE1korLdaw+Jf33pU/BV4gaePs5pnMFeOEtXUD4jKpuVi6YXydNDYrLHi963xKskL/RuRu9vlaBxTjI7Pj8Nn68vIn7mja3iBt7ipd8621wuq05Nnh4SWSYvPbyua2h5kKqKLb7VnNfFLBldzEhpc6u4nlRVzF2OtaB8RlS2Ui6rhkdUdraHhJnJSw8vXeNaNaSqIupbJaSwNjp/fTerZobM3UF5i5BsOMYsVr051XpIFDN56eFVUgnU1iz20nLkGs20eL5VyRDjDGTuDspn8FpQNjlHCX7Ho1oPiWomLz28SpqD1ixWeV3LkSs347lxqRkx5N9xOAWZM7DcBLYKmMrAckQ2qa3BWivFHhKTPGsy8RkjvRKY0nTzImq5ZGEi/n9lyUHzpbd8WDWwXcBUBpYFHrIsL5aD4qVPSlgeLAfVi6hl+bBq4KipjsXEh2X5sGrASsCUppsXUb30vQkzQw/DghFR2R6yh7AK8SLCeihwrqStifJJROfavZaTex0Ov6YcE6ivhvNiAAAAAElFTkSuQmCC", 7, 0, 7);

#define weapon_name
	return "blunderbuss"; // Name

#define weapon_type
	return 0;

#define weapon_cost
	return 0; //cost

#define weapon_load
	return 40; //reload

#define weapon_auto
	return 0;

#define weapon_area
	return 5;

#define weapon_laser_sight
	return false; //bolt weapon without laser sight

#define weapon_melee
    return false;
	
#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_sprt
	return global.blunderbuss; // Wep Sprite, needs to be set the same name as what was defined in init

#define weapon_text
	return "everyone get in here"; // Loading Tip
	
#define weapon_fire
repeat(5){
	if(random(5)<1 and (ammo[1]>=1 or infammo != 0) or (ammo[1]>=5 and ammo[2]<1 and ammo[3]<1 and ammo[4]<1 and ammo[5]<1)){
		repeat(5){
			if(random(500)<1 && (ammo[1] >= 24 or infammo != 0)){
				with instance_create(x,y,SentryGun){
					other.ammo[1]-=24;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndHeavyMachinegun)
				}
			}else if(random(4)<1 && (ammo[1] >= 2 or infammo != 0)){
				with instance_create(x,y,HeavyBullet){
					other.ammo[1]-=2;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndHeavyMachinegun)
				}
			}else if(random(3)>1 && (ammo[1] >= 1 or infammo != 0)){
				with instance_create(x,y,Bullet2){
					other.ammo[1]-=1;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndPopgun)
				}
			}else if(random(2)>1 && (ammo[1] >= 1 or infammo != 0)){
				with instance_create(x,y,BouncerBullet){
					other.ammo[1]-=1;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+8)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndBouncerSmg)
				}
			}else if(ammo[1] >= 1 or infammo != 0){
				with instance_create(x,y,Bullet1){
					other.ammo[1]-=1;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndMachinegun)
				}
			}
		}
	}
	else if(random(4)<1 and (ammo[2]>=1 or infammo != 0) or (ammo[2]>=1 and ammo[3]<1 and ammo[4]<1 and ammo[5]<1)){
		if(random(3)<1 and (ammo[2]>=1 or infammo != 0)){
			with instance_create(x,y,Slug){
				other.ammo[2]-=1;
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(-4,0)+20)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndSlugger)
			}
		}else if(random(2)<1 and (ammo[2]>=2 or infammo != 0)){
			other.ammo[2]-=1;
			repeat(5){
				with instance_create(x,y,Bullet2){
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+14 + random(2))
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndShotgun)
				}
			}
		}else if(ammo[2]>=1 or infammo != 0){
			other.ammo[2]-=1;
			repeat(5){
				with instance_create(x,y,FlameShell){
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+14 + random(2))
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndFireShotgun)
				}
			}
		}
	}
	else if(random(3)<1 and (ammo[3]>=1 or infammo != 0) or (ammo[3]>=1 and ammo[4]<1 and ammo[5]<1)){
		if(random(300) < 1 and (ammo[3]>=1 or infammo != 0)){
			with(instance_create(x,y,ToxicBolt)){
				other.ammo[3]-=1;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndCrossbow)
			}
		}else if(random(30)<1 and (ammo[3]>=1 or infammo != 0)){
			with instance_create(x,y,Disc){
				other.ammo[3]-=1;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+7)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndDiscgun)
			}
		}else if(random(15) < 1 and (ammo[3]>=2 or infammo != 0)){
			with(instance_create(x,y,HeavyBolt)){
				other.ammo[3]-=2;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndHeavyCrossbow)
			}
		}else if(random(2) < 1 and (ammo[3]>=1 or infammo != 0)){
			with(instance_create(x,y,Bolt)){
				other.ammo[3]-=1;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndCrossbow)
			}
		}else if (random(2)<1 and (ammo[3]>=1 or infammo != 0)){
			repeat(5){
				with instance_create(x,y,Splinter){
					other.ammo[3]-=1;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndSplinterGun)
				}
			}
		}else if((ammo[3]>=1 or infammo != 0)){
			repeat(2){
				with(instance_create(x,y,Seeker)){
					other.ammo[3]-=1;
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndCrossbow)
				}
			}
		}
	}
	else if(random(2)<1 and (ammo[4]>=1 or infammo != 0) or (ammo[4]>=1 and ammo[5]<1)){
		if (random(20)<1){
			with instance_create(x,y,ConfettiBall){
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndPartyHorn)
			}
		}else if (random(4)<1 and (ammo[4]>=1 or infammo != 0)){
			other.ammo[4]-=1;
			with instance_create(x,y,Flare){
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndFlare);
			}
		}else if (random(3)<1 and (ammo[4]>=1 or infammo != 0)){
			other.ammo[4]-=1;
			repeat(24){
				with instance_create(x,y,Flame){
					motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+10)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndFlamerStart);
					sound_play(sndFlamerLoop);
				}
			}
		}else if ((ammo[4]>=1 or infammo != 0)){
			other.ammo[4]-=1;
			repeat(3){
				with instance_create(x,y,MiniNade){
					motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
					team = other.team
					creator = other.team; image_angle = direction;
					sound_play(sndGrenadeShotgun)
				}
			}
		}//Other stuff that is just too explosive to make the weapon good
		/*else if (random(500)<1 and (ammo[4]>=3 or infammo != 0)){
			other.ammo[4]-=3;
			with instance_create(x,y,Nuke){
				motion_set(other.gunangle+random_range(5,5)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndNukeFire)
			}
		}else if (random(6)<1 and (ammo[4]>=2 or infammo != 0)){
			other.ammo[4]-=2;
			with instance_create(x,y,ClusterNade){
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndClusterLauncher)
			}
		}else if (random(5)<1 and (ammo[4]>=2 or infammo != 0)){
			other.ammo[4]-=2;
			with instance_create(x,y,HeavyNade){
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndHeavyNader)
			}
		}else if (random(5)<1 and (ammo[4]>=1 or infammo != 0)){
			other.ammo[4]-=1;
			with instance_create(x,y,Rocket){
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndRocket)
			}
		}else if(ammo[4]>=1 or infammo != 0){
			with instance_create(x,y,Grenade){
				other.ammo[4]-=1;
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndGrenade)
			}
		}*/
	}
	else if((ammo[5]>=1 or infammo != 0) or (ammo[5]>=1)){
		if(random(100)<1 and (ammo[5]>=8 or infammo != 0)){
			with instance_create(x,y,PlasmaBig){
				other.ammo[5]-=8;
				team = other.team
				motion_set(other.gunangle+random_range(-40,40)*other.accuracy, random_range(-4,0)+10)
				creator = other.team; image_angle = direction;;
				sound_play(sndPlasmaBig);
			}other.ammo[5]-=1;
		}else if(random(3)<1 and (ammo[5]>=2 or infammo != 0)){
			with instance_create(x,y,PlasmaBall){
				other.ammo[5]-=2;
				team = other.team
				motion_set(other.gunangle+random_range(-40,40)*other.accuracy, random_range(-4,0)+10)
				creator = other.team; image_angle = direction;;
				sound_play(sndPlasma);
			}other.ammo[5]-=1;
		}else if(random(2)<1 and (ammo[5]>=1 or infammo != 0)){
			 // Sound:
			if(skill_get(17)) sound_play_pitch(sndLightningPistolUpg, random_range(0.85, 1.15));
			else sound_play_pitch(sndLightningPistol, random_range(0.85, 1.15));

			 // Kick, Shift, Shake:
			weapon_post(7, -7, 5);

			 // Lightning:
			with instance_create(x,y,Lightning){
				other.ammo[5]-=1;
				move_contact_solid(other.gunangle, 11);
				alarm0 = 1;
				ammo = 18;
				image_angle = other.gunangle + (random_range(-20, 20) * other.accuracy);
				team = other.team;
				creator = other
				with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
			}
		}else if(ammo[5]>=1 or infammo != 0){
			with instance_create(x,y,LaserCannon){
				sound_play(sndLaser);
				other.ammo[5]-=1;
				image_angle = other.gunangle + (random_range(-25, 25) * other.accuracy);
				ammo = 1
				alarm0 = 8;	// 8 Frame Charge
				hitid = [sprite_index, "LASER CHARGE"];
				team = other.team;
				creator = other;
			}
		}
	}
	else{
		with instance_create(x,y,PopupText){
			text = "empty!"
			sound_play(sndEmpty);
		}
		exit;
	}
}

weapon_post(6, -4, 4);

#define step
with instances_matching(projectile,"bussrotation",1){
    image_angle+= 30
}