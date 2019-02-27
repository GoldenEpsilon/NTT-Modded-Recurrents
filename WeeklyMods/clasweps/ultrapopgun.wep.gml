#define init
global.sprite = sprite_add_weapon("UltraPop.png",2,4);

#define weapon_name
return "ULTRA POPGUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 1;

#define weapon_cost
return 2;

#define weapon_rads
return 3;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 36;

#define weapon_text
return "It works i think";

#define weapon_fire
  if instance_exists(self)
  {
weapon_post(4,-2,2);
sound_play_pitchvol(sndUltraShotgun,1.8,0.5)
sound_play_pitchvol(sndUltraPistol,1.3,0.8)
    with instance_create(x,y,UltraShell)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed=15;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}