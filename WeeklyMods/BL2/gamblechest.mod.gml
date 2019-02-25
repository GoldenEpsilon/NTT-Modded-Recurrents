#define init
global.sprGambleChest = sprite_add("res/gamblechest/sprGambleChest.png", 7, 18, 36);
global.sprGambleChestTransforming = sprite_add("res/gamblechest/sprGambleChestTransforming.png", 26, 18, 36);
global.sprGambleChestTransformed = sprite_add("res/gamblechest/sprGambleChestTransformed.png", 1, 18, 36);
global.sprGambleChestPulling = sprite_add("res/gamblechest/sprGambleChestPulling.png", 9, 18, 36);
global.sprGambleChestRolling = sprite_add("res/gamblechest/sprGambleChestRolling.png", 2, 18, 36);
global.sprGambleChestBounce = sprite_add("res/gamblechest/sprGambleChestBounce.png", 3, 18, 36);
global.sprGambleChestPrizeLeft = sprite_add("res/gamblechest/sprGambleChestPrizeLeft.png", 5, 18, 36);
global.sprGambleChestPrizeBottom = sprite_add("res/gamblechest/sprGambleChestPrizeBottom.png", 5, 18, 36);

#define step
if(!instance_exists(GenCont))
{
	with(AmmoChestMystery)
	{
		with(instance_create(x, y, CustomObject))
		{
			name = "gambleChest";
			mask_index = mskNone;
			sprite_index = global.sprGambleChest;
			drawE = 0;
			rolling = 0;
			image_speed = 0.4;
			prize = noone;
			prizeTimer = 0;
			prizeTimerMax = 30*5;
			prizex = x;
			prizey = y;
			img = 0;
			
			if(fork())
			{
				while(instance_exists(self))
				{
					if(sprite_index == global.sprGambleChest
					&& image_index >= 0
					&& image_index < 1)
					{
						image_index -= image_speed*0.95;
					}
					
					drawE = 0;
					
					with(Player)
					{
						if(point_in_rectangle(x, y, other.x-24, other.y-48, other.x+24, other.y+16))
						{
							other.drawE = 1;
							
							if(button_pressed(index, "pick")
							&& !other.rolling
							&& GameCont.rad >= 4*min(GameCont.hard, 16))
							{
								other.rolling = 1;
								img = -0.4;
								GameCont.rad -= 4*min(GameCont.hard, 16);
								
								if(other.sprite_index == global.sprGambleChest)
								other.sprite_index = global.sprGambleChestTransforming;
								else
								other.sprite_index = global.sprGambleChestPulling;
								
								sound_play(sndClick);
							}
						}
					}
					
					if(rolling)
					{
						if(!instance_exists(prize)) img += image_speed;
						
						if(sprite_index == global.sprGambleChestTransforming
						&& img >= sprite_get_number(sprite_index)-image_speed)
						{
							img = 0;
							sprite_index = global.sprGambleChestTransformed;
						}
						
						if(sprite_index == global.sprGambleChestTransformed
						&& img >= sprite_get_number(sprite_index)-image_speed
						&& rolling)
						{
							img = 0;
							sprite_index = global.sprGambleChestPulling;
							sound_play(sndClick);
						}
						
						if(sprite_index == global.sprGambleChestPulling
						&& img >= sprite_get_number(sprite_index)-image_speed)
						{
							img = 0;
							sprite_index = global.sprGambleChestRolling;
						}
						
						if(sprite_index == global.sprGambleChestRolling)
						{
							if(current_frame mod 2) sound_play(sndRadPickup);
							
							if(img >= (sprite_get_number(sprite_index)-image_speed)*10)
							{
								img = 0;
								sprite_index = global.sprGambleChestBounce;
							}
						}
						
						if(sprite_index == global.sprGambleChestBounce
						&& img >= sprite_get_number(sprite_index)-image_speed)
						{
							img = 0;
							
							var psycho = random(1);
							
							if(psycho < 0.1) // SHOWTIME!
							{
								prizeTimer = 0;
								img = 0;
								sprite_index = global.sprGambleChestTransformed;
								prize = noone;
								rolling = 0;
								
								repeat(12)
								{
									with(instance_create(x, y, Smoke))
									{
										speed = random(3);
										direction = random(360);
										vspeed -= random(2);
									}
								}
								
								with(instance_create(x, y, Nuke))
								{
									mask_index = mskNone;
									depth = -8;
									direction = 88+random(4);
									image_angle = direction;
									z = -8;
									zspeed = -8;
									zgrav = 0.3;
									initY = y;
									hasBlownUp = 0;
									
									if(fork())
									{
										while(instance_exists(self))
										{
											y = initY+z;
											speed = 0;
											zspeed += zgrav;
											z += zspeed;
											
											with(Smoke)
											{
												if(distance_to_object(other) <= 0)
												{
													depth = other.depth+1;
												}
											}
											
											if(!hasBlownUp)
											{
												active = 1;
												if(zspeed >= -2) active = random(-(zspeed-2));
												if(zspeed >= -0.5)
												{
													if(!hasBlownUp)
													{
														hasBlownUp = 1;
														sound_play(sndExplosionS);
														zspeed = -4;
														zgrav *= 2;
														
														with(instance_create(x, y+5, SmallExplosion))
														{
															mask_index = mskNone;
														}
													}
												}
											}
											else
											{
												active = 0;
												direction += 10+max(0, zspeed);
											}
											
											if(z >= -2)
											{
												instance_destroy();
											}
											
											wait(1);
										}
										
										exit;
									}
								}
							}
							else
							{
								var prizeDir = irandom(1);
								if(prizeDir == 0)
								{
									sprite_index = global.sprGambleChestPrizeLeft;
									prizex = x-16;
									prizey = y+8;
								}
								else if(prizeDir == 1)
								{
									sprite_index = global.sprGambleChestPrizeBottom;
									prizex = x;
									prizey = y+16;
								}
							}
						}
						
						if(prize == noone
						&& (sprite_index == global.sprGambleChestPrizeLeft
						|| sprite_index == global.sprGambleChestPrizeBottom)
						&& img >= sprite_get_number(sprite_index)-image_speed)
						{
							sound_play(sndShotgunHitWall);
							prize = instance_create(x, y, WepPickup);
							img = sprite_get_number(sprite_index)-image_speed;
							prizeTimer = prizeTimerMax;
						}
						
						if(instance_exists(prize))
						{
							prize.x = prizex;
							prize.y = prizey;
						}
						
						if(prizeTimer > 0)
						{
							prizeTimer -= 1;
							
							if(prizeTimer <= 0)
							{
								if(instance_exists(prize))
								{
									with(prize) instance_destroy();
								}
							}
						}
						
						if(prize != noone
						&& !instance_exists(prize))
						{
							prizeTimer = 0;
							img = 0;
							sprite_index = global.sprGambleChestTransformed;
							prize = noone;
							rolling = 0;
							
							repeat(12)
							{
								with(instance_create(x, y, Dust))
								{
									speed = random(3);
									direction = random(360);
								}
							}
						}
					}
					
					if(prize == noone)
					{
						prizeTimer = 0;
						
						with(WepPickup)
						{
							if(point_in_rectangle(x, y, other.x-24, other.y-32-24, other.x+24, other.y+24))
							{
								speed = 4;
								direction = point_direction(other.x, other.y, x, y)+sin(current_frame)*45;
								
								var _tries = 100;
								while(instance_exists(Wall)
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
							}
						}
					}
					else if(instance_exists(prize))
					{
						prize.rotation = 0;
						prize.image_angle = 0;
						prize.direction = 0;
						prize.speed = 0;
						
						if(is_array(prize.wep)
						&& prize.wep.wep == "procwep")
						{
							var w = sprite_get_width(prize.wep.procwep.handlespr)+sprite_get_width(prize.wep.procwep.bodyspr)+sprite_get_width(prize.wep.procwep.muzzlespr)-2;
							var h = sprite_get_height(prize.wep.procwep.handlespr)+sprite_get_height(prize.wep.procwep.bodyspr)+sprite_get_height(prize.wep.procwep.muzzlespr)-2;
							var hw = sprite_get_xoffset(prize.wep.procwep.handlespr);
							var hh = sprite_get_yoffset(prize.wep.procwep.handlespr);
							prize.x = prizex+hw-w/2;
							prize.y = prizey+hw-h/2;
							
							with(prize)
							{
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
					}
					
					image_index = img;
					
					wait(1);
				}
				exit;
			}
		}
		
		image_speed = 99;
		instance_change(Wind, 0);
	}
}

#define draw
draw_set_halign(1);
draw_set_font(fntSmall);

with(CustomObject)
{
	if("name" in self
	&& name == "gambleChest")
	{
		if(drawE && !rolling)
		{
			draw_set_font(fntM);
			
			draw_text_nt(x, y-32-8, "GAMBLE#" + (GameCont.rad < 4*min(GameCont.hard, 16) ? "@r" : "") + "(" + string(4*min(GameCont.hard, 16)) + " RADS)");
			draw_sprite(sprEPickup, 0, x, y-8)
		}
		else if(prizeTimer)
		{
			draw_text_nt(x, y-14, string(ceil(prizeTimer/30)));
		}
	}
}

#define draw_shadows
with(CustomObject)
{
	if("name" in self
	&& name == "gambleChest"
	&& (sprite_index != global.sprGambleChestTransforming
	 || sprite_index == global.sprGambleChestTransforming
	 && (image_index <= 2 || image_index >= 9)))
	{
		draw_sprite(shd24, 0, x, y-5);
	}
}
