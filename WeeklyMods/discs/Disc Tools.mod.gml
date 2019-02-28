#define draw_bloom
with (instances_matching(CustomProjectile, "name", "Hyper Disc")) {
	draw_sprite_ext(glow_sprite, image_index, x, y, image_xscale, image_yscale,
		image_angle, image_blend, image_alpha);
}
with (instances_matching(CustomProjectile, "name", "Hyper Disc' Trail")) {
	var q = sprite_index, rx = x, ry = y;
	var sx = image_xscale, sy = image_yscale;
	var rt = image_angle, a = image_alpha * 0.25;
	draw_sprite_ext(q, 1, rx, ry, sx, sy, rt, image_blend_from, a);
	draw_sprite_ext(q, 0, rx, ry, sx, sy, rt, image_blend, a);
}

#define disc_fire(spread, vel, dmg)
var r = instance_create(x, y, CustomProjectile);
with (r) {
	sprite_index = sprDisc;
	trail = true;
	team = other.team;
	creator = other;
	on_step = disc_step;
	on_wall = disc_wall;
	on_hit = disc_hit;
	on_move = null;
	on_bounce = null;
	on_post_hit = null;
	hitid = 76;
	damage = dmg;
	force = 4;
	dist = 300;
	time = 0;
	hold = false;
	xnext = x;
	ynext = y;
	xlast = x;
	ylast = y;
	motion_add(other.gunangle + random_range(-1, 1) * spread, vel);
}
return r;

#define disc_step
if (hold) exit;
time += 1;
x = xnext;
y = ynext;
xlast = x;
ylast = y;
if (trail) instance_create(x, y, DiscTrail);
// discs vanish when they pass a distance or hit a wall:
dist -= speed;
if (dist < -100) {
	sound_play_hit(sndDiscDie, 0.2);
	instance_destroy();
	exit;
}
// bounce off the shields:
var shield = instance_position(x + hspeed, y + vspeed, CrystalShield);
if (shield == noone) shield = instance_position(x + hspeed, y + vspeed, PopoShield);
if (shield != noone) direction = point_direction(shield.x, shield.y, x, y);
// calculate next position and pixel-perfect bounces:
xnext = x + hspeed;
ynext = y + vspeed;
if (position_meeting(xnext, ynext, Wall)) { // bounce
	sound_play_hit(sndDiscBounce, 0.2);
	if (!position_meeting(x - hspeed, y + vspeed, Wall)) {
		hspeed *= -1;
	} else if (!position_meeting(x + hspeed, y - vspeed, Wall)) {
		vspeed *= -1;
	} else {
		hspeed *= -1;
		vspeed *= -1;
	}
	script_ref_call(on_bounce, xnext, ynext);
	xnext = x + hspeed;
	ynext = y + vspeed;
}
if (team != -1 && distance_to_object(creator) > 16) team = -1;
script_ref_call(on_move, xlast, ylast, xnext, ynext);

#define disc_wall
if (hold) {
	x = xnext;
	y = ynext;
} else if (dist >= 0) {
	x = xnext;
	y = ynext;
	xprevious = xnext;
	yprevious = ynext;
} else {
	sound_play_hit(sndDiscDie, 0.2);
	instance_destroy();
}

#define disc_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale,
	point_direction(0, 0, hspeed, vspeed), image_blend, image_alpha);

#define disc_hit
if (projectile_canhit_melee(other)) {
	sound_play_hit(sndDiscHit, 0.2);
	var dmg = damage;
	if (other.object_index == Player && skill_get("Disc Skill")) dmg = min(dmg, 1);
	projectile_hit(other, dmg, force);
	view_shake_at(x, y, 2)
	script_ref_call(on_post_hit, other);
}
