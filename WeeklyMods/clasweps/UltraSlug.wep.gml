#define init
global.sprite = sprite_add_weapon("UltraSlugger.png",2,4);
global.sprslug = sprite_add("UltraSlug.png",2,12,12)
global.sprslugvanish = sprite_add("UltraslugDissapear.png",6,12,12)
global.sprslughit = sprite_add("UltraSlugHit.png",4,12,12)

#define weapon_name
return "ULTRA SLUGGER";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 2;

#define weapon_auto
return 0;

#define weapon_load
return 14;

#define weapon_cost
return 3;

#define weapon_rads
return 20;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 28;

#define weapon_text
return "@gUltra @sPunch";

#define weapon_fire
weapon_post(2,-6,9);
sound_play_pitchvol(sndSuperSlugger,0.7,1)
sound_play_pitchvol(sndUltraShotgun,1.3,1)
for(var i = 0; i < 5; i += 4){
with instance_create(x + lengthdir_x(3, gunangle),y + lengthdir_y(3, gunangle),CustomProjectile)
{
	sprite_index = global.sprslug;
	speed = i+14;
	friction = 0.75;
	direction = other.gunangle + (random_range(-1,1) * other.accuracy);
	image_angle = direction;
	team = other.team;
	damage = 38;
	force = 5;
	typ = 1;
	creator = other;
	on_step = script_ref_create(slugstep);
	on_wall = script_ref_create(slugwall);
  on_destroy = script_ref_create(slugdestroy);
	image_speed = .7;
	on_anim = script_ref_create(sluganim);
	on_draw = script_ref_create(slugdraw);
}
}
#define slugstep
if speed <= 1.4
{
  image_speed = 0.4;
  sprite_index = global.sprslugvanish;
}
//if sprite_index = global.sprslugvanish && image_index = 5 instance_destroy();

#define sluganim
if sprite_index = global.sprslug
{
  image_index = 1;
  image_speed = 0;
  damage-=8;
}
if sprite_index = global.sprslugvanish
{
  instance_delete(self);
}

#define slugdestroy
with instance_create(x,y,BulletHit)
{
  sprite_index = global.sprslughit;
  image_speed = 0.4;
}

#define slugwall
move_bounce_solid(self);
speed -= 3;
speed += (2.5 * skill_get(15));
image_angle = direction;

#define slugdraw
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha * 0.1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, 1);