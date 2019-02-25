#define init
global.sprDoomCannon = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACAAAAAUCAMAAADbT899AAAAMFBMVEUAAAAgHSstKzZcOyNdPYWBUryqbUGsjtL///8AAAAgHSstKzZOS11cOyOqbUHZtEViScvOAAAACXRSTlMAAAAAAAAAAABzZJuhAAAAxElEQVR42m2RCw6EMAhE1/9Sy3D/2y5DwejGF4OReaGt/TwRZx583pCzdxm85xTiOWV+y4HW2puw7yM3a8V9DSksJiCREXBjxZhgCRhQQ++N9O5d9qAE5p1uLlieLITOehLDmYJ/h+C9EFjSqyVqAgD2WPiqJfSagDiFqpd41QTfH/FeCkYUofGYLYhIfWNIlAHk/qMQgib1o8iysIoC12Vlsm2Py4oJLZCJ8XEcf9fNrITISyiD0YD5ulJ4ENEUeO7C9weXlhNqCJn8+QAAAABJRU5ErkJggg==", 8, 10);
global.sprDoomHead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAUCAMAAADImI+JAAAAD1BMVEUAAABdPYWBUrysjtL///9jGzU0AAAAAXRSTlMAQObYZgAAAKRJREFUeAGF01FuhDAQBNGZqrn/mSO2Y5BDnNQnPLUW1tR3qFIrqT0Wm09yX3ZzbuyhrIlEHLN1CTflkNkdei8UqM68BhOFz/P1LOhPaCkft//ueYUjSIf2a3ClF6Y79/gXmnueITNMBzryFzRbGnh4GJyk3Vp1ej037G4yeHrh93bHHf7C0knG4eFQEClA1vjtmEXuF3wf3ISLqkK9P4UVV4/6AoF5B4gycMEBAAAAAElFTkSuQmCC",2,10,10);
global.sprDoomBody = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAUCAMAAADImI+JAAAAD1BMVEUAAABdPYWBUrysjtL///9jGzU0AAAAAXRSTlMAQObYZgAAAJJJREFUeAGV0lEOwzAIg+HWP/c/8wbO0NKVSeWpqJ8cJXA8LQFo+if1Z1TdUAkitJro0o9KF1xcywLNAu2upTqsCgeyQwxTZnueQ6AjG+oNMeQKMVxOPnmEgoLyVSZo+en/w3YOHC/TgV+T5fbkYCnBgrp7HRKVkwyHETqvjOGwFKSSR3QkHNZM225qXtyN6XhUL+aDBg2ssksqAAAAAElFTkSuQmCC",2,10,10);

global.sprSmost = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAAD1BMVEUAAAAuHkJdPYWBUrysjtJCHvouAAAAAXRSTlMAQObYZgAAAT1JREFUeAHtlOFqxDAMg2s+vf8zb0SljS+CawZjDE73z7b0hbi546M/EPoWvzJvATnG4jG3qjbIBhDKm2RVbZC59BozieCJYJOfsAGqAhr54qx0FaxRBr8nO8QAYB7HdcDdZolkkAbYA+krWkLGKQehNbjB6isAaEUbZjBLk7hHm0RPdx0z+grw9CnmDDqGdV+4AKCawbgsawEPcgPfp9crGNXZIW64gS8usIJhWFq4j29kB7s1KA1cBqMEBkWwzGhgVxLYX1AA2xDAo7WCBb66Bvawm93gX/pCpev+5vRxFCexeKoQ66OvAqkbMGN5k1hTz+kDnB+OBR0MkJ4xrM+eCTzPc4Kl4Glc6+bawvu/WEewXBCxbNGTDJYm8PFAmpTyeRKCrBPMsUfm+LHY41pk7j56NyZvf1845t/pCwt9DP97ghiVAAAAAElFTkSuQmCC",5,12,12);

global.DoomGlower = noone;

#define weapon_name
return "CANNONDEMNATION";

#define weapon_sprt
return global.sprDoomCannon;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 4;

#define weapon_cost
return 3;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 17;

#define weapon_text
return "@qS@qM@qE@qL@qL @qF@qE@qA@qR";

#define weapon_fire

