#define init
global.sprite = sprite_add_weapon("bulletcannon.png",2,4);

#define weapon_name
return "Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 9;

#define weapon_text
return "Cannon Ball";

#define weapon_fire
weapon_post(7,-6,10);
sound_play(sndHeavyRevoler);
  if instance_exists(self)
  {
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 15;
      friction = 0.1;
      damage = 20;
      force = 15;
      sprite_index = sprFlakBullet;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}