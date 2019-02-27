#define init
global.sprite = sprite_add_weapon("GoldenBlazer.png",2,2);

#define weapon_name
return "Golden Blazer";

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

#define weapon_gold
return 1;

#define weapon_area
return 20;

#define weapon_text
return "Golden Inferno";

#define weapon_fire
weapon_post(5,-5,5);
sound_play_pitchvol(sndIncinerator,2,0.5)
sound_play_pitchvol(sndMachinegun,1.1,0.8)
sound_play(sndIncinerator);
  if instance_exists(self)
  {
    with instance_create(x,y,FlameShell)
    {
      direction = other.gunangle + (random_range(-2,2) * other.accuracy);
      speed = 15
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}