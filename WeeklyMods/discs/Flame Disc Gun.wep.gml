#define init
global.sprFlameDisc = sprite_add("Flame Disc.png", 2, 6, 6);
global.sprFlameDiscGun = sprite_add_weapon("Flame Disc Gun.png", -2, 4);

#define weapon_name
return "FLAME DISC GUN";

#define weapon_sprt
return global.sprFlameDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 9;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return skill_get(14) ? "With no fear of untimely demise" : "Burning circles";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 8, 5)) {
	sprite_index = global.sprFlameDisc;
	wait 7;
	while (instance_exists(self)) {
		with (instance_create(x, y, Flame)) motion_add(random(360), random_range(0.4, 1.1));
		wait 1;
	}
}
