#define init
global.sprite = sprite_add_weapon("UltraRifle.png",4,4);

#define weapon_name
return "ULTRA RIFLE";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 11;

#define weapon_cost
return 6;

#define weapon_rads
return 15;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 28;

#define weapon_text
return "@gULTRA @sBARRAGE";

#define weapon_fire
  if instance_exists(self)
  {
  repeat(3){
weapon_post(4,-3,3);
sound_play_pitchvol(sndHeavyMachinegun,0.7,1)
sound_play_pitchvol(sndUltraPistol,1.3,1)
    with instance_create(x,y,UltraBullet)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed=25;
      damage = 15;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
  wait(2)
}
}