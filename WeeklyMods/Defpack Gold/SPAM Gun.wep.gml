#define init
global.sprSpamGun = sprite_add_weapon("SPAM Gun.png", -2, 4);

#define weapon_name
return "SPAM GUN";

#define weapon_sprt
return global.sprSpamGun;

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
return 10;

#define weapon_text
return "DOING NOBODY A FAVOUR";

#define weapon_fire
sound_play(sndPistol)
with instance_create(x,y,Shell)
motion_add(random(359),2+random(2))
dar = random(359)
with instance_create(x+lengthdir_x(sprite_height/4,dar),y+lengthdir_y(sprite_height/4,dar),Bullet1)
{motion_add(random(360),16)
speed /= 3
damage *= 1.5
image_angle = direction
image_speed = 0
team = other.team
}
