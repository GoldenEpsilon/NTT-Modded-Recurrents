global.sndUltraSuperPlasmaCannon = sound_add("snd/uspcShot.ogg")
global.sprite = sprite_add_weapon("spr/uspc.png", 5, 22)

#define weapon_name
return loc("!argdn:SupUltPlaCan", "ULTRA SUPER PLASMA CANNON");
#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_cost
return 55;

#define weapon_load
return 550;

#define weapon_sprt
return global.sprite;

#define weapon_area
return 49;

#define weapon_swap
return sndSwapEnergy;

#define weapon_text
return "SPC!";

#define weapon_rads
return 300;

#define weapon_fire
var __angle = gunangle;
sound_play(global.sndUltraSuperPlasmaCannon);
repeat (3) with (instance_create(x + lengthdir_x(8, __angle), y + lengthdir_y(8, __angle), PlasmaHuge)) {
	motion_add(__angle + (random(4) - 2) * other.accuracy, 2);
	damage = 9;
	image_xscale = 6;
	image_yscale = 6;
	image_angle = direction;
	team = other.team;
	creator = other;
}
motion_add(__angle + 180, 6);
weapon_post(10, -8, 8);
resetSpeed = 0;
#define step(primary)
if (primary) {
	Player.maxspeed = 3
}
else
{
Player.maxspeed = 4
}