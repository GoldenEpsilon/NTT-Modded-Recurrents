#define init
global.sprSerpent = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABYAAAALCAMAAABMIo1MAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAERJREFUeNqdzEEKwDAIRNHOJHHuf+OogWkXhULfSj/o9QeA1xyBhypNGsbsYE/SMq7KTeJtZC5kxLny8wRiTu+WW5VvG4eoASS/k4FEAAAAAElFTkSuQmCC", 2, 5);
global.sprRail = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAQCAMAAABncAyDAAAAElBMVEUAAAD//wD///8n6oOS/9D/////y+RBAAAAA3RSTlMAAAD6dsTeAAAAWUlEQVR4AZWSUQoEIQxDTZrc/8qLUHaY/kzzEEGoxGd7cjgOn1C4+y2FuIqwQImQeTZAdi8sLdysAjriMgKqNKm2dvNyfsr9RxVfSJ+USeffmjcuH418+HJ+B/IDP625JJ4AAAAASUVORK5CYII=",2,9,8);

#define weapon_name
return "CRICKET";

#define weapon_sprt
return global.sprSerpent;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 10;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 5;

#define weapon_text
return "PUP PEP PIP POP PUP PEP POP";

#define weapon_fire

with instance_create(x+lengthdir_x(2, gunangle),y+lengthdir_y(2, gunangle),Bullet1){
	speed = 20;
	direction = other.gunangle;
	image_angle = direction;
	team = 2;
	creator = other;
	damage *= 3;
	sprite_index = global.sprRail;
}
sound_play_gun(sndTurretFire, 0.25, 0.6);
motion_add(other.gunangle,-60)
wkick += 8;

cktclick = 1;

#define step
if (argument0) {
	if (("cktclick" in self) && (cktclick = 1) && (reload < 1)) {
		cktclick = 0;
		sound_play_pitchvol(sndEmpty, 2, 0.75);
		sound_play_pitchvol(sndCrystalShield, 2.5, 0.5);
		
		repeat(2) with instance_create(x,y,Shell) {
			direction = other.gunangle + 180 + random_range(-30,30);
			speed = 5;
		}
		
		wkick = -2;
	}
}