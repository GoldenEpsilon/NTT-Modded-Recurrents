#define init
global.spr_gdDartico = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAM1BMVEUAAAAcIiYuNz4/GRNfLyZiCh1seoSvHRIAAAAzHA82BhBUOhhiCh2BaSKvHRLLpzrfyYZqoBteAAAACHRSTlMAAAAAAAAAALfnUqEAAABJSURBVAjXbYxJEoAwCARRMEEJy/9fGyJV6sE5NcwC8Cu+9bJEhNWDRfVUd7dRd7Jo+uMyfvyVL7/6K1/9/tlvLfnoSIhECLBvE+N2A1h2T30gAAAAAElFTkSuQmCC", 0, 4);
global.spr_gdDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAAG1BMVEUAAAAAAAA2BhBiCh2BaSKvHRLLpzrfyYb///8FGUINAAAAAXRSTlMAQObYZgAAACxJREFUeAFjwAIYGdG4rIwofGZWNkYIAHNZmZhZ2NnYgYCNEU0erh/dfJwAACSbAICJAIQ3AAAAAElFTkSuQmCC", 1, 5, 4);
global.msk_gdDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABBJREFUeAFjoBwwQgEDNQAAAtwACXPJAB4AAAAASUVORK5CYII=", 1, 5, 4);
global.out_gdDart = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAAJCAMAAADaUYZlAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACJJREFUeAFjAAJGRgZkwAgEKFwEQOczgrj4BNDUY5qPbj8AFm4ATgiAWaAAAAAASUVORK5CYII=", 1, 5, 4);

global.gdDartDrawer = noone;

#define weapon_name
return "GOLDEN DARTS";
#define weapon_sprt
return global.spr_gdDartico;
#define weapon_type
return 3;
#define weapon_laser_sight
return false;
#define weapon_auto
return false;
#define weapon_load
return 10;
#define weapon_cost
return 5;
#define weapon_swap
return sndSwapGold;
#define weapon_area
return -1;
#define weapon_text
return "HIGHEST SCORE";
#define weapon_gold
return 1;

#define weapon_fire
tempindex = index;
with instance_create(x,y,CustomProjectile) {
	creator = other;
	creatorindex = creator.tempindex;
	team = other.team;

	sprite_index = global.spr_gdDart
	mask_index = global.msk_gdDart;
	
	direction = other.gunangle;
	image_angle = direction;
	speed = 15;
	
	damage = 10;
	knockback = 2;
	
	DartType = 0;
	DartOalpha = 0;

	Dartdecay = 600;

	script_bind_step(gdDartStep, 0, id);
	
	on_hit = script_ref_create(gdDartHurt);
	on_wall = script_ref_create(gdDartWall);
}

sound_play_pitch(sndChickenThrow, random_range(1.5,1.7));
sound_play_pitchvol(sndSwapGold, random_range(1.3,1.6), 0.25);
motion_add(other.gunangle,1);

reloadsoundfix = 0;

#define step
if (argument0) {
	if !instance_exists(global.gdDartDrawer) {
		global.gdDartDrawer = instance_create(0, 0, CustomObject);
		with(global.gdDartDrawer){
			script_bind_draw(gdDartDraw, depth+0.1);
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

#define gdDartStep(Me)
with(Me) {
	if (!instance_exists(creator)) {
		creator = player_find(creatorindex);
	}

	if (DartType) {
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
		} else if (instance_exists(creator) && (creator.ammo[3] <= 50 + 44 * skill_get(10))) {
			if (instance_exists(Portal)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 2) {speed += 0.25;}
			}
			if (distance_to_object(creator) < 60 + 30*skill_get(3)) {
				direction = point_direction(x,y,creator.x,creator.y);
				if (speed < 5) {speed += 0.5;}
				
				if (distance_to_object(creator) < 5) {
					creator.ammo[3] += 5;
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
			DartType = 6;
		} else speed -= 0.75;
		
		if (skill_get(21)) {
			var target = instance_nearest(x,y,enemy);
			if instance_exists(target) {
				direction += angle_difference(point_direction(x,y,target.x,target.y), direction)/15;
				image_angle = direction;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define gdDartHurt
if ((!DartType) && (other.team != team)) {
	projectile_hit(other, damage, knockback, direction);
	DartType = 6;
	speed = 0;
}

#define gdDartWall
x += lengthdir_x(speed,direction);
y += lengthdir_y(speed,direction);
DartType = 6;
speed = 0;

#define gdDartDraw
with instances_matching(CustomProjectile, "DartType", 6) if (instance_exists(creator)) {
	draw_sprite_ext(global.out_gdDart,0,x,y,1,1,image_angle,player_get_color(creator.index),image_alpha*DartOalpha);
}

with instances_matching(Player, "wep", "golden darts") if (visible) {
	var DartAmmo = clamp(ammo[3] div 5, 0, 6);
	var DartAngMod = 60 / DartAmmo;
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.out_gdDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,player_get_color(index),image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
	var DartAngle = gunangle + ((5 + DartAngMod) * right * reload)/5;
	repeat(DartAmmo) {
		draw_sprite_ext(global.spr_gdDart,0,x+lengthdir_x(5+DartAmmo/3,DartAngle),y+lengthdir_y(5+DartAmmo/3,DartAngle),1,1,DartAngle,c_white,image_alpha);
		DartAngle += (5 + DartAngMod + reload * 0.75) * right;
	}
}