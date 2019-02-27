#define init
global.sprite = sprite_add_weapon("energy wrench.png",2,4);

#define weapon_name
return "ENERGY WRENCH";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 16;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 6;

#define weapon_text
return "Zzzzip!";

#define weapon_fire
{
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndWrench,1.15,0.9)
sound_play_pitchvol(sndEnergySword,1.15,0.7)
    with instance_create(x + lengthdir_x(skill_get(13)* 10, gunangle),y + lengthdir_y(skill_get(13)* 10, gunangle),EnergySlash)
    {
      direction = other.gunangle + (0 * other.accuracy);
    speed = 1.75 * (skill_get(13) + 1);
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      damage=13
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
}
}