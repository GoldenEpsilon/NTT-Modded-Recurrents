#define init
global.sprMaxigun = sprite_add_weapon("Big Gun.png", 20, 16);
global.sprMaxibullet = sprite_add("Big Bullet.png",2,42,22)
global.sprMaxishell = sprite_add("Big Shell.png",0,3,5)
global.sprMaxibulletHit = sprite_add("big bullet hit.png",4,24,24)
#define weapon_name
return "DOUBLE MAXIGUN";

#define weapon_sprt
return global.sprMaxigun;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 1	;

#define weapon_cost
return 6;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 404;

#define weapon_text
return choose("BUT CAN THEY OUTSMART @yBULLET?","@yBULLET @sMETA SAVED");

#define weapon_fire
sound_play(sndHyperRifle)
sound_play(sndMinigun)
sound_play(sndTripleMachinegun)
weapon_post(14,0,40)
with instance_create(x,y,Shell) {
	motion_add(other.gunangle+other.right*100+random(80)-40,3+random(2))
	sprite_index = global.sprMaxishell
	mask_index = mskHeavyBullet
}

with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),CustomProjectile){
	sprite_index = global.sprMaxibullet
	move_contact_solid(other.gunangle,4)
	motion_add(other.gunangle+12+random_range(-9,9)*other.accuracy,20)
	image_angle = direction
	team = other.team
	damage = 50
	speed += 6
	recycle_amount = 3
	creator = other
	on_destroy = bb_destroy
	on_wall = bb_wall
	on_draw = bb_draw
	on_step = bb_step
	on_hit = bb_hit
}
with instance_create(x+lengthdir_x(20,gunangle),y+lengthdir_y(20,gunangle),CustomProjectile){
	sprite_index = global.sprMaxibullet
	move_contact_solid(other.gunangle,4)
	motion_add(other.gunangle-12+random_range(-9,9)*other.accuracy,20)
	image_angle = direction
	team = other.team
	damage = 50
	speed += 6
	recycle_amount = 3
	creator = other
	on_destroy = bb_destroy
	on_wall = bb_wall
	on_draw = bb_draw
	on_step = bb_step
	on_hit = bb_hit
}
motion_add(gunangle+180,4-skill_get(2)*1.8)

#define bb_destroy
with instance_create(x,y,BulletHit){sprite_index = global.sprMaxibulletHit}

#define bb_wall
if irandom(7) = 1
{
	with other{instance_create(x,y,FloorExplo);instance_destroy()}
}
sound_play_pitchvol(sndHitWall,1,100/distance_to_object(creator))
instance_destroy()

#define bb_hit
projectile_hit(other, damage, force, direction);
if instance_exists(creator) if recycle_amount != 0 && irandom(9) <= 5 && skill_get(16){
	creator.ammo[1]+=recycle_amount
	if creator.ammo[1] > creator.typ_amax[1] {creator.ammo[1] = creator.typ_amax[1]}
	sound_play_pitchvol(sndRecGlandProc, 1, 7)
}
if instance_exists(creator) if recycle_amount != 0 && skill_get("recycleglandx10"){
	creator.ammo[1]+= 10*recycle_amount
	if creator.ammo[1] > creator.typ_amax[1] {creator.ammo[1] = creator.typ_amax[1]}
	sound_play_pitchvol(sndRecGlandProc, 1, 7)
}
sound_play_pitchvol(sndHitWall,1,100/distance_to_object(creator))
instance_destroy()

#define bb_draw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.05);
draw_set_blend_mode(bm_normal);

#define bb_step
if image_index >= 1{
	image_speed = 0
}
