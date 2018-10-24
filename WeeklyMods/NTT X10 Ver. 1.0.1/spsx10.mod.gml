#define init
global.tex = sprite_add("roguetex.png",1,0,0)

#define step
with Player if race = "rogue"{
	if "strikex10" not in self{
		strikex10 = 0
		strikex10max = 30
	}else{
		if rogueammo > 1{
			strikex10 += rogueammo-1
			strikex10 = min(strikex10max,strikex10+8)
			rogueammo = 1
			with instances_matching(PopupText,"target",index) if "strikex10" not in self{
				if text = "+2 PORTAL STRIKES"{
					text = "+10 PORTAL STRIKES"
					if other.strikex10 = other.strikex10max{
						text = "MAX PORTAL STRIKES"
					}
				}
				strikex10 = 1
			}
		}
		if rogueammo < 1 && strikex10 >= 1{
			strikex10--
			rogueammo++
		}
	}
}
#define draw_gui_end
with Player if "strikex10" in self{
	if race = "rogue" && ultra_get("rogue",1){
		var xx = -24, yy = 5;
		draw_set_visible_all(0)
		draw_set_visible(index,1)
		var tex = sprite_get_texture(global.tex,0)
		draw_primitive_begin_texture(pr_trianglefan, tex);
		texture_set_repeat(1);
		drawmyshit(xx +8,yy)
		drawmyshit(xx +22,yy)
		drawmyshit(xx +22,yy+4*(strikex10+rogueammo))
		drawmyshit(xx +8,yy+4*(strikex10+rogueammo))
		drawmyshit(xx +8,yy+4*(strikex10+rogueammo))
		draw_primitive_end()
		texture_set_repeat(0)
		draw_set_visible_all(1)
	}
}
#define drawmyshit(_x,_y)
draw_vertex_texture(_x,_y,(_x+0)/16,(_y)/16)