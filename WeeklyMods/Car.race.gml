#define init
global.spr_idle = sprVenusCarFixed;
global.spr_walk = sprVenusCarFixed;
global.spr_hurt = sprVenusCarFixedHurt;
global.spr_dead = mskNone;
global.spr_port = sprVenusCarFixed;
global.spr_icon = sprVenusCarFixed;
global.spr_slct = sprVenusCarFixed;
global.spr_sit1 = sprVenusCarFixed;
global.spr_sit2 = sprVenusCarFixed;
global.spr_ult[1] = sprCarIdle;
global.spr_ult[2] = sprVenusCar;

global.ultra[1] = 0;
global.ultra[2] = 0;

#define create
global.ultra[1] = 0
global.ultra[2] = 0
	
spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;
spr_sit1 = global.spr_sit1;
spr_sit2 = global.spr_sit2;

snd_wrld = sndUseCar;
snd_hurt = sndHitMetal;
snd_lowa = sndUseCar;
snd_lowh = sndUseCar;
snd_valt = sndCarLoop;
snd_crwn = sndUseCar;
snd_spch = sndCarLoop;
snd_idpd = sndUseCar;
snd_cptn = sndCarLoop;
snd_dead = sndExplosionCar;
snd_chst = sndUseCar;

maxhealth = 20;
my_health = 20;

gear = 1;

#define swep
return 1;

#define step
mask_index = sprite_index;
image_xscale = -1;
with(enemy)
{
  canmelee = 0;
  if place_meeting(x,y,other)
  {
    projectile_hit(self,other.gear * 3,0);
  }
}
if button_pressed(index,"spec")
{
  gear += 1;
  if gear > 3 gear = 1;
  if skill_get(5) && gear < 2 gear = 2;
  sound_play_pitchvol(sndUseCar,gear * 0.6,0.6);
}
switch (gear)
{
  case 1: maxspeed = 4 + skill_get(2) + (ultra_get(mod_current,2)); break;
  case 2: maxspeed = 6 + (skill_get(2) * 2) + (ultra_get(mod_current,2) * 2); break;
  case 3: 
    maxspeed = 8 + (skill_get(2) * 4) + (ultra_get(mod_current,2) * 4);
    speed = maxspeed;
    reload = 10;
    if can_shoot = 1 can_shoot = 0;
    break;
  default: maxspeed = 4; break;
}
if gear == 3 || ultra_get(mod_current,1)
{
  with(Wall)
  {
    if distance_to_object(other) < 8
    {
      instance_create(x,y,FloorExplo);
      instance_destroy();
    }
  }
}

#define race_portrait
return global.spr_port;

#define race_mapicon
return global.spr_icon;

#define race_menu_button
sprite_index = global.spr_slct;

#define race_name
return "CAR";

#define race_text
return "MORE @rHP#@wTRAMPLE @sENEMIES#@wCHANGE GEARS";

#define race_skins
return 1;

#define race_tb_text
return "OMIT FIRST GEAR";

#define race_ultra_button
sprite_index = global.spr_ult[argument0];

#define race_ultra_name
switch(argument0)
{
	case 1: return "ROAD RAGE";
	case 2: return "FAST FURY";
	default: return "";
}

#define race_ultra_text
switch (argument0)
{
	case 1: return "BREAK WALLS IN ANY GEAR";
	case 2: return "EVEN FASTER, EVEN MORE HEALTH";
	default: return "";
}

#define race_ultra_take
global.ultra[argument0] = 1;
if global.ultra[1] = 1 sound_play(sndExplosionCar);
if global.ultra[2] = 1
{
  sound_play(sndCarLoop);
  maxhealth += 5;
  my_health += 5;
}
sound_play(sndBasicUltra);

#define race_ttip
return["VROOM"];
