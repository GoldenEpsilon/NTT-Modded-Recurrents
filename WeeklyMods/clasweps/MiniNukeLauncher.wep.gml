#define init
global.sprite = sprite_add_weapon("MiniNukeLauncher.png",4,4);
global.sprrocket = sprite_add("MiniNuke.png",1,6,4);

#define weapon_name
return "Mini Nuke Launcher";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 40;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 7;

#define weapon_text
return "PORTABLE NUKES";

#define weapon_fire
weapon_post(8,-13,22);
sound_play_pitchvol(sndNukeFire,1.2,1);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskNuke;
	image_angle = direction;
	damage = 8;
	typ = 2;
	creator = other;
	speed = 2;
	on_step = mnukestep;
	on_draw = mnukedraw;
	on_destroy = mnukedestroy;
	sound_play(sndRocketFly);
  }


#define mnukestep
var _x = mouse_x[creator.index]
var _y = mouse_y[creator.index]
if instance_exists(creator) {
	motion_add(point_direction(x,y,_x,_y),.6)
	image_angle = direction
	speed = 6
}
if irandom(2) >= 1{
with instance_create(x- hspeed, y - vspeed, Smoke) {
	image_xscale = 0.5
	image_yscale = 0.5
	depth = -3
  }
  }

#define mnukedraw
	draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(5,image_angle), y - lengthdir_y(5,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
draw_set_blend_mode(bm_normal);
draw_self();


#define mnukedestroy
repeat(2){
	with instance_create(x + random_range(-10,10), y + random_range(-10,10), Explosion){
	hitid = [global.sprite,"MINI NUKE LAUNCHER"]
	}
}
repeat(6){
	with instance_create(x + random_range(-15,15), y + random_range(-15,15), SmallExplosion){
		hitid = [global.sprite,"MINI NUKE LAUNCHER"]
	}
}
sound_play_pitchvol(sndNukeExplosion,1.5,0.8);