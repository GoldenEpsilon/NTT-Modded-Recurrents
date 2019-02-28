#define init
global.sprToxicDisc = sprite_add("Toxic Disc.png", 2, 6, 6);
global.sprToxicDiscGun = sprite_add_weapon("Toxic Disc Gun.png", -2, 4);

#define weapon_name
return "TOXIC DISC GUN";

#define weapon_sprt
return global.sprToxicDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 10;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return player_count_race(15) ? "A perfect fit" : "Thread lightly";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 5, 3)) {
	sprite_index = global.sprToxicDisc;
	wait 10;
	do {
		instance_create(x, y, ToxicGas);
		wait 1;
	} while (instance_exists(self));
}
