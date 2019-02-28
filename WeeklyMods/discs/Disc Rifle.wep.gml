#define init
// Shoots 3 discs in quick succession.
// sprite from https://docs.google.com/spreadsheets/d/1Ir4nthoEcxO7RPVMIMHVYIzkUVck-zhRkn76NIUk7ZQ/edit#gid=0
global.sprDiscRifle = sprite_add_weapon("Disc Rifle.png", -2, 4);

#define weapon_name
return "DISC RIFLE";

#define weapon_sprt
return global.sprDiscRifle;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 11;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 4;

#define weapon_text
return "Handle with care";

#define weapon_fire
repeat (3) {
	mod_script_call("mod", "Disc Tools", "disc_fire", 5, 5, 6);
	sound_play(sndDiscgun);
	weapon_post(4, -10, 9);
	wait 4;
	if (!instance_exists(self)) break;
}


