#define init
global.sprite = sprite_add_weapon("SuperFocusedFlakCannon.png",6,4);

#define weapon_name
return "Super Focused Flak Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 75;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 16;

#define weapon_text
return "Anything Near your Crosshair Dies";

#define weapon_fire
sound_play(sndSuperFlakCannon)
weapon_post(10, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprSuperFlakBullet;
  mask_index = mskSuperFlakBullet;
  speed = 11;
  friction = 0.5;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 24;
  force = 24;
  typ = 1;
  on_wall = script_ref_create(sflakwall);
  on_hit = script_ref_create(sflakhit);
  on_step = script_ref_create(sflakstep);
}
motion_add(gunangle,-8);

#define flakstep
instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
if speed <= 0.5{
sound_play_pitchvol(sndFlakExplode,1.1,.8)
sound_play_pitchvol(sndShotgun,1.4,.8)
repeat(14){
with instance_create(x,y,Bullet2)
{
  direction = other.direction + (random_range(-20, 20));
      image_angle = direction;  
speed=17 + (random_range(-3, 3));
team = other.team;
creator = other;
}
}
instance_destroy();
}

#define flakwall
with instance_create(x,y,BulletHit){
sprite_index = sprFlakHit;}
speed=0

#define flakhit
projectile_hit(other,damage,force);
with instance_create(x,y,BulletHit){
sprite_index = sprFlakHit;}
speed=0

#define sflakstep
instance_create(x+random_range(-7,7),y+random_range(-7,7),Smoke)
instance_create(x+random_range(-7,7),y+random_range(-7,7),Smoke)
if speed <= 0.5{
sound_play_pitchvol(sndSuperFlakExplode,1.1,.8)
sound_play_pitchvol(sndSlugger,1.4,.9)
for (i = -25; i < 50; i += 25)
{
with instance_create(x + lengthdir_x(10,direction),y + lengthdir_y(10,direction),CustomProjectile)
{
  sprite_index = sprFlakBullet;
  mask_index = mskFlakBullet;
  speed = 8 + (random_range(-4, 4));
  friction = 0.6;
  direction = other.direction + other.i + (random_range(-8, 8));
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 12;
  force = 12;
  typ = 1;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_step = script_ref_create(flakstep);
}
}
instance_destroy();
}

#define sflakwall
move_bounce_solid(self);
with instance_create(x,y,BulletHit){
sprite_index = sprSuperFlakHit;}
speed=0

#define sflakhit
projectile_hit(other,damage,force);
with instance_create(x,y,BulletHit){
sprite_index = sprSuperFlakHit;}
speed=0