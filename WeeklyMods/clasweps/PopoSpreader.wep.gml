#define init
global.sprite = sprite_add_weapon("PopoSpreader.png",2,3);

#define weapon_name
return "IDPD SPREADER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 1;

#define weapon_load
return 7;

#define weapon_cost
return 7;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return -1;

#define weapon_text
return "SHOTGUN HELL";

#define weapon_fire
weapon_post(6,-9,9)
sound_play_pitchvol(sndRogueRifle,1.3,0.7)
sound_play_pitchvol(sndShotgun,1.9,0.7)
 with instance_create(x,y,IDPDBullet)
    {
      direction = other.gunangle + (random_range(2,-2) * other.accuracy);
      image_angle = direction;
    speed = 15
      creator = other;
    team=other.team;
    }
for(var i = 4; i <= 15; i += 4)
{
    with instance_create(x,y,IDPDBullet)
    {
      direction = other.gunangle + (i + random_range(2,-2) * other.accuracy);
      image_angle = direction;
    speed = 15 - (i*0.5)
      creator = other;
    team=other.team;
    }
    with instance_create(x,y,IDPDBullet)
    {
      direction = other.gunangle - (i * other.accuracy);
      image_angle = direction;
    speed = 15 - (i*0.5)
      creator = other;
    team=other.team;
    }
}