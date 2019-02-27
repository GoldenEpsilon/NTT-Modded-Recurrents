#define init
global.sprite = sprite_add_weapon("ChimeraExplosive.png",4,4);

#define weapon_name
return "Chimera (Explosive Form)";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return -1;

#define weapon_text
return "Ever Changing";

#define weapon_fire
wep = "chimeraenergy"
repeat(2)
{
sound_play_pitch(sndGrenade,0.8);
weapon_post(7, -4, 6);
with instance_create(x,y,Grenade)
{
  speed = 10 + (random_range(0, 3));
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
  }
}