#define init
global.sprite = sprite_add_weapon("HeavyGlove.png",0,4);
global.sprjab = sprite_add("HeavyJab.png",4,12,8)

#define weapon_name
return "HEAVY-WEIGHT GLOVE";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 0;

#define weapon_auto
return 1;

#define weapon_load
return 20;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 9;

#define weapon_melee
return false;

#define weapon_text
return "Heavy Weight Champion";

#define weapon_fire
weapon_post(-5,-3,4);
sound_play(sndWrench);
with instance_create(x,y,CustomProjectile) //custom projectile so it doesn't delete projectiles
{
	sprite_index = global.sprjab;
	mask_index = sprBullet1
	speed = 13 + (skill_get(13) * 3);
	friction = 1 - (skill_get(13) * 0.25);
	direction = other.gunangle + (random_range(-6,6) * other.accuracy);
	image_angle = direction;
	team = other.team;
	damage = 13;
	force = 5;
	typ = 1;
	creator = other;
	on_hit = script_ref_create(jabhit);
	image_speed = .3;
	on_anim = script_ref_create(jabanim);
}

#define jabhit
if other.nexthurt <= current_frame{
projectile_hit(other,damage,force);
}

#define jabanim
  instance_delete(self);