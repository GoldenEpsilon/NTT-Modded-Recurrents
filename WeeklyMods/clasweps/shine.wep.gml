#define init
global.sprite = sprite_add_weapon("Reflector.png",0,4);
global.sprshine = sprite_add("Shine.png",3,20,20);
global.sprmask = sprite_add("ShineMask.png",3,20,20);
global.snd_shine = sound_add("shine.ogg");

#define weapon_name
return "REFLECTOR";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_load
return 7;

#define weapon_swap
return sndSwapEnergy;

#define weapon_cost
return 1;

#define weapon_area
return 8;

#define weapon_melee
return false;

#define weapon_text
return "TORYAH";

#define weapon_fire
vspeed = 0;
hspeed = 0;
weapon_post(0,-3,4);
sound_play(global.snd_shine);
with instance_create(x,y,CustomSlash)
{
	sprite_index = global.sprshine;
	mask_index = global.sprmask
	image_xscale = 1.0 + (skill_get(17) * 1);
	image_yscale = 1.0 + (skill_get(17) * 1);
	speed = 0;
	direction = other.gunangle;
	team = other.team;
	damage = 4 + (skill_get(17) * 2);
	force = 25;
	typ = 1;
	creator = other;
	on_projectile = script_ref_create(shinereflect);
	on_hit = script_ref_create(shinehit);
	on_wall = script_ref_create(shinewall);
	image_speed = .4;
	on_anim = script_ref_create(shineanim);
}
#define shinereflect
with(other){
direction-=180;
team=2;
image_angle = direction;
}

#define shinehit
if other.nexthurt <= current_frame{
projectile_hit(other,damage,force);
}

#define shineanim
  instance_delete(self);


#define shinewall
//sorry Nothing