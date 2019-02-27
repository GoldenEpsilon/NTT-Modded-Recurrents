#define init
global.sprite = sprite_add_weapon("evilsbane.png",2,4);
global.sprbeam = sprite_add("evilsbanebeam.png",2,12,12);

#define weapon_name
return "EVIL'S BANE";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 0;

#define weapon_auto
return false;



#define weapon_melee
return true;

#define weapon_load
return 18;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 9;

#define weapon_text
return "Legendary blade";

#define weapon_fire
  if instance_exists(self)
  {
    weapon_post(0, -5, 5);
sound_play_pitchvol(sndChickenSword,1.15,0.9)
sound_play_pitchvol(sndEnergySword,1.15,0.2)
    with instance_create(x + lengthdir_x(skill_get(13)* 10, gunangle),y + lengthdir_y(skill_get(13)* 10, gunangle),Slash)
    {
      direction = other.gunangle + (0 * other.accuracy);
    speed = 1.75 * (skill_get(13) + 1);
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      team = other.team;
      creator = other;
    }
wepangle = -wepangle;
motion_add(gunangle, 3.5);
if my_health = maxhealth{
sound_play_pitchvol(sndPlasma,1.15,0.9)
    with instance_create(x + lengthdir_x(skill_get(13)* 10, gunangle),y + lengthdir_y(skill_get(13)* 10, gunangle),CustomProjectile)
    {
     sprite_index = global.sprbeam
     mask_index = mskPlasma
      direction = other.gunangle + (0 * other.accuracy);
    speed = 12;
    image_index = 1;
    image_speed = 0;
      damage = 7;
      force = 4;
      image_angle = direction;
      image_xscale = 1
      image_yscale = 1
      team = other.team;
      creator = other;
      on_hit = beamhit
      on_destroy = beamdestroy
    }
  }
}

#define beamhit
if (other.my_health > damage){
instance_destroy()
}

#define beamdestroy
sound_play_pitchvol(sndPlasmaHit,1.15,0.9)
with instance_create(x,y,PlasmaImpact){
sprite_index = sprPopoPlasmaImpact
image_xscale = 0.7;
image_yscale = 0.7;
}