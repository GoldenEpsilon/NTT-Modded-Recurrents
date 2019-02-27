#define init
global.sprite = sprite_add_weapon("RageBlaster.png",2,4);

#define weapon_name
return "Rage Blaster";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 8;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 7;

#define weapon_text
return "Let Anger Fuel it";

#define weapon_fire
weapon_post(4,-3,3);
sound_play_pitchvol(sndHeavyRevoler,1.2,0.6)
sound_play_pitchvol(sndPlasma,1.3,0.5)
sound_play_pitchvol(sndBloodHammer,1.3,0.3)
ragepower = (1-(my_health/maxhealth)) * 2.5
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      mask_index = mskEnemyBullet1
      if other.ragepower > 1{
      sprite_index = sprEnemyBullet1;
      pierce = 3;
      }else{
      sprite_index = sprAllyBullet
      pierce = 0;}
      direction = other.gunangle + (random_range(-5,5)) * other.accuracy;
      speed = 10 + other.ragepower;
      image_xscale = 1 + (skill_get(17) * 0.2) + other.ragepower * 0.2;
      image_yscale = image_xscale;
      image_angle = direction;
      damage = 3 + (skill_get(17) * 1) + other.ragepower * 5;
      damage = round(damage)
      team = other.team;
      creator = other;
      on_step = script_ref_create(ragestep);
      on_hit = script_ref_create(ragehit);
      on_wall = script_ref_create(ragewall);
	on_draw = script_ref_create(bullet_draw);
    }
}
#define ragestep
if image_index = 1{
	image_speed = 0
}

#define ragehit
if other.nexthurt <= current_frame+2{
projectile_hit(other, damage, force, direction);}
if (other.my_health > damage || pierce = 0){
instance_create(x,y,BulletHit);
instance_destroy()
}else{
pierce-=1
}

#define ragewall
instance_create(x,y,BulletHit);
instance_destroy()

#define bullet_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);