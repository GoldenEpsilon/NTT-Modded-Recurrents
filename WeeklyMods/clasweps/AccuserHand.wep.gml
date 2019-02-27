#define init
global.sprite = sprite_add_weapon("AccuserHand.png",4,6);

#define weapon_name
return "HAND OF THE ACCUSER";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 8;

#define weapon_text
return "BOLD ACCUSATIONS";

#define weapon_fire
weapon_post(4,-4,4);
sound_play_pitchvol(sndPlasma,1.6,1);
for(i = -20; i < 40; i += 20)
{
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (other.i + random_range(-2,2) * other.accuracy);
	sprite_index = sprPlasmaBall;
	//mask_index = mskPlasma;
	image_angle = direction;
	damage = 8;
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
var _x = mouse_x[creator.index]
var _y = mouse_y[creator.index]
if instance_exists(creator) {
	motion_add(point_direction(x,y,_x,_y),.4)
	image_angle = direction
	speed = 6
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
	image_xscale = 0.4
	image_yscale = 0.4
	}