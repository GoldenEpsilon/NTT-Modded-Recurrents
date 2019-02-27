#define init
global.sprBloodCrossbow = sprite_add_weapon("Blood Crossbow.png", 2, 3);
global.sprBloodBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAHCAYAAAAS9422AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACBSURBVChTY/j//z/VMBCACDCGiyFLwATJwSD9rdJAJsgcJPPAEheObvk/tzUJLEguBukHmQPCQAGwmEMDiITanh+kBcYghciKYZbDxEA0sjpkvg/QHHRfgA2HaYQKkIVB+mEOAgqAxcCOh/kAJkAuBunHGgfIiijFIENhGCL2nwEA1N1665X0OCkAAAAASUVORK5CYIIAAAAAAAAAAAAAAAAAAAAAAAAAAA==",0, -2, 3);

#define weapon_name
return "BLOOD CROSSBOW"

#define weapon_sprt
return global.sprBloodCrossbow;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 21;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 7;

#define weapon_text
return "BONE LAUNCHER";

#define weapon_fire
if ammo[3] = 0
{
	ammo[3] += 2
	sprite_index = spr_hurt
	image_index = 0
	my_health -= 1
	sound_play(snd_hurt)
}
else
	{
	sound_play(sndCrossbow)
	with instance_create(x,y,Bolt)
	{
		team = other.team
		check = 0
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),24)
		sprite_index = global.sprBloodBolt
		damge = 17
		do
		{
			image_angle = direction
				if speed <= 0 || place_meeting(x,y,enemy)
				{
					if check = 0
					{
						check = 1
						sound_play(sndBloodLauncherExplo)
						instance_create(x,y,MeatExplosion)
						team = other.team
					}
				}
		wait(1)
		}while(instance_exists(self))
	}
}
