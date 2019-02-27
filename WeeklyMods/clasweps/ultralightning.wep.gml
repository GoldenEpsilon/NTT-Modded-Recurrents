#define init
global.sprite = sprite_add_weapon("UltraLightning.png",2,4);

#define weapon_name
return "ULTRA LIGHTNING GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_load
return 10;

#define weapon_cost
return 3;

#define weapon_rads
return 12;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 36;

#define weapon_text
return "@gULTRA @sBARRAGE";

#define weapon_fire
  if instance_exists(self)
  {
weapon_post(4,-6,12);
sound_play_pitchvol(sndLightningRifleUpg,0.7,1);
sound_play_pitchvol(sndUltraLaser,1.7,0.7);
  repeat(3){
with instance_create(x,y,Lightning)
{
  move_contact_solid(other.gunangle, 10);
  alarm0 = 1;
  ammo = 16;
  image_angle = other.gunangle + (random_range(-10, 10) * other.accuracy);
  damage=60;
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn){
 image_angle = other.image_angle;
damage=other.damage;
}
}
}
}