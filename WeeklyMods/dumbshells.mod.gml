#define draw_gui_end
with instances_matching(CustomObject,"name","coolshell") draw_self()


if instance_exists(Player) with Shell{
	var me = id;
	with instance_nearest(x,y,Player){
		with instance_create(x - view_xview[index],y - view_yview[index],CustomObject){
			on_step = shellstep
			name = "coolshell"
			image_xscale = 1
			creator = other
			image_yscale = 1
			sprite_index = me.sprite_index
			depth = -11
			image_blend = other.image_blend
			spinspeed = 30+random(30)
			motion_add(me.direction,me.speed+10)
		}
	}
	instance_destroy()
}

#define shellstep
if instance_exists(creator){
	x -= creator.hspeed_raw * image_xscale
	y -= creator.vspeed_raw * image_xscale
}
motion_add(270,.7)
image_angle += spinspeed
image_xscale += .4
image_yscale += .4
if point_distance(x,y,xstart,ystart) > game_width instance_destroy()