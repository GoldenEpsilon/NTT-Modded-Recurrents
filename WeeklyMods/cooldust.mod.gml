#define init
with instances_matching(CustomDraw,"name",mod_current) instance_destroy()
with script_bind_draw(dustdraw,-1){
	name = mod_current
	global.drawer = id
}
global.sf = surface_create(5000,5000)
global.outlines = 1
global.words = ["Full outlines", "Lines only on the bottom"]

#define chat_command(cmd,arg,ind)
if cmd = "lines"{
	trace(global.words[global.outlines])
	global.outlines = !global.outlines
	return 1
}
return 0

#define step
if !instance_exists(global.drawer){
	with script_bind_draw(dustdraw,-1){
		global.drawer = id
		name = mod_current
	}
}

#define dustdraw
var _x = 7500, _y = 7500;
surface_set_target(global.sf)
draw_clear_alpha(c_black,0)
with instances_matching([Dust,Smoke,BoltTrail,DiscTrail,FishBoost,LaserCharge,BloodStreak,AcidStreak,BulletHit,ImpactWrists,ThrowHit,Debris,EBulletHit,Curse,projectile],"visible",1){
	x-=_x
	y-=_y
	draw_self()
	x+=_x
	y+=_y
}
surface_reset_target()
d3d_set_fog(1,c_black,1,1)
draw_surface(global.sf,_x,_y+1)
if global.outlines{
	draw_surface(global.sf,_x-1,_y)
	draw_surface(global.sf,_x+1,_y)
	draw_surface(global.sf,_x,_y-1)
}
d3d_set_fog(0,0,0,0)
draw_surface(global.sf,_x,_y)