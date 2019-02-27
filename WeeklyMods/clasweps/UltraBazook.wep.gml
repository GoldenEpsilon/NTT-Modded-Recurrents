#define init
global.sprite = sprite_add_weapon("UltraBazooka.png",8,5);
global.sprrocket = sprite_add("UltraMainRocket.png",1,4,4);
global.sprsplitrocket = sprite_add("UltraRocket.png",1,4,4);
global.sprflame = sprite_add("UltraRocketFlame.png",3,18,6);
global.sprsmoke = sprite_add("UltraSmoke.png",5,12,12)
global.sprsmallboom = sprite_add("Greensmallexplosion.png",7,12,12)

#define weapon_name
return "ULTRA BAZOOKA";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 3;

#define weapon_rads
return 20;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 28;

#define weapon_text
return "SPLIT OF DEATH";

#define weapon_fire
weapon_post(6,-9,18);
sound_play_pitchvol(sndRocket,0.7,1);
sound_play_pitchvol(sndUltraGrenade,1.6,0.9)
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
	alarm1 = 5;
	speed = 2;
	active = 0;
	on_step = mrcktstep;
	on_draw = mrcktdraw;
	on_hit = mrckthit;
	on_wall = mrcktwall;
	sound_play_pitchvol(sndRocketFly,0.7,1);
}

#define urcktstep
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
	if irandom(1) == 1 with instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	{
		sprite_index = global.sprsmoke;
	}
	if(speed < 12) speed += 0.5;
	else speed = 10;
}

#define urcktdraw
if(active)
{
	draw_sprite_ext(global.sprflame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(global.sprflame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define urcktdestroy
sound_play_pitchvol(sndExplosionL,0.7,1);
for(i = 0; i <= 240; i += 120){
	with instance_create(x+lengthdir_x(10,direction+i),y+lengthdir_y(10,direction+i),GreenExplosion){
sprite_index = global.sprsmallboom;
mask_index = mskSmallExplosion;
	hitid = [sprite_index, "Small Green Explosion"];
}
}



#define mrcktstep
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
	if irandom(1) == 1 with instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	{
		sprite_index = global.sprsmoke;
	}
	if(speed < 11){ speed += 0.5;
	}else{
	for(var i = -20; i <= 20; i += 20)
{
with instance_create(x,y,CustomProjectile)
{
	team = other.team;
	direction = other.direction + i;
	sprite_index = global.sprsplitrocket;
	//mask_index = mskRocket;
	image_angle = direction;
	damage = 20;
	typ = 2;
	creator = other;
	alarm1 = 5;
	speed = 12;
	active = 1;
	on_step = urcktstep;
	on_draw = urcktdraw;
	on_destroy = urcktdestroy;
	sound_play_pitchvol(sndRocketFly,0.7,1);
}
}
instance_destroy();
}
}

#define mrcktdraw
if(active)
{
	draw_sprite_ext(global.sprflame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(global.sprflame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define mrcktwall
sound_play_pitchvol(sndExplosionL,0.7,1);
for(i = 0; i <= 240; i += 120){
	instance_create(x+lengthdir_x(16,direction+i),y+lengthdir_y(16,direction+i),GreenExplosion)
}
instance_destroy()

#define mrckthit
projectile_hit(other,damage,force);
sound_play_pitchvol(sndExplosionXL,0.7,1);
for(i = 0; i <= 240; i += 120){
	instance_create(x+lengthdir_x(16,direction+i),y+lengthdir_y(16,direction+i),GreenExplosion)
}
instance_destroy()