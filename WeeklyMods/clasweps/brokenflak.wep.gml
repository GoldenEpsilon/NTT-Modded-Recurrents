#define init
global.sprite = sprite_add_weapon("BrokenFlakCannon.png",3,3);

#define weapon_name
return "Broken Flak Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 60;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "9/10";

#define weapon_fire
sound_play(sndFlakCannon)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprFlakBullet;
  mask_index = mskFlakBullet;
  speed = 8;
  friction = 0.25;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 30;
  force = 12;
  typ = 1;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
}
motion_add(gunangle,-8);

#define flakstep
with instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
{
image_xscale = .5;
image_yscale = .5;
}
with instance_create(x,y,Bullet2)
{
  direction = (random_range(1, 360));
      image_angle = direction;  
speed=8;
friction=.2;
damage=1
sound_play(sndPistol);
team = other.team;
creator = other;
}
wait(0);
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play(sndFlakExplode)
for (i = 0; i < 360; i += 72)
{
with instance_create(x,y,Bullet2)
{
  direction = other.i + (random_range(-20, 20));
      image_angle = direction;  
speed=15
team = other.team;
creator = other;
}
}