#define init
global.sprite = sprite_add_weapon("UltraDiscGun.png",0,6);
global.sprdisc = sprite_add("UltraDisc.png",2,6,6);

#define weapon_name
return "ULTRA DISC GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return 1;

#define weapon_load
return 15;

#define weapon_cost
return 6;

#define weapon_rads
return 20;

#define weapon_swap

return sndSwapBow;

#define weapon_area
return 30;

#define weapon_text
return "@gULTRA @sAPOLOGIES";

#define weapon_laser_sight
return false;

#define weapon_fire
  if instance_exists(self){
weapon_post(4,-6,12);
sound_play_pitch(sndDiscgun,0.7);
sound_play_pitchvol(sndUltraCrossbow,1.8,.6)
    with instance_create(x+lengthdir_x(7,gunangle),y+lengthdir_y(7,gunangle),CustomProjectile)
    {
      hitid = [global.sprdisc,"@gULTRA DISC"]
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed=7;
      damage=15;
      sprite_index=global.sprdisc;
      mask_index=mskDisc
      image_angle = direction;
      image_speed = 0.5;
      team = 0;
      typ = 1;
      target=noone;
      angle=16;
      aquiredelay=7;
      creator = other;
	alarm1 = 120;
      	on_step = script_ref_create(udiscstep);
	on_wall = script_ref_create(udiscwall);
	on_hit = script_ref_create(udischit);
  on_destroy = script_ref_create(udiscdestroy);
    }
}
#define udiscstep
team=-1;
with instance_create(x,y,DiscTrail){
image_angle=other.direction
}
if(alarm1 >= 0)
{
	alarm1 -= 1;
}
image_angle = direction;
if target = noone && instance_exists(enemy){
	var nearest = enemy;
	if distance_to_object(nearest) < 100{
	with enemy if point_distance(other.x, other.y, x, y) < point_distance(other.x, other.y, nearest.x, nearest.y)
	&& !collision_line(other.x, other.y, x, y, Wall, 0, 0) nearest = self;
	if !collision_line(x, y, nearest.x, nearest.y, Wall, 0, 0) target = nearest;
}
}
angle += 0.1 * current_time_scale;
if instance_exists(target) direction += clamp(angle_difference(point_direction(x, y, target.x, target.y), direction), -angle, angle) * .4;
if image_index = 1{
	image_speed = 0
}
if (!instance_exists(target)){
aquiredelay -= 1;
if (aquiredelay <= 0){
target = noone;
aquiredelay = 7;
}
}
if place_meeting(x,y,Slash){
target = noone;
aquiredelay = 14;
}
if alarm1<=0 {
instance_destroy()
}
#define udischit
sound_play(sndDiscHit)
projectile_hit(other, damage, force, direction);
alarm1-=3

#define udiscwall
move_bounce_solid(self);
image_angle=direction;
sound_play(sndDiscBounce)
instance_create(x,y,DiscBounce)

#define udiscdestroy
sound_play(sndDiscDie)
with instance_create(x,y,Disc)
{
  direction = other.direction + (random_range(-20, 20));
      image_angle = direction;  
speed=7 + (random_range(0, 3))
team = 0;
creator = other;
}