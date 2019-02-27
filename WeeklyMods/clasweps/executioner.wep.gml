#define init
global.sprite = sprite_add_weapon("Executioner.png",2,4);

#define weapon_name
return "EXECUTIONER";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 200;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 19;

#define weapon_text
return "EVERYTHING FUCKING DIES";

#define weapon_fire
weapon_post(30,-30,50);
sound_play_pitchvol(sndEraser,0.7,1);
sound_play_pitchvol(sndSuperSlugger,0.7,0.7);
sdira = random_range(-15,15) * accuracy;
sdirb = random_range(-15,15) * accuracy;
sdirc = random_range(-15,15) * accuracy;
sdird = random_range(-15,15) * accuracy;
for(i = 0; i < 7; i += 1)
{
	with instance_create(x,y,Slug)
	{
		direction = other.gunangle + other.sdira;
		image_angle = direction;
		speed = other.i + 12;
		team = other.team;
		creator = other;
	}
	with instance_create(x,y,Slug)
	{
		direction = other.gunangle + other.sdirb;
		image_angle = direction;
		speed = other.i + 12;
		team = other.team;
		creator = other;
	}
	with instance_create(x,y,Slug)
	{
		direction = other.gunangle + other.sdirc;
		image_angle = direction;
		speed = other.i + 12;
		team = other.team;
		creator = other;
	}
	with instance_create(x,y,Slug)
	{
		direction = other.gunangle + other.sdird;
		image_angle = direction;
		speed = other.i + 12;
		team = other.team;
		creator = other;
	}
}