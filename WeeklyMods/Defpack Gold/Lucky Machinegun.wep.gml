#define init
global.sprLuckyMachinegun = sprite_add_weapon("Lucky Machinegun.png", 3, 4);

#define weapon_name
return "LUCKY MACHINEGUN";

#define weapon_sprt
return global.sprLuckyMachinegun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 11;

#define weapon_text
return "7...7....";

#define weapon_fire

with instance_create(x,y,Shell)
	{
		motion_add(point_direction(x,y,mouse_x,mouse_y)+other.right*100+random(50)-25,2+random(5))
	}
wkick = 4
sound_play(sndGoldMachinegun)
with instance_create(x+lengthdir_x(11.5,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),y+lengthdir_y(11.5,point_direction(x,y,mouse_x[other.index],mouse_y[other.index])),Bullet1)
{
	team = other.team
	creator = other
	motion_add(creator.gunangle+random_range(-8,8)*creator.accuracy,13)
	image_angle = direction
	do
	{
		if place_meeting(x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),enemy)
		{
			if instance_exists(creator)
			{
				if irandom(34) = 1
				{
					with creator
					{
						sound_play(sndLuckyShotProc)
						instance_create(x,y,SteroidsTB)
					}
					type = choose(1,2,3,4,5)
					creator.ammo[type] += round(creator.typ_ammo[type]/2)
					if creator.ammo[type] > creator.typ_amax[type]
					{
						creator.ammo[type] = creator.typ_amax[type]
					}
					dir = instance_create(x,y,PopupText)
					dir.mytext = "+"+string(round(creator.typ_ammo[type]/2))+" "+string(creator.typ_name[type])
					if creator.ammo[type] = creator.typ_amax[type]
					{
						dir.mytext = "MAX "+string(creator.typ_name[type])
					}
				}
			}
		}
		wait(1)
	}while(instance_exists(self))
}
