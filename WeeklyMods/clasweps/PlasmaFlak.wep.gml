#define init
global.sprite = sprite_add_weapon("PlasmaFlak.png",3,3);

#define weapon_name
return "Plasma Launcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 23;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "Kaboom";

#define weapon_fire
sound_play(sndFlakCannon)
sound_play(sndPlasmaBig)
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
		sprite_index = sprPlasmaBall;
  		mask_index = mskPlasma;
      team = other.team;
  		damage = 15;
  		force = 6;
  		image_xscale = 1.5 + (skill_get(17) * 0.6);
  		image_yscale = image_xscale;
  		image_index = 1;
  		image_speed = 0;
      direction = other.gunangle + (random_range(-1,1) * other.accuracy);
      speed = 4;
      typ = 1;
      creator = other;
      image_angle = direction;
  on_wall = script_ref_create(plswall);
  on_hit = script_ref_create(plshit);
  on_destroy = script_ref_create(plsdestroy);
  on_step = script_ref_create(plsstep);
}
motion_add(gunangle,-8);

#define plsstep
instance_create(x+random_range(-4,4),y+random_range(-4,4),PlasmaTrail)
if speed < 8 speed += 0.05;
if image_xscale < 0.5 instance_destroy();

#define plswall
instance_destroy();

#define plshit
projectile_hit(other,damage,force);
image_xscale -= 0.1;
image_yscale -= 0.1;

#define plsdestroy
sound_play(sndFlakExplode)
sound_play(sndPlasmaBigExplode)
with instance_create(x,y,PlasmaImpact){
image_xscale = 1.3;
image_yscale = 1.3;
}
for (i = 0; i < 360; i += 45)
{
with instance_create(x + lengthdir_x(30,i),y + lengthdir_y(30,i),PlasmaImpact)
{
image_xscale = 0.7;
image_yscale = 0.7;
  direction = other.i + (random_range(-5, 5));
      image_angle = direction;  
team = other.team;
creator = other;
}
}