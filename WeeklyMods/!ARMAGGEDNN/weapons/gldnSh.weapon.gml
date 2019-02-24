global.sprGSH = sprite_add_weapon("spr/sprGSH.png", 8, 7);;
global.sprGSHS = sprite_add("spr/zGoldSlash.png", 3, 0, 24);
#define weapon_name
return loc("!argdn:GoldenSh", "GOLDEN SHOVEL");

#define weapon_type
return 0;

#define weapon_auto
return 0;

#define weapon_cost
return 0;

#define weapon_load
return 32;

#define weapon_sprt
return global.sprGSH;

#define weapon_area
return 10;

#define weapon_swap
return sndSwapHammer;

#define weapon_text
return "fancy dig";

#define weapon_gold
return 1;

#define weapon_fire
var __angle = gunangle;
var __long_arms = skill_get(13)
sound_play_gun(sndShovel, 0.2, 0.3);
instance_create(x, y, Dust);
var l = __long_arms * 20;
for (var i = -1; i <= 1; i++) {
	var d = __angle + i * 60 * accuracy;
	with (instance_create(x + lengthdir_x(l, d), y + lengthdir_y(l, d), Slash)) {
		sprite_index = global.sprGSHS;
		damage = 10;
		motion_add(d, 2 + 3 * __long_arms);
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}
wepangle = -wepangle;
motion_add(__angle, 6);
weapon_post(-4, 24, 2);

