#define init
global.sprite = sprite_add_weapon("MineLaunchr.png",2,2);
global.mine = sprite_add("Mine.png",1,3,3);

#define weapon_name
return "Mine Launcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 17;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 6;

#define weapon_text
return "Motion Sensative";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitch(sndSplinterGun,1.2);
sound_play_pitch(sndGrenade,1.2);
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 13 + (random_range(-0.5,0.5));
      friction = 0.5;
      damage = 15;
      image_angle = direction;
      sprite_index = global.mine;
      mask_index = mskBullet1;
      team = other.team;
      image_speed = 0;
      image_index = 1;
      creator = other;
      bounce = 1;
      alarm1 = 600;
      	on_step = script_ref_create(minestep);
	on_wall = script_ref_create(minewall);
	on_destroy = script_ref_create(mineexplode);
    }
}
#define minestep
with(instance_create(x, y, BoltTrail)) {
     image_angle = other.direction;
     image_xscale = other.speed;
     image_yscale = 1.5;
}
if alarm1 < 60{
      sprite_index = sprGrenadeBlink
      image_speed = 0.5
}
if alarm1 > 0{
alarm1 -= 1
}else{
instance_destroy()
}
if distance_to_object(enemy) < 10{
instance_destroy()
}

#define minewall
wait(1)
if bounce = 1{
	move_bounce_solid(false);
bounce -= 1;
image_angle = direction;
}else{
instance_destroy();
}

#define mineexplode
sound_play_pitch(sndExplosion,1.2);
instance_create(x,y,Explosion)