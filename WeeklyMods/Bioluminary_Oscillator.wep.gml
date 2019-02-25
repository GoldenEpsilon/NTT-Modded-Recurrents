#define init
global.bio_osc = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAKCAYAAAC0VX7mAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4wEZFg0hrRlD+AAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAT0lEQVQoz2NgGKrgP7kaGck0kBGfBFbNmzdvxmmar68vTsMZGRgY/gsGdaJoeL+uHKtB6enpGGIzZ85EMRSnC7FpRjMEpwupGoZUj2WqAwDjFhMEUzp/0AAAAABJRU5ErkJggg==", 0, 5);
global.spr_knife2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAKCAYAAAC0VX7mAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH4wEZFg0hrRlD+AAAAB1pVFh0Q29tbWVudAAAAAAAQ3JlYXRlZCB3aXRoIEdJTVBkLmUHAAAAT0lEQVQoz2NgGKrgP7kaGck0kBGfBFbNmzdvxmmar68vTsMZGRgY/gsGdaJoeL+uHKtB6enpGGIzZ85EMRSnC7FpRjMEpwupGoZUj2WqAwDjFhMEUzp/0AAAAABJRU5ErkJggg==", 1, 7, 5);
global.max_marks = 8;
global.las_dmg = 10;
global.las_dmg_up = 20;
global.las_spd = 10;
global.las_devd = 40;
global.las_devf = 2;
global.las_devt = 1;



#define weapon_name
return "Bioluminary Oscillator";

#define weapon_text
return choose("Arrows of Light", "Based Wing", "Dragon of Destruction", "Dragoon-born", "Panzer Force");

#define weapon_type
return 5;

#define weapon_auto
return 1;

#define weapon_load
return room_speed / 2;

#define weapon_cost
return 2;

#define weapon_rads
return 0;

//#define weapon_swap

#define weapon_melee
return 0;

#define weapon_area
return 15;

#define weapon_sprt
return sprIonCannon;; //global.bio_osc;

#define weapon_laser_sight
return 0;

#define weapon_gold
return 0;

#define step
if("marks" not in self) marks = 0;

if(wep != mod_current) marks = 0;

// LOCKON FIRE
if(button_released(index, "fire")){
	if(is_array(marks)){
		for(var i = 0; i < array_length(marks); i++){
			if (!marks[i]) break;
			if(instance_exists(marks[i])){
				laser_fire(marks[i], (skill_get(17) ? global.las_dmg_up : global.las_dmg), global.las_spd, global.las_devd, global.las_devf, global.las_devt);
				ammo[@weapon_type()] -= infammo == 0 ? weapon_cost() : 0;
				reload += weapon_load / global.max_marks;
				sound_play(sndLightningRifleUpg);
			}
		}
		reload += weapon_load();
		marks = 0;
	}
}

//race(angle_dif(90, point_direction(x, y, mouse_x[index], mouse_y[index])));




#define weapon_fire
if(button_pressed(index, "fire")){
	marks = array_create(global.max_marks, 0);
}

if(button_check(index, "fire")){
	with instance_nearest(mouse_x[index], mouse_y[index], enemy){
		if(position_meeting(mouse_x[other.index], mouse_y[other.index], self) && collision_line(other.x, other.y, x, y, Wall, 0, 1) == noone){
		//if(point_distance(x, y, mouse_x[other.index], mouse_y[other.index]) < 50){
			for(var i = 0; i < array_length(other.marks); i++){
				if(other.ammo[weapon_type()] < weapon_cost() * (i + 1)) break;
				//if(other.marks[i] == id) break; //Prevents multi lockon single target
				if(!other.marks[i]) {
					other.marks[@i] = id; sound_play_pitch(sndLaserCannonCharge, 0.8);
					//trace(other.marks);
					script_bind_draw(draw_lock, -10, other.marks[i], (90 / global.max_marks) * i, other);
					//trace((90 / global.max_marks) * i);
					break;
				}
			}
		}else other.reload = 0;
	}
}

//Firing for special cases - Target random enemies/No targets
if(!button_check(index, "fire") || button_check(index, "spec")){
	var nme = 359;
	//nme = instance_find(Bandit, irandom(instance_number(Bandit) - 1));
	//nme = instance_find(enemy, irandom(instance_number(enemy) - 1));
	//nme = instance_nearest(mouse_x[0] + random_range(-100, 100), mouse_y[0] + random_range(-100, 100), enemy);
	nme = instance_create(x, y, CustomObject) 
	//trace(object_get_name(nme.object_index));
	laser_fire(nme, (skill_get(17) ? global.las_dmg_up : global.las_dmg), global.las_spd, global.las_devd, global.las_devf, global.las_devt);
		with (nme) instance_destroy();
	ammo[@weapon_type()] -= infammo == 0 ? weapon_cost() : 0;
	if(wep = mod_current) reload += 2.5 * weapon_load() else if(bwep = mod_current) breload += 2.5 * weapon_load();
	sound_play(sndLightningRifleUpg);
}

ammo[@weapon_type()] += infammo == 0 ? weapon_cost() : 0;



//laser_fire(instance_nearest(x, y, enemy), 0, 15, 70, 0.4, 1);

