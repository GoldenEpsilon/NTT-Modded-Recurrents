#define init
global.sprBoltshard = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTczbp9jAAAAdUlEQVQ4T2MYBcML/EfDFIH/OVUtcAziQ4RxA2SbsSn+3zVtHhyD+BBh3OC/T1gsugvAGMRHlkOSRwEomuL11XBikGHoGKoPBfy3lxSGY2QDQHyQPDom5EIQQDEUxEfC6ICgC0EA2QCsCtAAqepHwSjADhgYALvZfsmPb/HxAAAAAElFTkSuQmCC", 4, 9);

#define weapon_name
return "BOLTSHARD";

#define weapon_sprt
return global.sprBoltshard;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 40;

#define weapon_cost
return 3;

#define weapon_area
return 12;

#define weapon_swap
return sndSwapBow;

#define weapon_text
return "SO MESSY..";

#define weapon_fire
with instance_create(x,y,Bolt)
{
	sprite_index = sprBolt;
	creator = other;
	team = creator.team;
	force = 8;
	direction = other.gunangle;
	image_angle = direction;
	speed = 24;
	friction = 0;
	sound_play(sndCrossbow);
	damage = 16;
	while(instance_exists(self)){
		if(speed < 1){
			image_xscale = 1;
			image_yscale = 1;
			with instance_create(x,y,Splinter){
				creator = other;
				team = creator.team;
				force = 1;
				direction = creator.direction - (180 - random_range(-45, 45));
				image_angle = direction;
				speed = 24;
				friction = 0;
				sound_play(sndSplinterPistol);
				damage = 2;
			}
		}
		wait(1);
	}
}