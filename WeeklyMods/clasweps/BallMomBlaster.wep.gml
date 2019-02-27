#define init
global.sprite = sprite_add_weapon("BallMomBlaster.png",2,4);

#define weapon_name
return "Ballmom Blaster";

#define weapon_sprt
return global.sprite;
 
#define weapon_type
return 4;

#define weapon_auto
return 0;

#define weapon_load
return 33;

#define weapon_cost
return 5;

#define weapon_swap
return sndSwapExplosive

#define weapon_area
return 24;

#define weapon_text
return "Always Believe in Your @wFamily";

#define weapon_fire
if instance_exists(self){
weapon_post(8,-4,6);
sound_play_pitchvol(sndFrogPistol,1.3,1);
sound_play_pitchvol(sndBallMamaFire,1.1,0.7);
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	sprite_index = sprFrogQueenBall;
	mask_index = mskFlakBullet;
	direction = other.gunangle + (random_range(5,-5) * other.accuracy)
	image_angle = direction
	speed = 6;
	damage = 5;
	force = 3;
	team = other.team
	creator = other
	alarm1 = 3;
	on_wall = script_ref_create(frogballwall);
	on_hit = script_ref_create(frogballhit);
	on_destroy = script_ref_create(frogballdestroy);
	on_step = script_ref_create(frogballstep);
	on_draw = script_ref_create(frogballdraw);
  }
}

#define frogballstep
if alarm1 >= 1{
alarm1 -= 1
}else{
if irandom(1) = 1{
    with instance_create(x, y, ToxicGas){
        motion_set(random(360), random_range(0.2,1.5))
	}
    }
}

#define frogballhit
projectile_hit(other,damage,force);
if other.my_health >= damage{
instance_destroy()
}else{
    with instance_create(x, y, ToxicGas){
        motion_set(random(360), random_range(0.2,2))
    }
}

#define frogballwall
instance_create(x,y,PortalClear)
instance_destroy()

#define frogballdestroy
repeat(15){
    with instance_create(x, y, ToxicGas){
        motion_set(random(360), random_range(0.2,2.5))
	}
}
repeat(15){
    with instance_create(x, y, EnemyBullet2){
        motion_set(random(360), random_range(2.5,4))
	image_angle = direction
	team = other.team
	}
}

#define frogballdraw
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1.0);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, 2*image_xscale, 2*image_yscale, image_angle, image_blend, 0.4);
draw_set_blend_mode(bm_normal);