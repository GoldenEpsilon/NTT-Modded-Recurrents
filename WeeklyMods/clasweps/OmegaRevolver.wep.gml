#define init
global.sprite = sprite_add_weapon("OmegaRevolver.png",2,4);

#define weapon_name
return "Omega Revolver";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 5;

#define weapon_cost
return 3;

#define weapon_rads
return 3;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return -1;

#define weapon_text
return "God Revolver";

#define weapon_fire
repeat(3){
if instance_exists(self){
weapon_post(8,-3,3);
sound_play_pitchvol(sndHeavyRevoler,0.8,1)
sound_play_pitchvol(sndUltraPistol,1.3,1)
  if instance_exists(self)
  {
    with instance_create(x,y,HeavyBullet)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 20;
      damage = 6;
      image_angle = direction;
      team = other.team;
      creator = other;
     }
    }
wait(1)
  }
}