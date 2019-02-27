#define init
global.sprite = sprite_add_weapon("ToxicDiscGun.png",-2,4);
global.sprdisc = sprite_add("ToxicDisc.png",2,6,6);

#define weapon_name
return "TOXIC DISC GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return 1;

#define weapon_load
return 25;

#define weapon_cost
return 1;

#define weapon_swap

return sndSwapBow;

#define weapon_area
return 7;

#define weapon_text
return "Just Unusable";

#define weapon_laser_sight
return false;

#define weapon_fire
  if instance_exists(self){
weapon_post(4,-6,12);
sound_play_pitch(sndDiscgun,0.7);
    with instance_create(x+lengthdir_x(9,gunangle),y+lengthdir_y(9,gunangle),CustomProjectile)
    {
      hitid = [global.sprdisc,"TOXIC DISC"]
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      speed=5;
      damage=6;
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
	alarm1 = 60;
      	on_step = script_ref_create(tdiscstep);
	on_wall = script_ref_create(tdiscwall);
	on_hit = script_ref_create(tdischit);
  on_destroy = script_ref_create(tdiscdestroy);
    }
}

#define tdiscstep
team=-1;
with instance_create(x,y,DiscTrail){
image_angle=other.direction
image_blend = c_green
}
if(alarm1 >= 0)
{
	alarm1 -= 1;
}
image_angle = direction;

#define tdischit
if other.nexthurt <= current_frame{
sound_play(sndDiscHit)
projectile_hit(other, damage, force, direction);
alarm1-=3
repeat(2){
	with instance_create(x,y,ToxicGas){
direction = random(359);
speed = 2 + random_range(0.3,-1.0);
}
}
}

#define tdiscwall
move_bounce_solid(self);
image_angle=direction;
sound_play(sndDiscBounce)
instance_create(x,y,DiscBounce)
repeat(2){
	with instance_create(x,y,ToxicGas){
direction = random(359);
speed = 2 + random_range(0.2,-1.0);
}
}
alarm1-=3
if alarm1<=0 {
instance_destroy()
}

#define tdiscdestroy
sound_play(sndDiscDie)
repeat(5){
	with instance_create(x,y,ToxicGas){
direction = random_range(1,360);
speed = 2.5 + random_range(0.4,-0.5);
}
}