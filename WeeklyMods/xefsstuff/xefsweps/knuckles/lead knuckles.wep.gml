#define init
global.sprPbNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAMAAAB4W0xQAAAAElBMVEUAAAAAAAAaFyYtKzZOS13////8M8ZVAAAAAXRSTlMAQObYZgAAADNJREFUeNptzUEKADAIA8HGzf/fXBGhgt3bIOr5pK5BgE1ZBoWzVNFM2qioPX27+/L+O7tLuwDqElGbVQAAAABJRU5ErkJggg==", -4, 5.5);
global.sprPbNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAMAAAB4W0xQAAAAElBMVEUAAAAAAAANCxMWFRsnJS7///9MvwKGAAAAAXRSTlMAQObYZgAAADNJREFUeNptzUEKADAIA8HGzf/fXBGhgt3bIOr5pK5BgE1ZBoWzVNFM2qioPX27+/L+O7tLuwDqElGbVQAAAABJRU5ErkJggg==", 1, -4, 5.5);
global.sprPbNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA4AAAALCAMAAAB4W0xQAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAB5JREFUeAFjAAFGKIBzEHxGZIDGw+CSoBgvnwHNVQAqfACDE4LxWAAAAABJRU5ErkJggg==", 1, -4, 5.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAH4AAAAYCAMAAAALULn9AAAAFVBMVEUAAAByn7+fw93///9yn7+fw93///89T4TsAAAABHRSTlMAAAAAs5NmmgAAAPhJREFUeAHFlltuwzAMBGVWy/sfuQ8aKoLQU20bo/NteMTVgxwNeiBiEBE6GRagTeU30qX/iKmTrw//ps6eXn8c83TngiOID9ov5lReIil6d5dW76cV1J+SF0DpZwF6WMAsml3n/V/2IouN+OuwPuVPCejn47+X/uenzQYsJN9f9Xjx8+Vz9GsFvZ79Hcq0/W9Qfps+IIEd/Eb67IeT75QP4RNc/d165X+GL3vv/aOn64vHrx4/PObFa54dV+8/Oy9/dFfxxrVvWo5Izy2n0FbL2W+4MHGV38qp7/gJ0LjxPPD86s5x8q8ftrjbmaMmFO6jB2LcOGi/AyCHF4cgUSTJAAAAAElFTkSuQmCC",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "LEAD KNUCKLES";

#define weapon_sprt
return global.sprPbNknucklesF;

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxPbN" in self return brassrelmaxPbN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 17;

#define weapon_text
return "AND KNUCKLES";

#define step
if "fistpunchyturnPbN" not in self fistpunchyturnPbN = 0;
if "otherfistwkickPbN" not in self otherfistwkickPbN = 0;
if "mightypunchingpowerPbN" not in self mightypunchingpowerPbN = 0;
if "punchstoredPbN" not in self punchstoredPbN = 0;
if "brassreloadPbN" not in self brassreloadPbN = 0;
brassrelmaxPbN = 30 - (12*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickPbN > 0 otherfistwkickPbN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	otherfistwkickPbN *= 0.6;
}

if (argument0){
	speed *= 0.9; 
	if button_check(index,"fire") && (mightypunchingpowerPbN < 15){
		mightypunchingpowerPbN += 0.25*(1 + ((maxhealth-my_health)/maxhealth)*skill_get(22));
	}
	if fistpunchyturnPbN = 0 wkick = (mightypunchingpowerPbN);
	else otherfistwkickPbN = -(mightypunchingpowerPbN);

	reload = brassreloadPbN;
	
	if (button_released(index,"fire")) && (brassreloadPbN <= 0){
		motion_add(other.gunangle,4+(other.mightypunchingpowerPbN)*(4/15));
		punchstoredPbN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);
		sound_play_gun(sndHammer, 0.5, 0.2);

		if fistpunchyturnPbN = 0 {
			wkick = -5 - (mightypunchingpowerPbN / 3);
			fistpunchyturnPbN = 1;
		}
		else {
			otherfistwkickPbN = 6 + (mightypunchingpowerPbN / 3);
			fistpunchyturnPbN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			LeadPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction;
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerPbN/8)));
			team = other.team;
			creator = other;
			damage = int64(8 + (other.mightypunchingpowerPbN)*(28/15));
			sprite_index = global.sprFistPuffBullet;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerPbN / 5;
			image_speed = 0.5;
		}
		repeat(3) with instance_create(x,y+4,Dust) motion_add(other.gunangle + 180,2.5);
		mightypunchingpowerPbN = 0;
		brassreloadPbN = brassrelmaxPbN;
	}
	if brassreloadPbN > 0 brassreloadPbN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerPbN = 0;

with(Shank) if ("LeadPuffBullet" in self){
	if (image_index > 2.5) {
		speed = speed/4;
		mask_index = mskNone;
	}
	with (Wall) if (place_meeting(x, y, other)) {
		instance_create(x,y,FloorExplo);
		instance_destroy();
	}
}

#define draw_backfist
with(Player) if (wep = "lead knuckles") && ("otherfistwkickPbN" in self){
	draw_sprite_ext(global.sprPbNknucklesO, 1, x+lengthdir_x(otherfistwkickPbN, gunangle)+right, y+lengthdir_y(otherfistwkickPbN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprPbNknucklesB, 1, x+lengthdir_x(otherfistwkickPbN, gunangle)+right, y+lengthdir_y(otherfistwkickPbN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickPbN = 0;
instance_destroy();