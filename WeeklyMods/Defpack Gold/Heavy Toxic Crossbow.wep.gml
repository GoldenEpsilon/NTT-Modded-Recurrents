#define init
global.sprHeavyToxicCrossbow = sprite_add_weapon("Heavy Toxic Crossbow.png", 3, 5);
global.sprHeavyToxicBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB8AAAAICAYAAAABfSQaAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABnSURBVDhPYwCC/4QwEIAIqmMQ+O9yVAzIw01D1TCQi7FZDMJgywcCwy3X1DcGY5+wWKJxTlULHGMTw4dBaqGOQFhOCYY5gBgMcgDc8oHAiDgHQmDCgGMMPlQxtTHEcgIYXRN18H8GAPsM0poaa7KBAAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",0, 20, 3);

#define weapon_name
return "HEAVY TOXIC CROSSBOW"

#define weapon_sprt
return global.sprHeavyToxicCrossbow;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 42;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 13;

#define weapon_text
return "FILL THE AIR WITH CHLORINE GOODNESS";

#define weapon_fire
	{
	wkick = 7
	sound_play(sndCrossbow)
	with instance_create(x,y,HeavyBolt)
	{
		hastouched = 0
		touch = 0
		team = other.team
		check = 0
		damage = 35
		timer = 6
		timer2 = 11
		image_xscale *= 0.8
		image_yscale *= 0.8
		motion_add(point_direction(x,y,mouse_x[other.index],mouse_y[other.index]),11)
		sprite_index = global.sprHeavyToxicBolt
		image_angle = direction
		do
		{
			timer -= 1
			if timer <= 0 && speed > 0
			{
				repeat(2)
				{
					instance_create(x,y,ToxicGas)
				}
			}
			if speed <= 0
			{
				timer2 -= 1
				if timer2 <= 0
				{
					sound_play(sndToxicBoltGas)
					repeat(35)
					{
						with instance_create(x,y,ToxicGas)
						{
							speed += random_range(0.3,1)
						}
					}
				instance_destroy()
				}
			}
			wait(1)
		}while(instance_exists(self))
	}
}
