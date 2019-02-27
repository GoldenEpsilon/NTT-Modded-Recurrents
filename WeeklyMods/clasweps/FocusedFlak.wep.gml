#define init
global.sprite = sprite_add_weapon("FocusedFlakCannon.png",6,3);

#define weapon_name
return "Focused Flak Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "One Direction";

#define weapon_fire
sound_play(sndFlakCannon)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = sprFlakBullet;
  mask_index = mskFlakBullet;
  speed = 9;
  friction = 0.42;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 12;
  force = 12;
  typ = 1;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
}
motion_add(gunangle,-4);

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
speed=16 + (random_range(-3, 3));
team = other.team;
creator = other;
}
}
instance_destroy();
}

#define flakwall

speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy