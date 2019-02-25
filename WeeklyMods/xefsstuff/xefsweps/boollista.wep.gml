#define init
global.sprDoomRifle = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAB0AAAAQCAMAAADd04TjAAAAIVBMVEUAAABfLybW1tbt7e0AAAAgHSstKzZOS11cOyOqbUHZtEVmnh1EAAAABHRSTlMAAAAAs5NmmgAAAH1JREFUGBkFwQECgkAMA7D0HP7/vTCpSeBERfBLAt6oGAAuD1x4wMz1A2gcTYPjE/dIABACIrcdLUCrGgWY0QKgtFDNdc8CoApFVY0FMFgDaj0GAAI7gYUBgDIogAGAtZgAGAAsIK8DHAAA2AUcAAC8vMAAACBfBQIAgMGCP1xqNhWtTx3EAAAAAElFTkSuQmCC", 8, 5);
global.sprGholt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABsAAAAJCAMAAAD0FKf3AAAAG1BMVEUAAABdPYWBUrysjtL///9dPYWBUrysjtL///+jcjmNAAAABXRSTlMAAAAAAMJrBrEAAABZSURBVHjafY9BDsBACAJdWXH//+KqtEkPTeckEiPYWgCZDYC9veSMcOsF8zTtL6lyHebFePLJiBgJGIvUYTIEZdruX+eL/LtTlq9/1gCvnPbktBv1k5x+Gi+xbAVJVAJNqQAAAABJRU5ErkJggg==", 1, 7, 4);
global.mskGholt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABsAAAAJCAMAAAD0FKf3AAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAAB5JREFUeAFjoAAwggEKH8FGADgfLocN4NGHzz5KAAAjVABGzYYEDAAAAABJRU5ErkJggg==", 1, 7, 4);
global.sprBullost = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAMAAACROYkbAAAAElBMVEWvRmO8aYJdPYWBUrysjtL///8G/8LwAAAAAnRSTlMAAHaTzTgAAADbSURBVHgBpZPRcsMgDAQdHfz/L1fo1iIZ2o6n1Ruw7MmArxd1UY/GGll6ApzrrM6soQ3oXahaR3EIbI+4DR2I4g5g5gzQQICh93di7Y+omQ7YHYOWYBpYQkc6oXDJH/EqADrLadJcIYld9qsyp5wQ1i8pHXqoFIzRowgDTIiOCMDgDoORBawpxRZMCgFERCAAiC2gEKhoSz8EGiUwwCkeAhKkNc0hshzyIQL0IdKdBboT3q4RgaR9jVl9jQkjmBuYHw8Jwc8PSRi+BfrafnvKktj/15+pn+a/f+cvDjsJ7Ib+rlIAAAAASUVORK5CYII=",4,8,8);

global.sprSmost = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAAD1BMVEUAAAAuHkJdPYWBUrysjtJCHvouAAAAAXRSTlMAQObYZgAAAT1JREFUeAHtlOFqxDAMg2s+vf8zb0SljS+CawZjDE73z7b0hbi546M/EPoWvzJvATnG4jG3qjbIBhDKm2RVbZC59BozieCJYJOfsAGqAhr54qx0FaxRBr8nO8QAYB7HdcDdZolkkAbYA+krWkLGKQehNbjB6isAaEUbZjBLk7hHm0RPdx0z+grw9CnmDDqGdV+4AKCawbgsawEPcgPfp9crGNXZIW64gS8usIJhWFq4j29kB7s1KA1cBqMEBkWwzGhgVxLYX1AA2xDAo7WCBb66Bvawm93gX/pCpev+5vRxFCexeKoQ66OvAqkbMGN5k1hTz+kDnB+OBR0MkJ4xrM+eCTzPc4Kl4Glc6+bawvu/WEewXBCxbNGTDJYm8PFAmpTyeRKCrBPMsUfm+LHY41pk7j56NyZvf1845t/pCwt9DP97ghiVAAAAAElFTkSuQmCC",5,12,12);

global.sprPuttGame0 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAOCAMAAAA7QZ0XAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAABRJREFUeAFjYAQDYigGMAmliNcHAA+yAFH9873BAAAAAElFTkSuQmCC",1,3,7);
global.sprPuttGame1 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACoAAAAICAMAAAC4eZ1UAAAAD1BMVEUAAAAAAACLi4vKysr///8l1rtDAAAAAXRSTlMAQObYZgAAADpJREFUeAFjwAIYgYCBOMDIzMyIwwggRgEgpWgAoowZiJmY4YCJmQnIA2JkMZAyUpSS4AASvEVCYAEA0vgBOULO2aUAAAAASUVORK5CYII=",1,21,4);
global.sprPuttGame2 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAYAAAAOCAMAAAA7QZ0XAAAACVBMVEUAAADKysr///+J+wwYAAAAAXRSTlMAQObYZgAAAB9JREFUeAFjgAEmIMCgGJmYGBlANCNUDYyCCOLXBwUADlQASa34/rkAAAAASUVORK5CYII=",1,3,7);

