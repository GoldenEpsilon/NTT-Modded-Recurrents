#define init
global.sprite = sprite_add_weapon("GuidedPistol.png",0,1);

#define weapon_name
return "GUIDER PISTOL";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_load
return 35;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 7;

#define weapon_text
return "TOWARDS THE CROSSHAIR";

#define weapon_fire
weapon_post(4,-4,4);
if skill_get(17){
sound_play_pitchvol(sndPlasmaUpg,1.6,1);
}else{
sound_play_pitchvol(sndPlasma,1.6,1);
}
sound_play_pitchvol(sndRogueRifle,1.1,1);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = sprPlasmaBall;
	mask_index = mskPlasma;
	image_angle = direction;
	damage = 6 + (skill_get(17) * 3);
	image_yscale = 0.5 + (skill_get(17) * 0.1)
	image_xscale = 0.7 + (skill_get(17) * 0.1)
	typ = 2;
	creator = other;
	speed = random_range(1,2);
	on_step = aLasrstep;
	on_draw = aLasrdraw;
	on_destroy = aLasrdestroy;
  }


#define aLasrstep
var _x = mouse_x[creator.index]
var _y = mouse_y[creator.index]
if instance_exists(creator) {
	motion_add(point_direction(x,y,_x,_y),.5)
	image_angle = direction
	speed = 6
}
if irandom(2) >= 1{
with instance_create(x- hspeed + random_range(1,-1), y - vspeed + random_range(1,-1), PlasmaTrail) {
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
sound_play_pitchvol(sndPlasmaHit,1.2,0.9);
	with instance_create(x,y, PlasmaImpact){
	image_xscale = 0.3
	image_yscale = 0.3
	damage = 1
	}