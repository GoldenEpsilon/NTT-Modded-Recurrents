weapon_set_area(65,-1)
weapon_set_name(65,"old smartgun")
global.cooldown = 0

#define weapon_name
	return "SMART GUN";

#define weapon_type
	return 1;

#define weapon_cost
	return 1;

#define weapon_load
	return 3;

#define weapon_auto
	return 1;

#define weapon_area
	return 10;

#define weapon_swap
	return sndSwapMachinegun;

#define weapon_sprt
	if instance_is(self, Player) and wep = "smartgun" and "legs" not in self
	return mskNone;
	else
	return sprSmartGun;
#define weapon_sprt_hud
    return sprSmartGun
#define weapon_text
	return "auto aim";
	
#define weapon_fire

if instance_exists(enemy)
with instance_create(x,y,Bullet1)
    {
    if instance_exists(Player){
    creator = instance_nearest(x,y,Player);
    var near_=instance_nearest(mouse_x[creator.index],mouse_y[creator.index],enemy)
    motion_add(point_direction(x+creator.hspeed,y+creator.vspeed,near_.x+near_.hspeed,near_.y+near_.vspeed)+(random_range(-4,4)*creator.accuracy),16)
    image_angle = direction
    team = creator.team
    sprite_index = sprIDPDBullet
    spr_dead = sprIDPDBulletHit
    with instance_create(x,y,Shell)
    	motion_add(other.direction+180+random(50)-25,2+random(2))
    creator.gunangle = direction
    global.cooldown = 12
    }
}
else
with instance_create(x,y,Bullet1)
    {
    if instance_exists(Player){
    creator = instance_nearest(x,y,Player);
    motion_add(creator.gunangle+(random_range(-4,4)*creator.accuracy),16)
    image_angle = direction
    team = creator.team
    sprite_index = sprIDPDBullet
    spr_dead = sprIDPDBulletHit
    with instance_create(x,y,Shell)
    	motion_add(other.direction+180+random(50)-25,2+random(2))
    }
}
sound_play(sndGruntFire)
weapon_post(4, -6, 3);

#define step
if wep = "smartgun" and "legs" not in self
if gunangle>180{
script_bind_draw(drawgun,depth-1,self)
}
else {
script_bind_draw(drawgun,depth+1,self)
} 
#define drawgun(cre)

with cre
if instance_exists(enemy) and global.cooldown > 0{
var near_=instance_nearest(mouse_x[index],mouse_y[index],enemy)
var ang_ =point_direction(x,y,near_.x+near_.hspeed,near_.y+near_.vspeed)
draw_sprite_ext(sprSmartGun,0,x+lengthdir_x(wkick,ang_+180),y+lengthdir_y(wkick,ang_+180),1,right,ang_,c_white,1)
global.cooldown -= 1
}
else
draw_sprite_ext(sprSmartGun,0,x,y,1,right,gunangle,c_white,1)

instance_destroy()