#define init
global.sprHeavyBloodCrossbow = sprite_add_weapon("Heavy Blood Crossbow.png", 3, 3);
global.sprHeavyBloodBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABkAAAAKCAYAAABBq/VWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACWSURBVDhPvZHBEUAwEEW3Dx2oQgFOStCAFlxShi604K4j9q/8sYKDMMw8IfH/E0SPhVS9yFuuumxynkYjXXwK8lpi+C5boGQI7SsRsqHY8CLRcluEgJJckMfL3kq6pjxAqd8l7zGmz3KstYsSiv6R4ORL4mQWyKPr9LlwkUr4I5+CLASXki8EAHmUe0Gc37frA7mcu0RWFRBI/JNLjXYAAAAASUVORK5CYII=",0, -2, 3);

#define weapon_name
return "HEAVY BLOOD CROSSBOW"

#define weapon_sprt
return global.sprHeavyBloodCrossbow;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 42;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 13;

#define weapon_text
return "HIT: GET A BLOODY REWARD
 MISS: GET BONED";

#define weapon_fire
if ammo[3] = 0 // DOESNT WORK >:(
{
	ammo[3] += 1
	sprite_index = spr_hurt
	image_index = 0
	my_health -= 1
	sound_play(snd_hurt)
}
else
	{
	wkick = 7
	sound_play(sndCrossbow)
	with instance_create(x,y,HeavyBolt)
	{
		hastouched = 0
		touch = 0
		team = other.team
		check = 0
		damage = 40
		image_xscale *= 0.8
		image_yscale *= 0.8
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),17)
		sprite_index = global.sprHeavyBloodBolt
		do
		{
				if place_meeting(x,y,enemy)
				{
					hastouched = 1
				}
				if speed = 0
				{
						if touch = 0
						{
							touch = 1
							if hastouched = 1
							{
							    if irandom(6) = 1
								{
									if instance_exists(Player)
									{
										with Player
										{
											instance_create(x,y,BloodLust)
											if my_health < maxhealth
											{
												my_health += 1
												with instance_create(x,y,PopupText)
												{
													mytext = "+1 HP"
												}
											}
											else
											{
												with instance_create(x,y,PopupText)
												{
													mytext = "MAX HP"
												}
											}
											sound_play(sndBloodlustProc)
										}

									}
								}
							}
							else
							{
								if irandom(1) = 1
								{
									with Player
									{
										sprite_index = spr_hurt
										image_index = 0
										my_health -= 1
									}
								}
							}
						}
				}
			image_angle = direction
				if speed <= 0 || place_meeting(x,y,enemy)
				{
					if check = 0
					{
						check = 1
						repeat(4)
						{
							sound_play(sndBloodLauncherExplo)
							instance_create(x+random_range(-1,1),y+random_range(-1,1),MeatExplosion)
						}
						team = other.team
					}
				}
		wait(1)
		}while(instance_exists(self))
	}
}
