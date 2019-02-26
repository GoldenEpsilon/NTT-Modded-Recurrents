global.sprite = sprite_add_weapon("spr/LyapasGun.png",3,7)
global.projectile = sprite_add("spr/lyapasP.png",1,7,8)
#define weapon_name
return loc("!argdn:DaiLyapas", "LYAPAS GUN");

#define weapon_type
return 4;

#define weapon_auto
return 1;

#define weapon_cost
return 1;

#define weapon_load
return 35;

#define weapon_sprt
return global.sprite;

#define weapon_area
return 7;

#define weapon_swap
return sndSwapExplosive;

#define weapon_text
return "dont touch sticky nades";

#define weapon_fire
var __angle = gunangle;
sound_play(sndGrenade);
with (instance_create(x, y, Grenade)) {
	sprite_index = global.projectile;
	sticky = 1;
	motion_add(__angle + (random(6) - 3) * other.accuracy, 11);
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(5, -10, 2);

#define step
with Explosion {
	instance_create(x,y,MeatExplosion)
	instance_create(x,y,MeatExplosion)
	instance_destroy()
}