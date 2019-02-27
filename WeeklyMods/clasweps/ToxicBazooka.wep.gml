#define init
global.sprite = sprite_add_weapon("ToxicBazooka.png",10,8);
global.sprrocket = sprite_add("ToxicRocket.png",1,4,4);
global.sprflame = sprite_add("UltraRocketFlame.png",3,18,6);

#define weapon_name
return "TOXIC BAZOOKA";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 8;

#define weapon_text
return "SAFETY HAZARD";

#define weapon_fire
weapon_post(6,-9,18);
sound_play_pitchvol(sndRocket,0.7,1);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = global.sprrocket;
	//mask_index = mskRocket;
	image_angle = direction;
	damage = 20;
	typ = 2;
	creator = other;
	alarm1 = 10;
	speed = 2;
	active = 0;
	on_step = trcktstep;
	on_draw = trcktdraw;
	on_destroy = trcktdestroy;
	sound_play_pitchvol(sndRocketFly,0.7,1);
}

#define trcktstep
if(alarm1 >= 0)
{
	alarm1 -= 1;
	if(alarm1 = 0)
	{
		active = 1;
		view_shake_at(x, y, 4);
	}
}
if(active)
{
	if irandom(1) == 1 instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	if(speed < 12) speed += 0.5;
	else speed = 10;
}

#define drcktdraw
if(active)
{
	draw_sprite_ext(global.sprflame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(global.sprflame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define trcktdraw
if(active)
{
	draw_sprite_ext(global.sprflame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(global.sprflame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define trcktdestroy
sound_play_pitchvol(sndExplosionL,0.7,1);
	instance_create(x,y,Explosion)
for(i = 0; i <= 340; i += 20){
	with instance_create(x,y,ToxicGas){
direction = other.i + random_range(10,-10);
speed = 2 + random_range(0,-1.5);
}
}