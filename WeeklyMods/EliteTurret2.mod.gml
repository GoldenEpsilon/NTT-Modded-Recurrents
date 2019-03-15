#define init
global.sprEliteTurretBase = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAIVBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6acFB/8OAD/hi////+Fy4/tAAAAAXRSTlMAQObYZgAAAHxJREFUeNrtz0EOgCAMRFGY1qL3v7CTBoJmcGHi0p+Ai9cAlr9Sew+49VYDxLZnjQOqjXoweqMLp6a/Z1wPh7AB9FTAlM0A9G3Fbly5LbiaEyOcH6v648BggCo871auTsq7GVyf5jE43JRJkXFkwfPlwuzORbqyKhtcvuoEdskExatDf54AAAAASUVORK5CYII=",1,14,11);
global.sprEliteTurretOff = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAGFBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6b///9YYok6AAAAAXRSTlMAQObYZgAAAGxJREFUeAHtzzEOA0EIQ1GwHe5/5Egr2Gxk0k2ZX0zzkGAi/mX3A1/dNtDYA7u6n2E8FcYEbgSdSQD9bCySup6Fk6JUJVFM/zgwDGQ4f3Y7p8DZTchPUw2X1stVVxJXvi93jm8O68mxNRynegPfrAP/eVc7fQAAAABJRU5ErkJggg==",1,14,11);
global.sprEliteTurretTop = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAMAAAAM7l6QAAAAElBMVEUAAAAAAAA6NklKVHOCi6b8OACtGpAnAAAAAXRSTlMAQObYZgAAAEdJREFUeAHtyTEKgEAQQ9FJsvc/sylGGMJqLbK/+cWrj4TuAaW15IAttnpAqKY6vKqEyanJocFM5WQ7p9IakbeStYtdnX7bBb/LAe7oNWapAAAAAElFTkSuQmCC",1,14,11);
global.sprEliteTurretSpawn = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAYYAAAAeCAMAAAAfHElNAAAAIVBMVEUAAAAAAAAZFC46NklKVHNjCRGCi6acFB/8OAD/hi////+Fy4/tAAAAAXRSTlMAQObYZgAAAc9JREFUeNrtl2FvwjAMRGM7tOX//+GVrVFDjPbEEoLQfBLth4MK3bvabQqFQqHQ/5YcSqF3Qsh5WfKuADGv7x5CobCfAsR7+i65prArOIwW991TyDk4jBb3XVoKgWH89Oe+S+MFhhdMf+67WEvBAsPw6c99F7Pas6DwiunPfZeLWfHMLkFhGIWn+i66rnZoXTUwPL+Eefpz38VU1227XrdtVY2Z5ILmJczTn/suZqaqP4dYDT5oXsI8/bnvYpZt/3wfPgmDHOpzOWhewjz9ue8ilu3n4pZN5DM72+9y0N6E6f9U30W1YFCVP2ZCpU0TOtvhQtC0hHn6c99Fz3tlLAZed6fApc52uRA0LmGe/tx3yWrlXjHNMhbDLzlLI3Chsx0uBM1LmKc/910sLwXDkm0aBnFy7vGftbjQ2Q4XgoYlDNOf+n5eeimLxQSCnoehNOd2Ki50tsOFoGEJ0/Tnvoudv52OQQ95DFpTaO9w39k+l4PmJcxPO/d9926NIU3cDVqp/UJDQe/dtrP97qk66NTqfgmn55526qATuBOflLSSd2sK3j072+t6laAfefUS9m49/dMDlaBTAnfue4OD4NwCwevmjHdZJWhwQ6HQWH0BlfIfEINqErAAAAAASUVORK5CYII=",13,14,10);

global.TEMPresetme = 0;
global.EliteTurretDrawer = noone;

#define step

if (global.TEMPresetme < 2) {
	global.TEMPresetme += 1;
}

