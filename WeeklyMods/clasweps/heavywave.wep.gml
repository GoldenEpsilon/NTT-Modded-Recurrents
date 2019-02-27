#define init
global.sprite = sprite_add_weapon("HeavyWaveGun.png",4,4);

#define weapon_name
return "Heavy Wave Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return 0;

#define weapon_load
return 18;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 13;

#define weapon_text
return "Wave Rides You";

#define weapon_fire
weapon_post(6, -8, 2);
sound_play(sndSlugger);
  if instance_exists(self)
  {
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 13;
	direction = other.gunangle
	image_angle = direction;
	team = other.team
	creator = other;
}
}
for (i = 12; i < 28; i += 17)
{
wait(2)
sound_play(sndSlugger);
weapon_post(6, -8, 2);
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 15;
	direction = other.gunangle + other.i;
	team = other.team
	creator = other;
damage = 15;
}
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 15;
	direction = other.gunangle - other.i;
	team = other.team
	creator = other;
damage = 15;
}
}
for (i = -30; i < -13; i += 13)
{
wait(2)
sound_play(sndSlugger);
weapon_post(6, -8, 2);
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 15;
	direction = other.gunangle + other.i;
	team = other.team
	creator = other;
damage = 15;
}
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 15;
	direction = other.gunangle - other.i;
	team = other.team
	creator = other;
damage = 15;
}
}
wait(2)
sound_play(sndSlugger);
weapon_post(6, -8, 2);
with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Slug)
{
	speed = 15;
	direction = other.gunangle
	image_angle = direction;
	team = other.team
	creator = other;
damage = 15;
}