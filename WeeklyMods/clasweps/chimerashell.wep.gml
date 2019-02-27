#define init
global.sprite = sprite_add_weapon("ChimeraShell.png",4,4);

#define weapon_name
return "Chimera (Shell Form)";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return -1;

#define weapon_text
return "Ever Changeing";

#define weapon_fire
wep="chimerabolt"
repeat(2)
{
sound_play_pitch(sndShotgun,0.8);
weapon_post(6, -4, 6);
repeat(8)
with instance_create(x,y,Bullet2)
{
  speed = 15 + (random_range(-3, 3));
  direction = other.gunangle + (random_range(-12, 12) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
  }
wait(2)
}