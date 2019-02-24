#define init
global.sprite = sprNukeLauncher;

#define weapon_name
return "ARMAGEDDON CANNON";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 300;

#define weapon_cost
return 99;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return -1;

#define weapon_text
return "SEE YOU ALL IN HELL";

#define weapon_fire

sound_play(sndNukeFire);
weapon_post(8,0,0);
with(Floor)
{
  if instance_exists(self) && irandom(3) == 1
  {
    strdtm = other.team;
    sound_play(sndExplosion);
    armatime = 90 + irandom(90);
  }
}

#define step
with(Floor)
{
  if "armatime" not in self armatime = -1;
  if "armagain" not in self armagain = 1;
  if armatime > -1 armatime -= 1;
  if armatime == 0
  {
    repeat(5)
    {
      with instance_create(x + random_range(-8, 8), y + random_range(-8,8), GreenExplosion)
      {
        team = other.strdtm;
        damage = 999999;
      }
    }
    if armagain > 0
    {
      armagain -= 1;
      armatime = 50 + irandom(25);
    }
  }
}