#define init
global.sprEliteTurretBase = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAIVBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6acFB/8OAD/hi////+Fy4/tAAAAAXRSTlMAQObYZgAAAHxJREFUeNrtz0EOgCAMRFGY1qL3v7CTBoJmcGHi0p+Ai9cAlr9Sew+49VYDxLZnjQOqjXoweqMLp6a/Z1wPh7AB9FTAlM0A9G3Fbly5LbiaEyOcH6v648BggCo871auTsq7GVyf5jE43JRJkXFkwfPlwuzORbqyKhtcvuoEdskExatDf54AAAAASUVORK5CYII=",1,15,11);
global.sprEliteTurretOff = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAGFBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6b///9YYok6AAAAAXRSTlMAQObYZgAAAGxJREFUeAHtzzEOA0EIQ1GwHe5/5Egr2Gxk0k2ZX0zzkGAi/mX3A1/dNtDYA7u6n2E8FcYEbgSdSQD9bCySup6Fk6JUJVFM/zgwDGQ4f3Y7p8DZTchPUw2X1stVVxJXvi93jm8O68mxNRynegPfrAP/eVc7fQAAAABJRU5ErkJggg==",1,15,11);
global.sprEliteTurretTop = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAElBMVEUAAAAAAAA6NklKVHOCi6b8OACtGpAnAAAAAXRSTlMAQObYZgAAAEdJREFUeAHtyTEKgEAQQ9FJsvc/sylGGMJqLbK/+cWrj4TuAaW15IAttnpAqKY6vKqEyanJocFM5WQ7p9IakbeStYtdnX7bBb/LAe7oNWapAAAAAElFTkSuQmCC",1,15,11);
global.sprEliteTurretSpawn = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAYYAAAAeCAMAAAAfHElNAAAAIVBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6acFB/8OAD/hi////+Fy4/tAAAAAXRSTlMAQObYZgAAAc9JREFUeNrtl2FvwjAMRGM7tOX//+GVrVFDjPbEEoLQfBLth4MK3bvabQqFQqHQ/5YcSqF3Qsh5WfKuADGv7x5CobCfAsR7+i65prArOIwW991TyDk4jBb3XVoKgWH89Oe+S+MFhhdMf+67WEvBAsPw6c99F7Pas6DwiunPfZeLWfHMLkFhGIWn+i66rnZoXTUwPL+Eefpz38VU1227XrdtVY2Z5ILmJczTn/suZqaqP4dYDT5oXsI8/bnvYpZt/3wfPgmDHOpzOWhewjz9ue8ilu3n4pZN5DM72+9y0N6E6f9U30W1YFCVP2ZCpU0TOtvhQtC0hHn6c99Fz3tlLAZed6fApc52uRA0LmGe/tx3yWrlXjHNMhbDLzlLI3Chsx0uBM1LmKc/910sLwXDkm0aBnFy7vGftbjQ2Q4XgoYlDNOf+n5eeimLxQSCnoehNOd2Ki50tsOFoGEJ0/Tnvoudv52OQQ95DFpTaO9w39k+l4PmJcxPO/d9926NIU3cDVqp/UJDQe/dtrP97qk66NTqfgmn55526qATuBOflLSSd2sK3j072+t6laAfefUS9m49/dMDlaBTAnfue4OD4NwCwevmjHdZJWhwQ6HQWH0BlfIfEINqErAAAAAASUVORK5CYII=",13,15,11);

global.sprTurretDisc = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAMCAMAAABP7o1HAAAAElBMVEUAAAAAAACcFB/8OAD/hi////9FE7TRAAAAAXRSTlMAQObYZgAAAExJREFUeAF90G0KgDAMg+G+ae5/ZjWMIbOYP3vCYB+tBLKcBgkGq++I0ashbxedYrPdsWyDbbHcjz8bvVyFX0eF8Xl56PGJ8f8H55FcCc0BxRgu5pMAAAAASUVORK5CYII=",2,6,6);
global.sprTurretLaser = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAAHCAMAAAD+ktemAAAADFBMVEX8OAD8OAD/hi/////ioDGYAAAAAXRSTlN/gFy0ywAAABJJREFUCNdjYGBgZGACQ0YGBgAARgAJFbJu0QAAAABJRU5ErkJggg==",1,0,3.5);

global.turretdrawer = noone;
global.turretcount = 0;

#define step

with(Turret) if global.turretcount < (floor(GameCont.loops/2) + 1){
	if ("triedforeliteturret" not in self) && (random(10) > 4) {
		triedforeliteturret = 1;
		global.turretcount += 1;
		with instance_create(x,y,CustomObject) {
			sprite_index = global.sprEliteTurretSpawn;
			image_speed = 0.4;
			scanarc = 30;
			scanangle = random(360);
			scanrange = 150;
			rotmode = choose(-1,1);
			beamshake = 1;

			target = noone;
			timetozero = 15;
			zeroing = 0;
		
			beamcharge = 0; // I forgot what this does
			lasercharge = 0; // this is for the actual laser
			reload = 0;
		
			weptype = choose(c_red,c_orange); // red = disk, c_orange = beam
		
			laserlength = 0;
		}
		instance_destroy();
	}
	else triedforeliteturret = 1;
}

