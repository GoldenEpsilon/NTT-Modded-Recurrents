#define init
global.sprite = sprite_add_weapon("Scorcher.png",2,4);

#define weapon_name
return "Scorcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 3;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 9;

#define weapon_text
return "Disco Inferno!";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitchvol(sndIncinerator,1.2,0.8);
sound_play_pitchvol(sndMinigun,1.2,0.8);
repeat(2){
  if instance_exists(self)
  {
    with instance_create(x,y,FlameShell)
    {
      direction = other.gunangle + (random_range(-12,12) * other.accuracy);
      speed = 15
      image_angle = direction;
      team = other.team;
      creator = other;
    }
}
}