#define init
global.gun = sprite_add_weapon("a fucking gun.png",10,8)
#define weapon_name
return "A FUCKING GUN"
#define weapon_type
return 1
#define weapon_cost
return 1
#define weapon_area
return -1
#define weapon_load
return 3
#define weapon_swap
return sndSwapPistol
#define weapon_auto
return 0
#define weapon_melee
return 0
#define weapon_laser_sight
return 1
#define weapon_fire
weapon_post(30,10,5)
with instance_create(x,y,CustomProjectile){
	on_destroy = cooldie
	motion_set(other.gunangle,24)
	image_angle = direction
	sprite_index = sprBullet1
	team = other.team
	creator = other
	image_index = 1
	image_speed = 0
	sound_play_gun(sndHeavyRevoler,.3,.6)
}
with instance_create(x,y,CustomObject){
	on_step = shellstep
	image_xscale = 2
	image_yscale = 2
	sprite_index = sprHeavyShell
	depth = -8
	motion_add(other.gunangle + 90*other.right+random_range(-30,30),15+random(6))
}

#define weapon_reloaded
wkick = 0

#define weapon_sprt
return global.gun
#define weapon_text
return "holy shit hes got a fucking gun"

#define cooldie
sound_play(sndExplosion)
instance_create(x,y,Explosion)

#define shellstep
image_angle += 30+random(10)
if !point_seen(x,y,-1) instance_destroy()