// Thanks 	Doosie for fixing a bug
	#define init
global.sprite = sprite_add_weapon("HyperShotty.png",5,4);

#define weapon_name
return "hyper shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return 0;

#define weapon_load
return 19;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 14;

#define weapon_text
return "Area Denial";

#define weapon_fire
weapon_post(8,-6,6);
sound_play_pitchvol(sndShotgun,0.8,1)
sound_play_pitchvol(sndHyperSlugger,1.2,0.6)
repeat(7){
if instance_exists(self){
	with hypershell(x + lengthdir_x(12, gunangle),y + lengthdir_y(12, gunangle)){	// Jsburg told me to use with hypershell instead of with instance create, he deserves all of my props
		direction = other.gunangle + random_range(19,-19) * other.accuracy;
	}
    }
}
motion_add(gunangle,-2);

#define hypershell(_x,_y)
with instance_create(_x,_y,CustomProjectile){
		name = "HyperShell";
		sprite_index = sprBullet2;
		mask_index = mskBullet2;
		team = other.team;
		direction = other.gunangle + random_range(19,-19) * other.accuracy;
		tries = 3200;
		damage = 4;
		force = 6;
		typ = 2;
		image_xscale = 1
		image_yscale = image_xscale;
		image_index = 0;
		image_speed = 0;
		on_hit = nothing
		on_destroy = hb_destroy;
				saveVars = ["tries"];
		if(fork()){
			wait 1;
if(instance_exists(self)){
		image_index = 1;
		}
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Smoke Trail:
				if(random(1)<0.2){
				with instance_create(x + random_range(3,-3),y + random_range(3,-3), Smoke){
				image_xscale *= 0.75
				image_yscale *= 0.75
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
				if(place_meeting(x,y,Wall)){
				tries = 0;
				if instance_exists(self){
				with instance_create(x,y,Bullet2){
        			motion_set(other.direction+random_range(-5,5),random_range(7,12))
        			image_angle = direction
        			projectile_init(other.team,other)
						}
				    }
				}
				 // Wall Collisions:
				if(place_meeting(x,y,InvisiWall))tries = 60;
				
			}
			if(instance_exists(self)) instance_destroy();
			exit;
		}
		if(instance_exists(self)){
		return id;
		}
	      }

#define hb_destroy
	sound_play(sndShotgunHitWall);	// Sound
	view_shake_at(x, y, 10);			// Screenshake


#define nothing
//Nothing.