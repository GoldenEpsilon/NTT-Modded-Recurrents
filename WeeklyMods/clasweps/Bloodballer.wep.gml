#define init
global.sprite = sprite_add_weapon("Bloodballer.png",3,2);
global.ball = sprite_add("Bloodball.png",2,8,8);
global.sprflame = sprite_add("BloodFlame.png",7,8,8);

#define weapon_name
return "Bloodballer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 9;

#define weapon_text
return "Burning Blood";

#define weapon_fire
if infammo = 0{
	
if ammo[weapon_get_type(argument0)] - 2 < 0{

ammo[weapon_get_type(argument0)] = 0;

sprite_index = spr_hurt;

image_index = 0;

my_health --;
	
sound_play(sndBloodHurt);

lasthit = [global.sprite,"Bloodballer"]
	
sound_play(snd_hurt);
}else
{

ammo[weapon_get_type(argument0)] -= 2}

}
weapon_post(7,-7,13);
sound_play_pitchvol(sndBloodCannonEnd,1.7,0.9)
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
	alarm0 = 1
  on_step = script_ref_create(HFStep);
  on_destroy = script_ref_create(HFDestroy);
    }
}

#define HFStep
with instance_create(x,y,Flame){
sprite_index = global.sprflame;
direction = random_range(1,360);
speed = random_range(0,3);
team = other.team;
creator = other;
}


#define HFDestroy
sound_play_pitchvol(sndBloodCannonEnd,1.5,0.7)
sound_play_pitchvol(sndExplosionS,0.9,0.7)
with instance_create(x,y,MeatExplosion){
      hitid = [global.ball,"BLOODBALL"]
}
repeat(10){
with instance_create(x,y,Flame){
sprite_index = global.sprflame;
damage = 3;
direction = random_range(1,360);
speed = random_range(3,5);
team = other.team;
creator = other;
  }
}