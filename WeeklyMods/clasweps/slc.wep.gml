#define init
global.sprite = sprite_add_weapon("Super Laser Cannon.png", 4, 4);

#define weapon_name
return "SUPER LASER CANNON";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 90;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 13;

#define weapon_text
return "Oh Super Cannon";

#define weapon_fire

weapon_post(3, -8, 0);
if !instance_exists(Laser) sound_play(sndLaserCannonCharge);
repeat(3){
with instance_create(x + lengthdir_x(16,gunangle),y + lengthdir_y(16,gunangle),LaserCannon)
{
	delay = 30
	team = other.team
	creator = other;
}
wait(6)
}
