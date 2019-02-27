#define init
global.sprite = sprite_add_weapon("HyperFlaregun.png",2,4);

#define weapon_name
return "Hyper Flare Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 18;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 14;

#define weapon_text
return "Fastfire";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndFlare,0.8,1)
	with instance_create(x + lengthdir_x(2, gunangle),y + lengthdir_y(2, gunangle), CustomProjectile){	// gunlocker code
		name = "HyperFlare";
		sprite_index = sprFlare;
		mask_index = mskBouncerBullet;
		team = other.team;
		direction = other.gunangle + random_range(5,-5) * other.accuracy;
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
		
		if(fork()){
			while(instance_exists(self) && tries > 0){
				tries -= 1;
				x += lengthdir_x(4, direction);
				y += lengthdir_y(4, direction);

				 // Flame Trail:
				if(random(1)<0.5){
				with instance_create(x + random_range(3,-3),y + random_range(3,-3), Flame){
				team = other.team;
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
			if(instance_exists(self)) instance_destroy();
			exit;
		}
		if(instance_exists(self)){
		return id;
		}
	}

#define hb_destroy
	sound_play(sndFlareExplode);	// Sound
	view_shake_at(x, y, 10);			// Screenshake
for (i = 0; i < 360; i += 15){
with instance_create(x,y,Flame){
team = other.team;
direction = other.i + random_range(5,-5);
speed = 2 + (random_range(-2,2));
}
}



#define nothing
//Nothing.