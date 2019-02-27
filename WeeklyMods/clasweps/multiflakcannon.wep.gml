#define init
global.sprite = sprite_add_weapon("multiflakcannon.png",2,4);

#define weapon_name
return "Multi Flak Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 120;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 19;

#define weapon_text
return "30/30";

#define weapon_fire
weapon_post(15,-10,20);
sound_play_pitchvol(sndFlakCannon,1.5,0.85);
sound_play_pitchvol(sndFlakCannon,1,0.85);
sound_play_pitchvol(sndFlakCannon,0.7,0.85);
repeat(3)
{
  if instance_exists(self)
  {
    with instance_create(x,y,FlakBullet)
    {
      direction = other.gunangle + (random_range(15, -15));
      speed = 8 + random_range(0,7);
      image_angle = direction;
      team = other.team;
      creator = other;
    }
	}
}