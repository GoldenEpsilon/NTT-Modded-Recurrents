#define init
global.sprCircleGun = sprite_add_weapon("Circle Gun.png", 0, 3);
global.sprCircle = sprite_add("Circle.png", 0, 3, 3)

#define weapon_name
return "CIRCLE GUN"

#define weapon_sprt
return global.sprCircleGun;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 25;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 12;

#define weapon_text
return "COLLISION VECTOR";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 4

with instance_create(x+lengthdir_x(13,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(13,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomObject)
{
	team = other.team
	timer = 20
	sprite_index = global.sprCircle
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),22)
	damage = 10
	 do
	 {
		speed /= 1.1
		if speed <= 1.1
		{
			speed = 0
		}
		if speed = 0
		{
			timer -= 1
			if timer = 0
			{
				timer = 20
				speed = 22
			}
		}
		if place_meeting(x,y,enemy)
		{

		}
		move_bounce_solid(true)
		image_angle += speed * 3
		wait(1)
	 }while instance_exists(self)
}
