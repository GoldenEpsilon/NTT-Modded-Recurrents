#define init
global.sprite = sprite_add_weapon("CrystalGun.png",2,4);

#define weapon_name
return "Crystal Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 40;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 29;

#define weapon_text
return "''My gun is screaming plz help''";

#define weapon_fire
sound_play_pitchvol(sndLaserCrystalCharge,1.15,1.3)
wait(10)
repeat(8){
  if instance_exists(self)
  {
weapon_post(3,-5,3);
if skill_get(17){
sound_play_pitchvol(sndLaserUpg,0.9,0.9)
}else{
sound_play_pitchvol(sndLaser,1.1,0.8)
}
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),EnemyLaser)
{
	alarm0 = 2;
	image_angle = other.gunangle + (random_range(-10,10) * other.accuracy);
	image_yscale = 1.5 + (skill_get(17) * 0.4);
	team = other.team
	creator = other;
  }
wait(2)
 }
}
sound_stop(sndLaserCrystalCharge)