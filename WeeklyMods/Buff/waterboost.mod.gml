#define step
//fish tb
with instances_matching(Player,"race","fish") if skill_get(mut_throne_butt){
    canspec = 0
    if button_pressed(index,"spec"){
	//	direction = point_direction(x,y,mouse_x,mouse_y);
	    repeat 3 instance_create(x+lengthdir_x(4,direction),y+lengthdir_y(4,direction),FishBoost)
		sound_play(sndFishRollUpg)
		sound_loop(sndFishTB)
		if !button_check(index,"east")
        and !button_check(index,"nort")
        and !button_check(index,"west")
        and !button_check(index,"sout")
        direction = gunangle
	}
    if button_check(index,"spec"){
       //if instance_exists(Portal)
       //    roll = -1
        instance_create(x,y,Dust)
		maxspeed = 6;
		speed = 6;
		angle -= (30*right)*current_time_scale
	//	if instance_exists(Portal) image_angle = (current_frame*30 mod 360)*right
		right = 1;
		if place_meeting(x+hspeed,y+vspeed,Wall){
		    move_contact_solid(1,1)
		}
		if speed < 6 instance_create(x,y,Dust)
    
        if button_pressed(index,"east"){ direction = 0;  repeat 3 with instance_create(x+lengthdir_x(4,direction),y+lengthdir_y(4,direction),FishBoost)motion_add(other.direction+180,random(3));sound_play(sndFishTB)}
        if button_pressed(index,"nort"){ direction = 90; repeat 3 with instance_create(x+lengthdir_x(4,direction),y+lengthdir_y(4,direction),FishBoost)motion_add(other.direction+180,random(3));sound_play(sndFishTB)}
        if button_pressed(index,"west"){ direction = 180;repeat 3 with instance_create(x+lengthdir_x(4,direction),y+lengthdir_y(4,direction),FishBoost)motion_add(other.direction+180,random(3));sound_play(sndFishTB)}
        if button_pressed(index,"sout"){ direction = 270;repeat 3 with instance_create(x+lengthdir_x(4,direction),y+lengthdir_y(4,direction),FishBoost)motion_add(other.direction+180,random(3));sound_play(sndFishTB)}
        
    //    if button_check(index,"east")and round(direction)=180 direction = 0
    //    if button_check(index,"nort")and round(direction)=270 direction = 90
    //    if button_check(index,"west")and round(direction)=0   direction = 180
    //    if button_check(index,"sout")and round(direction)=90  direction = 270
    }
    if button_released(index,"spec"){
		angle = 0;
		image_angle = angle
	    maxspeed = 4+(0.5*skill_get(mut_extra_feet));
	    sound_stop(sndFishTB)
    }
}