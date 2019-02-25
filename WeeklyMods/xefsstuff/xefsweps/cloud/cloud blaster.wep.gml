#define init
global.sprPPRBcloudblaster = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABEAAAANCAMAAAB4p3UoAAAAJFBMVEUAAAByn79/ZEOfw90AAABUQixyn79/ZEOfw92vj2rg7vj///+8I3ZuAAAABHRSTlMAAAAAs5NmmgAAAFFJREFUeNp1zNEOgCAMQ9EhhXX7/w+2qCwx0fPIerF/kPcDM4m6LilAXZOREncJv6zKR2BXwynuo76K4Eo1eexNTQ6Vk5zAYQVTYKX1DunNvpxKEAK2HegbfQAAAABJRU5ErkJggg==", -1, 4);

global.sprPPRBBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAMAAACROYkbAAAAFVBMVEUAAAByn7+fw93///9yn7+fw93///89T4TsAAAABHRSTlMAAAAAs5NmmgAAAIJJREFUeNrdk0sOgCAMRBkYvP+RnfJxFqxId75oTMf2hSiUgH3AUQAU3ZFgoS7XAUHiG3/EfK9Y5cYTIXBti273y7B0NhQsKobBw0oAPaPfhkOAKlpwCJRVlEhNJ3kK2mQLNpHXtQAvAbeC3e0B3gjwA0H6I6Z/Y3Yjpbdy/jClj/MLKLcNp/ErVaUAAAAASUVORK5CYII=",4,8,8);

global.PPRBBulletGlower = noone;

#define weapon_name
return "CLOUD BLASTER";

#define weapon_sprt
return global.sprPPRBcloudblaster;

#define weapon_type
return 1;

#define weapon_melee
return false;

#define weapon_auto
return true;

#define weapon_load
return 10;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return -1;

#define weapon_text
return "POOFY AMMO";

#define weapon_fire
if "my_health" not in self {
	if !instance_exists(global.PPRBBulletGlower) {
		global.PPRBBulletGlower = instance_create(0, 0, CustomObject);
		with(global.PPRBBulletGlower){
			script_bind_draw(PPRBBulletGlow, 0.1);
		}
	}
	with instance_create(x+lengthdir_x(2, gunangle),y+lengthdir_y(2, gunangle),CustomProjectile){
		motion_add(other.gunangle + random_range(-5,5)*other.accuracy,15 + 2.5*skill_get(13));
		image_angle = direction;

		team = other.team;
		creator = other;

		sprite_index = global.sprPPRBBullet;
		mask_index = mskBullet1;
		
		damage = 4;
		force = 4;
		
		on_hit = script_ref_create(PPRBHurt);
		on_wall = script_ref_create(PPRBWall);
		
		canthurt = noone;
		hurttime = -1;
		
		script_bind_step(PPRBbullet, 0, id);
	}
	sound_play_gun(sndOasisShoot, 0.25, 0.5);
	motion_add(other.gunangle,-2)
	wkick = 10;
}
else with instance_create(x,y,PopupText){
	mytext = "NOT FOR U";
	time = 15;
}
wkick = 8;

#define PPRBbullet(Me)
with (Me) {
	image_angle = direction;

	if speed > 0 speed -= speed/10;
	
	if (speed > 1) && ((image_index > 1) && (image_index < 2)) image_speed = 0;
	else image_speed = 0.5;
	
	if image_index > 3 instance_destroy();
	
	with(projectile) if instance_exists(self) && instance_exists(other) && (team != other.team) && (distance_to_object(other) < 15) {
		instance_destroy();
		other.speed /= (1.5 - 0.25*skill_get(13));
	}
	
	if (instance_exists(self)) && (hurttime >= 0) hurttime -= 1;
	if (instance_exists(self)) && (hurttime = 0) && (canthurt != noone) canthurt = noone;
	
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define PPRBBulletGlow
with(CustomProjectile) if sprite_index = global.sprPPRBBullet {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 1.5, 1.5, direction, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}

#define PPRBHurt
if canthurt != other {
	projectile_hit(other, damage, force, direction);
	canthurt = other;
	hurttime = 10;
}

#define PPRBWall
speed = 0;