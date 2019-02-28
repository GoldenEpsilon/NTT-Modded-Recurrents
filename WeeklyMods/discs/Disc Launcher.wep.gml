#define init
// Charge-action
global.sprBigDisc = sprite_add("Big Disc.png", 2, 9, 9);
global.sprDiscLauncher = sprite_add_weapon("Disc Launcher.png", -2, 4);

#define weapon_name
return "DISC LAUNCHER";

#define weapon_sprt
return global.sprDiscLauncher;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 10;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return "How convenient.";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
var r = script_bind_end_step("disc_hold", depth);
r.owner = self;
r.charge = 0;
r.maxcharge = 50;
var q = mod_script_call("mod", "Disc Tools", "disc_fire", 0, 0, 4);
q.hold = true;
q.sprite_index = global.sprBigDisc;
q.force = 3;
r.releaseAsap = false;
r.disc = q;

#define disc_hold
if (!instance_exists(disc)) {
	instance_destroy();
	exit;
}
var release = false;
if (instance_exists(owner)) {
	if (owner.object_index == Player) {
		release = !button_check(owner.index, "fire");
	} else {
		charge = maxcharge / 2;
		release = true;
	}
	if (position_meeting(disc.x, disc.y, Wall)) {
		if (release) {
			release = false;
			releaseAsap = true;
		}
	} else if (releaseAsap) release = true;
} else release = true;
if (release) {
	var c = charge / maxcharge;
	disc.hold = false;
	disc.speed = 4 + c * 12;
	disc.force = 4 + c * 12;
	disc.damage = floor(2 + c * 18);
	disc.image_blend = c_white;
	instance_destroy();
} else {
	var l = 16;
	var d = owner.gunangle;
	disc.time = 0;
	var nx = owner.x + lengthdir_x(l, d);
	var ny = owner.y + lengthdir_y(l, d);
	disc.x = nx;
	disc.xnext = nx;
	disc.y = ny;
	disc.ynext = ny;
	disc.direction = d;
	disc.image_angle = d;
	if (charge < maxcharge) {
		charge += 1;
		if (charge >= maxcharge) {
			sound_play(sndDiscgun);
			disc.image_blend = c_red;
		}
	}
}
