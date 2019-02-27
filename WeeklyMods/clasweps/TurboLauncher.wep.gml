#define init
global.sprite = sprite_add_weapon("TurboLauncher.png",10,3);
global.sprrocket = sprite_add("TurboRocket.png",1,4,4);

#define weapon_name
return "TURBO MISSILE LAUNCHER";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 1;

#define weapon_load
return 19;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 9;

#define weapon_text
return "UNMATCHED ACCELERATION";

#define weapon_fire
if instance_exists(self){
weapon_post(6,-9,18);
sound_play_pitchvol(sndRocket,1.1,1);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskRocket;
	image_angle = direction;
	damage = 5;
	typ = 2;
	creator = other;
	alarm1 = 1;
	speed = 2;
	active = 0;
	on_step = brcktstep;
	on_draw = brcktdraw;
	on_destroy = brcktdestroy;
	sound_play_pitchvol(sndRocketFly,1.3,1);
  }
}

#define brcktstep
if(alarm1 >= 0)
{
	alarm1 -= 1;
	if(alarm1 = 0)
	{
		active = 1;
		view_shake_at(x, y, 2);
	}
}
if(active)
{
	if irandom(2) == 2 instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	if(speed < 18) speed += 2;
	else speed = 16;
}

#define brcktdraw
if(active)
{
	draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define brcktdestroy
sound_play(sndExplosionS)
	instance_create(x,y,Explosion)
	repeat(2){
instance_create(x+random_range(1,-1),y+random_range(1,-1),SmallExplosion)
}