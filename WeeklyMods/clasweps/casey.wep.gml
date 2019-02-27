#define init
global.sprite = sprite_add_weapon("casey.png",2,4);
global.sprbullet = sprite_add("sprBaseball.png",2, 4, 8);

#define weapon_name
return "CASEY";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 45;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 10;

#define weapon_text
return "BACK TO IT";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
    sound_play(sndHammer);
    with instance_create(x + lengthdir_x(skill_get(13)* 8, gunangle),y + lengthdir_y(skill_get(13)* 8, gunangle),Slash)
    {
      direction = other.gunangle;
    speed = 1.5 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      damage=13
      team = other.team;
      creator = other;
    }
    with instance_create(x,y,Bullet1)
    {
      direction = other.gunangle
      speed = 11;
      damage=7
      image_angle = direction;
      team = other.team;
      sprite_index = global.sprbullet;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
}
}