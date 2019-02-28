#define init
global.sprLightningDisc = sprite_add("Lightning Disc.png", 2, 6, 6);
global.sprLightningDiscGun = sprite_add_weapon("Lightning Disc Gun.png", -2, 4);

#define weapon_name
return "LIGHTNING DISC GUN";

#define weapon_sprt
return global.sprLightningDiscGun;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 11;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 6;

#define weapon_text
return "CAUTION: DO NOT USE NEAR WATER";

#define weapon_fire
sound_play(sndDiscgun);
weapon_post(4, -10, 6);
with (mod_script_call("mod", "Disc Tools", "disc_fire", 2, 5, 5)) {
	sprite_index = global.sprLightningDisc;
	var t = 0;
	wait 10;
	do {
		if (random(4) < 1) with (instance_create(x, y, Lightning)) {
			image_angle = random(360);
			team = other.team;
			hitid = other.hitid;
			ammo = round(lerp(3, min(3 + t / 5, 7), power(random(1), 2)));
			alarm0 = 1;
			visible = false;
			with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
		}
		t += 1;
		wait 1;
	} while (instance_exists(self));
}
