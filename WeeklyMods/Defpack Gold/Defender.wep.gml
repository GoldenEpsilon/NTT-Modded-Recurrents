#define init
global.sprDefender = sprite_add_weapon("Defender.png", 2, 1);

#define weapon_name
return "DEFENDER"

#define weapon_sprt
return global.sprDefender;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 15;

#define weapon_text
return "KEEP YOUR DISTANCE";

#define weapon_fire

wkick = 1
if GameCont.rad >= 2
{
	sound_play(sndUltraLaser)
	GameCont.rad -= 2
	with instance_create(x+lengthdir_x(12,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(12,point_direction(x,y,mouse_x[index],mouse_y[index])),GuardianDeflect)
	{
		scale = random_range(0.6,0.8)
		image_xscale *= scale
		image_yscale *= scale
		timer = room_speed * 5
		team = other.team
		damage *= 2
		image_index = 0
		speed = random_range(10,21)
		direction = (point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+random_range(-10,10))*Player.accuracy
		do
		{
			move_bounce_solid(false)
			if speed > 0.1
			{
				speed /= 1.12
				iamge_speed = 0
			}
			else
			{
				speed = 0.1
				iamge_speed = 0.8
				image_angle = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])-90
				move_bounce_solid(false)
				timer -= 1
				if timer > 0
				{
					if image_index >= 6
					{
						image_index = 1
					}
				}
			}
			wait(1)
		}
		while(instance_exists(self))
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
