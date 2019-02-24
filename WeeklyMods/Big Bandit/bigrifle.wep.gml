#define init
global.spr = sprite_add_weapon("BigBanditGun.png", 16, 16);

#define weapon_name
return "BIG RIFLE";

#define weapon_text
return "ONLY THE LARGEST";

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 4;

#define weapon_cost
return 1;

#define weapon_sprt
return global.spr;

#define weapon_area 
return -1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_fire
if(object_index = Player)
{
	if(button_pressed(index, "fire")){ sound_play(sndBigBanditStartShoot); sound_play(sndBigBanditShootLaugh); }

	if(!button_check(index, "fire") and button_released(index, "fire"))
	sound_play(sndBigBanditStopShoot);
}

sound_play(sndEnemyFire);

with(instance_create(x, y, EnemyBullet1))
{
	motion_add(other.aimDirection + random_range(15, -15)*other.accuracy, 6);
	team = other.team;
	creator = other;
	damage = floor(3 * (GameCont.level/2));
	image_angle = direction;
}

weapon_post(4, 2, 2);