#define init
global.sprite = sprite_add_weapon("Heavy Shotty.png",2,4);

#define weapon_name
return "Heavy Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "Begone";

#define weapon_fire
sound_play_pitchvol(sndSlugger,0.8,0.7)
sound_play_pitchvol(sndShotgun,0.8,0.7)
weapon_post(12, -8, 16);
repeat(5){
{
with instance_create(x,y,Slug)
{
  speed = 15 + random_range(-2,2);
  direction = other.gunangle + (random_range(-10, 10) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 8;
  force = 4;
  typ = 1;
}
}
}
motion_add(gunangle,-8);