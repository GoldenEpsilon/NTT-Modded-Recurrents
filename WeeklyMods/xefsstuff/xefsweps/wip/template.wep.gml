#define init
global.sprzzz0 = sprite_add_weapon("", 0, 0);
global.sprzzz1 = sprite_add_base64("", 1, 0, 0);

#define weapon_name
return "TEMPLATE";
#define weapon_sprt
return global.sprzzz0;
#define weapon_type
return 1;
#define weapon_auto
return false;
#define weapon_load
return 1;
#define weapon_cost
return 0;
#define weapon_swap
return sndSwapMachinegun;
#define weapon_area
return -1;
#define weapon_text
return "XEFSTEMPLATE";

#define weapon_fire

script_bind_step(zzzStep, 0, id);
	
on_hit = script_ref_create(zzzHurt);
on_wall = script_ref_create(zzzWall);

#define step

#define zzzStep(Me)
with(Me) {

}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define zzzHurt
if ((other.team != team) && (other.sprite_index != other.spr_hurt)) {
	projectile_hit(other, damage, knockback, direction);
}

#define zzzWall
