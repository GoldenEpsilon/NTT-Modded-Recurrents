#define init
global.sprite = sprite_add_weapon("HuntingRifle.png",3,1);
global.spritebullet = sprite_add("SniperBullet.png",2,10,8);

#define weapon_name
return "Sniper";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 3;

#define weapon_laser_sight
 return true

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 4;

#define weapon_text
return "Big Game";

#define weapon_fire
weapon_post(5,-4,4)
sound_play_pitchvol(sndPistol,1.1,0.6);
sound_play_pitchvol(sndSniperFire,1.1,1);
for(i = -2; i < 3; i += 4)
{
with instance_create(x+lengthdir_x(4,gunangle),y+lengthdir_y(4,gunangle),Bullet1)
{
	sprite_index = global.spritebullet
	mask_index = mskBullet2
	direction = other.gunangle + other.i
	image_angle = direction
	speed = 25;
	damage = 5;
	team = other.team
	creator = other
  }
}
  motion_add(gunangle,-2.5);