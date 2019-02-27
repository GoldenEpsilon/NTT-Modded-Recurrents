#define init
global.sprite = sprite_add_weapon("GatlingLauncher.png",2,3);

#define weapon_name
return "Gatling Nader";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 7;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 11;

#define weapon_text
return "Grenades";

#define weapon_fire
sound_play_pitchvol(sndGrenade,1.5,0.8)
if instance_exists(self){
weapon_post(7, -4, 8);
with instance_create(x,y,Grenade)
{
  speed = 10 + random_range(-2,2);
  direction = other.gunangle + (random_range(-5, 5) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
}
motion_add(gunangle,-1);
}