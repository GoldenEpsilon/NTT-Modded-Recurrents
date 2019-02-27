#define init
global.spr_wep = sprite_add_weapon("sprites/sprIDPDSlugger.png",3,4);
global.spr_loadout = sprite_add_weapon("sprites/sprIDPDPistolLoadout.png",24,24);

#define weapon_name
return "I.D.P.D. SLUGPISTOL";

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 12;

#define weapon_cost
return 1;

#define weapon_sprt
return global.spr_wep;

#define weapon_loadout
return global.spr_loadout;

#define weapon_swap
return sndSwapPistol;

#define weapon_melee
return false;

#define weapon_lasersight
return false;

#define weapon_gold
return false;

#define weapon_area
return -1;

#define weapon_text
return "BACKUP IS HERE";

#define weapon_fire

	// KICK, CAMERA SHIFT, SCREENSHAKE
	weapon_post(2, 6, 3);

	// PLAYING SOUNDS
	sound_play_pitchvol(sndRogueRifle,random_range(0.85,1.15),1);

	// CREATING BULLET
	repeat(1) with instance_create(other.x, other.y, PopoSlug)
	{
		direction = (other.gunangle + irandom_range(-2,2));
		motion_add(direction,16);
		image_angle = direction;
		image_xscale = 0.6;
		team = other.team;
		creator = other;
	}