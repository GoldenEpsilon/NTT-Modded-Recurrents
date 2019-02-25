#define init
global.sprMilkSnake = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAALCAMAAACXmSduAAAAGFBMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmv///808OfXAAAAAXRSTlMAQObYZgAAAD1JREFUeNqNjUEOACAIw3QD//9kN0w0xos9AB0JtB/6ZinBAgqcJrNAykHsPe2HOqDiIcYImZG3y93r28sERcYA1bPCNI8AAAAASUVORK5CYII=", 0, 4);
global.sprSnake = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAMAAABA3o1rAAAADFBMVEUAAAAn6oOS/9D////Et/51AAAAAXRSTlMAQObYZgAAAEhJREFUeNq9kUEOABAMBLX9/591N6QutU7mxkyEGm+YJ3bXTHofSVvQrwI9Oc40eoINqtigwLIKBlH4h0BeUj1TDEqPWn+WZgK90AKlRm2ZYAAAAABJRU5ErkJggg==",2,8,8);

#define weapon_name
return "MILKSNAKE";

#define weapon_sprt
return global.sprMilkSnake;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 15;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 3;

#define weapon_text
return "HISS";

#define weapon_fire

if(fork()){
	repeat (3) {
		with instance_create(x+lengthdir_x(2, gunangle),y+lengthdir_y(2, gunangle),Bullet2){
			speed = 12.5;
			direction = other.gunangle;
			image_angle = direction;
			team = 2;
			creator = other;
			damage *= 1.5;
			sprite_index = global.sprSnake;
		}
		sound_play_gun(sndGruntFire, 1, 0.6);
		wkick += 1;
		motion_add(other.gunangle,-0.75);
		wait 2;
	}
	exit;
}

#define step

with (Bullet2) if (sprite_index = global.sprSnake){
	if (instance_exists(enemy)) && ("seek" in self){
		target = (instance_nearest(x, y, enemy));
		if (!collision_line(x, y, target.x, target.y, Wall, 1, 1)){
			direction -= angle_difference(direction, point_direction(x, y, target.x, target.y))/(point_distance(x, y, target.x, target.y)/7.5);
		}
	}
	if ("seek" not in self){seek = 1};
	image_angle = direction;
}