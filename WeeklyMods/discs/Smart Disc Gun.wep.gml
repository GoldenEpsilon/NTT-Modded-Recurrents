#define init
global.sprSmartDisc = sprite_add("Smart Disc.png", 2, 6, 6);
global.sprSmartDiscGunLock = sprite_add("Smart Disc Gun Lock.png", 2, 6, 6);
global.sprSmartDiscGun = sprite_add_weapon("Smart Disc Gun.png", -2, 4);

#define weapon_name
return "SMART DISC GUN";

#define weapon_sprt
return global.sprSmartDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 11;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 14;

#define weapon_text
return "OPTIMIZED";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 0, 5, 8)) {
	sprite_index = global.sprSmartDisc;
	on_post_hit = script_ref_create(disc_post_hit);
	on_bounce = script_ref_create(disc_bounce);
	guide = noone;
}

#define disc_post_hit(q)
if (!instance_exists(q) || (
	("my_health" in q && q.my_health <= 0)
	&& (q.object_index == Generator || !instance_is(q, prop))
)) {
	var dx = x, dy = y;
	var bq = noone, bd = 999999;
	var qx, qy, qd;
	// try to pick a non-player target first:
	with (hitme) {
		qx = x; qy = y;
		qd = point_distance(dx, dy, qx, qy);
		if (qd < bd
			&& object_index != Player
			&& (object_index == Generator || !instance_is(self, prop))
			&& !collision_line(dx, dy, qx, qy, Wall, false, false)
			&& self != q && ("my_health" not in self || my_health > 0)
		) {
			bq = self;
			bd = qd;
		}
	}
	// if there's none, pick the player:
	if (bq == noone) with (Player) {
		qx = x; qy = y;
		qd = point_distance(dx, dy, qx, qy);
		if (qd < bd
			&& !collision_line(dx, dy, qx, qy, Wall, false, false)
			&& my_health > 0
		) {
			bq = self;
			bd = qd;
		}
	}
	// update the guide:
	if (bq != noone) {
		qx = bq.x; qy = bq.y;
		direction = point_direction(x, y, qx, qy);
		dist = max(dist, bd + 50);
		if (!instance_exists(guide)) {
			guide = script_bind_draw(disc_draw_path, 1);
			guide.disc = self;
		}
		guide.x = qx;
		guide.y = qy;
		guide.visible = true;
	} else with (guide) visible = false;
}
#define disc_bounce
// guideline is hidden on bounces
with (guide) visible = false;

#define disc_draw_path
draw_set_color($FF721F);
if (instance_exists(disc)) {
	var dx = disc.x, dy = disc.y;
	draw_line_width(dx, dy, x, y, 1);
	// guideline is hidden upon reaching destination:
	if (point_distance(x, y, dx, dy) < 4) visible = false;
} else instance_destroy();