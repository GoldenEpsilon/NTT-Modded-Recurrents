#define init
global.sprSuperSkillshot = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAZCAMAAADZh4T+AAAAJFBMVEUAAAA/GRNcOyNfLyaqbUEAAAA/GRNcOyNfLyaqbUHZtEX///+rcg+DAAAABXRSTlMAAAAAAMJrBrEAAAB4SURBVHgBbc5RDoMwDINhw/idtPc/8FKtQ9GYRUg/+SX6H6CTOSetnJk5YSsddk1CcaYZRI1zIj4Ze0uoQqy136/jrF7nweIldBHrt7CCVk8/L34OTFO5a5fru6/PdLHZNvo6wtk9RrmwLcLuFk+jblB35UGKz7wBe48D9vDiGt4AAAAASUVORK5CYII=", -3, 14);
global.sprSuperSkillFlash = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABoAAAAcCAMAAABIzV/hAAAAG1BMVEUAAAD//wD///8AAABcOyOqbUHZtEX//wD///9CKDB3AAAAA3RSTlMAAAD6dsTeAAAAiUlEQVR4Aa2PgaoDMQgEzfreuf//xWXxPIME2kLn4ASHIYkd8BzfKb/8p8r/rn9/p2gNR8W4l8G78lJBBkmNVMISFvVgfZUlMVVW3pVkGxdyrc7VcwtsZ6FVOhYY1f6uqRgACCA4FG0hWcZRmdb5e6o2PT+utrOOFWZVkTqNqaCNioWhYA1SWaoXtZwEo3UnA4cAAAAASUVORK5CYII=",2,6.5,-5);
global.sprSuperSkillBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABwAAAAtCAMAAACK9fuuAAAAG1BMVEUAAAAyOT5MVl1seoQAAABcOyOqbUHZtEX///9S6nV1AAAABHRSTlMAAAAAs5NmmgAAAHpJREFUeAHt0sEKwyAQBuExjvr+b1wCQSpkJd3SW3+PH3gYFhAJp398hOIG/RiRHIqYQzXGZt/g+AXikEdYyz1y2sT5jzcVVxQxSrJHNcZm3+D4BsOLckge116LkkWyWDhAigde7w3riSI6Q81VwKZ25zEvs7XRu1fMF18HBQjw1HyeAAAAAElFTkSuQmCC",4,3.5,44);
global.mskSkillBolt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAAChJREFUeAFjAANGMAAzEVyEECMSgPERAIsAIxqgiQBhd6CJYPEchvcBb5AA0QPUdCMAAAAASUVORK5CYII=",1,8,8);

global.SuperSkillShotGlower = noone;

#define weapon_name
return "Super Skillshot";

#define weapon_sprt
return global.sprSuperSkillshot;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 13;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 10;

#define weapon_text
return "360 No-scope";

#define weapon_fire

if !instance_exists(global.SuperSkillShotGlower) {
	global.SuperSkillShotGlower = instance_create(0, 0, CustomObject);
	with(global.SuperSkillShotGlower){
		script_bind_draw(draw_superskillshotglow, depth+0.1);
	}
}

with instance_create(x + lengthdir_x(SSdist,gunangle+180),y + lengthdir_y(SSdist,gunangle+180),CustomProjectile){
	team = other.team;
	creator = other;
	
	sprite_index = global.sprSuperSkillBolt;
	mask_index = global.mskSkillBolt;
	image_speed = 0;
	image_alpha = 0;
	
	on_hit = script_ref_create(SSHurt);
	on_wall = script_ref_create(SSWall);
	
	damage = 0;
	time = 50;
	
	script_bind_step(SSBolt, 0, id);
}
var rotation = random_range(0,360);
repeat(4) {
	with instance_create(x + lengthdir_x(SSdist,gunangle+180) + lengthdir_x(10,rotation),y + lengthdir_y(SSdist,gunangle+180) + lengthdir_y(10,rotation),CustomProjectile){
		team = other.team;
		creator = other;
		
		sprite_index = global.sprSuperSkillBolt;
		mask_index = global.mskSkillBolt;
		image_speed = 0;
		image_alpha = 0;
		
		on_hit = script_ref_create(SSHurt);
		on_wall = script_ref_create(SSWall);
		
		damage = 0;
		time = 50;
		
		script_bind_step(SSBolt, 0, id);
	}
	rotation += 90;
}
firesounds = 5;

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
if ("wep" in self) && (wep = "superskillshot") {
	if (("firesounds" in self) && (firesounds > 0)) {
		sound_play_gun(sndCrossbow, 0.25, 0.5);
		weapon_post(2, 1, 1);
		
		with instance_create(x + lengthdir_x(9,gunangle) + lengthdir_x(12,gunangle + 90 * right) + random_range(-1, 1), y + lengthdir_y(9,gunangle) + lengthdir_y(12,gunangle + 90 * right) + random_range(-1, 1),CustomObject) {
			sprite_index = global.sprSuperSkillFlash;
			direction = 90;
			speed = 20;
			
			script_bind_step(SSBoltUp, 0, self);
		}
		
		firesounds -= 1;
	}
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

#define draw_superskillshotglow

with(CustomObject) if ((sprite_index = global.sprSuperSkillFlash) && (image_index < 1)) {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y - 15, 1.75, 1.75, 0, c_white, 0.075);
	draw_set_blend_mode(bm_normal);
}

#define SSWall
//nope
#define weapon_laser_sight
//nah