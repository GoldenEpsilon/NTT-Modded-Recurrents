#define init
global.traildrawer = -4
global.trailsf = surface_create(4000,4000)
global.sfx = 7500
global.sfy = 7500
surface_set_target(global.trailsf)
draw_clear_alpha(c_white,0)
surface_reset_target()

#define cleanup
with global.traildrawer instance_destroy()

#define draw_trails
surface_set_target(global.trailsf)
draw_set_blend_mode(bm_subtract)
draw_set_alpha(.15*current_time_scale)
draw_set_color_write_enable(0,0,0,1)
draw_rectangle(0,0,surface_get_width(global.trailsf),surface_get_height(global.trailsf),0)
draw_set_blend_mode(bm_normal)
draw_set_alpha(1)
draw_set_color_write_enable(1,1,1,1)

d3d_set_fog(1,c_white,1,1)

with instances_matching_gt(instances_matching_lt(instances_matching_gt(instances_matching_lt(instances_matching_ne(projectile,"object_index",Flame,TrapFire),"y",view_yview[0]+game_height),"y",view_yview[0]),"x",view_xview[0]+game_width),"x",view_xview[0]){
    draw_sprite_ext(sprDust,irandom(3),x-global.sfx,y-global.sfy,(speed*current_time_scale)/8,random(.5)+.1,direction,c_white,1)
}

d3d_set_fog(0,0,0,0)

surface_reset_target()
for var i = 0; player_is_active(i); i++{
    draw_set_visible_all(0)
    draw_set_visible(i,1)
    draw_surface_part(global.trailsf,view_xview[i]-global.sfx,view_yview[i] - global.sfy, game_width, game_height, view_xview[i], view_yview[i])
}
draw_set_visible_all(1)


#define step
if !surface_exists(global.trailsf){
    global.trailsf = surface_create(7000,7000)
    surface_set_target(global.trailsf)
    draw_clear_alpha(c_black,0)
    surface_reset_target()
}
if !instance_exists(global.traildrawer){
    with script_bind_draw(draw_trails,1){
        global.traildrawer = id
        persistent = 1
    }
}
if instance_exists(GenCont){
    surface_set_target(global.trailsf)
    draw_clear_alpha(c_black,0)
    surface_reset_target()
}
