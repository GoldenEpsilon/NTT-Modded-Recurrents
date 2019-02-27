#define init
global.sprite = sprite_add_weapon("lightningflakcannon.png",2,5);
global.sprflak = sprite_add("lightningflak.png",2,7,7)

#define weapon_name
return "Lightning Flak Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 60;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "T3N/T3N";

#define weapon_fire
sound_play(sndFlakCannon)
sound_play_pitchvol(sndLightningCannonEnd,1.5,0.7);
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = global.sprflak;
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
instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke);
wait(0);
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play(sndLightningRifle)
sound_play_pitchvol(sndLightningCannonEnd,0.9,0.7);
sound_play_pitchvol(sndFlakExplode,0.9,0.5);
for (i = 0; i < 360; i += 30)
{
with instance_create(x,y,Lightning)
{
  move_contact_solid(other.i, 10);
  alarm0 = 1;
  ammo = 6;
  image_angle = other.i + (random_range(-40, 40));
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
}
}