#define init
global.sprMarker 		 = sprite_add_weapon("sprites/sprMarker.png", 3, 2);
global.sprMarkerBolt = sprite_add("sprites/projectiles/sprMarkerBolt.png",2,-2,3)
#define weapon_name
return "MARKER"

#define weapon_sprt
return global.sprMarker;

#define weapon_type
return 3;

#define weapon_auto
return false;

#define weapon_load
return 18;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapBow;

#define weapon_area
return 9;

#define weapon_text
return "UNSEEN ALLIES";

#define weapon_fire
weapon_post(6,-50,5)
sound_play_pitch(sndUltraCrossbow,random_range(3,4))
sound_play_pitch(sndHeavyCrossbow,random_range(2,3))
sound_play_pitch(sndSeekerPistol,random_range(1.6,2))
with instance_create(x,y,Bolt)
{
	name = "marker bolt"
	damage = 6
	team = other.team
	creator = other
	sprite_index = global.sprMarkerBolt
	motion_add(other.gunangle+random_range(-2,2),24)
	image_angle = direction
}

#define step
with BoltStick{
	if sprite_index = global.sprMarkerBolt && instance_exists(target){
		name = "marker bolt"
		if target.speed > .5 target.speed = .5
		if "spawn" not in self
		{
			with instance_create(x,y,CustomObject)
			{
				tar_width  = 80
				tar_height = 80
				team   = 2
				ammo   = 25
				timer  = 45
				target = other.target
				on_step = volley_step
			}
			spawn = 1
		}
	}
}

#define volley_step
if instance_exists(target)
{
	x = target.x
	y = target.y
}
timer-=current_time_scale
if timer <= 0{
	ammo--
	repeat(2) with instance_create(x+lengthdir_x(random(tar_width),random(360)),y+lengthdir_y(random(tar_height),random(360)),CustomProjectile){
		name = "volley arrow"
		depth = -10
		sprite_index = sprBolt
		mask_index   = mskNothing
		image_index  = 1
		image_speed  = 0
		direction    = random(360)
		image_angle = 270
		force = 0
		damage = 6
		team = other.team
		z = irandom_range(300,350)
		zstart = z
		on_step = rainarrow_step
		on_wall = rainarrow_wall
		on_draw = rainarrow_draw
	}
	timer = 1
}
else sound_play_pitch(sndEnemySlash,1-timer/300)
if ammo <= 0 instance_destroy()

#define rainarrow_wall
var wall = other
with instance_create(x,y-z-4,CustomObject){
    image_angle = 270
    sprite_index = sprBolt
    image_index = 1
    image_speed = 0
    depth = -10
    if fork(){
        repeat(30){
            wait(1)
            if !instance_exists(wall) break
        }
        if instance_exists(self) instance_destroy()
        exit
    }
}
with instance_create(x,y,Dust) depth = -10
sound_play_pitch(sndBoltHitWall,random_range(.8,1.2))
sound_play_pitch(sndHitWall,random_range(.8,1.2))
instance_destroy()


#define rainarrow_step
z -= current_time_scale*20
if z <= 25 {
    mask_index = mskBolt;
    depth = TopCont.depth+1
    if skill_get(mut_bolt_marrow){
        var q = mod_script_call_self("mod", "defpack tools", "instance_nearest_matching_ne", x, y, hitme, "team", team)
        if instance_exists(q) && point_distance(x, y, q.x, q.y) < 30{
            x = q.x
            y = q.y
        }
    }
}
/*with instance_create(x,y - z,BoltTrail){
    image_angle = point_direction(x,y,other.xprevious,other.yprevious - other.z + 20*current_time_scale)
    image_xscale = point_distance(x,y,other.xprevious,other.yprevious - other.z + 20*current_time_scale)
    depth = other.depth
    image_yscale /= 2
}*/

if z < 0
{
    if place_meeting(x,y,Floor){
        with instance_create(x,y,CustomObject){
            image_angle = 270
            sprite_index = sprBolt
            image_index = 1
            image_speed = 0
            if fork(){
                repeat(30){
                    wait(1)
                }
                if instance_exists(self) instance_destroy()
                exit
            }
        }
    }
	instance_create(x,y-z,Dust)
	sound_play_pitch(sndBoltHitWall,random_range(.8,1.2))
	sound_play_pitch(sndHitWall,random_range(.8,1.2))
	view_shake_at(x,y,2)
	instance_destroy()
}

#define rainarrow_draw
draw_sprite_ext(shd16,0,x,y,.3,1,0,c_white,(1-z/zstart)*.4)
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,270,image_blend,image_index)
