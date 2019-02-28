#define init
// Potentially the only weapon of this kind that still works.
global.sprBulletDisc = sprite_add("Splinter Gun Disc.png", 2, 6, 6);
global.sprBulletDiscGun = sprite_add_weapon("Splinter Gun Disc Gun.png", -2, 5);

#define weapon_name
return "SPLINTER GUN DISC GUN";

#define weapon_sprt
return global.sprBulletDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 100;

#define weapon_cost
return 8;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 12;

#define weapon_text
return "NEVER GIVE THE DISC A GUN";

#define weapon_fire
sound_play_gun(sndDiscgun, 0.2, -0.5);
weapon_post(7, -15, 15);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 3, 15)) {
	shoot_angle = random(360);
	shoot_angle_dir = choose(-1, 1);
	sprite_index = global.sprBulletDisc;
	wait 10;
	with (self) on_move = script_ref_create(shoot_pass);
}

#define shoot_pass(lx, ly, nx, ny)
shoot_angle += shoot_angle_dir * 7;
if (time % 3 != 0) exit;
var i = shoot_angle;
var n = 4;
sound_play_gun(sndSplinterPistol, 0.2, -0.3);
repeat (n) {
	with (instance_create(nx, ny, Splinter)) {
		motion_add(i, 16 + random(8));
		image_angle = direction;
		team = -1;
		creator = other.creator;
		hitid = other.hitid;
	}
	i += 360/n;
}