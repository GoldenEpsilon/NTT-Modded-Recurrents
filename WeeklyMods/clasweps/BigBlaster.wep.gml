#define init
global.sprite = sprite_add_weapon("BigBlaster.png",10,2);

#define weapon_name
return "Big Blaster";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 22;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapMachinegun

#define weapon_area
return 9;

#define weapon_text
return "Heheheh";

#define weapon_fire
repeat(5){
if instance_exists(self){
weapon_post(3,-4,4);
sound_play_pitchvol(sndMachinegun,0.8,1);
with instance_create(x+lengthdir_x(4,gunangle),y+lengthdir_y(4,gunangle),AllyBullet)
{
	direction = other.gunangle + (random_range(7,-7) * other.accuracy)
	image_angle = direction
	speed = 15;
	damage = 3;
	team = other.team
	creator = other
  }
motion_add(gunangle,-1);
wait(3)
 }
}