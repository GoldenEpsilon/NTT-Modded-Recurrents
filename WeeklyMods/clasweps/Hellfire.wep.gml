#define init
global.sprite = sprite_add_weapon("Hellfire.png",6,4);

#define weapon_name
return "Hellfire";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return 0;

#define weapon_load
return 75;

#define weapon_cost
return 11;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 21;

#define weapon_text
return "@rWatch the world Burn";

#define weapon_fire
weapon_post(7,-7,13);
sound_play_pitchvol(sndDoubleFireShotgun,0.7,0.9)
sound_play_pitchvol(sndFlameCannonEnd,1.2,0.9)
repeat(15){
  if instance_exists(self)
  {
    with instance_create(x,y,FlameShell)
    {
      direction = other.gunangle + (random_range(-23,23) * other.accuracy);
      speed = 12 + (random_range(-3,3))
      image_angle = direction;
      team = other.team;
      creator = other;
    }
  }
}
repeat(20){
  if instance_exists(self)
  {
    with instance_create(x,y,Flame)
    {
      direction = other.gunangle + (random_range(-40,40) * other.accuracy);
      speed = 5 + (random_range(-3,3))
      image_angle = direction;
      team = other.team;
      creator = other;
    }
  }
}
repeat(6){
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-18,18) * other.accuracy);
      sprite_index = sprFireBall
      mask_index = mskFlakBullet
      speed = 8 + (random_range(-2,3))
      damage = 10;
      image_angle = direction;
      team = other.team;
      creator = other;
  on_step = script_ref_create(HFStep);
  on_destroy = script_ref_create(HFDestroy);
    }
  }
}

#define HFStep
with instance_create(x,y,Flame){
direction = random_range(1,360);
speed = random_range(0,2);
team = other.team;
creator = other;
}


#define HFDestroy
sound_play_pitchvol(sndFlameCannonEnd,1.5,0.7)
sound_play_pitchvol(sndExplosionS,0.9,0.7)
with instance_create(x,y,SmallExplosion){
      hitid = [sprFireBall,"HELLFIRE-BALL"]
}
repeat(15){
with instance_create(x,y,Flame){
direction = random_range(1,360);
speed = random_range(3,5);
team = other.team;
creator = other;
  }
}