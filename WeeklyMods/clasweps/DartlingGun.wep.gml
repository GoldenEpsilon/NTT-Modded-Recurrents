#define init
global.sprite = sprite_add_weapon("DartlingGun.png",2,3);
global.dart = sprite_add("dart.png",1,4,3);

#define weapon_name
return "Dartling Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 10;

#define weapon_text
return "Operation Dart Storm";

#define weapon_fire
weapon_post(3,-5,5);
sound_play_pitch(sndSplinterGun,1.2);
sound_play_pitchvol(sndMinigun,1.1,0.7);
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-7,7) * other.accuracy);
      speed = 13
      damage = 4;
      image_angle = direction;
      sprite_index = global.dart;
      mask_index = mskBullet1;
      team = other.team;
      image_speed = 0;
      image_index = 1;
      creator = other;
      pierce = 2;
      	on_step = script_ref_create(dartstep);
      	on_hit = script_ref_create(darthit);
	on_wall = script_ref_create(dartwall);
    }
}
#define dartstep
with(instance_create(x, y, BoltTrail)) {
     image_angle = other.direction;
     image_xscale = other.speed;
     image_yscale = 0.75;
}

#define darthit
projectile_hit(other,damage,force);
if pierce >= 1{
pierce -= 1;
}else{
instance_destroy();
}

#define dartwall
sound_play_pitch(sndBoltHitWall,1.3);
with instance_create(x,y,BoltStick){
alarm1 = 30;
sprite_index = global.dart
image_angle = other.direction
}
with instance_create(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction),MeleeHitWall){
image_angle = other.direction;
}
instance_destroy();