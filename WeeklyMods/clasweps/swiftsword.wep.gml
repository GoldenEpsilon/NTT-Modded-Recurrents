#define init
global.sprite = sprite_add_weapon("swiftsword.png",2,4);

#define weapon_name
return "DOUBLE SLASHER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 30;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 4;

#define weapon_text
return "SLICE AND DICE, TWICE";

#define weapon_fire
repeat(2)
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
    sound_play(sndChickenSword);
    with instance_create(x + lengthdir_x(skill_get(13)* 6, gunangle),y + lengthdir_y(skill_get(13)* 6, gunangle),Slash)
    {
      direction = other.gunangle + (4 * other.accuracy);
    speed = 0.65 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = .8
      image_yscale = .8
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
    wait(10);
  }
}