if !instance_exists(global.DoomGlower) {
	global.DoomGlower = instance_create(0, 0, CustomObject);
	with(global.DoomGlower){
		script_bind_draw(draw_doomglow, depth+0.1);
	}
}

TailFind = noone;
with instances_matching(CustomProjectile,"dsOpen",true) if (distance_to_object(other) < 25) {
	other.TailFind = id;
}

with instance_create(x+lengthdir_x(10,gunangle),y+lengthdir_y(10,gunangle),CustomProjectile) {
	isDOOMsnake = true;

	creator = other;
	team = other.team;
	direction = other.gunangle;
	speed = 3;
	
	dsTarget = other.TailFind;
	if (dsTarget = noone) {
		with (creator) {
			sound_play_pitch(sndBlackSwordMega, random_range(1.5,2.5));
			motion_add(gunangle,-4);
			weapon_post(10, 5, 150);
			repeat(6) with instance_create(x,y,Smoke) {
				direction = other.gunangle + random_range(-60,60);
				speed = random_range(3,6);
				sprite_index = global.sprSmost;
			}
		}
		script_bind_step(dsHead, 0, id);
		sprite_index = global.sprDoomHead;
		dsLeader = id;
		dsLifetime = 30;
		
		damage = 10;
	} else {
		with (creator) {
			sound_play_pitch(sndBlackSwordMega, random_range(0.25,1));
			motion_add(gunangle,-2);
			weapon_post(7, 5, 100);
			repeat(3) with instance_create(x,y,Smoke) {
				direction = other.gunangle + random_range(-30,30);
				speed = random_range(1,4);
				sprite_index = global.sprSmost;
			}
		}
		script_bind_step(dsTail, 0, id);
		sprite_index = global.sprDoomBody;
		dsTarget.dsOpen = false;
		dsLeader = dsTarget.dsLeader;
		dsLeader.dsLifetime += 60;
		dsLifetime = 4;
		
		damage = 5;
	}
	dsOpen = true
	
	on_hit = script_ref_create(dsHurt);
	on_wall = script_ref_create(dsWall);
}

#define dsHead(Me)
with(Me) {
	if (image_index >= 1) {image_speed = 0;}

	dsTarget = instance_nearest(x,y,enemy);

	if instance_exists(dsTarget) {direction += angle_difference(point_direction(x,y,dsTarget.x,dsTarget.y), direction)/20;}
	image_angle = direction - 45;
	
	
	
	dsLifetime -= 1;
	if (dsLifetime <= 0) {
		instance_create(x,y,Explosion);
		sound_play_pitch(sndBlackSwordMega, random_range(0.5,0.6));
		sound_play_pitch(sndStatueDead, random_range(0.6,0.7));
		repeat(6) with instance_create(x,y,Smoke) {
			direction = random(360);
			speed = random_range(3,5);
			sprite_index = global.sprSmost;
		}
		instance_destroy();
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define dsTail(Me)
with(Me) {
	if (image_index >= 1) {image_speed = 0;}

	if ((!instance_exists(dsTarget)) || (distance_to_object(dsTarget) > 40)) {
		if (instance_exists(dsLeader)) {dsLeader.dsLifetime -= 10;}
		dsLifetime -= 1;
	} else {
		direction += angle_difference(point_direction(x,y,dsTarget.x,dsTarget.y), direction)/5;
		image_angle = direction - 45;
	}
	
	if (dsLifetime <= 0) {
		instance_create(x,y,Explosion);
		sound_play_pitch(sndBlackSwordMega, random_range(0.7,0.8));
		sound_play_pitch(sndStatueDead, random_range(0.8,0.9));
		repeat(4) with instance_create(x,y,Smoke) {
			direction = other.direction + 180 + random_range(-60,60);
			speed = random_range(5,7);
			sprite_index = global.sprSmost;
		}
		instance_destroy();
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define dsHurt
if ((other.team != team) && (other.sprite_index != other.spr_hurt)) {
	projectile_hit(other, damage, 5, point_direction(other.x,other.y,x,y));
}
	
#define dsWall
move_bounce_solid(true);
if (dsLeader = id) {dsLifetime -= 5;}

#define draw_doomglow

with instances_matching(CustomProjectile, "isDOOMsnake", true) {
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, 1.75, 1.75, direction - 45, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}