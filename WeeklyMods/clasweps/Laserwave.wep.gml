#define init
global.sprite = sprite_add_weapon("Laserwave.png",4,4);

#define weapon_name
return "Laser Wave Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 18;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 13;

#define weapon_text
return "Wavey and Zappy";

#define weapon_fire
weapon_post(6, -8, 2);
if skill_get(17){
sound_play(sndLaserUpg);
}else{
sound_play(sndLaser);
}
  if instance_exists(self)
  {
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2 + (skill_get(17));
	image_angle = other.gunangle;
	image_yscale = 1.6 + (skill_get(17) * 0.6);
	team = other.team
	creator = other;
	damage = 1;
}
}
for (i = 0; i < 28; i += 7)
{
wait(1)
if skill_get(17){
sound_play(sndLaserUpg);
sound_play_pitchvol(sndWaveGun,1.6,0.7);
}else{
sound_play(sndLaser);
sound_play_pitchvol(sndWaveGun,1.6,0.7);
}
weapon_post(6, -8, 2);
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2 + (skill_get(17));
	image_angle = other.gunangle + other.i;
	image_yscale = 1.6 + (skill_get(17) * 0.6);
	team = other.team
	creator = other;
	damage = 1;
}
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2 + (skill_get(17));
	image_angle = other.gunangle - other.i;
	image_yscale = 1.6 + (skill_get(17) * 0.6);
	team = other.team
	creator = other;
	damage = 1;
}
}
for (i = -30; i < 7; i += 7)
{
wait(1)
if skill_get(17){
sound_play(sndLaserUpg);
}else{
sound_play(sndLaser);
}
weapon_post(6, -8, 2);
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2 + (skill_get(17));
	image_angle = other.gunangle + other.i;
	image_yscale = 1.6 + (skill_get(17) * 0.6);
	team = other.team
	creator = other;
	damage = 1;
}
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
{
	alarm0 = 2 + (skill_get(17));
	image_angle = other.gunangle - other.i;
	image_yscale = 1.6 + (skill_get(17) * 0.6);
	team = other.team
	creator = other;
	damage = 1;
}
}