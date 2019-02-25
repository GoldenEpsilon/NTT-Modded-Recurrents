#define init
global.spr_pnDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAALCAMAAACnFTZPAAAAJ1BMVEUAAAAAAAAA/wAcIiYuNz42BhBExRZMVl1iCh1seoSKlp6vHRK+/QiMn0eAAAAAAXRSTlMAQObYZgAAAFBJREFUeAF9juEKwCAIBvc122fZ+z/vRGX7Ex0IeRzhdQBFPH9FUnxcQUODrT0zEcKyhW/8Rq0j7VptJJxdLWr4JtXKqDb/rfYm7HTD/t4dL31FAx58AF+DAAAAAElFTkSuQmCC", 0, 5);
global.spr_pnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAH4AAAALCAMAAACOEsnIAAAAJ1BMVEUAAAAAAAAA/wAcIiYuNz42BhBExRZMVl1iCh1seoSKlp6vHRK+/QiMn0eAAAAAAXRSTlMAQObYZgAAAH1JREFUeNrN0zkOwzAMBMDQkaPL/39vkGoopHApbzlbLSi9HpKIDaZpoc0GGWSQQbaibkat8etXuyCDDDLIEkqcs41R3xElFjsggwwyyGDeNNs5Ruml1BrZLsgggywjg8v63v/X9w9kkEEGWcb72x+QQQYZZHDny9//7/fnC4V7CT1NFgi7AAAAAElFTkSuQmCC", 6, 7, 5);
global.msk_pnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABFJREFUeAFjGBDAiAoYBggAAAh9ABADwZ23AAAAAElFTkSuQmCC", 1, 7, 5);
global.out_pnDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAH4AAAALCAMAAACOEsnIAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAFFJREFUeAHF1CEOACEMRFHe/S+9qu6LNU1HPjGBQPsmvMmqdYAyZcqUCRuMBsYEChQoUGCcTJmwQYECFa60ClS40upv7m9///b3P/907q+23gcvxwMESx22NAAAAABJRU5ErkJggg==", 6, 7, 5);

global.pnDartDrawer = noone;

#define weapon_name
return "POISON DARTS";
#define weapon_sprt
return global.spr_pnDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 20;
#define weapon_cost
return 8;
#define weapon_swap
return sndSwapSword;
#define weapon_area
return 18;
#define weapon_text
return "LETHAL LOAD";

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_pnDart
	mask_index = global.msk_pnDart;
	image_speed = 0;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 15;
	
	damage = 5;
	knockback = 8;
	
	DartType = 0;
	
	DartStuck = false;
	DartStuTo = noone;
	DartSHurt = 30;
	DartStAng = 0;
	DartStDst = 0;
	
	if (creator.ammo[4] >= 2) {
		DartFuel = 50;
		creator.ammo[4] -= 2;
	} else if (creator.ammo[4] >= 0) {
		DartFuel = creator.ammo[4] * 25;
		creator.ammo[4] = 0;
	}
	image_index = (DartFuel div 10);
	DartFireing = false;
	
	DartOalpha = 0;

	Dartdecay = 600;

	script_bind_step(pnDartStep, 0, id);
	
	on_hit = script_ref_create(pnDartHurt);
	on_wall = script_ref_create(pnDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(0.7,0.9));
sound_play_pitchvol(sndMeleeFlip, random_range(0.9,1.1), 0.5);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.pnDartDrawer) {
		global.pnDartDrawer = instance_create(0, 0, CustomObject);
		with(global.pnDartDrawer){
			script_bind_draw(pnDartDraw, depth+0.1);
		}
	}
	
	wkick = 1000;
	
	// should stop the crossbow reload sound from playing
	if ("reloadsoundfix" not in self) {
		reloadsoundfix = 0;
	}
	if ((reload < 1) && (reloadsoundfix < 5)) {
		sound_play_pitchvol(sndCrossReload, 100, 0);
		reloadsoundfix += 1;
	}
	
} else if (wkick = 998) {wkick = 0}

#define pnDartStep(Me)
with(Me) {
	if (!instance_exists(creator)) {
		creator = player_find(creatorindex);
	}

	if (DartStuck) {
		if instance_exists(DartStuckTo) {
			x = DartStuckTo.x + lengthdir_x(DartStDst,DartStAng);
			y = DartStuckTo.y + lengthdir_y(DartStDst,DartStAng);
		} else {
			DartStuck = false;
		}
	
	}

	if (DartFireing) {
		if (DartFuel > 0) {
			image_index = DartFuel div 10;
			if (DartFuel mod 1 = 0) with instance_create(x,y,ToxicGas) {
				creator = other.creator;
				direction = random(360);
				speed = random(1);
			}
			DartFuel -= 0.5;
		} else {
			DartFireing = false;
			DartType = 8;
		}
	} else if (DartType) {
		if (DartOalpha < 1) {
			DartOalpha += 0.1;
		}
		
		Dartdecay -= 1;
		if (Dartdecay <= 0) {
			repeat(3) with instance_create(x,y,Dust) {
				speed = random(3);
				direction = random(360);
			}
			instance_destroy();
		} else if (instance_exists(creator) && (creator.ammo[3] <= 47 + 44 * skill_get(10))) {
			if (instance_exists(Portal)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 2) {speed += 0.25;}
			}
			if (distance_to_object(creator) < 60 + 30*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 8;
					instance_destroy();
				}
			}
		} else {
			if ((instance_exists(creator)) && (Dartdecay > 150)) {Dartdecay = 150;}
		
			if (speed > 0) {
				speed -= 0.5;
			} else speed = 0;
		}
	} else {
		if (speed < 0.1) {
			DartFireing = true;
			if (DartFuel > 0) {sound_play(sndToxicBoltGas);}
		} else speed -= 0.75;
		
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			if instance_exists(target) {
				direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/20;
				image_angle = direction;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define pnDartHurt
if ((!DartType) && (other.team != team) && (!DartStuck)) {
	projectile_hit(other, damage, knockback, direction);
	DartFireing = true;
	if (DartFuel > 0) {sound_play(sndToxicBoltGas);}
	DartStuck = true;
	DartStuckTo = other;
	DartStAng = point_direction(other.x, other.y, x, y);
	DartStDst = distance_to_object(other);
	speed = 0;
}

#define pnDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartFireing = true;
if (DartFuel > 0) {sound_play(sndToxicBoltGas);}
speed = 0;

#define pnDartDraw
with instances_matching(CustomProjectile, "DartType", 8) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_pnDart,image_index,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "poison darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 8, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/10;
	var DartSize = (ammo[4] * 25) div 10;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_pnDart,clamp(DartSize,0,5),x+lengthdir_x(clamp(DartSize,0,5)+5+DartAmmo/3,DartAngle),y+lengthdir_y(clamp(DartSize,0,5)+5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.5) * right;
		DartSize -= 5;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/10;
	var DartSize = (ammo[4] * 25) div 10;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_pnDart,clamp(DartSize,0,5),x+lengthdir_x(clamp(DartSize,0,5)+5+DartAmmo/3,DartAngle),y+lengthdir_y(clamp(DartSize,0,5)+5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.5) * right;
		DartSize -= 5;
	}
}