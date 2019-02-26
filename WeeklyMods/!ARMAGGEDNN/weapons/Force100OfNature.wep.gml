global.wepspr = sprite_add_weapon("spr/sprForce100OfNature.png", 3, 38)
global.earrape = sound_add("snd/FHONshot.ogg")
#define weapon_name
return loc("!argdn:Fo100ON", "FORCE HUN-GREED OF NATURE");
#define weapon_type
return 2;
#define weapon_auto
return 1;
#define weapon_cost
return 1;
#define weapon_load
return 0;
#define weapon_sprt
return global.wepspr;
#define weapon_area
return 22;
#define weapon_swap
return sndSwapShotgun;
#define weapon_text
return "OH MY GOD WHAT THE FUCK!????";
#define weapon_fire
var __angle = gunangle;
sound_play(global.earrape);
sound_play(global.earrape);
repeat (5) {
	with (instance_create(x, y, Shell)) {
	sprite_index = sprShotShell
		motion_add(other.gunangle + random_range(-10, 10) * 25, 4 + random(3));
	}}
repeat (18) {
	with (instance_create(x, y, Bullet2)) {
		damage = 1;
		motion_add(__angle + (random(180) - 30) * other.accuracy, 30 - random(15));
		image_angle = direction;
		team = other.team;
		creator = other;
	}
}
motion_add(__angle + 180, random(999));
weapon_post(18, -8, 10);

#define step
with (Player) {
	if race = "fish" {
		cwep = "revolver"
	}
}
