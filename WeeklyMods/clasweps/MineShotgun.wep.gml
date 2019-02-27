#define init
global.sprite = sprite_add_weapon("MineShotgun.png",2,2);
global.mine = sprite_add("MiniMine.png",1,3,3);
global.blink = sprite_add("MiniMineBlink.png",2,3,3);

#define weapon_name
return "Mine Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 22;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 9;

#define weapon_text
return "Mine Field";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitch(sndSplinterGun,1.2);
sound_play_pitch(sndGrenade,1.2);
  if instance_exists(self)
repeat(3){
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-9,9) * other.accuracy);
      speed = 13 + (random_range(-1.5,1.5));
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
      alarm1 = 200;
      	on_step = script_ref_create(minestep);
	on_wall = script_ref_create(minewall);
	on_destroy = script_ref_create(mineexplode);
    }
   }
}
#define minestep
with(instance_create(x, y, BoltTrail)) {
     image_angle = other.direction;
     image_xscale = other.speed;
     image_yscale = 1.5;
}
if alarm1 < 20{
      sprite_index = global.blink
      image_speed = 0.5
}
if alarm1 > 0{
alarm1 -= 1
}else{
instance_destroy()
}
if distance_to_object(enemy) < 7{
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
sound_play_pitch(sndExplosionS,1.2);
instance_create(x,y,SmallExplosion)