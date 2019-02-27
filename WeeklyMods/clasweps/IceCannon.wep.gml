#define init
global.sprite = sprite_add_weapon("IceCannon.png",3,5);
global.sprflak = sprite_add("IceFlakBullet.png",2,8,8)
global.sprshard = sprite_add("IceShard.png",1,6,4)

#define weapon_name
return "Ice Cannon";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 60;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 13;

#define weapon_text
return "Get @bICCED@s Dummy";

#define weapon_fire
sound_play_pitchvol(sndFlameCannon,1.3,1.0);
sound_play_pitchvol(sndFireShotgun,1.5,1.0);
weapon_post(8, -8, 16);
with instance_create(x + lengthdir_x(10,gunangle),y + lengthdir_y(10,gunangle),CustomProjectile)
{
  sprite_index = global.sprflak;
  mask_index = mskFlakBullet;
  speed = 6;
  friction = 0.1;
  direction = other.gunangle + (random_range(-6, 6) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 30;
  force = 12;
  typ = 1;
  spin = 0
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
  on_draw = script_ref_create(flakdraw);
}
motion_add(gunangle,-8);

#define flakstep
if irandom(1) = 1{
instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
}
spin += 10
for (i = 0; i < 360; i += 120)
{
with instance_create(x,y,CustomProjectile){
sprite_index = global.sprshard
mask_index = mskEnemyBullet1
damage = 2
force = 1
speed = random_range(6,9)
friction = 0.3
alarm1 = random_range(8,15)
direction = other.spin + random_range(-20,20) + other.i
team = other.team
image_angle= direction
on_step = shard_step
on_draw = shard_draw
 }
}
if speed <= 0 instance_destroy();

#define flakdraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.2);
draw_set_blend_mode(bm_normal);

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
sound_play_pitchvol(sndFlakExplode,1.3,0.9);
sound_play_pitchvol(sndDoubleFireShotgun,1.3,0.7);
instance_create(x,y,PortalClear)
for (i = 0; i < 360; i += 4)
{
with instance_create(x,y,CustomProjectile){
sprite_index = global.sprshard
mask_index = mskEnemyBullet1
damage = 2
force = 1
speed = random_range(3,9)
friction = 0.3
alarm1 = random_range(7,15)
direction = other.i + random_range(30,-30)
team = other.team
image_angle= direction
on_step = shard_step
on_draw = shard_draw
 }
}

#define shard_step
if alarm1 <= 0{
instance_destroy()
}else{
alarm1 -= 1
}

#define shard_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.5);
draw_set_blend_mode(bm_normal);