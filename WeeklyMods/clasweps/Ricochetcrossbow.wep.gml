#define init
global.sprite = sprite_add_weapon("Ricochetcrossbow.png",3,4);

#define weapon_name
return "Ricochet Crossbow";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 15;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 8;

#define weapon_text
return "Bouncy Bouncy";

#define weapon_fire
weapon_post(6,-5,5);
sound_play(sndSplinterGun);
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-2,2) * other.accuracy);
      speed = 15;
      damage = 15;
      image_angle = direction;
      sprite_index = sprBolt;
      mask_index = mskBullet1;
      team = other.team;
      creator = other;
      bounce = 1;
      	on_step = script_ref_create(rboltstep);
      	on_anim = script_ref_create(rboltanim);
	on_wall = script_ref_create(rboltwall);
    }
}
#define rboltstep
with(instance_create(x, y, BoltTrail)) {
     image_angle = other.direction;
     image_xscale = other.speed;
     image_yscale = 1.5;
}

#define rboltanim
image_speed = 0;
image_index = 1;

#define rboltwall
wait(1)
if bounce = 1{
	move_bounce_solid(false);
bounce -= 1;
image_angle = direction;
}else{
instance_destroy();
}