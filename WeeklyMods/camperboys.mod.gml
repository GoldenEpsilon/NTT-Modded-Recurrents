#define init
global.spawnshit = 0

#define step
if instance_exists(CharSelect)
{
	var races = mod_get_names("race");
	for (var i = 0; i<array_length(races); i++)
	{
		if !array_length(instances_matching(CampChar,"race",races[i]))
		{
			var len = random_range(40,100);
			var ang = random(360);
			with instance_create(64+lengthdir_x(len,ang),64+lengthdir_y(len,ang),CustomObject)
			{
				lsthealth = 0
				bskin = 0
				accuracy = 0
				index = 0
				maxspeed = 0
				wep = 1
				maxhealth = 10
				my_health = 0
				size = 1
				typ_ammo = [0,0,0,0,0,0]
				typ_amax = [0,0,0,0,0,0]
				mod_script_call("race",races[i],"create")
				mask_index = mskPlayer
				with CampChar if place_meeting(x,y,other)
				{
					var dir = point_direction(x,y,other.x,other.y)
					with other move_contact_solid(dir,16)
				}
				with instance_create(x,y,CampChar)
				{
					lastx = x
					x = lastx
					lasty = y
					y = lasty
					sprite_index = other.spr_idle
					spr_to = other.spr_idle
					spr_from = other.spr_idle
					spr_slct = other.spr_idle
					spr_menu = other.spr_idle
					if "spr_to" in other
					{
						spr_to = other.spr_to
					}
					if "spr_from" in other
					{
						spr_from = other.spr_from
					}
					if "spr_slct" in other
					{
						spr_slct = other.spr_slct
					}
					if "spr_menu" in other
					{
						spr_menu = other.spr_menu
						sprite_index = spr_menu
					}
					race = races[i]
					image_xscale = (x > 64 ? -1 : 1)
				}
				instance_destroy()
			}
		}
	}
	
	var campers = 0;
	var camper = 0;
	for (var i=0;i<=3;i++)
	{
		if player_is_active(i)
		{
			for (var o = 0; o<array_length(races); o++)
			{
				if player_get_race(i) = races[o]
				{
					if camper != races[o]
					{
						camper = races[o]
						campers++
					}
				}
			}
		}
	}
	
	var race_selected = array_create(array_length(races))
	for (var r = 0; r<array_length(races); r++)
	{
		race_selected[r] = false
		
		for (var i=0;i<=3;i++)
		{
			if  !player_is_active(i) || player_get_race(i) != races[r]
				continue
			else
				race_selected[r] = true
		}
	}
	
	for (var r = 0; r < array_length(race_selected); r++)
	{
		with instances_matching(CampChar,"race",races[r])
		{
			if race_selected[r]
			{
				if sprite_index != spr_to && sprite_index != spr_slct && image_index + image_speed*current_time_scale > image_number
				{
					sprite_index = spr_to
				}
				else if image_index + image_speed*current_time_scale >= image_number
				{
					image_index = (sprite_index = spr_to ? 0 : image_index - image_number)
					sprite_index = spr_slct
				}
			}
			else
			{
				if sprite_index != spr_from && sprite_index != spr_menu && image_index + image_speed*current_time_scale > image_number
				{
					sprite_index = spr_from
				}
				else if image_index + image_speed*current_time_scale >= image_number
				{
					image_index = (sprite_index = spr_from ? 0 : image_index - image_number)
					sprite_index = spr_menu
				}
			}
			
			if !sprite_exists(sprite_index)
				instance_destroy()
		}
	}
	
	if array_length(instances_matching(CampChar,"race",camper)) with instances_matching(CampChar,"race",camper)[0]
	{
		with CampChar if num = 17
		{
			x = other.x
			y = other.y
		}
	}
}

if instance_exists(GameCont)
{
	if GameCont.area = 0 && instance_exists(Floor) && instance_exists(Player)
	{
		if global.spawnshit = 1
		{
			var races = mod_get_names("race");
			for (var i = 0; i<array_length(races); i++)
			{
				if !array_length(instances_matching(Player,"race",races[i]))
				{
					var len = random_range(40,100);
					var ang = random(360);
					with instance_create(10000+lengthdir_x(len,ang),10000+lengthdir_y(len,ang),CustomObject)
					{
						lsthealth = 0
						bskin = 0
						accuracy = 0
						index = 0
						maxspeed = 0
						wep = 1
						maxhealth = 10
						my_health = 0
						size = 1
						typ_ammo = [0,0,0,0,0,0]
						typ_amax = [0,0,0,0,0,0]
						mod_script_call("race",races[i],"create")
						mask_index = mskPlayer
						with Corpse if place_meeting(x,y,other)
						{
							var dir = point_direction(x,y,other.x,other.y)
							with other move_contact_solid(dir,16)
						}
						if !place_meeting(x,y,Floor) || place_meeting(x,y,Wall)
						{
							var closeboy = instance_nearest(x,y,Floor);
							x = closeboy.x+16
							y = closeboy.y+16
						}
						with instance_create(x,y,Corpse)
						{
							sprite_index = other.spr_dead
							image_speed = 0
							image_index = image_number
						}
						instance_destroy()
					}
				}
			}
			with Corpse image_xscale = choose(-1,1)
			global.spawnshit = 0
		}
	}
	else
	{
		global.spawnshit = 1
	}
}

#define cleanup
var races = mod_get_names("race");
for (var i = 0; i<array_length(races); i++)
{
	with instances_matching(CampChar,"race",races[i])
	{	
		instance_delete(self)
	}
	with instances_matching(Corpse,"race",races[i])
	{
		instance_delete(self)
	}
}