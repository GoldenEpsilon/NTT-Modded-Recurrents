#define init
global.sprPutter = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAAHCAMAAAA74E03AAAAGFBMVEUAAAAAAAA/GRNMVl1fLyZseoSKlp7///8q3mdiAAAAAXRSTlMAQObYZgAAADpJREFUeNpljdEKACAIA5s6//+TW4RYeA8TTplrAEA5dSaURWsmlBYRFlYbyD/nTt7pavle8VCNTZsNMCUAr5RtS58AAAAASUVORK5CYII=", -2, 4);

global.sprPuttGame0 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAOCAMAAAA7QZ0XAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABRJREFUeAFjYAQDYigGMAmliNcHAA+yAFH9873BAAAAAElFTkSuQmCC",1,3,7);
global.sprPuttGame1 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACoAAAAICAMAAAC4eZ1UAAAAD1BMVEUAAAAAAACLi4vKysr///8l1rtDAAAAAXRSTlMAQObYZgAAADpJREFUeAFjwAIYgYCBOMDIzMyIwwggRgEgpWgAoowZiJmY4YCJmQnIA2JkMZAyUpSS4AASvEVCYAEA0vgBOULO2aUAAAAASUVORK5CYII=",1,21,4);
global.sprPuttGame2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAOCAMAAAA7QZ0XAAAACVBMVEUAAADKysr///+J+wwYAAAAAXRSTlMAQObYZgAAAB9JREFUeAFjgAEmIMCgGJmYGBlANCNUDYyCCOLXBwUADlQASa34/rkAAAAASUVORK5CYII=",1,3,7);

#define weapon_name
return "PUTTER";

#define weapon_sprt
return global.sprPutter;

#define weapon_type
return 0;

#define weapon_load
return 30;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return -1;

#define weapon_text
return "4";

#define weapon_fire

if (!instance_exists(puttgame)) {
	swing = true;
	reload = 0;
	puttgame = instance_create(x,y,CustomObject);
	with puttgame {
		script_bind_step(puttgame_step, 0, id);
		script_bind_draw(puttgame_draw, -6.1, id);
		
		golfer = other;
		
		pgTime = -15;
		pgSpeed = 0;
		pgGO = false;
		pgState = true;
		pgAlpha = 0;
		
		pgHardness = 0; // [0 , 1)
	}

	
} else {

	pgStrength = 15 - abs(puttgame.pgTime);
	with hitme if ((team != other.team) && (distance_to_point(other.x+lengthdir_x(40,other.gunangle),other.y+lengthdir_y(40,other.gunangle)) <= 20 + 5* skill_get(13))) {
		sound_play_pitchvol(sndGoldWrench, 1.5 + other.pgStrength/30, 2);
		sound_play(snd_hurt);
	
		golfer = other;
		with instance_create(x,y,CustomProjectile) {
			pgHitGuy = other;
			creator = other.golfer;
			team = creator.team;
			
			damage = creator.pgStrength;
			
			direction = creator.gunangle;
			speed = creator.pgStrength*1.5;
			
			mask_index = other.mask_index;
			if (mask_index = -1) {mask_index = mskAlly;}
			
			script_bind_step(golfbullet_step, 0, id);
			on_wall = script_ref_create(golfbullet_wall);
			on_hit = script_ref_create(golfbullet_hit);
		}
	}

	repeat(6 + 2 * skill_get(13)) with instance_create(x+lengthdir_x(40,gunangle),y+lengthdir_y(40,gunangle),CaveSparkle) {
		direction = random(360);
		speed = random(2 + 2 * skill_get(13));
	}
	
	repeat(4) with instance_create(x,y,Dust) {
		direction = other.gunangle + random_range(-10,10);
		speed = random_range(4,6);
	}

	sound_play_pitchvol(sndMeleeFlip, 1.1 + random(0.15), 1.5)
	motion_add(gunangle,4)
	wepangle -= 200;
	swing = false;
	
	puttgame.pgGO = true;
}

#define step
if (argument0) {

	if "puttgame" not in self {
		puttgame = noone;
		swing = false;
	}
	
	if (swing) {
		wepangle += 1;
	} else {
		wepangle -= abs(angle_difference(wepangle, 120))/15;
	}
	
}

#define puttgame_step(Me)
with(Me) if (instance_exists(golfer)) {
	if (pgState) {
		if(pgGO) {
			pgState = false;
			golfer.reload = 30;
		} else {
			
			pgSpeed = (16 - pgHardness - abs(pgTime))/(10 - 9 * pgHardness);
		
			if (pgAlpha < 1) {pgAlpha += 0.25;}
			if (pgTime >= 15) {
				golfer.swing = false;
				pgState = false;
				golfer.reload = 15;
			}
			pgTime += pgSpeed;
		}
	} else {
		pgAlpha -= 0.25;
		if (pgAlpha <= 0) {
			golfer.puttgame = noone;
			instance_destroy();
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define puttgame_draw(Me)
with(Me) if (instance_exists(golfer)) {
	draw_sprite_ext(global.sprPuttGame0,0,golfer.x+pgTime,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
	draw_sprite_ext(global.sprPuttGame1,0,golfer.x,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
	draw_sprite_ext(global.sprPuttGame2,0,golfer.x+pgTime,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define golfbullet_step(Me)
with(Me) {
	with (pgHitGuy) {
		sprite_index = spr_hurt;
		image_index = 0;
		x = other.x;
		y = other.y;
	}
	speed -= 0.25;
	if ((speed <= 0) || (!instance_exists(pgHitGuy))) {instance_destroy();}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define golfbullet_wall
move_bounce_solid(true);
speed -= 1;
projectile_hit(pgHitGuy, damage/15, 0, 0);

#define golfbullet_hit
if ((other != pgHitGuy) && (other.sprite_index != other.spr_hurt)) {
	projectile_hit(other, pgHitGuy.my_health * damage/10, damage, point_direction(other.x,other.y,x,y));
	projectile_hit(pgHitGuy, damage/8, 0, 0);
}