#define init
global.sprite = sprite_add_weapon("GoldenFireballer.png",3,2);

#define weapon_name
return "Golden Fireballer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 20;

#define weapon_cost
return 2;

#define weapon_gold
return 1;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 20;

#define weapon_text
return "The Fire isn't @ygold @s0/100";

#define weapon_fire
weapon_post(7,-7,13);
sound_play_pitchvol(sndFlameCannonEnd,1.7,0.9)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      sprite_index = sprFireBall
      mask_index = mskFlakBullet
      speed = 7
      damage = 6;
      image_angle = direction;
      team = other.team;
      creator = other;
	alarm0 = 1
  on_step = script_ref_create(HFStep);
  on_destroy = script_ref_create(HFDestroy);
    }
}

#define HFStep
if alarm0=0{
with instance_create(x,y,Flame){
direction = random_range(1,360);
speed = random_range(0,2);
team = other.team;
creator = other;
}
alarm0=choose(0,1)
}else{
alarm0=0
}


#define HFDestroy
sound_play_pitchvol(sndFlameCannonEnd,1.5,0.7)
sound_play_pitchvol(sndExplosionS,0.9,0.7)
with instance_create(x,y,SmallExplosion){
      hitid = [sprFireBall,"FIREBALL"]
}
repeat(10){
with instance_create(x,y,Flame){
direction = random_range(1,360);
speed = random_range(3,5);
team = other.team;
creator = other;
  }
}