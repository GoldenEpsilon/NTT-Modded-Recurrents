#define init

#define weapon_name
return loc("!argdn:ShiHeavyGun", "SHIELDER HEAVY GUN");

#define weapon_type
return 1;

#define weapon_sprt
return sprPopoHeavyGun;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 6;

#define weapon_text
return "BLOODY SPAM";
    
#define weapon_fire
var __angle = gunangle;
repeat (2) if (instance_exists(self)) {
	sound_play_gun(sndRogueRifle, 0.1, 0.3);
	with (instance_create(x, y, Shell)) {
			motion_add(__angle + (random(12) - 6) * other.accuracy, 1);
	}
	with (instance_create(x, y, IDPDBullet)) {
		motion_add(__angle + (random(12) - 6) * other.accuracy, 13);
		image_angle = direction;
		team = other.team;
		creator = other;
		accuracy = 40
	}
	weapon_post(4, -6, 3);
	wait 3;
}