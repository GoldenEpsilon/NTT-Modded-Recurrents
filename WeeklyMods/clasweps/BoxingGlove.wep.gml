#define init
global.sprite = sprite_add_weapon("BoxingGlove.png",0,4);
global.sprjab = sprite_add("Jab.png",4,12,8)

#define weapon_name
return "BOXING GLOVE";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 0;

#define weapon_auto
return 1;

#define weapon_load
return 14;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 6;

#define weapon_melee
return false;

#define weapon_text
return "Circuit Champion";

#define weapon_fire
weapon_post(-5,-3,4);
sound_play(sndWrench);
with instance_create(x + lengthdir_x(6, gunangle),y + lengthdir_y(6, gunangle),CustomProjectile) //custom projectile so it doesn't delete projectiles
{
	sprite_index = global.sprjab;
	speed = 11 + (skill_get(13) * 3);
	friction = 1 - (skill_get(13) * 0.3);
	direction = other.gunangle + (random_range(-6,6) * other.accuracy);
	image_angle = direction;
	team = other.team;
	damage = 8;
	force = 5;
	typ = 1;
	walltime = 15
	creator = other;
	on_hit = script_ref_create(jabhit);
	image_speed = .4;
	on_wall = script_ref_create(jabwall);
	on_anim = script_ref_create(jabanim);
}

#define jabhit
if other.nexthurt <= current_frame{
projectile_hit(other,damage,force);
speed -= 2;
}

#define jabanim
  instance_delete(self);

#define jabwall
if walltime <= 0{
instance_destroy()
}else{
walltime -= 1
}