#define init
global.sprite = sprite_add_weapon("GuidedShotty.png",4,3);

#define weapon_name
return "Guider Shotgun";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 50;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "SPREAD MEANS NOTHING";

#define weapon_fire
weapon_post(4,-4,4);
sound_play_pitchvol(sndPlasmaBig,1.6,1);
for(i = -30; i < 40; i += 10)
{
with instance_create(x+lengthdir_x(12,gunangle),y+lengthdir_y(12,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (other.i + random_range(-4,4) * other.accuracy);
	sprite_index = sprPlasmaBall;
	//mask_index = mskPlasma;
	image_angle = direction;
	damage = 4 + (skill_get(17) * 2);
	Pspeed = random_range(4,6)
	image_yscale = 0.5
	image_xscale = 0.7
	typ = 2;
	creator = other;
	speed = random_range(1,2);
	on_step = aLasrstep;
	on_draw = aLasrdraw;
	on_destroy = aLasrdestroy;
  }
}


#define aLasrstep
if instance_exists(creator) {
var _x = mouse_x[creator.index]
var _y = mouse_y[creator.index]
	motion_add(point_direction(x,y,_x,_y),.4)
	image_angle = direction
	speed = Pspeed
}
if irandom(2) = 0{
with instance_create(x- hspeed, y - vspeed, PlasmaTrail) {
	image_xscale = 0.7
	image_yscale = 0.7
	depth = -3
  }
  }
if image_index = 1{
image_index = 1
image_speed = 0
}

#define aLasrdraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);


#define aLasrdestroy
sound_play_pitchvol(sndPlasmaHit,1.6,0.6);
	with instance_create(x,y, PlasmaImpact){
	image_xscale = 0.3
	image_yscale = 0.3
	damage = 1
	}