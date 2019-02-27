#define init
global.sprite = sprite_add_weapon("AceLauncher.png",3,3);
global.ace = sprite_add("Ace.png",1,11,12);

#define weapon_name
return "Ace Runway";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 45;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapMotorized;

#define weapon_area
return 9;

#define weapon_text
return "Death From Above";

#define weapon_fire
sound_play(sndFlakCannon)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = global.ace;
  mask_index = mskFlakBullet;
  speed = 4;
  direction = other.gunangle + (random_range(-3, 3) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 19;
  force = 12;
  typ = 1;
  alarm0 = 10;
  alarm1 = 7;
  image_speed = 0.4
  on_wall = script_ref_create(acewall);
  on_hit = script_ref_create(acehit);
  on_destroy = script_ref_create(acedestroy);
  on_step = script_ref_create(acestep);
}
motion_add(gunangle,-4);

#define acestep
with instance_create(x- (hspeed * 1.2), y - (vspeed * 1.2), Smoke) {
	image_xscale = 0.5
	image_yscale = 0.5
	depth = -7
  }
if alarm0 = 0{
sound_play_pitchvol(sndPistol,1.1,0.8)
Of = choose(30,10)
for (i = 0; i < 360; i += 360/7)
{
with instance_create(x,y,AllyBullet)
{
  direction = other.direction + other.i + other.Of +random_range(2,-2);
      image_angle = direction;  
speed=5
team = other.team;
creator = other;
damage = 3;
  }
 }
alarm0 = choose(15,14)
}else{
alarm0 -= 1
}
if alarm1 = 0{
sound_play_pitchvol(sndMachinegun,1.4,0.5)
with instance_create(x + lengthdir_x(5,direction),y + lengthdir_y(5,direction),AllyBullet)
{
  direction = other.direction + random_range(6,-6);
      image_angle = direction;  
speed=6
team = other.team;
creator = other;
damage = 3;
 }
alarm1 = 13
}else{
alarm1 -= 1
}
if speed <= 0 instance_destroy();

#define acewall
speed=0

#define acehit
projectile_hit(other,damage,force);
speed=0

#define acedestroy
sound_play(sndFlakExplode)
sound_play(sndExplosion)
with instance_create(x,y,Explosion){
hitid = [global.ace,"ACE"]
}