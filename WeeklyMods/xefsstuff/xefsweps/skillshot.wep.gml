#define init
global.sprSkillshot = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAsAAAASCAMAAAC6q9RHAAAAG1BMVEUAAAAaFyYtKzYAAAAyOT4/GRNMVl1fLyZseoSdsCoyAAAAA3RSTlMAAAD6dsTeAAAAUUlEQVR42l2NAQrAMAgD7a6a/v/FU2ZLmURzKBj7F3BwraCXS1JAoqc7IceomkAdSvF5DWb2fhnXU9ERD8jldFYSF1tz+GHjZhjNY6R2QHLZC7thAZgDF+bNAAAAAElFTkSuQmCC", -2, 10);
global.sprSkillFlash = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABoAAAAcCAMAAABIzV/hAAAAFVBMVEUAAAAAAAAyOT5MVl1seoT//wD///+yN9E6AAAAAXRSTlMAQObYZgAAAFVJREFUeAG90DESgDAIRFFXw7//kWVrgcZMFsbmDSbkOhH1stTJvR7tJbXkNOQa9tpKkv4TNZGNP8UUEe7qh4ETBZGkJD4EyAH6qfms/obzXvNrZDkvfCIB0NuVnrwAAAAASUVORK5CYII=",2,6.5,3);
global.sprSkillBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABwAAAAtCAMAAACK9fuuAAAAG1BMVEUAAAAyOT5MVl1seoQAAAAyOT5MVl1seoT////6k2UVAAAABHRSTlMAAAAAs5NmmgAAAHZJREFUeAHt0sFqwzAAA1Alebb//483RhhsVJBSQi/VxYcHBktOIlLDBy+h6MjTGLkBRVREx2HquO7AWBcbOra2zrf9IsoFBUslIiqi4zB1XK9gfYolFePyX4y8G7fsP4f9ER57QoTAHz6SGJjOGf7FGGtOZ5lfwXYEpBZ0Eb0AAAAASUVORK5CYII=",4,3.5,44);
global.mskSkillBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAAChJREFUeAFjAANGMAAzEVyEECMSgPERAIsAIxqgiQBhd6CJYPEchvcBb5AA0QPUdCMAAAAASUVORK5CYII=",1,8,8);

global.SkillShotGlower = noone;

#define weapon_name
return "Skillshot";

#define weapon_sprt
return global.sprSkillshot;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 13;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 4;

#define weapon_text
return "No-scope";

#define weapon_fire

if !instance_exists(global.SkillShotGlower) {
	global.SkillShotGlower = instance_create(0, 0, CustomObject);
	with(global.SkillShotGlower){
		script_bind_draw(draw_skillshotglow, depth+0.1);
	}
}

with instance_create(x + lengthdir_x(7,gunangle) + lengthdir_x(9,gunangle + 90 * right), y + lengthdir_y(7,gunangle) + lengthdir_y(9,gunangle + 90 * right),CustomObject) {
	sprite_index = global.sprSkillFlash;
	direction = 90;
	speed = 20;
	
	script_bind_step(SSBoltUp, 0, self);
}

with instance_create(x + lengthdir_x(SSdist,gunangle+180),y + lengthdir_y(SSdist,gunangle+180),CustomProjectile){
	team = other.team;
	creator = other;
	
	sprite_index = global.sprSkillBolt;
	mask_index = global.mskSkillBolt;
	image_speed = 0;
	image_alpha = 0;
	
	on_hit = script_ref_create(SSHurt);
	on_wall = script_ref_create(SSWall);
	
	damage = 0;
	time = 50;
	
	script_bind_step(SSBolt, 0, self);
}
sound_play_gun(sndCrossbow, 0.25, 0.5);
weapon_post(2, 1, 1);

#define SSBoltUp(Me)
with (Me) {
	if (image_index >= 1) {image_speed = 0;}

	if (image_alpha > 0) {
		image_alpha -= 0.25;
	}
	else {
		instance_destroy();
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define SSBolt(Me)
with (Me) {
	if ((time <= 40) && (image_alpha = 0)) {
		image_speed = 1;
		image_alpha = 1;
	}

	if ((image_index >= 3) && (image_speed > 0)) {
		image_speed = 0;
		damage = 30;
		repeat(3) {
			with instance_create(x,y,Dust) {
				direction = random_range(0,360);
				speed = random_range(3,4);
			}
		}
	}
	else {
		damage = 0;
	}
	
	if (time < 10) {
		image_alpha -= 0.1;
	}

	if time > 0 time -= 1;
	else instance_destroy();
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define SSHurt
if (damage > 0) {projectile_hit(other, damage, 0, 0);}

#define step
if ("wep" in self) && (wep = "skillshot") {
	SSdist = distance_to_point(mouse_x[self.index], mouse_y[self.index]);
	
	if (("CamBak" not in self) || (CamBak = 420)) {
		CamBak = view_object[self.index];
		view_object[self.index] = self;
	}
}
else if (("CamBak" in self) && (CamBak != 420)) {
	view_object[self.index] = CamBak;
	CamBak = 420;
}

#define draw_skillshotglow

with(CustomObject) if ((sprite_index = global.sprSkillFlash) && (image_index < 1)) {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y - 15, 1.75, 1.75, 0, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}

#define SSWall
//nope
#define weapon_laser_sight
//nah