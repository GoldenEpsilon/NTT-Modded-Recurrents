#define init
global.sprUltraSpamGun = sprite_add_weapon("Ultra SPAM Gun.png", -2, 4);

#define weapon_name
return "ULTRA SPAM GUN";

#define weapon_sprt
return global.sprUltraSpamGun;

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
return 20;

#define weapon_text
return "NOBODY IS HAPPY WITH THIS";

#define weapon_fire
if GameCont.rad >= 1
{
	GameCont.rad -= 1
	sound_play(sndPistol)
	repeat(2)
	{
	with instance_create(x,y,GuardianBullet)
	{motion_add(random(359),5)
	speed /= 3
	damage *= 1.5
	image_angle = direction
	image_speed = 0
	team = other.team
	}
	}
}
else
{
	sound_play(sndUltraEmpty)
	ammo[1] += 1
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}