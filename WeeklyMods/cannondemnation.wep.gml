#define init
global.sprDoomCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB8AAAAPCAMAAAArpuSQAAAAElBMVEUAAAAAAAAaFyYtKzZOS13////8M8ZVAAAAAXRSTlMAQObYZgAAAH1JREFUeAFd0FGOBCEIBmH/Ku5/5mVlxum23sgXSWSlW1N+nXlFyUR1VsfMul2CWPhxKVG3444qTnsQyZoFXb3eFzFmtSNo/t3tXg6t7eFbZj/HNbarqO3SHU+yne20e53h3OH383dB+aZkXcVnN88CIeD9fEpwIjdPmZ76B1WQAwxQC9ImAAAAAElFTkSuQmCC", 6, 4);
global.sprDoomHead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACwAAAAQCAMAAABa4m3lAAAADFBMVEUAAACyYP/ikv//5/7KS3PTAAAAAXRSTlMAQObYZgAAAGtJREFUeNqtkuEKACEIg1Pf/53PvM1Fv064EQTra2i2tsxLtm5ZyikjGqnGhQb8d7diAxItNHyvYvMQLGixh9/JRg8GWfpnFIIVfQezoSqDLGmwDeuGf4Al/xtWGZMGZ083GMpw3KOPNPqiD130BT9M0+EzAAAAAElFTkSuQmCC",2,11,8);
global.sprDoomBody = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACwAAAAQCAMAAABa4m3lAAAAFVBMVEUAAAChWc/ti///5/6yYP/ikv//5/4RlExHAAAABHRSTlMAAAAAs5NmmgAAAH5JREFUeAGt0tEKxTAIA1C1cf//yXdKhhC8b83LQA8rrVoF2YFpAHQvKv7R541wd+Bh2ru3nRo2yl5hWlbGTp2BG1ijBjEgtnuZeli86R9rYFLL08GG8wL2G1guSPzngvp0xOvT6VAO8ToUHTdxrOOWRTofjlgXiXwocX1lRX+ligw72poqkQAAAABJRU5ErkJggg==",2,11,8);

global.DoomGlower = noone;

#define weapon_name
return "CANNONDEMNATION";

#define weapon_sprt
return global.sprDoomCannon;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 17;

#define weapon_text
return "@qS@qM@qE@qL@qL @qF@qE@qA@qR";

#define step

if "doomcount" not in self doomcount = -1;

if (wep = "cannondemnation") && button_released(index,"fire"){
	reload = 30;
	doomcount = -1;
	lastdoom = -1;
}
else if wep != "cannondemnation" {
	doomcount = -1;
	lastdoom = -1;
}

#define DoomHead(Me)
with(Me){
	if image_index > 0 image_speed = 0;
	
	with (hitme) if (team != other.team) && (sprite_index != spr_hurt) && (distance_to_object(other) < 5) {
		sprite_index = spr_hurt;
		image_index = 0;
		sound_play(snd_hurt);
		my_health -= 10;
		motion_add(point_direction(other.x, other.y, x, y),4);
	}

	move_bounce_solid(true)
	if instance_exists(enemy){
		target = instance_nearest(x,y,enemy);
		if collision_line(x,y,target.x,target.y,Wall,0,0) < 0 {
			targetdirection = point_direction(x, y, target.x, target.y);
			direction += angle_difference(targetdirection,direction)/10;
		}
	}
	image_angle = direction;
	lifetime -= 1;
	if lifetime < 0 {
		instance_create(x,y,Explosion);
		instance_destroy();
	}
}

#define DoomBody(Me)
with(Me){
	if image_index > 0 image_speed = 0;
	
	with (hitme) if (team != other.team) && (sprite_index != spr_hurt) && (distance_to_object(other) < 5) {
		sprite_index = spr_hurt;
		image_index = 0;
		sound_play(snd_hurt);
		my_health -= 5;
		motion_add(point_direction(other.x, other.y, x, y),4);
	}

	move_bounce_solid(true)
	if instance_exists(target){
		targetdirection = point_direction(x, y, target.x, target.y);
		direction += angle_difference(targetdirection,direction)/5;
		image_angle = direction;
		
		if distance_to_object(target) > 30 {
			instance_create(x,y,Explosion);
			instance_destroy();
		}
	}
	else {
		instance_create(x,y,Explosion);
		instance_destroy();
	}
}

#define weapon_fire

doomcount += 1;

with instance_create(x+lengthdir_x(20, gunangle),y+lengthdir_y(20, gunangle),CustomProjectile){
	if !instance_exists(global.DoomGlower) {
		global.DoomGlower = instance_create(0, 0, CustomObject);
		with(global.DoomGlower){
			script_bind_draw(draw_doomglow, depth+0.1);
		}
	}
	on_wall = script_ref_create(nothing);
	on_hit = script_ref_create(nothing);
	image_xscale = 1.1;
	image_yscale = 1.1;
	speed = 3;
	direction = other.gunangle;
	image_angle = direction;
	team = other.team;
	creator = other;
	if other.doomcount = 0 {
		sprite_index = global.sprDoomHead;
		lifetime = 0;
		other.doomheadtarget = self;
		script_bind_step(DoomHead, 0, id);
	}
	else {
		sprite_index = global.sprDoomBody;
		target = other.lastdoom;
		script_bind_step(DoomBody, 0, id);
	}
	other.lastdoom = self;
}

doomheadtarget.lifetime += 30;

if doomcount = 0 {
	sound_play_pitch(sndBlackSwordMega, random_range(1.5,2.5));
	motion_add(other.gunangle,-4);
	weapon_post(10, 5, 150);
}
else {
	sound_play_pitch(sndBlackSwordMega, random_range(0.25,1));
	motion_add(other.gunangle,-2);
	weapon_post(7, 5, 100);
}

#define nothing

#define draw_doomglow

with(CustomProjectile) if (sprite_index = global.sprDoomHead) || (sprite_index = global.sprDoomBody) {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 1.75, 1.75, direction, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}
