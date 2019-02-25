// /loadmod mods/pgw/reloadindicator.mod.gml

#define draw_gui
if(!instance_exists(GenCont)
&& !instance_exists(SkillIcon)
&& !instance_exists(CrownIcon)
&& !instance_exists(EGSkillIcon))
{
	with(Player)
	{
		if(reload > 0)
		{
			with(Player)
			{
				draw_set_visible(index, 0);
			}
			draw_set_visible(index, 1);
			
			if is_object(wep)
				var _reload = wep.procwep.reload;
			else
				var _reload = weapon_get_load(wep);
			draw_set_color(c_black);
			draw_rectangle(-view_xview[index]+mouse_x[index]-16, -view_yview[index]+mouse_y[index]+16, -view_xview[index]+mouse_x[index]+16, -view_yview[index]+mouse_y[index]+20, 0);
			draw_set_color(player_get_color(index));
			draw_rectangle(-view_xview[index]+mouse_x[index]-15, -view_yview[index]+mouse_y[index]+17, -view_xview[index]+mouse_x[index]-15+(30*((abs(_reload)-abs(reload > _reload ? _reload : reload))/abs(_reload))), -view_yview[index]+mouse_y[index]+19, 0);
			
			with(Player)
			{
				draw_set_visible(index, 1);
			}
		}
	}
}
