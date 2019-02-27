#define init
global.sprite = sprite_add_weapon("BloodyRevolver.png",-1,4);
global.sprtrail = sprite_add("BloodyTrail.png",3,4,4);
global.sprbullet = sprite_add("BloodyBullet.png",2,8,8);

#define weapon_name
return "Bloody Revolver";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return 0;

#define weapon_load
return 8;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 10;

#define weapon_text
return "The @wBullets @qH@qu@qn@qg@qe@qr@q.@q.@q.";

#define weapon_fire
weapon_post(2,-3,3);
sound_play_pitch(sndPistol,0.9);
sound_play_pitchvol(sndBloodHammer,1.4,.7)
  if instance_exists(self)
  {
    with instance_create(x,y,CustomProjectile)
    {
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
      sprite_index = global.sprbullet;
      mask_index = mskBullet1;
      speed = 12;
      image_angle = direction;
      team = other.team;
      creator = other;
      target=noone;
      angle=16;
      aquiredelay=15;
	alarm1 = 60;
	alarm2 = 4;
	pierce = 5;
      	on_step = script_ref_create(bbulletstep);
	on_wall = script_ref_create(bbulletwall);
	on_hit = script_ref_create(bbullethit);
	on_draw = script_ref_create(bullet_draw);
    }
}

#define bbulletstep
if random(1) < 0.4{
with instance_create(x+random_range(3,-3),y+random_range(3,-3),PlasmaTrail){
sprite_index = global.sprtrail
  }
}
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
if instance_exists(target) direction += clamp(angle_difference(point_direction(x, y, target.x, target.y), direction), -angle, angle) * .7;
if image_index = 1{
	image_speed = 0
}
image_angle=other.direction
if (!instance_exists(target)){
aquiredelay -= 1;
}
if alarm1<=0 {
instance_destroy()
}

#define bbulletwall
with instance_create(x + lengthdir_x(3, direction),y + lengthdir_y(3, direction),BulletHit){
sprite_index = sprEnemyBulletHit
}
instance_destroy();

#define bbullethit
projectile_hit(other, damage, force, direction);
if (other.my_health > 5 || pierce = 0){
with instance_create(x,y,BulletHit){
sprite_index = sprEnemyBulletHit
}
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