#define init
global.sprite = sprite_add_weapon("PopoFireballer.png",6,4);
global.ball = sprite_add("PopoFireball.png",2,8,8);

#define weapon_name
return "IDPD Fireballer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 35;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return -1;

#define weapon_text
return "Inter Dimensional Pyromania";

#define weapon_fire
weapon_post(7,-7,13);
sound_play_pitchvol(sndDoubleFireShotgun,1.2,0.9)
sound_play_pitchvol(sndFlameCannonEnd,1.4,0.9)
repeat(3){
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-6,6) * other.accuracy);
      sprite_index = global.ball
      mask_index = mskFlakBullet
      speed = 8 + (random_range(-1,1))
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
sprite_index=sprFireLilHunter
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
sprite_index=sprFireLilHunter
direction = random_range(1,360);
speed = random_range(3,5);
team = other.team;
creator = other;
  }
}