#define init
global.sprite = sprite_add_weapon("UltraPlasma.png",4,7);
global.sprplasma = sprite_add("Ultraplasmaproj.png", 2, 12, 12);
global.sprplasmaexplo = sprite_add("ultraplasmaimpact.png", 7, 16, 16);
global.sprtrail = sprite_add("UltraPlasmaTrail.png", 3, 4, 4);

#define weapon_name
return "ULTRA PLASMA GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_load
return 30;

#define weapon_cost
return 6;

#define weapon_rads
return 20;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 28;

#define weapon_text
return "@gUltra @sShock";

#define weapon_fire
    weapon_post(4, -8, 8);
    sound_play(sndPlasmaRifle);
sound_play_pitchvol(sndUltraLaser,1.4,.7)
    with instance_create(x,y,CustomProjectile)
    {
  		sprite_index = global.sprplasma;
  		mask_index = mskPlasma;
      team = other.team;
  		damage = 10;
  		force = 6;
  		image_xscale = 1.6 + (skill_get(17) * 0.6);
  		image_yscale = image_xscale;
  		image_index = 1;
  		image_speed = 0;
      direction = other.gunangle + (random_range(-1,1) * other.accuracy);
      speed = 4;
      typ = 1;
      creator = other;
      image_angle = direction;
      on_hit = script_ref_create(uplshit);
      on_step = script_ref_create(uplsstep);
      on_draw = script_ref_create(uplsdraw);
      on_destroy = script_ref_create(uplsdestroy);
    }
/*
#define uplsanim
image_speed = 0;
image_index = 1;
*/

#define uplsstep
with instance_create(x+random_range(-4,4),y+random_range(-4,4),PlasmaTrail)
{
  sprite_index = global.sprtrail;
}
if speed < 8 speed += 0.05;
if image_xscale < 1 {
image_xscale += 0.1;
image_yscale += 0.1;
}
if image_xscale < 0.5 instance_destroy();

#define uplshit
projectile_hit(other,damage,force);
image_xscale -= 0.1;
image_yscale -= 0.1;

#define uplswall

#define uplsdestroy
sound_play(sndPlasmaHit);
with instance_create(x,y,PlasmaImpact)
{
  image_xscale = 1.5;
  image_yscale = 1.5
  team = other.team;
  sprite_index = global.sprplasmaexplo;
}
if image_xscale > 1{
instance_create(x,y,PortalClear)
}
#define uplsdraw
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha * 0.1);
draw_set_blend_mode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);