#define init
global.sprite = sprite_add_weapon("BloodyRifle.png",5,3);

#define weapon_name
return "Bloody Rifle";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 20;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 13;

#define weapon_text
return choose("The Bullets require @qB@ql@qo@o@d@q.@q.@q.","The Bullets require @qB@ql@qo@o@d@q.@q.@q.","The Bullets require @qB@ql@qo@o@d@q.@q.@q.","May or may not have been made with a soul,#may or may not be demonically possessed.");

#define weapon_fire
weapon_post(2,-3,3);
sound_play_pitch(sndHeavyMachinegun,0.9);
sound_play_pitchvol(sndBloodHammer,1.2,.7)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      sprite_index = sprHeavyBullet;
      mask_index = mskBullet1;
      speed = 13;
      image_angle = direction;
      team = other.team;
      creator = other;
      target=noone;
      angle=16;
      damage = 10;
      aquiredelay=4;
	alarm1 = 80;
	alarm2 = 5;
	pierce = 8;
      	on_step = script_ref_create(bbulletstep);
	on_wall = script_ref_create(bbulletwall);
	on_hit = script_ref_create(bbullethit);
	on_draw = script_ref_create(bullet_draw);
    }
}

#define bbulletstep
if(alarm1 >= 0)
{
	alarm1 -= 1;
}
if(alarm2 >= 0)
{
	alarm2 -= 1;
}
if (alarm2 = 0){
image_angle = direction;
if target = noone && instance_exists(enemy){
	var nearest = enemy;
	if distance_to_object(nearest) < 100{
	with enemy if point_distance(other.x, other.y, x, y) < point_distance(other.x, other.y, nearest.x, nearest.y)
	&& !collision_line(other.x, other.y, x, y, Wall, 0, 0) nearest = self;
	if !collision_line(x, y, nearest.x, nearest.y, Wall, 0, 0) target = nearest;
}
}
  }
angle += 0.1 * current_time_scale;
if instance_exists(target) direction += clamp(angle_difference(point_direction(x, y, target.x, target.y), direction), -angle, angle) * .85;
if image_index = 1{
	image_speed = 0
}
image_angle=other.direction
if (!instance_exists(target)){
aquiredelay -= 1;
if (aquiredelay <= 0){
target = noone;
aquiredelay = 7;
}
}
if alarm1<=0 {
instance_destroy()
}

#define bbulletwall
instance_create(x,y,BulletHit)
instance_destroy();

#define bbullethit
projectile_hit(other, damage, force, direction);
if (other.my_health > 15 || pierce = 0){
instance_create(x,y,BulletHit);
instance_destroy()
}else{
alarm1-=3
pierce-=1
}

#define bullet_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.1);
draw_set_blend_mode(bm_normal);