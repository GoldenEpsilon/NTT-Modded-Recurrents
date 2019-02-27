#define init
global.sprite = sprite_add_weapon("ThroneGun.png",2,3);

#define weapon_name
return "Throne Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 40;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 14;

#define weapon_text
return "Not for Sitting";

#define weapon_fire
repeat(4){
  if instance_exists(self)
  {
for(var i = -15; i <= 15; i += 15)
{
sound_play(sndNothingFire);
weapon_post(5,-5,5);
    with instance_create(x,y,ThroneBeam)
    {
      direction = other.gunangle + i + (random_range(-1,1) * other.accuracy);
      speed = 11
      damage = 3;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
  }
wait(3)
 }
}
wait(1)
repeat(4){
for(var i = -22.5; i <= 22.5; i += 15)
{
sound_play(sndNothingFire);
weapon_post(5,-5,5);
    with instance_create(x,y,ThroneBeam)
    {
      direction = other.gunangle + i + (random_range(-1,1) * other.accuracy);
      speed = 11
      damage = 3;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
  }
wait(3)
 }