#define init
global.sprSerpent = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABQAAAALCAMAAABI111xAAAAHlBMVEUAAAAaFyb///8AAAAdGyMvLjRITDxRUFh5fmuqr5ekldgcAAAAA3RSTlMAAAD6dsTeAAAAUklEQVR4AVXNURJEEQxE0R5pxP43POlURL3zgxsFhgBaW8enIuwDGW1yNkY12XM37oiMYd6k6KB4+TnHyXzUQm4zKul3/IwaLndfFqHigxvLaH8t3gKyiZRxyQAAAABJRU5ErkJggg==", 3, 4);
global.sprSnake = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAMAAABA3o1rAAAADFBMVEUAAAAn6oOS/9D////Et/51AAAAAXRSTlMAQObYZgAAAEhJREFUeNq9kUEOABAMBLX9/591N6QutU7mxkyEGm+YJ3bXTHofSVvQrwI9Oc40eoINqtigwLIKBlH4h0BeUj1TDEqPWn+WZgK90AKlRm2ZYAAAAABJRU5ErkJggg==",2,8,8);

#define weapon_name
return "SERPENT";

#define weapon_sprt
return global.sprSerpent;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 30;

#define weapon_cost
return 9;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 9;

#define weapon_text
return "SLIPPERY";

#define weapon_fire

if(fork()){
	repeat (4) {
		with instance_create(x+lengthdir_x(10, gunangle),y+lengthdir_y(10, gunangle),Bullet2){
			speed = 17.5;
			direction = other.gunangle;
			image_angle = direction;
			team = 2;
			creator = other;
			damage *= 2.5;
			image_xscale = 1.1;
			image_yscale = 1.1;
			sprite_index = global.sprSnake;
		}
		sound_play_gun(sndGruntFire, 1, 0.3);
		wkick += 2;
		motion_add(other.gunangle,-1);
		wait 2;
	}
	exit;
}

#define step

with (Bullet2) if (sprite_index = global.sprSnake){
	if (instance_exists(enemy)) && ("seek" in self){
		target = (instance_nearest(x, y, enemy));
		if (!collision_line(x, y, target.x, target.y, Wall, 1, 1)){
			direction -= angle_difference(direction, point_direction(x, y, target.x, target.y))/(point_distance(x, y, target.x, target.y)/20);
		}
	}
	if ("seek" not in self){seek = 1};
	image_angle = direction;
}