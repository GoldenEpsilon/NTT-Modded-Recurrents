#define init
global.sprite = sprite_add_weapon("ToxicBlazer.png",2,3);

#define weapon_name
return "Toxic Blazer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 6;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 6;

#define weapon_text
return "Suffocate, man Suffocate";

#define weapon_fire
sound_play(sndIncinerator)
weapon_post(5, -5, 5);
repeat(1){
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprBullet2;
  mask_index = mskBullet1;
  speed = 15;
  image_blend = make_color_rgb(100,255,100);
  friction = 0.6;
  direction = other.gunangle + (random_range(-5, 5) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 5;
  force = 12;
  image_speed= 0.4;
  typ = 1;
  toxin = 1;
  on_wall = script_ref_create(tshellwall);
  on_anim = script_ref_create(tshellanim);
  on_destroy = script_ref_create(tshelldestroy);
  on_step = script_ref_create(tshellstep);
  on_draw = script_ref_create(tshelldraw);
}
}


#define tshellstep
if speed <= 2
{
  image_speed = 0.4;
  sprite_index = sprBullet2Disappear;
if toxin = 1{
toxin = 0;
with instance_create(x,y,ToxicGas){
direction = random(359);
speed = 1 + random_range(0.2,-0.9)
}
}
}
if sprite_index = sprBullet2Disappear && image_index = 5 instance_destroy();

#define tshellanim
if sprite_index = sprBullet2{
  image_index = 1
  image_speed = 0;
  damage-=2;
}
if sprite_index = sprBullet2Disappear
{
  instance_delete(self);
}

#define tshelldestroy
if toxin = 1{
with instance_create(x,y,ToxicGas){
direction = random(359);
speed = 1 + random_range(0.2,-0.9)
}
}
with instance_create(x,y,BulletHit)
{
  image_speed = 0.4;
}

#define tshellwall
if skill_get(15){
move_bounce_solid(self);
speed -= 2.5;
image_angle = direction;
}else{
instance_destroy();
}

#define tshelldraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);