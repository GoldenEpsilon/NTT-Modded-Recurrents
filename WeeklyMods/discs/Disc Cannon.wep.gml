#define init
global.sprCannonDisc = sprite_add("Mini Disc.png", 2, 6, 6);
global.sprDiscCannon = sprite_add_weapon("Disc Cannon.png", -2, 4);

#define weapon_name
return "DISC CANNON";

#define weapon_sprt
return global.sprDiscCannon;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 15;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 5;

#define weapon_text
return "";

#define weapon_fire
sound_play_gun(sndDiscgun, 0.2, -0.3);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 8, 6)) {
	friction = 0.2;
	do {
		if (speed <= 0.1) {
			var n = 11;
			gunangle = random(360);
			repeat (n) {
				with (mod_script_call("mod", "Disc Tools", "disc_fire", 0, 2, 4)) {
					sprite_index = global.sprCannonDisc;
					dist = 100;
					if (fork()) {
						var i = 0;
						while (instance_exists(self) && speed < 10) {
							speed += 20 / (i + 10);
						}
						exit;
					}
				}
				gunangle += 360 / n;
			}
			instance_destroy();
			exit;
		}
		wait 1;
	} while (instance_exists(self));
}
