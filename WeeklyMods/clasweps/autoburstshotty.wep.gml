#define init
global.sprite = sprite_add_weapon("AutoBurstShotty.png",4,3);

#define weapon_name
return "Auto Burst Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return true;

#define weapon_load
return 10;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 11;

#define weapon_text
return "Even Quicker Succesion";

#define weapon_fire
repeat(2)
{
if instance_exists(self){
sound_play_pitch(sndShotgun,1.2);
weapon_post(6, -4, 6);
repeat(4)
{
with instance_create(x,y,Bullet2)
{
  speed = 13 + random_range(-2,4);
  direction = other.gunangle + (random_range(-10, 10) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 5;
  force = 4;
  typ = 1;
}
}
}
wait(2)
}
if instance_exists(self){
sound_play_pitch(sndShotgun,1.2);
weapon_post(6, -4, 6);
repeat(3)
{
with instance_create(x,y,Bullet2)
{
  speed = 15 + random_range(-2,4);
  direction = other.gunangle + (random_range(-10, 10) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  force = 4;
  typ = 1;
}
}
}