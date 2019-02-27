#define init
global.sprite = sprite_add_weapon("LilGunther.png",6,4);

#define weapon_name
return "Lil Gunther";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 35;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapMachinegun

#define weapon_area
return 14;

#define weapon_text
return "Sniper Bouncer";

#define weapon_fire
weapon_post(7,-4,4);
sound_play_pitchvol(sndMachinegun,0.8,0.5);
sound_play_pitchvol(sndLilHunterSniper,1.2,0.7);
if instance_exists(self){
for(i = 1; i < 4; i += 1)
{
with instance_create(x+lengthdir_x(4,gunangle),y+lengthdir_y(4,gunangle),AllyBullet)
{
	direction = other.gunangle + (random_range(1,-1) * other.accuracy)
	image_angle = direction
	speed = 8 + (other.i*2);
	damage = 3;
	team = other.team
	creator = other
  }
 }
}
wait(1)
if instance_exists(self){
weapon_post(7,-4,4);
sound_play_pitchvol(sndLilHunterBouncer,1.2,0.7);
for(i = -15; i < 16; i += 10)
{
with instance_create(x+lengthdir_x(4,gunangle),y+lengthdir_y(4,gunangle),BouncerBullet)
{
	direction = other.gunangle + (random_range(2,-2) + other.i * other.accuracy)
	image_angle = direction
	speed = 5;
	damage = 2;
	team = other.team
	creator = other
  }
 }
}