#define init
global.sprUltraGunhammer = sprite_add_weapon("Ultra Gunhammer.png", 4, 8);
weapon_is_melee(1)
#define weapon_name
return "ULTRA GUNHAMMER";

#define weapon_sprt
return global.sprUltraGunhammer;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 9;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 20;

#define weapon_text
return "UNBELIEVABLE POWER";

#define weapon_fire

wkick = 5
if GameCont.rad >= 35
{
	repeat(15)
		{
			with instance_create(x+lengthdir_x(40,point_direction(x,y,mouse_x[index],mouse_y[index]))*random_range(0.4,1.6),(y+lengthdir_y(40,point_direction(x,y,mouse_x[index],mouse_y[index])))*random_range(0.4,1.6),Smoke)
			motion_add(point_direction(x,y,x,y)-180,random_range(5,6))
		}
	GameCont.rad -= 35
	sound_play(sndHammer)
	sound_play(sndUltraPistol)
	with instance_create(x,y,Slash)
	{
		dmg = 5
		longarms = 0
		direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
		if instance_exists(Player)
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),2+longarms)
		image_angle = direction
		team = other.team
		image_xscale *= 1.2
		image_yscale *= 1.2
		sprite_index = sprUltraSlash
		damage *= 5
	}
	wepangle = -wepangle
	wkick = 4
	motion_add(point_direction(x,y,mouse_x,mouse_y),20)
			with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),UltraBullet)
			{
				motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4),16)
				image_angle = direction
				team = other.team
			}
			with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),UltraBullet)
			{
				motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)+4,16)
				image_angle = direction
				team = other.team
			}
				with instance_create(x+lengthdir_x(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height/2,point_direction(x,y,mouse_x[index],mouse_y[index])),UltraBullet)
			{
				motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(8)-4)-4,16)
				image_angle = direction
				team = other.team
			}
}
else
{
	sound_play(sndUltraEmpty)
	with instance_create(x,y,PopupText)
	{
		mytext = "NOT ENOUGH RADS"
	}
}
