#define init
global.sprite = sprite_add_weapon("HeavyLaser.png",2,4);

#define weapon_name
return "Heavy Laser Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 8;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 13;

#define weapon_text
return "Zap em";

#define weapon_fire
weapon_post(6, -8, 2);
if skill_get(17){
sound_play_pitchvol(sndUltraLaserUpg,1.15,0.9)
sound_play_pitchvol(sndLaserUpg,0.8,0.9)
}else{
sound_play_pitchvol(sndUltraLaser,1.15,0.8)
sound_play_pitchvol(sndLaser,0.8,0.8)
}
  if instance_exists(self)
  {
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2;
	image_angle = other.gunangle;
	image_yscale = 2.2 + (skill_get(17) * 0.8);
	team = other.team
	damage = 10;
	creator = other;
}
}