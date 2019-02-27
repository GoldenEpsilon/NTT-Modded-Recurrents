#define init
global.sprite = sprite_add_weapon("InvCrystalGun.png",3,5);

#define weapon_name
return "Cursed Crystal Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 32;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return -1;

#define weapon_text
return "@p@qP@qL@qE@qA@qS@qE @qH@qE@qL@qP";

#define weapon_fire
sound_play_pitchvol(sndLaserCrystalCharge,1.15,1.3)
sound_play_pitchvol(sndHyperCrystalHalfHP,3.5,0.3)
wait(10)
repeat(14){
  if instance_exists(self)
  {
if irandom(4) = 0{
image_alpha = 0.2
}else{
image_alpha = 1
}
weapon_post(4,-5,6);
if skill_get(17){
sound_play_pitchvol(sndLaserUpg,0.8,1)
}else{
sound_play_pitchvol(sndLaser,0.9,1)
}
with instance_create(x + lengthdir_x(5,gunangle),y + lengthdir_y(5,gunangle),EnemyLaser)
{
	alarm0 = 2;
	image_angle = other.gunangle + (random_range(-10,10) * other.accuracy);
	image_yscale = 1.6 + (skill_get(17) * 0.4);
	team = other.team
	creator = other;
  }
wait(1)
 }
}
image_alpha = 1
sound_stop(sndLaserCrystalCharge)