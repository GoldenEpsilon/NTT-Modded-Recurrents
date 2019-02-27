#define init
global.sprite = sprite_add_weapon("goldscorpionarm.png",2,8);

#define weapon_name
return "Gold Scorpion Arm";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 50;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 14;

#define weapon_text
return "Luxurious Mutilation";

#define weapon_fire
sound_play(sndScorpionFireStart);
repeat(10){
  if instance_exists(self)
  {
weapon_post(2,-5,5);
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle + (random_range(-22,22) * other.accuracy);
      speed = random_range(1.5,2.5);
      damage = 2;
      sprite_index = sprScorpionBullet;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle + (random_range(-5,5) * other.accuracy);
      speed = 10;
      damage = 2;
      sprite_index = sprScorpionBullet;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
sound_play(sndGoldScorpionFire);
wait(1)
}
    with instance_create(x+random_range(-2,2),y+random_range(-2,2),Bullet1)
    {
      direction = other.gunangle + (random_range(-22,22) * other.accuracy);
      speed = random_range(1.5,2.5);
      damage = 2;
      sprite_index = sprScorpionBullet;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}