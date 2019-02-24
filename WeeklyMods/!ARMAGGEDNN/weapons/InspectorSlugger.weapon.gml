#define init

#define weapon_name
return loc("!argdn:InsSlugg", "INSPECTOR SLUGGER");

#define weapon_type
return 2;

#define weapon_sprt
return sprPopoSlugger;

#define weapon_auto
return true;

#define weapon_load
return 14;

#define weapon_cost
return 1;

#define weapon_swap
return sndSlugger;

#define weapon_area
return 6;

#define weapon_text
return "STOLEN FROM INSPECTOR";
    
#define weapon_fire
repeat (1) if (instance_exists(self)) {
	sound_play_gun(sndSlugger, 0.1, 0.3);
	with (instance_create(x, y, Shell)) {
		motion_add(other.gunangle + random_range(-1, 1) * 25, 2 + random(2));
	}
	with (instance_create(x, y, PopoSlug)) {
		motion_add(other.gunangle + random_range(-1, 1) * 2 * other.accuracy, 16);
		image_angle = direction;
		team = other.team;
		creator = other;
		damage = 18
		force = 18
	}
	weapon_post(4, -6, 3);
	wait 3;
}