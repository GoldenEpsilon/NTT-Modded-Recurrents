#define init
global.sprite = sprite_add_weapon("PopoBurstShotty.png",6,2);

#define weapon_name
return "IDPD Burst Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 27;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return -1;

#define weapon_text
return "Popo Barrage";

#define weapon_fire
repeat(3)
{
  if instance_exists(self)
  {
sound_play_pitch(sndShotgun,1.2);
sound_play_pitch(sndRogueRifle,1.4);
weapon_post(6, -4, 6);
repeat(4)
{
with instance_create(x,y,Bullet2)
{
  speed = 14 + random_range(-2,4);
  direction = other.gunangle + (random_range(-17, 17) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  force = 4;
  typ = 1;
}
}
}
wait(2)
}
wait(1)
  if instance_exists(self)
  {
repeat(4)
{
with instance_create(x,y,Bullet2)
{
  speed = 14 + random_range(-2,4);
  direction = other.gunangle + (random_range(-17, 17) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  force = 4;
  typ = 1;
}
}
}