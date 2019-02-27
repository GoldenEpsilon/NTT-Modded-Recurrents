#define init
global.sprite = sprite_add_weapon("Blazer.png",2,2);

#define weapon_name
return "Blazer";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 4;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 5;

#define weapon_text
return "Burn Baby Burn";

#define weapon_fire
weapon_post(5,-5,5);
sound_play_pitchvol(sndIncinerator,2,0.5)
sound_play_pitchvol(sndMachinegun,1.1,0.8)
sound_play(sndIncinerator);
  if instance_exists(self)
  {
    with instance_create(x,y,FlameShell)
    {
      direction = other.gunangle + (random_range(-6,6) * other.accuracy);
      speed = 15
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}