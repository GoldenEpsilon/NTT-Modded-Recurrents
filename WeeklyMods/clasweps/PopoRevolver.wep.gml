#define init
global.sprite = sprite_add_weapon("PopoRevolver.png",2,4);

#define weapon_name
return "IDPD Pistol";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 4;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 7;

#define weapon_text
return "Area Cleaner";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndRogueRifle,1.7,0.8)
sound_play_pitchvol(sndPistol,1.3,0.3)
  if instance_exists(self)
  {
    with instance_create(x,y,IDPDBullet)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed = 15;
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}