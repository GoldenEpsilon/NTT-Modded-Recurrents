#define init
global.sprite = sprite_add_weapon("ChimeraBullet.png",4,4);

#define weapon_name
return "Chimera (Bullet Form)";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 10;

#define weapon_text
return "Ever Chaninging";

#define weapon_fire
wep="chimerashell"
repeat(5)
{
  if instance_exists(self)
  {
sound_play_pitch(sndMachinegun,0.8);
weapon_post(6, -4, 6);
with instance_create(x,y,Bullet1)
{
  speed = 15
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
  }
wait(2)
}
}