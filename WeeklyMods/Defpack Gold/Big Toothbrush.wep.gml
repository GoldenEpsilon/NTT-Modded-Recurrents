#define init
global.brush = sprite_add_weapon("Big Toothbrush.png",8,0)
#define weapon_name
return "BIG TOOTHBRUSH"
#define weapon_type
return 0
#define weapon_cost
return 0
#define weapon_area
return 7;
#define weapon_load
return 19
#define weapon_swap
return sndSwapHammer
#define weapon_auto
return 0
#define weapon_melee
return 0
#define weapon_laser_sight
return 0
#define weapon_fire
sound_play(sndHammer)
weapon_post(-16 - (20*skill_get(13)),6,0)
with instance_create(x+lengthdir_x(16+(20*skill_get(13)),gunangle),y+lengthdir_y(16+(20*skill_get(13)),gunangle),Shank){
	sprite_index = mskNone
	canfix = false
	mask_index = global.brush
	damage = 16
	creator = other
	force = 8
	team = other.team
	image_angle = other.gunangle
}
#define weapon_sprt
return global.brush
#define weapon_text
return "not enough toothpaste"
