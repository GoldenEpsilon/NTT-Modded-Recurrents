#define init
global.sprHeavyNuke = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA4AAAAKCAYAAACE2W/HAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAB5SURBVChTYwCC/2iYwaEBROIGMPn/utpm//28Y8EYxIcIYxiIjIHkfzD9X0pcDWwACIP4MDZcrEMRgaGaYQywZhBm+K8IdwHcJUAxMEbWCFaMZABIEqdGEMapEShJnlOBkgQ1UhQ4MJvAtkEFoTQuDAYYgoQTAAMDAFgIpU+LGTr2AAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==/1DM4NBAPAaB/37esTDNcAPwAbhGXW0zsGYkA0AA2TB0DCT/g+n/UuJqYANAGMSHseFiHYoIDNUMYyBs/a8IZyOLgTGyRpBtMM1gDJTEqRGEcWoESpLkVGRFyJpgYigaKQockATcL1BBKI0LgwGyBrAg0QkAisECxGEGBgDIgL7Y7NoS3QAAAABJRU5ErkJgggAAAAAAAAAAAAAAAAAAAA==",1, 8, 6);
global.sprHeavyNukeLauncher = sprite_add_weapon("Heavy Nuke Launcher.png", 9, 7);

#define weapon_name
return "HEAVY NUKE LAUNCHER";

#define weapon_sprt
return global.sprHeavyNukeLauncher;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 105;

#define weapon_cost
return 7;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 15;

#define weapon_text
return "THIS IS WHAT WILL END IT ALL";

#define weapon_fire

sound_play(sndRocket)
wkick = 10
with instance_create(x+lengthdir_x(8,wepangle),y+lengthdir_y(8,wepangle),CustomObject)
{
	motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(random(4)-2)*other.accuracy,1)
	team = other.team
	image_xscale *= 0.95
	image_yscale *= 0.95
	index = other.index
	sprite_index = global.sprHeavyNuke
	visible = true
	typ = 2 //0 = nothing, 1 = deflectable, 2 = destructable
	snd = sndRocketFly
	sound_play(snd)
	do
	{
		image_angle = direction
		with instance_create(x,y,Smoke)
		{
			image_xscale *= 0.7
			image_yscale *= 0.7
		}
		if speed > 3
		{
			speed = 3
		}
		motion_add(point_direction(x,y,mouse_x[index],mouse_y[index]),0.5)
		motion_add(direction,0.3)
		image_angle = direction
		if place_meeting(x,y,enemy) || place_meeting(x,y,Wall)
		{
			sound_stop(snd)
			sound_play(sndExplosionXL)
			ang = random(360)
			repeat(20)
			{
				with instance_create(x+lengthdir_x(12,ang),y+lengthdir_y(12,ang),HeavyNade)//BECAUSE IDK HOW THE EXPLOSIONS ARE CALLED014

				{
					repeat(200)
					{
						instance_create(x,y,Dust)
					}
					instance_destroy()
				}
				ang += 360/8
			}
			instance_destroy()
		}
	wait(1)
	}while(instance_exists(self));
}
