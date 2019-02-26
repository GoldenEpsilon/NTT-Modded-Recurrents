global.uk = sprite_add_weapon("spr/ukatana.png",4,8)
#define weapon_name
return loc("!argdn:UltKatana", "ULTRA KATANA");
#define weapon_type
return 0;
#define weapon_auto
return 0;
#define weapon_cost
return 0;
#define weapon_load
return 11;
#define weapon_sprt
return global.uk;
#define weapon_area
return 16;
#define weapon_swap
return sndSwapSword;
#define weapon_text
return "chicken loves her sword";
#define weapon_rads
return 8;
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13);
instance_create(x, y, Dust);
ang = __angle;
move_contact_solid(ang, 5);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 20, ang), y + lengthdir_y(__long_arms * 20, ang), Slash)) {
	sprite_index = sprUltraSlash
	ang = other.ang;
	damage = 30;
	motion_add(ang, 2 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
speed = -speed * 0.5;
weapon_post(-6, 8, 1);

