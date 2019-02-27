#define init
global.sprite = sprite_add_weapon("ThroneCannon.png",2,3);

#define weapon_name
return "Throne Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 60;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 15;

#define weapon_text
return "The Guardian";

#define weapon_fire
sound_play(sndBigBallFire)
weapon_post(8, -8, 16);
repeat(2)
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprBigGuardianBullet;
  mask_index = mskFlakBullet;
  speed = 7 + random_range(1,-1);
  friction = 0.1;
  direction = other.gunangle + (random_range(-12, 12) * other.accuracy);
  image_angle = direction;
  image_speed = 0.4
  team = other.team;
  creator = other;
  damage = 10;
  force = 12;
  typ = 1;
  bulspeed = 4
  buloff = random(90)
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
  on_draw = script_ref_create(flakdraw);
}
motion_add(gunangle,-8);

#define flakstep
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play(sndBigBallExplo)
instance_create(x,y,PortalClear)
repeat(4){
for (i = 0; i < 360; i += 360/7)
{
with instance_create(x,y,GuardianBullet)
{
  direction = other.i + other.buloff
speed= other.bulspeed;
team = other.team;
creator = other;
}
}
bulspeed -= 0.5
}

#define flakdraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);