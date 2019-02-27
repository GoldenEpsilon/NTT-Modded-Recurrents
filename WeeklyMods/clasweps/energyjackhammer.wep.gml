#define init
global.sprite = sprite_add_weapon("energy jackhammer.png",2,6);

#define weapon_name
return "ENERGY JACKHAMMER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return true;



#define weapon_melee
return false;

#define weapon_load
return 18;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "Zzzzzzzzzzz!";

#define weapon_fire
  repeat(18){
  if instance_exists(self)
  {
    weapon_post(-7, 0, 0);
sound_play_pitchvol(sndJackHammer,1.3,0.7)
sound_play_pitchvol(sndJackHammer,1,0.7)
    with instance_create(x + lengthdir_x(skill_get(13)* 12, gunangle),y + lengthdir_y(skill_get(13)* 12, gunangle),EnergyShank)
    {
      direction = other.gunangle + (random_range(-7,7)* other.accuracy);
    speed = 1 * (skill_get(13) + 3);
      image_angle = direction;
      image_xscale = 1.1 + (skill_get(13)*.1);
      image_yscale = 1 + (skill_get(13)*.1);
      damage=6 + (skill_get(13)*2)
      team = other.team;
      creator = other;
    }
wait(1)
}
}