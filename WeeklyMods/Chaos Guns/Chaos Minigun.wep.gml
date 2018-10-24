#define LOGO
/*iVBORw0KGgoAAAANSUhEUgAAABsAAAAOCAYAAADez2d9AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAABGklEQVQ4T62UsW7CMBRFo5axC+rExIDUFakbHYAdZraqP9CpI1Ilhk58ACNfwK/wTYbzkus+O04VVK50ZOfl5V7biVJlCj24i8L5bZDwPXls1eir26OKiwghRBItdzYk5qUgavTRL7j+3P4o0Jyp9woTq6eH5FrQl4HCevOehLog9dRqwlBinAe+zuYGxkB/T36lnZVQAOwPR4MgRnbi0e7ysfGqpbDF6Dl8TF8M5n4XHgWX6nkN8LYEpDAFKUyBt4BPB1GtXQGr0tF5VMc8rwF+tW07CMUAD2Y6Co9C/H3N8RIuGKJaQdS6KBmrDsyHq5OFjb/s+4eo+IDgPXahHh25H3UPsgX9S3+FSXcJQjLKMekP0vxFrqqqCw4NuzrMAB10AAAAAElFTkSuQmCC*/
#define README
/*Adds a minigun that uses all types of ammo and shoots out most types of projectiles*/
#define init 
global.chaos_minigun = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAL0AAAAOCAYAAAB6iR3rAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAADEklEQVRoQ+WWMY7UQBBFR0BIgoiICJBIkcggAPIlJkNcgIgQCYmAiAMQcgKuwpmG+uX6nnK529s93e2ZFU/6sqfd/m/KnhUcAseCdOFYgG3tQZwhlV6kumO6YI9pE9vagzhDKr1Idcd04fj39YNFvj27v1rDvmn7TPJL4HkzEbyMUuwWxZaqXMJqhpFzxd7/+RnCA+zjDJaYBKveIc/w3Xc9LMpTIqxhH/Yz+Pz56w8KtRnrOZldK8a7bGnG9WVdwu5z+V7v4Zpsb3YJUBXhXbakoANFJa5zniEcHhSNcuFzzTNcyJibh/cWnxnsCwHH9x8+LqROxD2KfZGzwP12GlGXnjguORc6R7oE7apFb3Tgoy3d6mJq5kJxAnXpiaP3+zKSLsrAojgKX756o0Exgv2FmaELX2IEU/vEpeca7RK0sxX0hMz0eIZboJiMeF8e+XzCZKsbEAqQn79+ayDCEX9RPlhPHa1Lgcu+wzBMdRVzyaUhLoFrmlZqXEzNXFtIlzLqfXmka4Kyt08eHz+9eK7BOQS4MYbi1HpcQ9CtBiH34+iJqa5mrtS9rS5hNVcrNa5znmEONQgj3xdRA6CMIsoorAl6MlG2fhy9MNVVzZXqzEXqclG25moFvRal9zNMoQZh9PvyLqDFUYS/EPwlxXAd5XENQd9UOwtn1NwZ36uSE7vNJWj3FuzxvS2u3FznoKWGGk5sumJK5zLVLi47Rtcki0EZSmIo8dd5ji7GiRHFZh2KqcBucwlz/xa9XT6+qxXzgFtdPqVzeSAxhrgyz3Atw1ouqWKuIzh/dPNHZU+/6FCIYnMOxVTq2msuYeHZAnt7uhCsxbQg95MiF1MzF5E1MsyVeIbLmxD8/yoX7uE/Qf7Ia0j4QorNuSDlYGxLFaaa78Upk3Iw3HPOXIJf06QcDPcAOPyR15AeLi2tRDpJlYt7Sp/hni5LE1sy0ke0gW3xP/BWdptL0O8Mhz9ifbqsdHFpcQbbcmef4Y6uuShGwbNjWsGLSGGXu7oEzhGj3FWXdCSxy11dAueIUS7rOhz+AXB9buhtieN3AAAAAElFTkSuQmCC", 7, 0, 7);
#define weapon_name
	return "chaos minigun"; // Name

#define weapon_type
	return 0;

#define weapon_cost
	return 0; //cost

#define weapon_load
	return 4; //reload

#define weapon_auto
	return 1;

#define weapon_area
	return 10;

#define weapon_laser_sight
	return false; //bolt weapon without laser sight

#define weapon_melee
    return false;
	
#define weapon_swap
	return sndSwapPistol; // Swap sound

#define weapon_sprt
	return global.chaos_minigun; // Wep Sprite, needs to be set the same name as what was defined in init

#define weapon_text
	return "CHAOS CONTROL!"; // Loading Tip
	
#define weapon_fire
if(random(5)<1 and (ammo[1]>=1 or infammo != 0) or (ammo[1]>=5 and ammo[2]<1 and ammo[3]<1 and ammo[4]<1 and ammo[5]<1)){
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
	
    motion_add(gunangle+180,4);

weapon_post(6, -4, 4);