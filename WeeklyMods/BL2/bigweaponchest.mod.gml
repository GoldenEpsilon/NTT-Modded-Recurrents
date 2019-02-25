#define init
global.sprBigWeaponChest = sprite_add("res/bigweaponchest/sprBigWeaponChest.png", 7, 20, 22);
global.sprBigWeaponChestOpening = sprite_add("res/bigweaponchest/sprBigWeaponChestOpening.png", 10, 20, 22);
global.sprBigWeaponChestOpen = sprite_add("res/bigweaponchest/sprBigWeaponChestOpen.png", 1, 20, 22);

#define step
if(!instance_exists(GenCont))
{
	with(BigWeaponChest)
	{
		with(instance_create(x, y, CustomObject))
		{
			name = "bigWeaponChest";
			mask_index = mskNone;
			sprite_index = global.sprBigWeaponChest;
			revealed = 0;
			image_speed = 0.4;
			
			for(var i = 0; i <= 2; i += 1)
			{
				prize[i] = noone;
			}
			
			if(fork())
			{
				while(instance_exists(self))
				{
					with(Player)
					{
						if(point_in_rectangle(x, y, other.x-24, other.y-16, other.x+24, other.y+16)
						&& other.sprite_index == global.sprBigWeaponChest)
						{
							other.sprite_index = global.sprBigWeaponChestOpening;
							other.image_index = 0;
							sound_play(sndBigWeaponChest);
						}
					}
					
					if(sprite_index == global.sprBigWeaponChest
					&& image_index >= 0
					&& image_index < 1)
					{
						image_index -= image_speed*0.95;
					}
					else if(sprite_index == global.sprBigWeaponChestOpening)
					{
						drawE = 0;
						
						if(image_index >= 2 && image_index < 3
						&& !revealed)
						{
							revealed = 1;
							
							for(var i = 0; i <= 2; i += 1)
							{
								prize[i] = instance_create(x, y, WepPickup);
								with(prize[i])
								{
									oldMask = mask_index;
									mask_index = mskNone;
									rotation = 0;
									speed = 0;
									image_alpha = 0;
									
									procwep_lvl = min(10, GameCont.level+irandom(2));
									mod_script_call("mod", "pgw", "procwep_gen");
								}
							}
						}
						else if(image_index >= 3 && image_index < 4)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+1*(i-1);
									y = other.y-4;
									image_alpha = 1;
									image_blend = c_dkgray;
								}
							}
						}
						else if(image_index >= 5 && image_index < 6)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+1*(i-1);
									y = other.y-5;
									image_blend = c_gray;
								}
							}
						}
						else if(image_index >= 6 && image_index < 7)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+1*(i-1);
									y = other.y-6;
									image_blend = c_ltgray;
								}
							}
						}
						else if(image_index >= 7 && image_index < 8)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+4*(i-1);
									y = other.y-7;
									image_blend = c_white;
								}
							}
						}
						else if(image_index >= 8 && image_index < 9)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+9*(i-1);
									y = other.y-8;
								}
							}
						}
						else if(image_index >= 9 && image_index < 10)
						{
							for(var i = 0; i <= 2; i += 1)
							{
								with(prize[i])
								{
									x = other.x+12*(i-1);
									y = other.y-7;
								}
							}
						}
						
						if(image_index >= image_number-image_speed)
						{
							sprite_index = global.sprBigWeaponChestOpen;
						}
					}
					else if(sprite_index == global.sprBigWeaponChestOpen)
					{
						image_index = 0;
						image_speed = 0;
						drawE = 0;
						
						for(var i = 0; i <= 2; i += 1)
						{
							if(instance_exists(prize[i]))
							{
								with(prize[i])
								{
									x = other.x+13*(i-1);
									y = other.y-6;
									//mask_index = oldMask;
									//mask_index = weapon_get_sprt(wep.wep);
									mask_index = mskBullet1;
								}
							}
						}
					}
					
					for(var i = 0; i <= 2; i += 1)
					{
						if(instance_exists(prize[i])
						&& is_array(prize[i].wep))
						{
							with(prize[i])
							{
								/*var w = sprite_get_width(wep.procwep.handlespr)+sprite_get_width(wep.procwep.bodyspr)+sprite_get_width(wep.procwep.muzzlespr)-2;
								x -= w/2;*/
								var h = sprite_get_height(wep.procwep.handlespr)+sprite_get_height(wep.procwep.bodyspr)+sprite_get_height(wep.procwep.muzzlespr)-2;
								y += h/2-8;
								rotation = 90;
								image_angle = 90;
								speed = 0;
							}
						}
					}
					
					wait(1);
				}
				exit;
			}
		}
		
		image_speed = 99;
		instance_change(Wind, 0);
	}
}

#define draw_shadows
with(CustomObject)
{
	if("name" in self
	&& name == "bigWeaponChest")
	{
		draw_sprite(shd24, 0, x, y-5);
	}
}
