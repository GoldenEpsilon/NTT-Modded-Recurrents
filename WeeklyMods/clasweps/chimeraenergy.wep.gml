#define init
global.sprite = sprite_add_weapon("ChimeraEnergy.png",4,4);

#define weapon_name
return "Chimera (Energy Form)";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 20;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return -1;

#define weapon_text
return "Ever Changing";

#define weapon_fire
sound_play_pitch(sndLaser,0.9);
weapon_post(7, -4, 6);
wep = "chimerabullet"
repeat(3)
{
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
  {
	alarm0 = 2;
	image_angle = other.gunangle + (random_range(-7, 7) * other.accuracy);
	image_yscale = 1.8 + (skill_get(17) * 0.8);
	team = other.team
	creator = other;
  }
}