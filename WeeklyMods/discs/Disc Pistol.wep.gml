#define init
// Semi-automatic, but more precise than disc gun.
weapon_set_area(18, -1);

#define weapon_name
return "DISC PISTOL";

#define weapon_sprt
return sprDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 7;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 1;

#define weapon_text
return "Only self to blame";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
mod_script_call("mod", "Disc Tools", "disc_fire", 2, 5, 6);
