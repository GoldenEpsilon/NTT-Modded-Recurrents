#define init
global.sprite = sprite_add_weapon("DoubleIceShot.png",4,3)
global.sprshell = sprite_add("IceShell.png",2,8,8)
global.sprdissa = sprite_add("IceShellDissapear.png",5,8,8)
global.sprhit = sprite_add("IceShellHit.png",4,12,12)
global.sprshard = sprite_add("IceShard.png",1,6,4)

#define weapon_name
return "Double Ice Shotgun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 45;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 9;

#define weapon_text
return "Low Temperature";

#define weapon_melee
return false;

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitchvol(sndDoubleFireShotgun,1.2,1.0);
sound_play_pitchvol(sndDoubleShotgun,1.2,1.0);
repeat(13){
with instance_create(x,y,CustomProjectile){
    direction = other.gunangle + (random_range(-25,25) * other.accuracy);
    image_angle = direction;
    speed = 15 + random_range(-2,3);
    sprite_index = global.sprshell
    mask_index = mskBullet2
    on_step = shell_step
    on_destroy = shell_destroy
    on_wall = shell_wall
    on_draw = shell_draw
    on_hit = shell_hit
    on_anim = shell_anim
    friction = .6
    team = other.team
    wallbounce = skill_get(15) * 2
    fallofftime = current_frame + 2
    damage = 2
    falloff = 1
    force = 3
    image_speed = 1
    bounce = 1
   }
}

#define shell_anim
image_index = 1
image_speed = 0

#define shell_hit
projectile_hit(other, (current_frame < fallofftime? damage : (damage - falloff)), force, direction);
speed = 0
with instance_create(x,y,BulletHit){
sprite_index = global.sprhit
}
repeat(2){
with instance_create(x,y,CustomProjectile){
sprite_index = global.sprshard
mask_index = mskEnemyBullet1
damage = 2
force = 1
speed = random_range(7,9)
friction = 0.3
alarm1 = random_range(7,15)
direction = random(359)
team = other.team
image_angle= direction
on_step = shard_step
on_draw = shard_draw
 }
}
instance_destroy()

#define shell_wall
if skill_get(15) && bounce = 1
{
fallofftime = current_frame + 2
move_bounce_solid(true)
speed /= 1.5
speed = min(speed+wallbounce,16)
wallbounce *= .95
image_angle = direction
bounce = 0
}else{
with instance_create(x,y,BulletHit){
sprite_index = global.sprhit
}
move_bounce_solid(true)
repeat(2){
with instance_create(x,y,CustomProjectile){
sprite_index = global.sprshard
mask_index = mskEnemyBullet1
damage = 2
force = 1
speed = random_range(7,9)
friction = 0.3
alarm1 = random_range(8,15)
direction = other.direction + random_range(30,-30)
team = other.team
image_angle= direction
on_step = shard_step
on_draw = shard_draw
 }
}
instance_destroy()
}
sound_play_hit(sndShotgunHitWall,.3)

#define shell_step
if speed < 4{
with instance_create(x,y,BulletHit){
    sprite_index = global.sprdissa
    speed = other.speed
    image_angle = other.image_angle
    friction = other.friction
    direction = other.direction
    image_speed = .4
}
 instance_destroy()
}

#define shell_draw
draw_self()
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,2*image_xscale,2*image_yscale,image_angle,image_blend,(current_frame < fallofftime? .2 : .1))
draw_set_blend_mode(bm_normal)

#define shell_destroy

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
