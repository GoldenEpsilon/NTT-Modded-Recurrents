#define init
global.sprite = sprite_add_weapon("ringofplasma.png",2,6);

#define weapon_name
return "Ring of plasma";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 100;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 16;

#define weapon_text
return "PURE ENERGY";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitchvol(sndDevastator,1.2,0.8);
sound_play_pitchvol(sndPlasmaBigExplode,1.2,0.8);
for (rpi = 0; rpi < 1000; rpi += 20)
{
  if instance_exists(self)
  {
with instance_create(x + lengthdir_x(rpi*0.07,rpi),y + lengthdir_y(rpi*0.07,rpi),PlasmaImpact)
  {
direction = other.rpi
team= other.team
image_xscale = 0.1 + (other.rpi * 0.0010)
image_yscale = image_xscale
  }
with instance_create(x + lengthdir_x(rpi*0.07,rpi+180),y + lengthdir_y(rpi*0.07,rpi+180),PlasmaImpact)
  {
direction = other.rpi
team= other.team
image_xscale = 0.1 + (other.rpi * 0.0010)
image_yscale = image_xscale
  }
sound_play_pitchvol(sndPlasmaHit,1.5,0.3);
wait(1)
}
}