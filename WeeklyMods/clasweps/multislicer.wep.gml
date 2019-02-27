#define init
global.sprite = sprite_add_weapon("multislicer.gif",2,4);

#define weapon_name
return "MULTISLASHER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 50;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 20;

#define weapon_text
return "NT THE ANIME";

#define weapon_fire
repeat(6)
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
    sound_play(sndChickenSword);
    with instance_create(x + lengthdir_x(skill_get(13)* 8, gunangle),y + lengthdir_y(skill_get(13)* 8, gunangle),Slash)
    {
      direction = other.gunangle + (4 * other.accuracy);
    speed = 1.5 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = .6
      image_yscale = .6
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
    wait(5);
  }
}