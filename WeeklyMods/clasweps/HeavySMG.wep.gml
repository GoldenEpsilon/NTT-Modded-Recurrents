#define init
global.sprite = sprite_add_weapon("HeavySMG.png",2,4);

#define weapon_name
return "heavy SMG";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 13;

#define weapon_text
return "Have it";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndHeavyRevoler,0.9,0.8)
sound_play_pitchvol(sndHeavyMachinegun,1.3,0.3)
  if instance_exists(self)
  {
    with instance_create(x,y,HeavyBullet)
    {
      direction = other.gunangle + (random_range(-11,11) * other.accuracy);
      speed = 15;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}