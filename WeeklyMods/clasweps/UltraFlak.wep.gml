#define init
global.sprite = sprite_add_weapon("UltraFlak.png",3,4);
global.sprbullet = sprite_add("UltraFlakBullet.png",2,8,8);
global.sprsmoke = sprite_add("UltraSmoke.png",5,12,12)
#define weapon_name
return "ULTRA FLAK CANNON";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 6;

#define weapon_rads
return 25;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 36;

#define weapon_text
return "@gULTRA@s/10";

#define weapon_fire
sound_play_pitchvol(sndFlakCannon,0.5,1.5)
sound_play_pitchvol(sndUltraShotgun,1.3,1)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = global.sprbullet;
  mask_index = mskFlakBullet;
  speed = 8;
  friction = 0.25;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 20;
  force = 12;
  typ = 1;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
}
motion_add(gunangle,-8);

#define flakstep
if irandom(2) <= 1 with instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	{
		sprite_index = global.sprsmoke;
	}
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play_pitchvol(sndFlakExplode,0.7,1)
sound_play_pitchvol(sndUltraShotgun,1.6,0.9)
for (i = 0; i < 360; i += 10)
{
with instance_create(x,y,UltraShell)
{
  direction = other.i + (random_range(-20, 20));
      image_angle = direction;  
speed=13 + (random_range(-1, 3))
team = other.team;
creator = other;
}
}