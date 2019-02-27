#define init
global.sprite = sprite_add_weapon("Zap Shotgun.png",4,3);

#define weapon_name
return "Zap Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 8;

#define weapon_text
return "THUNDERSTRIKE";

#define weapon_fire
sound_play_pitchvol(sndShotgun,0.8,0.7)
sound_play_pitchvol(sndLightningShotgun,1.2,0.8)
weapon_post(12, -8, 16);
repeat(5){
{
with instance_create(x,y,CustomProjectile)
{
  sprite_index = sprBullet2;
  mask_index = mskBullet2;
  speed = 12 + (random_range(-1, 2));
  friction = .5
  direction = other.gunangle + (random_range(-20, 20) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 3;
  force = 4;
  typ = 1;
  on_step = script_ref_create(zapshellstep);
  on_wall = script_ref_create(zapwall);
  on_hit = script_ref_create(zaphit);
  on_draw = script_ref_create(bullet_draw);
}
}
}
motion_add(gunangle,-3);



#define zapwall
with instance_create(x,y,Lightning) {
  move_contact_solid(0, 10);
  alarm0 = 1;
  ammo = 4;
  image_angle = (random_range(1, 360));
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
}
instance_destroy()

#define zaphit
projectile_hit(other,damage,force);
with instance_create(x,y,Lightning)
{
  move_contact_solid(0, 10);
  alarm0 = 1;
  ammo = 3;
  image_angle = (random_range(1, 360));
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
}
instance_destroy()

#define zapshellstep
if image_index = 1{
	image_speed = 0
}
if speed <= 0 instance_destroy();

#define bullet_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);