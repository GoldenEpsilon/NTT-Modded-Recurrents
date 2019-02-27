#define init
global.sprite = sprite_add_weapon("Zap Cannon.png",4,4);

#define weapon_name
return "Zap Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 45;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 12;

#define weapon_text
return "THUNDERSTRIKE";

#define weapon_fire
sound_play_pitchvol(sndLightningCannon,1.3,0.7)
sound_play_pitchvol(sndLightningShotgun,1.3,0.9)
weapon_post(12, -4, 7);
with instance_create(x,y,CustomProjectile)
{
  sprite_index = sprLightningBall;
  mask_index = mskBullet2;
  speed = 12;
  direction = other.gunangle + (random_range(-1, 1) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 10 + (skill_get(17) * 5);
  force = 6 + (skill_get(17) * 10);
  typ = 1;
  on_draw = script_ref_create(bullet_draw);
  on_step = script_ref_create(bullet_step);
  on_wall = script_ref_create(zapwall);
  on_hit = script_ref_create(zaphit);
  on_destroy = script_ref_create(zapdestroy);
}
motion_add(gunangle,-8);



#define zapwall
speed=0
instance_destroy()

#define zaphit
projectile_hit(other,damage,force);
instance_destroy()

#define bullet_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);

#define bullet_step
if image_index = 1{
	image_speed = .5
}

#define zapdestroy
repeat(6 + (skill_get(17) * 1))
{
with instance_create(x,y,Lightning)
{
  move_contact_solid(0, 10);
  alarm0 = 1;
  damage=6 + (skill_get(17) * 2)
  ammo = random_range(6,8);
  image_angle = (random_range(1, 360));
  team = other.team;
  creator = other
  with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
}
}