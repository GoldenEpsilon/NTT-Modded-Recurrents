#define init
global.sprBloodDisc = sprite_add("Bloody Disc.png", 1, 6, 6);
global.sprBloodDiscGun = sprite_add_weapon("Bloody Disc Gun.png", -2, 4);

#define weapon_name
return "BLOODY DISC GUN";

#define weapon_sprt
return global.sprBloodDiscGun;

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
return 7;

#define weapon_text
return choose(
	"A COLD SKULLED KILLER",
	"BONE TO KILL"
);

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 6, 7)) {
	trail = false;
	sprite_index = global.sprBloodDisc;
	cd = 0;
	do {
		make_trail();
		cd += 1;
		// make the skull face the right side up when moving left:
		if (sign(image_yscale) != sign(hspeed)) image_yscale *= -1;
		// don't explode corpses when everyone's dead:
		if (instance_number(enemy) > 0) {
			// find the nearby corpse:
			var lx = x, ly = y;
			var nq = instance_nearest(lx, ly, Corpse);
			if (nq) { // if there's one,
				var nx = nq.x, ny = nq.y;
				var nd = point_distance(lx, ly, nx, ny);
				if (nd < 16 && cd >= 5) { // and it's close enough,
					cd = 0;
					dist += 100;
					with (nq) { // explode the corpse
						var nt = other.team;
						var nc = other.creator;
						sound_play(sndExplosion);
						sound_play(sndCorpseExplo);
						with (instance_create(nx, ny, BloodStreak)) {
							motion_add(point_direction(lx, ly, nx, ny), 8);
							image_angle = direction;
						}
						if (size > 1) {
							var i = random(360);
							repeat (3) {
								with (instance_create(nx + lengthdir_x(24, i), ny + lengthdir_y(24, i), MeatExplosion)) {
									team = nt;
									creator = nc;
								}
								i += 120;
							}
							with (instance_create(nx, ny, MeltSplat)) sprite_index = sprMeltSplatBig;
						} else {
							instance_create(nx, ny, MeltSplat);
							with (instance_create(nx, ny, MeatExplosion)) {
								team = -1;
								creator = nc;
							}
						}
						instance_destroy();
					} // with (nq)
				} // if (nd < X && cd > Y)
				else if (nd < 128 && nd > 8 && !collision_line(lx, ly, nx, ny, Wall, 0, 0)) {
					// home onto the corpse
					var _speed = speed;
					motion_add(point_direction(lx, ly, nx, ny), 0.5 + (nd < 64) * 2);
					speed = _speed;
				}
			} // if (nq)
		} // if (random)
		wait 1;
	} while (instance_exists(self));
}
#define make_trail
if (fork()) {
	with (instance_create(x, y, Effect)) {
		sprite_index = global.sprBloodDisc;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
		image_blend = c_red;
		// grow-vanish:
		repeat (5) {
			wait 1;
			if (!instance_exists(self)) exit;
			image_xscale += 0.1;
			image_yscale += 0.1;
			image_alpha -= 0.2;
		}
		instance_destroy();
	}
}