global.slsh = sprite_add("spr/swipe_flail.png",5, 22, 44)
global.porzy = sprite_add_weapon("spr/flail.png",9, 12)
#define weapon_name
return loc("!argdn:Porzy", "PORZYGUN");
#define weapon_type
return 0;
#define weapon_auto
return 1;
#define weapon_cost
return 0;
#define weapon_load
return 30;
#define weapon_sprt
return global.porzy;
#define weapon_area
return 1;
#define weapon_swap
return sndSwapExplosive;
#define weapon_text
return "kill'ya";
#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play(sndHammer);
instance_create(x, y, Dust);
with (instance_create(x + lengthdir_x(__long_arms * 30, __angle), y + lengthdir_y(__long_arms * 30, __angle), Slash)) {
	sprite_index = global.slsh
	damage = 30;
	motion_add(__angle, 4 + 3 * __long_arms);
	image_angle = direction;
	team = other.team;
	creator = other;
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 12, 1);

