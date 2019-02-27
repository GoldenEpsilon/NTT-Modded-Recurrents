#define init
global.sprite = sprite_add_weapon("catalyst.png",9,4)

#define weapon_name
return "Catalyst";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 13;

#define weapon_text
return "Blood For Blood";

#define weapon_melee
return false;

#define weapon_fire
if infammo = 0{
	
if ammo[weapon_get_type(argument0)] - 4 < 0{

ammo[weapon_get_type(argument0)] = 0;

sprite_index = spr_hurt;

image_index = 0;

my_health --;
	
sound_play(sndBloodHurt);

lasthit = [global.sprite,"Catalyst"]
	
sound_play(snd_hurt);
}else
{

ammo[weapon_get_type(argument0)] -= 4}

}
weapon_post(9,-9,15);
sound_play_pitchvol(sndBloodLauncher,1.2,1.0);
sound_play_pitchvol(sndBloodCannonEnd,1.6,0.4);
sound_play_pitchvol(sndUltraShotgun,1.3,0.3);
repeat(10){
with instance_create (x+lengthdir_x(9,other.gunangle+random_range(3,-3)),y+lengthdir_y(9,other.gunangle+random_range(3,-3)),BloodStreak)
{
	image_angle = other.gunangle + (random_range(-16,16) * other.accuracy);
}
with instance_create(x,y,CustomProjectile){
    direction = other.gunangle + (random_range(-16,16) * other.accuracy);
    image_angle = direction;
    speed = 19 + random_range(-2,3);
    sprite_index = sprBullet2
    mask_index = mskBullet2
    on_step = shell_step
    on_destroy = shell_destroy
    on_wall = shell_wall
    on_draw = shell_draw
    on_hit = shell_hit
    on_anim = shell_anim
    friction = .6
    team = other.team
    wallbounce = skill_get(15) * 5
    fallofftime = current_frame + 2
    damage = 3
    falloff = 1
    force = 2
    image_speed = 1
   }
}

#define shell_anim
image_index = 1
image_speed = 0

#define shell_hit
projectile_hit(other, (current_frame < fallofftime? damage : (damage - falloff)), force, direction);
speed = 0
instance_create(x,y,MeatExplosion);
with instance_create(x,y,BulletHit){
    sprite_index = sprBullet2Disappear
    speed = other.speed
    image_angle = other.image_angle
    friction = other.friction
    direction = other.direction
    image_speed = .4
}
instance_destroy()

#define shell_wall
fallofftime = current_frame + 2
move_bounce_solid(true)
speed /= 1.5
speed = min(speed+wallbounce,16)
wallbounce *= .95
with instance_create(x,y,BloodStreak){
image_angle = other.direction
}
sound_play_hit(sndShotgunHitWall,.2)
sound_play_hit(sndBloodLauncherExplo,1.5)
image_angle = direction

#define shell_step
if speed < 3{
with instance_create(x,y,BulletHit){
    sprite_index = sprBullet2Disappear
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