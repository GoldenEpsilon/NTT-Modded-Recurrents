#define init
global.sprFireSpamGun = sprite_add_weapon("Fire SPAM Gun.png", -2, 4);

#define weapon_name
return "FIRE SPAM GUN";

#define weapon_sprt
return global.sprFireSpamGun;

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
return 12;

#define weapon_text
return "BURN THEM TO THE BOILING BOTTOM";

#define weapon_fire
sound_play(sndPistol)
with instance_create(x,y,Shell)
motion_add(random(359),2+random(2))
dar = random(359)
with instance_create(x+lengthdir_x(sprite_height/4,dar),y+lengthdir_y(sprite_height/4,dar),FireBall)
{motion_add(random(360),16)
speed /= 3
damage *= 1.75
image_angle = direction
image_speed = 0
team = other.team
do
{
	if place_meeting(x,y,enemy)
	{
		with instance_create(other.x,other.y,Flame)
		{
			team = other.team
			sound_play(sndBurn)
		}
	}
	wait(1)
}while(instance_exists(self))
}
