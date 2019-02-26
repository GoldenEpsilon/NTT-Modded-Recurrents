#define init
//global.sprName = sprite_add_weapon_base64("",0,0)
#define weapon_name
return "CANNONER"; 

#define weapon_type
return 1; 

#define weapon_cost
return 1;

#define weapon_area
return 1;

#define weapon_load
return 1;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_auto
return 0;

#define weapon_fire

sound_play(sndFlakCannon);

with instance_create(x, y, CustomProjectile){
	team = other.team;
	creator = other;
	motion_set(other.gunangle, 12);
	image_angle = direction;
	friction = .5;
	on_step = script_ref_create(cannon_step);
	on_destroy = script_ref_create(cannon_pop);
	if other.bwep != null {wep = other.bwep};
	else wep = 1
	sprite_index = sprDebris1
	damage = 0
}
wkick = 1

#define cannon_step
if speed <= 0 || place_meeting(x,y,Explosion) {instance_destroy()}

#define cannon_pop
var i = 0
repeat(8){
with FireCont accuracy = 1;
player_fire_ext(i, wep, x, y, team, self)
i += 45
}

#define weapon_sprt
return sprFlakCannon;

#define weapon_text
return "EIGHT RADICAL SHOTS";