#define init
weapon_set_area(18, -1);
global.sprDiscSeeker = sprite_add_weapon("Seeker Disc Gun.png", -2, 4);

#define weapon_name
return "SEEKER DISC GUN";

#define weapon_sprt
return global.sprDiscSeeker;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 12;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return "All you ever wanted";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
var _team = team;
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 5, 6)) {
	do {
		var t = instance_nearest(x, y, hitme);
		if (t && (t.team == _team || instance_is(t, prop) && t.object_index != Generator)) {
			t = instance_nearest(x, y, enemy);
			if (t && t.team == _team) t = noone;
		}
		if (t) {
			var tx = t.x, ty = t.y;
			if (!collision_line(x, y, tx, ty, Wall, 0, 0)) {
				var dir = point_direction(x, y, tx, ty);
				motion_add(point_direction(x, y, tx, ty),
					0.5 + (point_distance(x, y, tx, ty) < 48 + skill_get(21) * 48) * 4);
			}
			image_angle = direction;
		}
		direction += random(4) - 2;
		speed = 4 + random(4);
		wait 1;
	} while (instance_exists(self));
}