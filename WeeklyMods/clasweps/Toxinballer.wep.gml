#define init
global.sprite = sprite_add_weapon("Toxinballer.png",3,2);
global.ball = sprite_add("Toxicball.png",2,8,8);

#define weapon_name
return "Toxicaller";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 25;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 9;

#define weapon_text
return "Biohazard";

#define weapon_fire
weapon_post(7,-7,13);
sound_play_pitchvol(sndFlameCannonEnd,1.7,0.9)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      sprite_index = global.ball
      mask_index = mskFlakBullet
      speed = 7
      damage = 6;
      image_angle = direction;
      team = other.team;
      creator = other;
	alarm0 = 3
  on_step = script_ref_create(HFStep);
  on_destroy = script_ref_create(HFDestroy);
    }
}

#define HFStep
if alarm0=0{
with instance_create(x,y,ToxicGas){
direction = random_range(1,360);
speed = random_range(0.1,1);
team = other.team;
creator = other;
}
alarm0=choose(0,1)
}else{
alarm0-=1
}


#define HFDestroy
sound_play_pitchvol(sndFlameCannonEnd,1.5,0.7)
sound_play_pitchvol(sndExplosionS,0.9,0.7)
with instance_create(x,y,SmallExplosion){
      hitid = [global.ball,"TOXIC BALL"]
}
repeat(10){
with instance_create(x,y,ToxicGas){
direction = random_range(1,360);
speed = random_range(1,3);
team = other.team;
creator = other;
  }
}