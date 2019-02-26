global.sprite1 = sprite_add_weapon("spr/sprelitepopogun.png", 1, 5);

#define weapon_name
return loc("!argdn:EGruRfle", "POLICE ASSAULT RIFLE");

#define weapon_type
return 1;

#define weapon_sprt
return global.sprite1;

#define weapon_auto
return false;

#define weapon_load
return 8.5;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "IDPD GUN";
    
#define weapon_fire
repeat (3) if (instance_exists(self)) {
	sound_play_gun(sndRogueRifle, 0.1, 0.3);
	with (instance_create(x, y, Shell)) {
		motion_add(other.gunangle + random_range(-1, 1) * 25, 2 + random(2));
	}
	with (instance_create(x, y, IDPDBullet)) {
		motion_add(other.gunangle + random_range(-1, 1) * 2 * other.accuracy, 16);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
	weapon_post(4, -6, 3);
	wait 3;
}