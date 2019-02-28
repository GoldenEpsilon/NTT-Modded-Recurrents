#define init
// Small, faster discs.
global.sprMiniDiscGun = sprite_add_weapon("Mini Disc Gun.png", -2, 5);
global.sprMiniDisc = sprite_add("Mini Disc.png", 2, 4, 4);

#define weapon_name
return "MINI DISC GUN";

#define weapon_sprt
return global.sprMiniDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 10;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 0;

#define weapon_text
return "so small";

#define weapon_fire
sound_play_gun(sndDiscgun, 0.2, 0.5);
repeat (2) {
	weapon_post(3, -6, 4);
	with (mod_script_call("mod", "Disc Tools", "disc_fire", 3, 5, 4)) {
		sprite_index = global.sprMiniDisc;
	}
	wait 6;
	if (!instance_exists(self)) break;
}
