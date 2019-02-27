#define init
global.sprLaserFlakCannon = sprite_add_weapon("Laser Flak Cannon.png", 2, 4);
global.sprLaserFlakBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADDSURBVEhL7ZQxFsIwDENzNI7GzQO2okQ1MaavAwx8vSy1JHtqu93bfL3jtb4X55q5jC7XZe+kR2TwWL6Us8spy+wOmAvFa5rfIzuzKaIzKhZmXaqXI2Ko4uhFh6E9GWuODJifoQr1ugY8oAIeZABqxuAzNOMVY7mpYvksacxP/wN+4ABThXpdAx5RAQ8yDoNUxdGLDkN7MtYcGUeDqojOqEPRk6xLFTPf/xVbydkjzMtcBhfypbCIR7hZlqk418w1WnsAq2ceLVskifwAAAAASUVORK5CYII=",2, 7, 7);


#define weapon_name
return "LASER FLAK CANNON";

#define weapon_sprt
return global.sprLaserFlakCannon;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 16;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 7;

#define weapon_text
return "1/10";

#define weapon_fire

wkick = 5
sound_play(sndFlakCannon)
sound_play(sndLaser)
with instance_create(x+lengthdir_x(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),y+lengthdir_y(sprite_height-6,point_direction(x,y,mouse_x[index],mouse_y[index])),CustomProjectile)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(12)-6)*other.accuracy,11+random(2))
	image_angle = direction
	team = other.team
	sprite_index = global.sprLaserFlakBullet
	image_speed = 1
	damage = 20
	mask_index = mskFlakBullet
	do
	{
		speed -= 0.5
		if irandom(1) = 1
		{
			instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
		}
		if speed <= 0 || place_meeting(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),enemy) || place_meeting(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),Wall) || place_meeting(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction),prop)
		{
			repeat(15)
			{
				with instance_create(x,y,Laser)
				{
					image_angle = random(359)
					team = other.team
					event_perform(ev_alarm,0)
					team = other.team
				}
			}
			instance_destroy()
		}
		wait(1)
	}while(instance_exists(self))

}
