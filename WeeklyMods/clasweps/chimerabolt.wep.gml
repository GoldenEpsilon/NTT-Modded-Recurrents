#define init
global.sprite = sprite_add_weapon("ChimeraBolt.png",4,4);

#define weapon_name
return "Chimera (Bolt Form)";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return -1;

#define weapon_text
return "Ever Changeing";

#define weapon_fire
sound_play_pitch(sndCrossbow,0.8);
wep="chimeraexplosive"
weapon_post(6, -4, 6);
for(var i = -12; i <= 12; i += 12)
{
with instance_create(x,y,Bolt)
{
  speed = 15
  direction = other.gunangle + i + (random_range(-2, 2) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
  }
}