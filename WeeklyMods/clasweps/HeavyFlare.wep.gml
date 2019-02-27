#define init
global.sprite = sprite_add_weapon("HeavyFlareGun.png",2,3);
global.sprflare = sprite_add("HeavyFlare.png",2,4,4);

#define weapon_name
return "HEAVY FLARE GUN";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 14;

#define weapon_cost
return 2;

#define weapon_swap 
return sndSwapFlame;

#define weapon_area
return 11;

#define weapon_text
return "Get Attention";

#define weapon_fire
sound_play_pitchvol(sndIncinerator,1.3,0.7)
sound_play_pitchvol(sndFlare,0.7,1.1)
weapon_post(5, -5, 5);
with instance_create(x,y,CustomProjectile) //custom projectile so it doesn't delete projectiles
{
	sprite_index = global.sprflare;
	speed = 11;
	friction = 0.3;
	direction = other.gunangle + (random_range(-3,3) * other.accuracy);
	image_angle = direction;
	team = other.team;
	damage = 15;
	force = 5;
	typ = 1;
	creator = other;
	on_step = script_ref_create(flarestep);
	on_destroy = script_ref_create(flaredie);
	image_speed = 0.5;
}

#define flarestep
with instance_create(x,y,Flame){
team = other.team;
direction = other.direction - (180 + random_range(3,-3));
speed = 2;
}
if speed <= 0{
instance_destroy()
}

#define flaredie
sound_play_pitchvol(sndFlareExplode,0.7,1);
for (i = 0; i < 360; i += 7.2){
with instance_create(x,y,Flame){
team = other.team;
direction = other.i + random_range(5,-5);
speed = 3 + (random_range(-2,2));
}
}
