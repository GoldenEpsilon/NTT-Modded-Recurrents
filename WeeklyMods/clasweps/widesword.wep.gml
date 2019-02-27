#define init
global.sprite = sprite_add_weapon("widesword.png",2,4);

#define weapon_name
return "WIDESWORD";

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
return "i don't think thats how swords work";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndChickenSword,0.7,1);
    with instance_create(x,y,Slash)
    {
      direction = other.gunangle
    speed = 1.5 * (skill_get(13) + 2);
      image_angle = direction;
      image_xscale = .85
      image_yscale = 1.75
      damage= 17
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
}
}