#define init
global.sprite = sprite_add_weapon("Explosiongun.png",3,4);

#define weapon_name
return "Explosion Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 9;

#define weapon_text
return "Boom Boom";

#define weapon_fire
weapon_post(9,-9,15);
sound_play_pitchvol(sndExplosionL,1.1,2);
for(i = 64; i < 200; i += 55)
{
	with instance_create(x+lengthdir_x(other.i,other.gunangle+random_range(3,-3)),y+lengthdir_y(other.i,other.gunangle+random_range(3,-3)),Explosion)
	{
		creator = other;
	}
}
motion_add(gunangle,-7);