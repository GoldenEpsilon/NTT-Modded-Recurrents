#define init
global.sprite = sprite_add_weapon("longsword.png",2,4);

#define weapon_name
return "LONGSWORD";

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
return 9;

#define weapon_text
return "INSERT LENNY FACE";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndChickenSword,0.7,1);
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),Slash)
    {
      direction = other.gunangle
    speed = 1.0 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = 2
      image_yscale = .7
      damage=15
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
}
}