weapon_set_area(wep_heavy_grenade_launcher,-1)
weapon_set_name(wep_heavy_grenade_launcher,"old heavy grenade launcher")
global.cooldown = 0

#define weapon_name
	return "HEAVY GRENADE LAUNCHER";

#define weapon_type
	return 4;

#define weapon_cost
	return 2;

#define weapon_load
	return 26;

#define weapon_auto
	return 0;

#define weapon_area
	return 8;

#define weapon_swap
	return sndSwapExplosive;

#define weapon_sprt
	return sprHeavyNader;
#define weapon_text
	return "peircing mades it better";
#define weapon_reloaded
sound_play(sndNadeReload)
#define weapon_fire
sound_play(sndHeavyNader)
weapon_post(8, -6, 3);
with instance_create(x,y,CustomProjectile){
        sprite_index = sprHeavyNade
        damage = 30
        friction = 0.4
        direction = other.gunangle+(random_range(-5,5)*other.accuracy)
        image_angle = direction
        speed = 11+random(2)
        alarm0 = 50
        maxspeed = speed
        force = 10
        typ = 1
        team = other.team
        creator = other
        hitid = [sprHeavyNade,"HEAVY NADE"]
        on_step = CustomHeavyNade
        on_hit  = CustomHeavyNade_hit
        on_wall = CustomHeavyNade_wall
        on_destroy = CustomHeavyNade_destroy
    }
    
#define CustomHeavyNade


if alarm0>0{ 
    alarm0--
    if alarm0>40 and random(2)<1 instance_create(x,y,Smoke)
    if alarm0<20 
    if (alarm0 mod 4 < 2 )
        sprite_index = sprHeavyGrenadeBlink
        else
        sprite_index = sprHeavyNade
    image_angle += speed
    if place_meeting(x,y,Slash){
        speed = maxspeed
        direction = instance_nearest(x,y,Slash).direction
        }
    if place_meeting(x,y,Shank)
        instance_destroy()
    if place_meeting(x,y,EnergySlash){
        speed = maxspeed
        direction = instance_nearest(x,y,EnergySlash).direction
        }
    if place_meeting(x,y,EnergyHammerSlash){
        speed = maxspeed
        direction = instance_nearest(x,y,EnergyHammerSlash).direction
        }
    if place_meeting(x,y,LightningSlash){
        speed = maxspeed
        direction = instance_nearest(x,y,LightningSlash).direction
        }
    if place_meeting(x,y,EnergyShank)
        instance_destroy()
    if place_meeting(x,y,Explosion)
        instance_destroy()
}
else if alarm0=0
    instance_destroy()
#define CustomHeavyNade_hit
with nearest_instance_but_not_this_team(x,y,hitme,team)
    if my_health>other.damage*(other.speed/other.maxspeed){
        my_health -= other.damage*(other.speed/other.maxspeed)
        with other{
            instance_destroy()
        }
    }
    else 
    my_health = 0

#define CustomHeavyNade_wall
sound_play(sndHitWall)
instance_create(x,y,Dust)
move_bounce_solid(1)
speed *= 0.8
image_angle = direction
#define CustomHeavyNade_destroy
with instance_create(x,y,GreenExplosion) hitid = [sprGreenExplosion,"HEAVY EXPLOSION"]
sound_play(sndExplosionL)
#define nearest_instance_but_not_this_team(_x, _y, _instances,_team)
	var	_nearest = noone,
		d = 1000000;

	with(instances_matching_ne(_instances,"team",_team)){
		var _dis = point_distance(_x, _y, x, y);
		if(_dis < d){
			_nearest = id;
			d = _dis;
		}
	}

	return _nearest;