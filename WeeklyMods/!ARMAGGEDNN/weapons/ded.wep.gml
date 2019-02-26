global.sprite = sprite_add_weapon("spr/fckyou.png",7,10)
global.die = sound_add("snd/die.ogg")
#define weapon_name
return loc("!argdn:FckGuu", "FUCK GUN");

#define weapon_type
return 5;

#define weapon_auto
return 0;

#define weapon_cost
return 10;

#define weapon_load
return 30;

#define weapon_sprt
return global.sprite;

#define weapon_area
return 99;

#define weapon_swap
return sndSwapExplosive;

#define weapon_text
return "dont touch sticky nades";

#define weapon_fire
var __angle = gunangle;
sound_play(global.die)
with (instance_create(mouse_x, mouse_y, Flame)) {
	damage = 6660
	image_angle = direction;
	team = other.team;
	creator = other;
}
weapon_post(5, -10, 2);

#define step
with enemy{
	if my_health = 0 {
		sound_play(global.die)
		}
	}