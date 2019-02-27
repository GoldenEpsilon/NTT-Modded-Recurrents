#define init
global.sprite = sprite_add_weapon("PlasmaShotty.png",3,4);

#define weapon_name
return "Plasma Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 11;

#define weapon_text
return "Funner";

#define weapon_fire
if skill_get(17){
sound_play_pitchvol(sndPlasmaUpg,0.9,0.9);
sound_play_pitchvol(sndShotgun,0.9,1.3);
}else{
sound_play_pitchvol(sndPlasma,0.9,0.8);
sound_play_pitchvol(sndShotgun,0.9,1.1);
}
weapon_post(6, -4, 9);
repeat(5){
{
with instance_create(x,y,PlasmaBall)
{
  speed = 7 + random_range(-3,5);
  direction = other.gunangle + (random_range(-10, 10) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 7;
  force = 4;
  typ = 1;
  image_xscale = 0.7 + (skill_get(17) * 0.4);
  image_yscale = image_xscale;
}
}
}
motion_add(gunangle,-4);