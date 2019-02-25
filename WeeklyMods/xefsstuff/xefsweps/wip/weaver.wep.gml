#define init
global.sprWeaver = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAGCAMAAADNLv/0AAAAGFBMVEUAAAAgHSstKzZOS12qbUHZtEUAAAD///9vlUROAAAABnRSTlMAAAAAAABupgeRAAAAIElEQVR4AWNggwNkJgOCCSeYwCQLMzMjIzOIycDKBAIAKw4BKVI3BiEAAAAASUVORK5CYII=", 8, 10);
global.sprDoomNode = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAMAAACROYkbAAAAElBMVEWvRmO8aYJdPYWBUrysjtL///8G/8LwAAAAAnRSTlMAAHaTzTgAAADbSURBVHgBpZPRcsMgDAQdHfz/L1fo1iIZ2o6n1Ruw7MmArxd1UY/GGll6ApzrrM6soQ3oXahaR3EIbI+4DR2I4g5g5gzQQICh93di7Y+omQ7YHYOWYBpYQkc6oXDJH/EqADrLadJcIYld9qsyp5wQ1i8pHXqoFIzRowgDTIiOCMDgDoORBawpxRZMCgFERCAAiC2gEKhoSz8EGiUwwCkeAhKkNc0hshzyIQL0IdKdBboT3q4RgaR9jVl9jQkjmBuYHw8Jwc8PSRi+BfrafnvKktj/15+pn+a/f+cvDjsJ7Ib+rlIAAAAASUVORK5CYII=",4,8,8);
global.sprDoomBeam = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAAKCAMAAABCDMR4AAAADFBMVEW8aYKBUrysjtL////gdx93AAAAAXRSTlMAQObYZgAAABVJREFUCNdjYGRgYGBiYIZCJiCPEQAAyAATcZOD1AAAAABJRU5ErkJggg==",1,0,5);

global.sprSmost = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAAD1BMVEUAAAAuHkJdPYWBUrysjtJCHvouAAAAAXRSTlMAQObYZgAAAT1JREFUeAHtlOFqxDAMg2s+vf8zb0SljS+CawZjDE73z7b0hbi546M/EPoWvzJvATnG4jG3qjbIBhDKm2RVbZC59BozieCJYJOfsAGqAhr54qx0FaxRBr8nO8QAYB7HdcDdZolkkAbYA+krWkLGKQehNbjB6isAaEUbZjBLk7hHm0RPdx0z+grw9CnmDDqGdV+4AKCawbgsawEPcgPfp9crGNXZIW64gS8usIJhWFq4j29kB7s1KA1cBqMEBkWwzGhgVxLYX1AA2xDAo7WCBb66Bvawm93gX/pCpev+5vRxFCexeKoQ66OvAqkbMGN5k1hTz+kDnB+OBR0MkJ4xrM+eCTzPc4Kl4Glc6+bawvu/WEewXBCxbNGTDJYm8PFAmpTyeRKCrBPMsUfm+LHY41pk7j56NyZvf1845t/pCwt9DP97ghiVAAAAAElFTkSuQmCC",5,12,12);

global.WeaverGlower = noone;

#define weapon_name
return "WEAVER";

#define weapon_sprt
return global.sprWeaver;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 4;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 17;

#define weapon_text
return "@qS@qM@qE@qL@qL @qF@qE@qA@qR";

#define weapon_fire

if !instance_exists(global.WeaverGlower) {
	global.WeaverGlower = instance_create(0, 0, CustomObject);
	with(global.WeaverGlower){
		script_bind_draw(draw_weaveglow, depth+0.1);
	}
}

NodeFind = noone;
with instances_matching(CustomProjectile,"wvOpen",true) if (distance_to_object(other) < 60) {
	other.NodeFind = id;
}

with instance_create(x+lengthdir_x(10,gunangle),y+lengthdir_y(10,gunangle),CustomProjectile) {
	isWeaverNode = true;
	
	creator = other;
	team = other.team;
	direction = other.gunangle;
	speed = 2;
	
	wvTarget = other.NodeFind;
	if (wvTarget = noone) {
		wvConnects = 0;
	} else {
		wvConnects = 1;
		wvTarget.wvConnects += 1;
		if (wvTarget.wvConnects >= 3) {
			wvTarget.wvOpen = false;
			wvTarget.wvLifetime += 600;
		}
	}
	wvOpen = true;
	
	sprite_index = global.sprDoomNode;
	image_index = choose(0,1,2,3);
	image_speed = 0;
	rotspeed = random_range(-20,20);
	
	wvLifetime = 600;
	svSetup = 0;
	
	script_bind_step(wvNode, 0, id);
	on_hit = script_ref_create(wvHurt);
	on_wall = script_ref_create(wvWall);
}

#define wvNode(Me)
with(Me) {
	image_angle += rotspeed;
	
	if (svSetup < 1) {svSetup += 0.1;}
	
	if ((wvTarget != noone) && (!instance_exists(wvTarget))) {
		wvTarget = noone;
		if (!wvOpen) {wvOpen = true;}
		wvConnects -= 1;
	}
	
	if (wvLifetime <= 0) {
		repeat(6) with instance_create(x,y,Smoke) {
			direction = random(360);
			speed = random_range(1,3);
			sprite_index = global.sprSmost;
		}
		instance_destroy();
	} else {
		wvLifetime -= 1;
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define wvHurt
if ((other.team != team) && (other.sprite_index != other.spr_hurt)) {
	projectile_hit(other, damage, 5, point_direction(other.x,other.y,x,y));
}
	
#define wvWall
move_bounce_solid(true);
wvLifetime -= 5;

#define draw_weaveglow
with instances_matching(CustomProjectile, "isWeaverNode", true) {
	
	var beamsize = 0.5 + random(0.5)
	if (wvTarget != noone) {
		draw_sprite_ext(global.sprDoomBeam, image_index, x, y, distance_to_object(wvTarget) * 1.25, beamsize * svSetup * wvLifetime/600, point_direction(x,y,wvTarget.x,wvTarget.y), c_white, 0.25 + 0.75 * wvTarget.wvLifetime/600);
	}

	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.75, image_yscale * 1.75, direction - 45, c_white, 0.1);
	if (wvTarget != noone) {
		draw_sprite_ext(global.sprDoomBeam, image_index, x, y, distance_to_object(wvTarget) * 1.25, beamsize * 1.75 * svSetup * wvLifetime/600, point_direction(x,y,wvTarget.x,wvTarget.y), c_white, ( 0.25 + 0.75 * wvTarget.wvLifetime/600) * 0.1);
	}
	draw_set_blend_mode(bm_normal);
}