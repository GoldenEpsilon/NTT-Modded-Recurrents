#define init
global.sprite = sprite_add_weapon("Quickdraw.png",2,4);

#define weapon_name
return "Quickdraw";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 13;

#define weapon_text
return "Shoots as fast as you can #@wPull the Trigger";

#define weapon_fire
repeat(2){
if instance_exists(self){
weapon_post(2,-3,3);
sound_play_pitchvol(sndHeavyRevoler,1.3,1)
  if instance_exists(self)
  {
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 20;
      image_angle = direction;
      team = other.team;
      creator = other;
     }
    }
wait(1)
  }
}