#define init 
global.super_blunderbuss = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAL0AAAAPCAYAAACx1c5OAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAACY0lEQVRoQ+WWwXLDIAxE8zW55ZhLTp18Wf/clcQKC4wx1KBp3DezEyMwy8rMtLfJLPidzkLg0QsvP89cl/xerl4sDz82AahMxyubWw8JNy82AajMAz4MKvNYHo+HSxMlzgqqU/HK5tZD4pLfCx4KquDrGw9jkAa+Xi9pYiitjPRCmAjKCV7ZPrWHxJ/5Xq5346pNZLyyfWoPiX996TX0KWkDa03EOYYDiwSvbKVcVP6VWnpIxPU92PdYvV4taoXWJoz+VhaqpajZ/X5fns+niJ/5xV5pA2tNxDmGA4sEr2x7uUr7HKnmw5Qy9XDWq6V/LcjOhhnfSpGdLWqmRmrGsk3pFe8pOxv2LscIYJHgla2Wq/R+q2jrYg+JTaYeznq19O8I2dkw61uVvBjZODd6v9/dsma8b9h+RU4wCVjkuGTDEXYp7benmg/YzdTDWa8W1cD+llNeVg25glkurluV/ozka6whagnIOwVYJHDdKZucoQavGeDDVDP1cNZLVcu1B83lnPZSNeTamnEtTCXEjWpNUkN+DqUV5N2A6QjKCZiKoBxBOQFTHtlk7xzMWc76MEmevUw4QgKmIlwb4UUc5pIDGFC2DPMijnJJMRH/f1WSXSOjLd2XvuTDwrSA1xMwFUE5AVMCD1klL5bOQyWql16llDxYdq2MthxexFwlHxaOItC6DZga4mXXyCgDVhGULfZ9UcmHZdfIaMvhpR+NGPJvGM4D/RNQmo1XNvce8mOozANWAkozceuhImYe2aSDBIYeeGVz7yGByjzgw6AyFbceKm5OrqkCXn6X7KHz9zJet9sP7VIXPXBph5kAAAAASUVORK5CYII=", 7, 0, 7);
#define weapon_name
	return "super blunderbuss"; // Name

#define weapon_type
	return 0;

#define weapon_cost
	return 0; //cost

#define weapon_load
	return 100; //reload

#define weapon_auto
	return 0;

#define weapon_area
	return 8;

#define weapon_laser_sight
	return false; //bolt weapon without laser sight

#define weapon_melee
    return false;
	
#define weapon_swap
	return sndSwapShotgun; // Swap sound

#define weapon_sprt
	return global.super_blunderbuss; // Wep Sprite, needs to be set the same name as what was defined in init

#define weapon_text
	return "stuff it all in!"; // Loading Tip
	
#define weapon_fire
repeat(25){
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

weapon_post(6, -4, 4)

#define step
with instances_matching(projectile,"bussrotation",1){
    image_angle+= 30
}
#define ls_step

	 // Laser Firing:
	if(alarm0 >= 0){
		alarm0 -= 1;
		if(alarm0 = 0){
			 // Sound:
			if(skill_get(17)) sound_play_pitch(sndLaserUpg,	0.75);
						 else sound_play_pitch(sndLaser,	0.75);

			 // Kick, Shift, Shake:
			with(creator) weapon_post(6, -14, 8);

			 // Accuracy Stuff:
			var _accuracy = 1;
			if("accuracy" in creator) _accuracy = creator.accuracy;

			 // Laser Shotgun:
			repeat(ammo) with instance_create(x,y,Laser){
				alarm0 = 1;
				image_angle = other.direction + (random_range(-14, 14) * _accuracy);
				image_yscale = 1.6 + (skill_get(17) * 0.6);
				hitid = [sprite_index, "LASER"];
				team = other.team;
				creator = other.creator;
			}

			instance_destroy();
		}
	}