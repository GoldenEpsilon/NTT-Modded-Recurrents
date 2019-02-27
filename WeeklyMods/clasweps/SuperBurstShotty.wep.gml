#define init
global.sprite = sprite_add_weapon("SuperBurstShotty.png",6,3);

#define weapon_name
return "Super Burst Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 35;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 16;

#define weapon_text
return "Endless Stream Of Shells";

#define weapon_fire
repeat(5)
{
sound_play_pitch(sndShotgun,0.9);
weapon_post(9, -7, 9);
repeat(5)
{
  if instance_exists(self)
  {
with instance_create(x,y,Bullet2)
{
  speed = 15 + random_range(-2,4);
  direction = other.gunangle + (random_range(-17, 17) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  force = 4;
  typ = 1;
}
}
}
wait(3)
}