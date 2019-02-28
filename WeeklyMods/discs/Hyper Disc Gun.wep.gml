#define init
// from https://docs.google.com/spreadsheets/d/1Ir4nthoEcxO7RPVMIMHVYIzkUVck-zhRkn76NIUk7ZQ/edit#gid=0
global.sprHyperDiscGun = sprite_add_weapon("Hyper Disc Gun.png", -2, 6);
global.sprHyperDiscTrail = sprite_add("Hyper Disc' Trail.png", 2, 0, 4);
global.sprHyperDisc = sprite_add("Hyper Disc.png", 2, 6, 6);
global.sprHyperDiscGlow = sprite_add("Hyper Disc' Glow.png", 2, 6, 6);

#define weapon_name
return "DISCO GUN";

#define weapon_sprt
return global.sprHyperDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 6;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 7;

#define weapon_text
return "The Future Sure Is Nice";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 14, 7)) {
	sprite_index = global.sprHyperDisc;
	glow_sprite = global.sprHyperDiscGlow;
	_team = other.team;
	trail = false;
	on_move = script_ref_create(disc_trail_make);
	on_bounce = script_ref_create(disc_trail_bounce);
	on_draw = disc_draw;
	frame = current_frame;
	image_blend = make_color_hsv(frame * 16 % 256, 240, 255);
	name = "Hyper Disc";
}

#define disc_draw
var q = sprite_index, i = image_index, _x = x, _y = y;
var sx = image_xscale, sy = image_yscale;
var rot = direction, alpha = image_alpha;
draw_sprite_ext(q, i, _x, _y, sx, sy, rot, c_white, alpha);
draw_sprite_ext(glow_sprite, i, _x, _y, sx, sy, rot, image_blend, alpha);

#define disc_trail_make(x1, y1, x2, y2)
frame += 1;
var _blend = image_blend;
image_blend = make_color_hsv(frame * 16 % 256, 240, 255);
if (fork()) with (instance_create(x1, y1, CustomProjectile)) {
	sprite_index = global.sprHyperDiscTrail;
	image_blend = other.image_blend;
	image_blend_from = _blend;
	image_angle = point_direction(x1, y1, x2, y2);
	image_xscale = point_distance(x1, y1, x2, y2) / 8;
	hitid = 76;
	on_step = disc_trail_step;
	on_wall = disc_trail_wall;
	on_hit = disc_trail_hit;
	on_draw = disc_trail_draw;
	damage = 3;
	creator = other.creator;
	team = other._team;
	name = "Hyper Disc' Trail";
}

#define disc_trail_wall
exit;

#define disc_trail_bounce(nx, ny)
with (instance_create(x, y, DiscTrail)) image_blend = other.image_blend;

#define disc_trail_hit
if (image_alpha > 0.1 && projectile_canhit_melee(other)) {
	sound_play_hit(sndDiscHit, 0.2);
	projectile_hit_push(other, damage, force);
	view_shake_at(x, y, 2)
}

#define disc_trail_step
image_alpha *= (1 - 0.1);
if (image_alpha < 0.01) {
	instance_destroy();
}

#define disc_trail_draw
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend_from, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);