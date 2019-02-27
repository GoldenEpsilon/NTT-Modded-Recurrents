#define init
global.sprite = sprite_add_weapon("MiniGrenadeGatling.png",2,3);

#define weapon_name
return "Gatling Mini Nader";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 4;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 16;

#define weapon_text
return "Try Not To blow yourself up";

#define weapon_fire
weapon_post(7, -4, 8);
repeat(2){
if instance_exists(self){
sound_play_pitchvol(sndGrenadeRifle,1.5,0.8)
sound_play_pitchvol(sndGrenade,2,0.3)
with instance_create(x,y,MiniNade)
{
  speed = 13 + random_range(-3,3);
  direction = other.gunangle + (random_range(-5, 5) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  typ = 1;
}
wait(2)
}
motion_add(gunangle,-1);
}