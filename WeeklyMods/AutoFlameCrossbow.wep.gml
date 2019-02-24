#define init
global.sprAutoFireBow = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABEAAAAJCAYAAADU6McMAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTczbp9jAAAAiUlEQVQoU42P0QmAMAxEu4GfggP4ofgrfna0DuMkziVoz3ohqVEUHk0ul6sNMYXf5O8AD70WvkDANpQgILo2XcJtIN4cQcfayNwYaJrGWUDvoYMydohFGHiy3pdS696EdG1vgIk1w2sQJiF8grfE3nsyAnAZahFJbaZRa/gLnNRl4Q1t9vqYQjgBsZGk32d0YqMAAAAASUVORK5CYII=", 2, 2);

#define weapon_name
return "AUTO FLAME CROSSBOW";

#define weapon_sprt
return global.sprAutoFireBow;

#define weapon_type
return 3;

#define weapon_auto
return true;

#define weapon_load
return 8;

#define weapon_cost
return 1;

#define weapon_area
return 6;

#define weapon_swap
return sndSwapBow;

#define weapon_text
return "MOLTEN FURY";

#define weapon_fire
with instance_create(x,y,Bolt)
{
	sprite_index = sprBolt;
	bowbolt = 1;
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
		if(speed > 1){
			repeat(2)with instance_create(x,y,Flame){
				creator = other;
				team = creator.team;
				force = 1;
				direction = random_range(0, 360);
				image_angle = direction;
				speed = 4;
				friction = 0.1;
				sound_play(sndBurn);
				damage = 2;
			}
		}
		wait(1);
	}
}