global.DoomRifleGlower = noone;

#define weapon_name
return "BOOLLISTA";
#define weapon_sprt
return global.sprDoomRifle;
#define weapon_type
return 5;
#define weapon_auto
return false;
#define weapon_load
return 1;
#define weapon_cost
return 3;
#define weapon_swap
return sndSwapMachinegun;
#define weapon_area
return 19;
#define weapon_text
return "HAUNTED HOUSE GASSES";

#define weapon_fire
if !instance_exists(global.DoomRifleGlower) {
	global.DoomRifleGlower = instance_create(0, 0, CustomObject);
	with(global.DoomRifleGlower){
		script_bind_draw(draw_doomRifleglow, depth+0.1);
	}
}

if (("puttgame" not in self) || (!instance_exists(puttgame))) {
	ammo[5] += 3;
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
	puttgame.pgGO = true;
}

#define puttgame_step(Me)
with(Me) if (instance_exists(golfer)) {
	if (pgState) {
		if(pgGO) {
			pgState = false;
			with (golfer) {
				reload = 30;
				pgStrength = abs(puttgame.pgTime);
				sound_play_pitchvol(sndHyperLauncher, 0.5 + (15 - pgStrength)/60, 0.75);
				with instance_create(x,y,CustomProjectile) {
					DRNGing = true
					creator = other;
					team = other.team;
					
					direction = other.gunangle;
					image_angle = direction;
					
					speed = 15;
					
					sprite_index = global.sprGholt;
					mask_index = global.mskGholt
					
					GholtLifetime = 60;
					
					damage = 5 * (15 - other.pgStrength);
					knockback = (15 - other.pgStrength);
					BullostTimerMax = other.pgStrength - 2*skill_get(17);
					BullostTimer = 0;
					
					script_bind_step(GholtStep, 0, id);
	
					on_hit = script_ref_create(GholtHurt);
					on_wall = script_ref_create(GholtWall);
				}
				repeat(6) with instance_create(x,y,Smoke) {
					direction = other.gunangle + random_range(-20,20);
					speed = random_range(2,6);
					sprite_index = global.sprSmost;
				}
			}
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

#define GholtStep(Me)
with(Me) {
	if (speed < 1) {
		GholtLifetime -= 1;
		if (GholtLifetime < 1) {
			repeat(6) with instance_create(x,y,Smoke) {
				direction = other.direction + 180 + random_range(-60,60);
				speed = random_range(2,4);
				sprite_index = global.sprSmost;
			}
			sound_play_pitchvol(sndBlackSwordMega, random_range(0.4,0.6), 0.5);
			instance_destroy();
		}
	} else {
		BullostTimer -= 1;
		if (BullostTimer < 1) {
			BullostTimer = BullostTimerMax;
			var randdist = random_range(10,30);
			var randangl = random(360)
			with instance_create(x+lengthdir_x(randdist,randangl),y+lengthdir_y(randdist,randangl),CustomProjectile) {
				DRNGing = true
				
				creator = other.creator;
				team = other.team;
				
				damage = 5;
				knockback = 1;
				
				sprite_index = global.sprBullost;
				image_index = choose(0,1,2,3);
				image_speed = 0;
				rotspeed = random_range(-20,20);
				
				target = other;
			
				script_bind_step(BullostStep, 0, id);
	
				on_hit = script_ref_create(GholtHurt);
				on_wall = script_ref_create(BullostWall);
			}
			with instance_create(x,y,Smoke) {
				direction = random(360);
				speed = random_range(1,2);
				sprite_index = global.sprSmost;
			}
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define BullostStep(Me)
with(Me) {
	if ((!instance_exists(target)) || (distance_to_object(target) < 2)) {
		repeat(2) with instance_create(x,y,Smoke) {
			direction = random(360);
			speed = random_range(1,3);
			sprite_index = global.sprSmost;
		}
		sound_play_pitchvol(sndBlackSwordMega, random_range(0.7,0.9), 0.25);
		sound_play_pitchvol(sndBigBallExplo, random_range(0.25,0.4), 0.25);
		instance_destroy();
	} else {
		image_angle += rotspeed;
		
		direction = point_direction(x,y,target.x,target.y);
		speed += 0.1;
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define GholtHurt
if ((other.team != team) && (other.sprite_index != other.spr_hurt) && (speed > 1)) {
	projectile_hit(other, damage, knockback, direction);
}

#define GholtWall
speed *= 0.5;

#define BullostWall

#define puttgame_draw(Me)
with(Me) if (instance_exists(golfer)) {
	draw_sprite_ext(global.sprPuttGame0,0,golfer.x+pgTime,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
	draw_sprite_ext(global.sprPuttGame1,0,golfer.x,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
	draw_sprite_ext(global.sprPuttGame2,0,golfer.x+pgTime,golfer.y-30,1,1,0,player_get_color(golfer.index),pgAlpha);
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define draw_doomRifleglow

with instances_matching(CustomProjectile, "DRNGing", true) {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 1.75, 1.75, direction, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}