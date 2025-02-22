#define init
global.sprUltraSpamGun = sprite_add_weapon("sprites/Ultra SPAM Gun.png", 0, 2);
global.sprUltraSpamGunOff = sprite_add_weapon("sprites/Ultra SPAM Gun Off.png", 0, 2);
#define weapon_name
return "ULTRA SPAM GUN";

#define weapon_sprt
with(GameCont)
{
	if "rad" in self && rad >= 1 {return global.sprUltraSpamGun};
	else {return global.sprUltraSpamGunOff};
}

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 1;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 24;

#define weapon_text
return choose("NOBODY IS HAPPY WITH THIS","@gULTRA @sSTALE");
#define weapon_rads
return 1

#define weapon_fire
sound_play_pitch(sndSwapExplosive,random_range(1.5,1.9))
sound_play_pitch(sndFrogExplode,random_range(.6,.8))
sound_play_pitch(sndFlyFire,random_range(.6,.8))
sound_play_pitch(sndUltraLaser,random_range(1.4,1.6))
weapon_post(0,0,12)
repeat(2){
	with instance_create(x,y,GuardianBullet){
		motion_add(other.gunangle+random_range(-180,180)*other.accuracy,2)
		creator = other
		damage *= 3
		image_angle = direction
		image_speed = .6
		team = other.team
	}
}
