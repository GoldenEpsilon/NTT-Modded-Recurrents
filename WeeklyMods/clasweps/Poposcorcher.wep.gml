#define init
global.sprite = sprite_add_weapon("PopoScorcher.png",4,2);

#define weapon_name
return "IDPD Scorcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 2;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return -1;

#define weapon_text
return "Fire Drill";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitchvol(sndIncinerator,1.2,0.8);
sound_play_pitchvol(sndMinigun,1.2,0.8);
repeat(3){
with instance_create(x,y,Flame){
direction = other.gunangle + random_range(15,-15)
speed = random_range(5,7)
team = other.team
  }
}
repeat(2){
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
}