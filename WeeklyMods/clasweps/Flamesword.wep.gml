#define init
global.sprite = sprite_add_weapon("FlameSword.png",2,4);

#define weapon_name
return "FLAME SWORD";

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
return 12;

#define weapon_text
return "CLASH AND BURN";

#define weapon_fire
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndChickenSword,0.9,0.8)
sound_play_pitchvol(sndIncinerator,2,0.4)
  if instance_exists(self)
  {
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),Slash)
    {
      direction = other.gunangle + (4 * other.accuracy);
      speed = 1 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = .8
      image_yscale = .8
      team = other.team;
      damage=2
      creator = other;
    }
repeat(9)
{
    with instance_create(x,y,Flame)
    {
      direction = other.gunangle + (random_range(-20,20) * other.accuracy);
      speed = 3 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = .8
      image_yscale = .8
      team = other.team;
      creator = other;
    }
  }
}
wepangle = -wepangle;
motion_add(gunangle, 3.5);