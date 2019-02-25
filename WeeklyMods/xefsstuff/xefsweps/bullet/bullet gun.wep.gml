#define init
global.sprBullet_Gun = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAMCAMAAAC6EAb3AAAAJ1BMVEUAAAAdGhcdGyMvLjQAAAAdGhcdGyMvLjQyLitITDxRUFh5fmuqr5eEsRcvAAAABHRSTlMAAAAAs5NmmgAAAG9JREFUeNpVjgsOwyAMQ+mWj8G5/3kXF7VdbfQQjkGMW7Y1Hn2+Zqwii6bxVQHYrLZldppSOMSKylyr0yUlIDLZm9I4u4DIoE73u+5itfc/DgMQ7k83TKkD3dWa8i7rjgDMaWyPP5mjR5OvVHeEkz+11wTsIrAT8AAAAABJRU5ErkJggg==", 2, 4);

global.sprBullet_Bullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACQAAAASCAMAAAAE/YwaAAAAJFBMVEUAAAAdGyMvLjRITDx5fmsAAAAdGyMvLjRITDxRUFh5fmuqr5e7eGxlAAAABXRSTlMAAAAAAMJrBrEAAADCSURBVHgBldLhTsMwDEXh23lpju33f19qm4ohARP356cjVU2i2eqp95M0QAQ0/ibE51h/CQZwWwtIr4IZcJhR1gKoRna1MmSPc+/zYRaxRqAEyCwh0bF7h5GsRSAaHEomOr3pxCbSiF8yUSS4+1ruGzLWJdL2XeIqmWhP5HeEvOQqpY5I4/5c/8wlXOIjCjrCbPfsK8JbEHMqESbVD5tZZElWVQJq6aN7mgB7EtynUgP4fglcyat0M/L+gv/zVN4+ug8PIQ3i7pma0AAAAABJRU5ErkJggg==",2,9,9);
global.mskBullet_Bullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAMAAABhEH5lAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAAClJREFUeAFjIAkwAgGGAKogIxwgRBAApxAjCqBIiLCNcDHczsf0NikAAGQyAJWQgSItAAAAAElFTkSuQmCC",1,9,9);

global.sprBullet_Bullet_break = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAMAAADeZIrLAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAIZJREFUeAGtlEEKxDAMxEb///RC9+AYtRCHzE0xjEhcmic8SaWzxgkZhH9cyfuYzAI2LLyck5MANtANWcJdgSs56LehPw6XLuBFAkUfAiYC75OvFn8WCQNBLHJxzWD/Bn4VsY6FEljBnoHplhfe6SL3BMBYYEOxti3n+c+uwOMWhorGQs7Kf/+mAZfM7YC5AAAAAElFTkSuQmCC",6,9,9);

#define weapon_name
return "BULLET GUN";

#define weapon_sprt
return global.sprBullet_Gun;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_melee
return 0;

#define weapon_load
return 10;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 18;

#define weapon_text
return "BULLET BULLETS";

#define weapon_fire

with instance_create(x + lengthdir_x(5, gunangle),y + lengthdir_y(5, gunangle),CustomProjectile) {
	direction = other.gunangle;
	image_angle = direction;
	speed = 15 + 5*skill_get(13);
	
	damage = 1;
	
	sprite_index = global.sprBullet_Bullet;
	mask_index = mskDisc;

	lifetime = 30;
	
	drawtarget = ((30 + 10 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id))))/2;
	team = other.team;
	owner = other;
	
	script_bind_step(bulletbullet_step, 0, id);
}

sound_play_gun(sndDiscgun, 0.25, -0.5);

#define bulletbullet_step(Me)
with (Me) {

	Crange = (30 + 10 * skill_get(13)) / (1 + array_length(instances_matching(projectile, "Bcapturer", id)));
	
	with (projectile) if (damage > 1 && ("Bcapturer" not in self || Bcapturer = -1) &&distance_to_object(other) < other.drawtarget) {
		sound_play_pitch(sndSwapCursed, 1 + 0.1 * array_length(instances_matching(projectile, "Bcapturer", other)));
		Bcapturer = other;
		team = other.team;
		if ("bIncd" not in self) {
			damage *= 2 + skill_get(17);
			bIncd = 1;
		}
	}
	
	with instances_matching(projectile, "Bcapturer", id) {
		direction = point_direction(x,y,other.x,other.y);
		image_angle += damage;
		speed = point_distance(x, y, other.x,other.y)/2;
	}
	
	script_bind_draw(draw_radius, depth, id);
	
	on_wall = script_ref_create(bounce);
	on_hit = script_ref_create(hurt);
	
	
	
	if (lifetime = 0) {
		Crange = 0;
		if (drawtarget < 12) {
			with (projectile) if ("Bcapturer" in self && Bcapturer = other) {
				instance_destroy();
			}
			sprite_index = global.sprBullet_Bullet_break;
			if (image_index > 4) {
				instance_destroy();
			}
		}
	}
	else {
		lifetime -= 1;
		speed -= 0.75 + 0.25*skill_get(13);
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define draw_radius(Me)
with(Me) if instance_exists(owner) {
	drawtarget += (Crange - drawtarget)/10;
	draw_set_alpha(0.1 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_add);
	draw_set_alpha(0.2 * image_alpha);
	draw_circle_colour(x+random_range(-0.25,0.25),y+random_range(-0.25,0.25),drawtarget-2,player_get_color(owner.index),player_get_color(owner.index),0);
	draw_set_blend_mode(bm_normal);
	draw_set_alpha(1);
}
instance_destroy();

#define bounce
move_bounce_solid(true);
sound_play_pitchvol(sndDiscBounce, 0.8, image_alpha);

#define hurt
if ((lifetime > 0) && (other.sprite_index != other.spr_hurt)) {
	projectile_hit(other, 0, 0, 0);
}