#define init
weapon_set_area(18, -1);
global.sprMiniDisc = sprite_add("Mini Disc.png", 2, 4, 4);
global.sprDiscShotgun = sprite_add_weapon("Disc Shotgun.png", -2, 4);

#define weapon_name
return "DISC SHOTGUN";

#define weapon_sprt
return global.sprDiscShotgun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 17;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return "Watch out,";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
repeat (7) {
	var q = mod_script_call("mod", "Disc Tools", "disc_fire", 20, random_range(4, 8), 4);
	q.sprite_index = global.sprMiniDisc;
	q.mask_index = global.sprMiniDisc;
}
