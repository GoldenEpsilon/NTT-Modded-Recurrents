#define init

#define game_start

#define step

#define weapon_name
return "LASER WRENCH";

#define weapon_sprt
return sprWrench;

#define weapon_type
return 0;

#define weapon_auto
return false;

#define weapon_load
return 22;

#define weapon_cost
return 0;

#define weapon_area
return -1;

#define weapon_swap
return sndSwapHammer;

#define weapon_melee
return false;

#define weapon_laser_sight
return true;

#define weapon_text
return "FIGHT MILK";

#define weapon_fire
weapon_post(5, 30, 10);
sound_play(sndWrench);


with(instance_create(x + lengthdir_x(8, gunangle), y + lengthdir_y(8, gunangle), Slash)){
	creator = other;
	team = creator.team;
	direction = creator.gunangle;
	image_angle = direction;
	damage = 0;
}