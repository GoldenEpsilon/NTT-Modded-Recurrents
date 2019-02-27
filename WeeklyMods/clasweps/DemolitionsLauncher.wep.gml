#define init
global.sprite = sprite_add_weapon("DemolitionsLauncher.png",2,4);
global.mine = sprite_add("DemolitionBomb.png",1,5,5);

#define weapon_name
return "Demolitions Launcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 34;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 9;

#define weapon_text
return "Bomber";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitch(sndSplinterGun,0.6);
sound_play_pitch(sndHeavyNader,1.2);
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
      bounce = 2;
      alarm1 = 40;
      	on_step = script_ref_create(minestep);
      	on_hit = script_ref_create(minehit);
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
if alarm1 > 0{
alarm1 -= 1
}else{
instance_destroy()
}

#define minehit
projectile_hit(other,damage,force);
instance_destroy()

#define minewall
wait(1)
if bounce >= 1{
	move_bounce_solid(false);
bounce -= 1;
image_angle = direction;
}else{
instance_destroy();
}

#define mineexplode
instance_create(x,y,Explosion);
sound_play_pitchvol(sndExplosionL,1.5,1);
for(i = 30; i <= 60; i += 30){
	instance_create(x+lengthdir_x(i,0),y+lengthdir_y(i,0),SmallExplosion);
	instance_create(x+lengthdir_x(i,90),y+lengthdir_y(i,90),SmallExplosion)
	instance_create(x+lengthdir_x(i,180),y+lengthdir_y(i,180),SmallExplosion)
	instance_create(x+lengthdir_x(i,270),y+lengthdir_y(i,270),SmallExplosion)
}