with (Turret) if (
("EliteChecked" not in self) &&
(random(2.5 + GameCont.loops * 0.5) < 1)) {
	sound_play_pitchvol(sndTurretSpawn, 0.8, 2);
	sound_play_pitchvol(sndGoldTankAim, 0.8, 1.25);
	with instance_create(x,y,CustomObject) {
		EliteTurret = 1;
		sprite_index = global.sprEliteTurretSpawn;
		
		//view angle
		vang = random(360);
		//view arc (doubled)
		varc = 0;
		//view arc max
		varm = 30 + 10*GameCont.loops;
		//view range
		vrng = 200 + 25*GameCont.loops;
		
		//rotation direction
		rotd = choose(-1,1);
		//rotation speed min
		roti = 0.75 + 0.1*GameCont.loops;
		//rotation speed max
		rota = 1 + 0.2*GameCont.loops;
		//proximity boost
		prxb = 0;
		//rotation speed
		rots = roti;
		
		//AI mode (0 = searching, 1 = targeting, 2 = fireing)
		mode = 0;
		//target
		targ = noone;
		//beam warning
		bemw1 = 0;
		bemw2 = 0;
		//beam charge
		bemc = 0;
		//beam damage
		bemd = 0;
		
		active = 0;
		
		//effects
		vangscanner = -varc;
		scanalpha = 0;
	}
	
	if !instance_exists(global.EliteTurretDrawer) {
		global.EliteTurretDrawer = instance_create(0, 0, CustomObject);
		with(global.EliteTurretDrawer){
			script_bind_draw(EliteTurretDraw, -10);
		}
	}
	
	instance_destroy();
}
else {
	EliteChecked = 1;
}

with (CustomObject) if ("EliteTurret" in self) {
	if ((sprite_index = global.sprEliteTurretSpawn) && (image_index >= 11.5)) sprite_index = global.sprEliteTurretOff;
	if (sprite_index = global.sprEliteTurretBase) {
		if (scanalpha < 1) scanalpha += 0.05;
		vang += rots*rotd;

		if (mode = 0) {
			if (distance_to_object(instance_nearest(x,y,Player)) > 1.75*vrng) {
				sprite_index = global.sprEliteTurretOff;
			}
		
			if (rots > roti) rots -= 0.1;
			if (rots < roti) rots += 0.1;
			if (varc < varm) varc += (varm - varc)/60
			
			with(Player) if ((distance_to_object(other) < other.vrng) && (abs(angle_difference(other.vang,point_direction(other.x,other.y,x,y))) < other.varc)){
				other.targ = id;
				other.mode = 1;
			}
			
			if (bemw1 > 0) bemw1 -= 0.5;
			
		} else {
			if (!instance_exists(targ) ) {
				targ = noone;
				mode = 0;
			}
			else var angletotarget = angle_difference(vang,point_direction(x,y,targ.x,targ.y));
			
			prxb = ((vrng + 0.1)/(distance_to_object(targ) + 0.1))
			if (prxb > 10) prxb = 10;
			
			if (abs(angletotarget) < varc) {
				rots = abs(angletotarget * prxb)/varc * rota;
			}
			else if (rots < rota) rots += 0.1;
			
			if (((distance_to_object(targ) < vrng)) && (abs(angletotarget) < varc)) {
				
				if (angletotarget > 0) rotd = -1;
				else rotd = 1;
				
				if (varc > varm/2) varc += (varm/2 - varc)/60
				
				if ((abs(angletotarget) < 5) && (bemc = 0)) {
					if (bemw1 < 60) {
						bemw1 += 1;
					}
					else mode = 2;
				}
			}
			else {
				if (varc < varm/2) {
					varc += (varm - varc)/120;
				}
				else mode = 0;
			}
			
		}
		
		if (!instance_exists(targ) ) {
			targ = noone;
			mode = 0;
		}
		
		if (((mode = 2) || (bemw2 > 0)) && (bemw2 < 30)) {
			bemw2 += 1;
		}
		
		if (bemw2 = 1) sound_play_pitchvol(sndLaserCannonCharge, 0.8, 2);
		if (bemw2 = 30) {
			sound_play_pitchvol(sndExplosion, 0.9, 0.7);
			sound_play_pitchvol(sndPlasmaUpg, 0.85, 2.1);
			sound_play_pitchvol(sndLightningRifleUpg, 1.6, 1.5);
		}
		
		if (bemw2 = 30) {
			bemc = 200;
			bemw1 = 0;
			bemw2 = 0;
			mode = 1;
		}
		
		if (bemc > 0) bemc -= 4;
		
		if (bemc > 50) {
			with(Player) if ((sprite_index != spr_hurt) && (collision_line(other.x, other.y, other.x+lengthdir_x(other.vrng*3,other.vang), other.y+lengthdir_y(other.vrng*3,other.vang), id, 0, 0))) {
				projectile_hit(id, round(other.bemc/80) + 1, 0, 0)
			}
		}
	}

	if ((sprite_index = global.sprEliteTurretOff) && (instance_exists(enemy)) && (array_length(instances_matching(CustomObject,"sprite_index",global.sprEliteTurretBase)) < round(GameCont.loops) + 1) && (distance_to_object(instance_nearest(x,y,Player)) <= vrng*1.5)){
		sprite_index = global.sprEliteTurretBase
		varc = 0;
	}
	
	if (!instance_exists(enemy)) {
		sprite_index = global.sprEliteTurretOff;
	}
	
	if (global.TEMPresetme < 2) instance_destroy();
}

