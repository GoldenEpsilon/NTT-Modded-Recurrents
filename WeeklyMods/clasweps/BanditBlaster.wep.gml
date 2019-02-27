#define init
global.sprite = sprite_add_weapon("BanditBlaster.png",5,1);

#define weapon_name
return "Bandit Blaster";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 11;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun

#define weapon_area
return -1;

#define weapon_text
return "How many of these are there?";

#define weapon_fire
repeat(2){
if instance_exists(self){
weapon_post(3,-3,3);
sound_play_pitchvol(sndMachinegun,1.3,1);
sound_play_pitchvol(sndEnemyFire,1.1,0.6);
with instance_create(x+lengthdir_x(4,gunangle),y+lengthdir_y(4,gunangle),AllyBullet)
{
	direction = other.gunangle + (random_range(5,-5) * other.accuracy)
	image_angle = direction
	speed = 15;
	damage = 3;
	team = other.team
	creator = other
  }
wait(4)
 }
}