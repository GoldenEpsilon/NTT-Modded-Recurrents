#define init
global.sprite = sprite_add_weapon("RapidPistol.png",0,2);

#define weapon_name
return "Pistol Rifle";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 8;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun

#define weapon_area
return 9;

#define weapon_text
return "the size of this Mag";

#define weapon_fire
repeat(2){
if instance_exists(self){
weapon_post(3,-3,3);
sound_play_pitchvol(sndPistol,0.9,0.7);
sound_play_pitchvol(sndMachinegun,1.6,0.6);
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
wait(3)
 }
}