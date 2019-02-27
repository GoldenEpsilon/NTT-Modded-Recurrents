#define init
global.sprite = sprite_add_weapon("HeavyFlak.png",3,3);

#define weapon_name
return "Heavy Flak Cannon";

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
return 14;

#define weapon_text
return "Rate it";

#define weapon_fire
sound_play_pitchvol(sndSuperFlakCannon,0.8,0.8)
sound_play_pitchvol(sndHeavySlugger,1.25,0.8)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprSuperFlakBullet;
  mask_index = mskSuperFlakBullet;
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
instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play_pitchvol(sndSuperFlakExplode,1.1,0.8)
sound_play_pitchvol(sndSlugger,1.5,0.8)
for (i = 0; i < 360; i += 22.5)
{
with instance_create(x,y,Slug)
{
  direction = other.i + (random_range(-20, 20));
      image_angle = direction;  
speed=13 + (random_range(-2,2))
team = other.team;
creator = other;
}
}