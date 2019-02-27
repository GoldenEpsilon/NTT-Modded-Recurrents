#define init
global.sprite = sprite_add_weapon("MegaNukeLauncher.png",12,6);
global.sprrocket = sprite_add("MegaNuke.png",1,7,6);

#define weapon_name
return "MEGA NUKE LAUNCHER";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 74;

#define weapon_cost
return 7;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 19;

#define weapon_text
return "HOLY SHIT, THIS IS OVERKILL,#RIGHT?";

#define weapon_fire
weapon_post(8,-13,22);
sound_play_pitchvol(sndNukeFire,0.8,1);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskNuke;
	image_angle = direction;
	damage = 5;
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
	image_xscale = 1.25
	image_yscale = 1.25
}

#define mnukedestroy
repeat(26){
	with instance_create(x + random_range(-70,70), y + random_range(-70,70), Explosion){
	hitid = [global.sprite,"MEGA NUKE LAUNCHER"]
	}
}
repeat(14){
	with instance_create(x + random_range(-85,85), y + random_range(-85,85), SmallExplosion){
		hitid = [global.sprite,"MEGA NUKE LAUNCHER"]
	}
}
sound_play_pitchvol(sndNukeExplosion,0.8,2);
sound_play_pitchvol(sndExplosionXL,0.6,2);