if !instance_exists(global.turretdrawer) && (global.turretcount > 0){
	global.turretdrawer = instance_create(0, 0, CustomObject);
	with(global.turretdrawer){
		script_bind_draw(beamdraw, -0.1);
	}
}

// Actual code start
with(CustomObject) if (sprite_index = global.sprEliteTurretBase) || (sprite_index = global.sprEliteTurretOff) || (sprite_index = global.sprEliteTurretSpawn) {
	if ((instance_number(enemy) > 0) || (mod_exists("mod", "testenv"))) && (sprite_index = global.sprEliteTurretBase) {
		scanangle += rotmode;
		with(Player) if (abs(angle_difference(other.scanangle,point_direction(other.x,other.y,x,y))) < other.scanarc) && (distance_to_object(other) < other.scanrange) && (collision_line(other.x,other.y,x,y,Wall,0,0) < 0) {
			if other.target = noone other.target = self;
			other.zeroing = 150;
		}

		if target = noone {
			beamcharge -= beamcharge/30;
			beamshake = 0.5;
			if rotmode > 0 rotmode += (1-rotmode)/30;
			else if rotmode < 0 rotmode += (-1-rotmode)/30;
			else rotmode = 0;

			if lasercharge > 0 lasercharge += (-1 - lasercharge)/60
		}
		else {
			beamshake = 3;
			if zeroing <= 0 target = noone;
			with(Player) {
				if (abs(angle_difference(other.scanangle,point_direction(other.x,other.y,x,y))) > other.scanarc) || (distance_to_object(other) > other.scanrange) || (collision_line(other.x,other.y,x,y,Wall,0,0) > 0)  other.zeroing -= 1;
				else other.beamcharge += (other.scanarc - other.beamcharge)/other.timetozero;

				if (abs(angle_difference(other.scanangle,point_direction(other.x,other.y,x,y))) < other.scanarc) && (distance_to_object(other) < other.scanrange) && (collision_line(other.x,other.y,x,y,Wall,0,0) < 0) {
					other.rotmode = -(angle_difference(other.scanangle,point_direction(other.x,other.y,x,y)))/5
				}
			}
		
			if ((scanarc - beamcharge) < 1) && (reload <= 0){
				if weptype = c_red {
					with(instance_create(x,y,Disc)) {
						team = 1;
						creator = other;
			
						direction = other.scanangle;
						image_angle = direction;
						speed = 5;
				
						sprite_index = global.sprTurretDisc;
				
						damage = 3;
					}
					sound_play_gun(sndGunGun, 0.25, -0.5);
					reload = 15;
				}
				else if weptype = c_orange {
					lasercharge += (1 - lasercharge)/30;
				}
			}
			else if reload > 0 reload -= 1;
		}
		if lasercharge > 0 {
			var laserlength = findbeam(x,y,scanangle,scanrange*2);
			with(Player) if ((abs(angle_difference(other.scanangle,point_direction(other.x,other.y,x,y)))) < 5) && (distance_to_object(other) <= laserlength) && (sprite_index != spr_hurt) {
				sprite_index = spr_hurt;
				image_index = 0;
				sound_play(snd_hurt);
				my_health -= floor(other.lasercharge*4);
			}
		}
	}
	else if ((sprite_index = global.sprEliteTurretSpawn) && (image_index > 11)) sprite_index = global.sprEliteTurretBase;
	else if ((sprite_index != global.sprEliteTurretOff) && (sprite_index != global.sprEliteTurretSpawn)) sprite_index = global.sprEliteTurretOff;
}

if GameCont.area != 6 global.turretcount = 0;

#define findbeam(x, y, angle, max)
var l;
for (l = 0; ((l < (max)) && (!collision_point(x+lengthdir_x(l,angle),y+lengthdir_y(l,angle),Wall,0,1))); l += 1){}
return l;

#define beamdraw
with(CustomObject) if (sprite_index = global.sprEliteTurretBase) || (sprite_index = global.sprEliteTurretOff) {
	if (instance_number(enemy) > 0) || (mod_exists("mod", "testenv")) {
		var drawscanangle = scanangle + scanarc - beamcharge;
		repeat(5){
			var scanlength = findbeam(x,y,drawscanangle,scanrange);
			draw_line_width_colour(
				x, y,
				x+lengthdir_x(scanlength,drawscanangle+random_range(-beamshake,beamshake)), y+lengthdir_y(scanlength,drawscanangle+random_range(-beamshake,beamshake)),
				1.5, weptype, weptype);
			drawscanangle -= (scanarc - beamcharge)/2;
		}
		if (lasercharge > 0){
			var laserlength = findbeam(x,y,scanangle,scanrange*2);
			instance_create(x+lengthdir_x(laserlength,scanangle),y+lengthdir_y(laserlength,scanangle),Smoke);
			draw_sprite_ext(
				global.sprTurretLaser, 0, 
				x, y, 
				laserlength, lasercharge*1.75, 
				scanangle, c_white, 1);
			draw_set_blend_mode(bm_add)
			draw_sprite_ext(
				global.sprTurretLaser, 0, 
				x, y, 
				laserlength, lasercharge*1.75*2, 
				scanangle, c_white, 0.1);
			draw_set_blend_mode(bm_normal)
		}
	}
	draw_sprite(global.sprEliteTurretTop, 0, x, y)
}