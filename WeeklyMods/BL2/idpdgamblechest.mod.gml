#define init
global.sprIDPDGambleChest = sprite_add("res/idpdgamblechest/sprIDPDGambleChest.png", 7, 18, 36);
global.sprIDPDGambleChestTransforming = sprite_add("res/idpdgamblechest/sprIDPDGambleChestTransforming.png", 9, 18, 36);
global.sprIDPDGambleChestTransformed = sprite_add("res/idpdgamblechest/sprIDPDGambleChestTransformed.png", 1, 18, 36);

#define step
if(!instance_exists(GenCont))
{
	with(IDPDChest)
	{
		wait(1);
		
		if(instance_exists(self)
		&& object_index == IDPDChest)
		{
			with(instance_create(x, y, CustomObject))
			{
				name = "IDPDGambleChest";
				mask_index = mskNone;
				sprite_index = global.sprIDPDGambleChest;
				drawE = 0;
				image_speed = 0.4;
				img = 0;
				prize = noone;
				
				if(fork())
				{
					while(instance_exists(self))
					{
						if(sprite_index == global.sprIDPDGambleChest
						&& image_index >= 0
						&& image_index < 1)
						{
							image_index -= image_speed*0.95;
						}
						
						drawE = 0;
						
						with(Player)
						{
							var __o = other;
							
							if(point_in_rectangle(x, y, other.x-24, other.y-24, other.x+24, other.y+16))
							{
								if(other.sprite_index == global.sprIDPDGambleChest)
								{
									other.sprite_index = global.sprIDPDGambleChestTransforming;
									other.image_index = 0;
									other.img = 0;
								}
								else
								{
									other.drawE = 1;
									
									if(button_pressed(index, "pick")
									&& GameCont.rad >= 4*min(GameCont.hard, 16))
									{
										GameCont.rad -= 4*min(GameCont.hard, 16);
										
										if(random(1) < 0.1)
										{
											instance_create(x, y, VanSpawn);
										}
										else
										{
											with(instance_create(x, y-24, WepPickup))
											{
												var _o = __o;
												__o.prize = self;
												procwep = 1;
												
												/*mod_script_call("mod", "pgw", "procwep_gen",
												"I.D.P.D.", -1, -1, 999);*/
												procwep_brand = "I.D.P.D.";
												procwep_lvl = 999;
												mod_script_call("mod", "pgw", "procwep_gen");
												
												oldMask = mask_index;
												mask_index = mskNone;
												image_alpha = 0;
												
												var _tries = 100;
												while(instance_exists(self)
												&& distance_to_object(Wall) <= 0
												&& _tries > 0)
												{
													with(instance_nearest(x, y, Wall))
													{
														instance_create(x, y, FloorExplo);
														instance_destroy();
													}
													
													_tries -= 1;
												}
												
												while(instance_exists(self)
												&& image_alpha < 1)
												{
													_o.drawE = 0;
													rotation = 0;
													image_angle = 0;
													direction = 0;
													speed = 0;
													image_alpha += 0.03;
													image_blend = choose(c_blue, c_aqua);
													
													if(instance_exists(_o)
													&& is_array(wep))
													{
														var w = sprite_get_width(wep.procwep.handlespr)+sprite_get_width(wep.procwep.bodyspr)+sprite_get_width(wep.procwep.muzzlespr)-2;
														var h = sprite_get_height(wep.procwep.handlespr)+sprite_get_height(wep.procwep.bodyspr)+sprite_get_height(wep.procwep.muzzlespr)-2;
														var hw = sprite_get_xoffset(wep.procwep.handlespr);
														var hh = sprite_get_yoffset(wep.procwep.handlespr);
														var _y = 0;
														if(random(1) < 0.1) _y += 2*random_range(-1, 1);
														x = _o.x+hw-w/2;
														y = _o.y+hw-h/2+_y-(16*image_alpha);
													}
													
													if(random(1) < 0.25)
													{
														with(instance_create(x, y, PortalShock))
														{
															image_blend = choose(c_white, c_aqua);
														}
													}
													
													wait(1);
												}
												
												if(instance_exists(self))
												{
													image_alpha = 1;
													image_blend = c_white;
													mask_index = oldMask;
												}
												
												if(instance_exists(__o))
												__o.prize = noone;
											}
										}
									}
								}
							}
						}
						
						if(sprite_index == global.sprIDPDGambleChestTransforming)
						{
							img += image_speed;
							
							if(img >= sprite_get_number(sprite_index)-image_speed)
							{
								img = 0;
								sprite_index = global.sprIDPDGambleChestTransformed;
							}
						}
						
						image_index = img;
						
						with(WepPickup)
						{
							if(point_in_rectangle(x, y, other.x-24, other.y-32-24, other.x+24, other.y+24))
							{
								speed = 4;
								direction = point_direction(other.x, other.y, x, y)+sin(current_frame)*45;
								
								if(instance_exists(Wall)
								&& distance_to_object(Wall) <= 0)
								{
									with(instance_nearest(x, y, Wall))
									{
										instance_create(x, y, FloorExplo);
										instance_destroy();
									}
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
}

#define draw
draw_set_halign(1);
draw_set_font(fntM);

with(CustomObject)
{
	if("name" in self
	&& name == "IDPDGambleChest")
	{
		if(drawE
		&& sprite_index == global.sprIDPDGambleChestTransformed)
		{
			var _y = 0;
			if(random(1) < 0.1) _y += 2*random_range(-1, 1);
			
			draw_set_blend_mode(bm_add);
			draw_set_color(choose(c_aqua, c_blue));
			draw_text(x, y+_y-32-8, "GAMBLE#(" + string(4*min(GameCont.hard, 16)) + " RADS)");
			draw_sprite(sprEPickup, 0, x, y+_y-8)
			draw_set_color(c_white);
			draw_set_blend_mode(bm_normal);
		}
		if(instance_exists(prize))
		{
			draw_set_blend_mode(bm_add);
			//repeat(2+irandom(2))
			for(var i = 0; i < 2+irandom(2); i += 1)
			{
				draw_set_color(merge_color(choose(c_aqua, c_blue), c_black, 0.75));
				var w = sprite_get_width(prize.wep.procwep.handlespr)+sprite_get_width(prize.wep.procwep.bodyspr)+sprite_get_width(prize.wep.procwep.muzzlespr)-2;
				draw_line(x, y, prize.x+random(w)-8, prize.y);
			}
			draw_set_color(c_white);
			draw_set_blend_mode(bm_normal);
		}
	}
}

#define draw_shadows
with(CustomObject)
{
	if("name" in self
	&& name == "IDPDGambleChest")
	{
		draw_sprite(shd24, 0, x, y-5);
	}
}
