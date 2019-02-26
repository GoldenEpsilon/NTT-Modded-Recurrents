#define step
with (Player) if race_id = 2 if (button_released(index, "spec"))
	{
	if skill_get(5)
	if instance_exists(CrystalShield) && (variable_instance_get(CrystalShield, "creator") == self)
		{
		if position_meeting(mouse_x[index], mouse_y[index],Floor) && !position_meeting(mouse_x[index], mouse_y[index],Wall)
			{
			sound_play(sndCrystalTB)
			with (CrystalShield)
				{
				creator = other
				bskin = other.bskin
				instance_destroy()
				}
			x=mouse_x[index]
			y=mouse_y[index]
			with instance_create(x,y,CrystalShield)
				{
				creator = other
				bskin = other.bskin
				}
			}
		else{
		    sound_play(sndCrystalTB)
			with (CrystalShield)
				{
				creator = other
				bskin = other.bskin
				instance_destroy()
				}
			var clos = instance_nearest(mouse_x,mouse_y,Floor);
			x=clos.x+(sprite_get_width(clos.sprite_index)/2)
			y=clos.y+(sprite_get_width(clos.sprite_index)/2)
			with instance_create(x,y,CrystalShield)
				{
				creator = other
				bskin = other.bskin
				}
			}
		}
	}
