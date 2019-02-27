#define init
global.sprite = sprite_add_weapon("Hyper_Revolver.png",1,3);

#define weapon_name
return "hyper revolver";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 6;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 12;

#define weapon_text
return "Instant Impact";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndHeavyRevoler,1.2,1)
sound_play_pitchvol(sndHyperSlugger,1.25,0.5)
	with instance_create(x + lengthdir_x(16, gunangle),y + lengthdir_y(16, gunangle), CustomProjectile){	// gunlocker code
		name = "HyperBullet";
		sprite_index = sprBullet1;
		mask_index = mskBullet1;
		team = other.team;
		direction = other.gunangle + random_range(2,-2) * other.accuracy;
		image_angle = direction;
		tries = 1600;
		damage = 4;
		force = 6;
		typ = 2;
		image_xscale = 1
		image_yscale = image_xscale;
		image_index = 0;
		image_speed = 0;
		on_hit = nothing
		on_destroy = hb_destroy;
// This code is not meant to be put into a step at all
		
		if(fork()){
			wait 1;
		if instance_exists(self){
		image_index = 1;
		}
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Smoke Trail:
				if(random(1)<0.15){
				with instance_create(x + random_range(3,-3),y + random_range(3,-3), Smoke){
				image_xscale *= 0.5
				image_yscale *= 0.5
					}
				}

				 // Enemy Collisions:
				if(place_meeting(x,y,enemy))with(enemy){ // will not hit an enemy or a prop but at least it doesnt knock back props
					if(place_meeting(x,y,other) && team != other.team && my_health > 0){
						projectile_hit(self, other.damage, other.force, other.direction);
						other.tries = 0;
						}
						}
				if(place_meeting(x,y,prop))with(prop){	//DONT FUCKING PUSH PROPS JESUS CHRIST
					if(place_meeting(x,y,other) && team != other.team && my_health > 0){
						projectile_hit(self, other.damage, 0, 0);
						other.tries = 0;
					}					
				}

				 // Wall Collisions:
				if(place_meeting(x,y,Wall))tries = 0;
				 // Wall Collisions:
				if(place_meeting(x,y,InvisiWall))tries = 60;
			}
			if instance_exists(self){
			instance_create(x,y,BulletHit)
			if(instance_exists(self)) instance_destroy();
			}
			exit;
		}
		return id;
	}

#define hb_destroy
	sound_play(sndHitWall);	// Sound
	view_shake_at(x, y, 10);			// Screenshake


#define nothing
//Nothing.