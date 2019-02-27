#define init
global.sprite = sprite_add_weapon("PLasmaNukeLauncher.png",12,8);
global.sprrocket = sprite_add("PlasmaNuke.png",1,7,5);

#define weapon_name
return "PLASMA NUKE LAUNCHER";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 54;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_text
return "HOLY SHIT, THIS IS OVERKILL,#RIGHT?";

#define weapon_fire
weapon_post(8,-13,22);
sound_play_pitchvol(sndNukeFire,1.3,1);
if skill_get(17){
sound_play_pitchvol(sndPlasmaHugeUpg,1.3,0.75);
}else{
sound_play_pitchvol(sndPlasmaHuge,1.3,0.75);
}
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskNuke;
	image_angle = direction;
	damage = 10 + (skill_get(17) * 10);
	typ = 2;
	creator = other;
	speed = 2;
	on_step = mnukestep;
	on_destroy = mnukedestroy;
	sound_play_pitchvol(sndRocketFly,0.6,1);
  }


#define mnukestep
var _x = mouse_x[creator.index]
var _y = mouse_y[creator.index]
if instance_exists(creator) {
	motion_add(point_direction(x,y,_x,_y),.4)
	image_angle = direction
	speed = 4
}
with instance_create(x- hspeed, y - vspeed, Smoke) {
	image_xscale = 0.7
	image_yscale = 0.7
}
with instance_create(x- hspeed, y - vspeed, PlasmaTrail) {
	image_xscale = 1.2
	image_yscale = 1.2
}

#define mnukedestroy
	with instance_create(x,y, PlasmaImpact){
	image_xscale = 1.7 + (skill_get(17) * 0.5)
	image_yscale = 1.7 + (skill_get(17) * 0.5)
	hitid = [global.sprrocket,"PLASMA NUKE"]
	damage = 15 + (skill_get(17) * 15)
	}
expspread = random_range(0,360)
for(i = 0; i <= 360; i += 20 - (skill_get(17) * 5)){
	with instance_create(x+lengthdir_x(random_range(30,65 + (skill_get(17) * 7)),direction+i+expspread),y+lengthdir_y(random_range(30,65 + (skill_get(17) * 7)),direction+i+expspread),PlasmaImpact){
direction = other.direction + other.i;
	damage = 7 + (skill_get(17) * 4)
}
}
sound_play_pitchvol(sndNukeExplosion,1.2,0.8);
sound_play_pitchvol(sndPlasmaBigExplodeUpg,0.8,0.85);