#define laser_fire
with instance_create(x, y, CustomProjectile){
	bio_laser = 1;
	target = argument0;
	sprite_index = sprScorpionBullet;
	damage = argument1;
	lightspeed = argument2;
	dev_angle = argument3;		//Deviator angular change per step
	dev_factor = argument4;		//Deviator vector length factor
	dev_type = argument5;		//Deviation type 0: no deviation, 	1: waveform,	2:triangular distribution,		3: uniform distribution, 
	deviator = other.gunangle;
	dev_l = 1;
	adj_vect = lightspeed * dsin(20);
	var fire_dev = 0;
	repeat(3) fire_dev += (button_pressed(other.index, "spec") ? random(5) :random(40));
	motion_add(other.gunangle + other.accuracy * choose(-1, 1) * fire_dev, lightspeed);
	image_angle = direction;
	team = other.team;
	creator = other;
	on_step = light_curve;
	on_hit = hit_enemy;
	on_wall = break_wall;
	lasthit = 0;
	cdown = 0;
	deploying = room_speed * 0.1;
}

#define light_curve
if("bio_laser" in self){
	if(!deploying--){
		if(instance_exists(target)){
			if(point_distance(x, y, target.x, target.y) > 5 * lightspeed && dev_type != 0) proj_rand();
			proj_home();
			proj_lead();
		} else {
			if(dev_type != 0){
				proj_rand()
			}
		}
	//SPEED CLAMPING
	speed = lightspeed;
	image_angle = direction;
	}
	// Trails
	with instance_create(x, y, BoltTrail){
		image_xscale = other.speed + 2;
		image_yscale = 3;
		image_blend = c_lime;
		image_angle = other.direction;
	}
	if(cdown > 0) cdown-- else lasthit = 0;
}

//trace(lightspeed);

#define hit_enemy
if(lasthit != other){
	projectile_hit(other, damage, 1, direction);
	blast = 2;
	cdown = 2 * room_speed;
	if(skill_get(17)) with (instance_create(x, y, PlasmaImpact)) damage = random_range(15,25);
	if(other.my_health > damage){
		if(fork()){
			wait (2);
			instance_create(self.x, self.y, PlasmaImpact);
			instance_change(PlasmaImpact, 1);
			speed = 3;
			exit;
		}
	}
}

#define break_wall
with instance_create(x, y, BoltTrail){
image_xscale = other.speed + 4;
image_yscale = 5;
image_blend = c_lime;
image_angle = other.direction;
}

if(!(GameCont.timer mod (room_speed / 6))){
	with instance_create(x + random(5),y + random(5), PlasmaImpact){
		//image_xscale = 0.5; image_yscale = 0.5;
		motion_add(random(360), random(3));
	}
}

if(++lightspeed < random((skill_get(17) ? 300 : 100) + lightspeed)){
	with other{
		instance_change(FloorExplo, 1);
	}
}else{
	with other{
		instance_change(FloorExplo, 1);
	}
	repeat(skill_get(17) ? 3 : 1){
		instance_create(x, y, PlasmaImpact);
	}
	instance_destroy();
}

#define angle_dif(angle1, angle2)
angular_difference = 	((angle2 - angle1 > 180) ? angle2 - angle1 - 360 :
						((angle2 - angle1 < -180) ? angle2 - angle1 + 360 :
						angle2 - angle1))
return angular_difference;

#define proj_home
// HOMING
h_adjust = target.x - (x + hspeed);
v_adjust = target.y - (y + vspeed);
var adj_fact = (adj_vect < point_distance(0, 0, h_adjust, v_adjust)) ? point_distance(0, 0, h_adjust, v_adjust) / adj_vect : 1;
hspeed += h_adjust / adj_fact;
vspeed += v_adjust / adj_fact;
//

#define proj_rand
/* RANDOM DEVIATION V1
motion_add(deviator, lightspeed * dev_factor * random(1));
deviator += (dev_type == 1) ? random(dev_angle) - random(dev_angle) : random_range(- dev_angle, dev_angle);
*/

// RANDOM DEVIATION V2
if(abs(deviator) > dev_angle + 20) deviator = -dev_type * dev_angle;
motion_add(((abs(dev_type) == 1) ? direction : 0) + deviator, lightspeed * dev_factor * random(1));
switch(dev_type){
	//	Cases:		 -1/1:Waveform 		2: Triangular distribution		3: Uniform distribution
	case -1:
	case 1:
	if(abs(deviator) > dev_angle) dev_type *= -1;
	//trace(dev_type, abs(angle_dif(direction, direction + deviator)));
	//trace(dev_type, abs(deviator));
	deviator += dev_type * (dev_angle / 3) * (30 / room_speed);
	break;					
	case 2:	deviator +=	random(dev_angle) - random(dev_angle);	break;
	case 3:	deviator += random_range(- dev_angle, dev_angle);	break;
	default: break;
}
//

#define proj_lead
/* LEADING V1
adj_fact = point_distance(0, 0, hspeed, vspeed) / point_distance(x, y, target.x, target.y);
hspeed = hspeed / adj_fact + target.hspeed;
vspeed = vspeed / adj_fact + target.vspeed;
*/

// LEADING V2
h_adjust = target.x + target.hspeed - x - hspeed;
v_adjust = target.y + target.vspeed - y - vspeed;
adj_fact = (abs(angle_dif(direction, point_direction(x, y, target.x, target.y))) < 30) && (point_distance(x, y, target.x, target.y) < lightspeed) ? 1 : point_distance(0, 0, h_adjust, v_adjust) * 2 / adj_vect;
hspeed += h_adjust / adj_fact;
vspeed += v_adjust / adj_fact;
//



#define draw_lock(mark, d_offset, marker)
if(!instance_exists(marker)) instance_destroy()
else if(!instance_exists(mark)) instance_destroy()
else if(!is_array(marker.marks)) instance_destroy()
else draw_sprite_ext(sprCrosshair, 4, mark.x, mark.y, (("size" in mark) ? mark.size + 0.5 : 1.5), (("size" in mark) ? mark.size + 0.5 : 1.5), (GameCont.timer * 180 / room_speed) + d_offset, c_lime,0.8);


