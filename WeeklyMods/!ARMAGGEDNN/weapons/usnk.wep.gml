global.sprSuperNukeLauncher = sprite_add_weapon("spr/usnk.png", 13, 20)
#define weapon_name
return loc("!argdn:UltSuppaNuk", "ULTRA SUPER NUKE LAUNCHER");
#define weapon_type
return 4;
#define weapon_auto
return 0;
#define weapon_cost
return 9;
#define weapon_load
return 100;
#define weapon_sprt
return global.sprSuperNukeLauncher;
#define weapon_area
return 14;
#define weapon_swap
return sndSwapExplosive;
#define weapon_text
return "true power";
#define weapon_rads
return 15;
#define weapon_fire
var __angle = gunangle;
sound_play(sndNukeFire);
repeat (16) with (instance_create(x, y, Nuke)) {
	image_xscale = 6;
	image_yscale = 6;
	motion_add(__angle + (random(4) - 2) * other.accuracy, 2);
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(10, -40, 8);

