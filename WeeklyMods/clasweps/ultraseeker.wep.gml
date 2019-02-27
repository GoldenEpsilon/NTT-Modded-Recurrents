#define init
global.sprite = sprite_add_weapon("UltraSeeker.png",0,4);
global.sprsekr = sprite_add("ultraseekerpro.png",1,5,4)
global.sprmsekr = sprite_add("ultramegaseeker.png",1,7,4)
#define weapon_name
return "ULTRA SEEKER GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 3;

#define weapon_auto
return 1;

#define weapon_load
return 17;

#define weapon_cost
return 3;

#define weapon_rads
return 20;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 36;

#define weapon_text
return "@gULTRA @sSEEKING TECH";

#define weapon_fire
  if instance_exists(self)
  {
weapon_post(8,-6,12);
sound_play_pitchvol(sndSeekerShotgun,0.7,1);
sound_play_pitchvol(sndUltraCrossbow,1.5,.7)
with instance_create(x,y,CustomProjectile)
{
      direction = other.gunangle + (random_range(-3,3) * other.accuracy);
	      speed=7;
      damage=15;
      sprite_index=global.sprmsekr;
      image_angle = direction;
      target=noone;
      angle=16;
      aquiredelay=7;
      team=other.team;
      creator = other;
	alarm1 = 120;
      	on_step = script_ref_create(umskrstep);
	on_wall = script_ref_create(umskrwall);
      	on_destroy = script_ref_create(umskrdestroy);
    }
}

#define umskrstep
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
if instance_exists(target) direction += clamp(angle_difference(point_direction(x, y, target.x, target.y), direction), -angle, angle) * (0.7 + (skill_get(21) * 0.3));
with(instance_create(x, y, BoltTrail)) {
     image_angle = other.direction;
     image_xscale = other.speed;
     image_yscale = 1.5;
}
#define umskrwall
instance_destroy()

#define umskrhit
instance_destroy()

#define umskrdestroy
sound_play(sndSeekerPistol);
for (i = 0; i < 360; i += 36)
{
with instance_create(x,y,Seeker)
{
  direction = other.i + (random_range(-20, 20));
sprite_index = global.sprsekr;
      image_angle = direction;  
speed=4
team = other.team;
creator = other;
damage = 12;
  move_contact_solid(other.i, 10);
}
}