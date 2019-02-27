#define init
global.sprite = sprite_add_weapon("scorpionarm.png",2,6);

#define weapon_name
return "Scorpion Arm";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 30;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 8;

#define weapon_text
return "Hey, Scorp, can you lend me a hand?";

#define weapon_fire
sound_play(sndScorpionFireStart);
repeat(8){
  if instance_exists(self){
weapon_post(2,-5,5);
  {
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle + (random_range(-12,12) * other.accuracy);
      speed = 7;
      damage = 2;
      sprite_index = sprScorpionBullet;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
sound_play(sndScorpionFire);
wait(1)
}
}
}