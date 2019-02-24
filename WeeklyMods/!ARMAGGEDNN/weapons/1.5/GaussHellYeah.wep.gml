global.wow = sprite_add("spr/sprLaserGauss.png",1,1,2)
#define weapon_name
return "GAUSS GUN";

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 5;

#define weapon_sprt
return sprLaserGun;

#define weapon_area
return 2;

#define weapon_swap
return sndSwapEnergy;

#define weapon_text
return "futuristic weaponry";

#define weapon_fire
var __angle = gunangle;
var __laser_brain = skill_get(17)
if (__laser_brain) {
	sound_play(sndLaserUpg);
} else sound_play(sndLaser);
with (instance_create(x, y, Laser)) {
	image_xscale = 0.75;
	image_yscale = 0.75;
	image_angle = __angle + (random(12) - 1) * other.accuracy;
	team = other.team;
	event_perform(ev_alarm, 0);
}
weapon_post(5, -5, 5);

