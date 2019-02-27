#define init
global.sprite = sprite_add_weapon("ExplosionPistol.png",3,4);

#define weapon_name
return "Explosion Pistol";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 6;

#define weapon_text
return "Pure Explosions";

#define weapon_fire
weapon_post(9,-9,15);
sound_play_pitchvol(sndExplosion,1.1,2);
for(i = 35; i < 200; i += 45)
{
	with instance_create(x+lengthdir_x(other.i,other.gunangle+random_range(3,-3)),y+lengthdir_y(other.i,other.gunangle+random_range(3,-3)),SmallExplosion)
	{
		creator = other;
	}
}
motion_add(gunangle,-7);