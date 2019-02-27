#define init
global.sprite = sprite_add_weapon("PopoExplosionGun.png",3,4);

#define weapon_name
return "IDPD Explosion Gun";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 55;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return -1;

#define weapon_text
return "@bIDPD @sPrototype";

#define weapon_fire
weapon_post(12,-12,25);
sound_play_pitchvol(sndExplosion,1.1,0.5);
sound_play_pitchvol(sndIDPDNadeExplo,1.1,1);
	with instance_create(x+lengthdir_x(80,other.gunangle+random_range(3,-3)),y+lengthdir_y(80,other.gunangle+random_range(3,-3)),PopoExplosion)
	{
		creator = other;
		team = other.team
		damage = 20;
	}
	with instance_create(x+lengthdir_x(135,other.gunangle+random_range(3,-3)),y+lengthdir_y(135,other.gunangle+random_range(3,-3)),Explosion)
	{
		sprite_index = sprRogueExplosion
		creator = other;
		team = other.team
		damage = 15;
	}