#define EliteTurretDraw
with (CustomObject) if (sprite_index = global.sprEliteTurretBase) {
	draw_sprite(global.sprEliteTurretBase, 0, x, y);
	
	repeat(round(vrng*3/200)) {
		if (vangscanner > varc) vangscanner -= 2*varc;
		draw_set_alpha(((1 - (abs(vangscanner) / varc)) * 0.25 - (bemc/200 * 0.60)) * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng,vang+vangscanner), y+lengthdir_y(vrng,vang+vangscanner), 1.5, c_red, c_red);
		vangscanner += varc/round(vrng*3/200)*2;
	}
	vangscanner += varc/60*rotd;
	
	draw_set_blend_mode(bm_subtract);
	draw_set_alpha(0.05 * scanalpha);
	draw_set_colour(c_teal);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(x, y);
	var primitiveangle = -varc
	repeat(round(varm*4/3 + 1)) {
		draw_vertex(x+lengthdir_x(vrng,vang+primitiveangle), y+lengthdir_y(vrng,vang+primitiveangle));
		primitiveangle += varc/round(varm*2/3);
	}
	draw_primitive_end();
	draw_set_blend_mode(bm_normal);
	
	if (bemw1 > 0) {
		draw_set_alpha((bemw1/60 * 0.3 + 0.3) * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), bemw1/6, c_red, c_red);
	}
	if (bemw2 > 0) {
		draw_set_alpha((bemw2/30 * 0.5) * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), 10, c_orange, c_orange);
	}
	if (bemc > 0) {
		draw_set_blend_mode(bm_add);
		draw_set_alpha(0.1 * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), 15*bemc/200, c_red, c_red);
		
		draw_set_alpha(0.5 * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), 10*bemc/200, c_red, c_red);
		
		draw_set_alpha(5 * scanalpha);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), 8*bemc/200, c_orange, c_orange);
		draw_line_width_colour(x, y, x+lengthdir_x(vrng*3,vang), y+lengthdir_y(vrng*3,vang), 6*bemc/200, c_white, c_white);
	}

	draw_set_blend_mode(bm_normal);
	draw_set_alpha(1);
	draw_sprite(global.sprEliteTurretTop, 0, x, y);
}
else if (sprite_index = global.sprEliteTurretOff) draw_sprite(global.sprEliteTurretTop, 0, x, y);

if (global.TEMPresetme < 2) instance_destroy();