global.dab = sprite_add_weapon("spr/dubsteb.png",23,28)
#define weapon_name
return loc("!argdn:dubStepGun", "DUBSTEP GUN");

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 7;

#define weapon_sprt
return global.dab;

#define weapon_area
return 9;

#define weapon_swap
return sndSwapEnergy;

#define weapon_text
return "";

#define weapon_fire
var __angle = gunangle;
var __laser_brain = skill_get(17)
if (__laser_brain) {
	sound_play(sndLaserUpg);
} else sound_play(sndLaser);
repeat 2 with (instance_create(x, y, Laser)) {
	damage = 20;
	image_xscale = 8;
	image_yscale = 8;
	image_angle = __angle + (random(8) - 4) * other.accuracy;
	team = other.team;
	event_perform(ev_alarm, 0);
	wait 3;
	}
weapon_post(5, -3, 2);

#define step
with Wall {
if instance_exists(Wall)
	if place_meeting(x,y,Laser) {
		instance_create(x,y,GreenExplosion)
		}
	}
