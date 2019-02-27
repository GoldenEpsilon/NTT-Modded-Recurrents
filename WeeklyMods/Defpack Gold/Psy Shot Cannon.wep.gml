#define init
global.sprPsyShotCannon = sprite_add_weapon("Psy Shot Cannon.png", 4, 2);
#define weapon_name
return "PSY SHOT CANNON";

#define weapon_sprt
return global.sprPsyShotCannon;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 43;

#define weapon_cost
return 12;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 13;

#define weapon_text
return "YOU GO NOW";

#define weapon_fire

wkick = 6
sound_play(sndFlakCannon)
with instance_create(x+lengthdir_x(sprite_height,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),y+lengthdir_y(sprite_height,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),CustomObject)
{
	team = other.team
	image_blend = c_purple
	speed = 11
	image_xscale *= 1.5
	image_yscale *= 1.5
	dir = random(359)
	damage = 60
	timer = room_speed * 2
	dirfac = random(359)
	sprite_index = sprBullet2
	image_index = 0
	direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])
	do
	{
			if place_meeting(x+3,y,Wall) || place_meeting(x-3,y,Wall)
			{
				hspeed *= -1
			}
			if place_meeting(x,y+3,Wall) || place_meeting(x,y-3,Wall)
			{
				vspeed *= -1
			}
			scale = random_range(0.9,1.1)
			image_speed = 0
			dirfac += 10
			image_xscale = 1.5*scale
			image_yscale = 1.5*scale
			if speed > 1.0000000001
			{
				speed /= 1.6
			}
			else
			{
				speed = 0
				if x = xprevious && y = yprevious && timer > 1
				{
					if instance_exists(enemy) && instance_exists(Player)
					{
						sound_play(sndShotgun)
						with instance_create(x,y,Bullet2)
						{
							motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y)+(random(8)-4)*Player.accuracy,16)
							image_angle = direction
							image_xscale *= 1.2
							image_yscale *= 1.2
							team = other.team
							damage *= 1.5
							speed *= 0.9
							timer = 2
							image_blend = c_purple
							do
							{
								timer -= 1
								if timer < 0
								{
									timer = 0
								}
								if timer = 0
								{
									if instance_exists(enemy)
									{
										if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
										{
											if distance_to_object(instance_nearest(x,y,enemy)) < 200
											{
												motion_add(point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y),1.3)
												image_angle = direction
											}
										}
									}
								}
							wait 1
							}while (instance_exists(self))
						}
						timer -= 1
						if timer <= 0
						{
							instance_destroy()
						}
					}
				}
			}
		wait 1
		}
	while (instance_exists(self))
	}
