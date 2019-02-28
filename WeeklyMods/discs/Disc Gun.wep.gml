#define init
// Standard issue, except with the custom discs.
weapon_set_area(18, -1);
global.sprDiscGunPlus = sprite_add_weapon("Disc Gun.png", -2, 4);

#define weapon_name
return "DISC GUN";

#define weapon_sprt
return global.sprDiscGunPlus;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 8;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 2;

#define weapon_text
return "Instant classic";

#define weapon_fire
sound_play_gun(sndDiscgun, 0.2, 0.3);
weapon_post(4, -10, 6);
mod_script_call("mod", "Disc Tools", "disc_fire", 5, 5, 6);
