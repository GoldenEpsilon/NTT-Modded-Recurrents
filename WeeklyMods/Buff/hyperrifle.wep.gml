weapon_set_area(26,-1)
weapon_set_name(26,"old hyper rifle")

#define weapon_name
	return "HYPER RIFLE";

#define weapon_type
	return 1;

#define weapon_cost
	return 5;

#define weapon_load
	return 3;

#define weapon_auto
	return 0;

#define weapon_area
	return 8;

#define weapon_swap
	return sndSwapMachinegun;

#define weapon_sprt
	return sprHyperRifle;

#define weapon_text
	return "hyper time";
	
#define weapon_fire


repeat(6){
if instance_exists(self) with instance_create(x,y,Bullet1)
{
sound_play(sndHyperRifle)
motion_add(other.gunangle+random(4)-2,16)
image_angle = direction
team = other.team
creator = other
sprite_index = sprIDPDBullet
spr_dead = sprIDPDBulletHit
with instance_create(x,y,Shell)
	motion_add(other.direction+180+random(50)-25,2+random(2))

with other weapon_post(4, -6, 3);
}
wait 1
}