#define init
global.sprUlNknucklesF1 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAGFBMVEUAAAAAAAAyJxo4pBJI/QhUQix/ZEO+/Qjo909lAAAAAXRSTlMAQObYZgAAADpJREFUeNpljkkOADEIw+oOLv//caURKgdySmKxrCGgvefw+q2VCDaa/CERi5GfGJEM0jO9bd6pD4YuU8UA/WuolD4AAAAASUVORK5CYII=", -4, 6.5);
global.sprUlNknucklesF0 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAFVBMVEUAAAAAAAAbWAYughEyJxpUQix/ZEP0Ot08AAAAAXRSTlMAQObYZgAAADlJREFUeNpljkkOACAIAx1w/P+TTQyRAz21nbCsIaC95/D7rZUINpq8kIjFyBAjkkF6prfNO/XB0AVLgADkCFh38wAAAABJRU5ErkJggg==", -4, 6.5);
global.sprUlNknucklesB1 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAG1BMVEUAAAAAAAAZEw0qIRY4pBI/MiFI/Qi+/Qj///8f5ozfAAAAAXRSTlMAQObYZgAAADpJREFUeNpljkkOADEIw+p6Cv//caURKgdySmKxrCGgvefw+q2VCDaa/CERi5GfGJEM0jO9bd6pD4YuRwQA1szyC1sAAAAASUVORK5CYII=", 1, -4, 6.5);
global.sprUlNknucklesB0 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAGFBMVEUAAAAAAAANLAMXQQgZEw0qIRY/MiH///8tkuXmAAAAAXRSTlMAQObYZgAAADlJREFUeNpljkkOACAIAx1w/P+TTQyRAz21nbCsIaC95/D7rZUINpq8kIjFyBAjkkF6prfNO/XB0AVLgADkCFh38wAAAABJRU5ErkJggg==", 1, -4, 6.5);
global.sprUlNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAClJREFUeAFjAAFGRkYQBWUjeIwQAGUjeIwIgMJhJI6DahqCh+4CFLcBACPJAGsXX+OVAAAAAElFTkSuQmCC", 1, -4, 6.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAI5JREFUeNrdlkEKwCAQA7X+/889FDqCYhr2EGiOGjN02eq2ja5ZTQifks4Ys06RHT8+UwtQoTtUfAqxCRkn7Q6g1afZpAiyqDU+A90fEfGdTJpNRi/cAROHzyazXiRrsK6c0zeVT2YvBIbs9GsJzO4fwPlS55sr9julLpDYlZl6JFLPYmgQSI0++WEvNt7eNJcJnZoYxFUAAAAASUVORK5CYII=",3,20,12);
global.sprFistPuffBulletUltra = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAAD1BMVEUAAABI/Qi+/Qj//wD////R2FK9AAAAAXRSTlMAQObYZgAAALtJREFUeAHFluEOwyAIBuHw/Z950WSENZbikob7uXx4slRFNhCRB1Q1zxXQCWBfxhgGj1KboH9LsWh0bpbUaI3qTLH5yX4ZEdsVLAhqz5XdcefuzM2x1LWZOVZcds/izBy79lzClAKXNdKuVVIUK+VkmWNInX3XprkXCi17+P4MH7csUBV7yzuwU7FgpZyKKEmIY7FQzOVi4U0xbeLuv7r/42o4Tn0XSMOV2fdIdD2LfYNA4+jTN+w1jLcfSPkLLyO6eIkAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "ULTRA KNUCKLES";

#define weapon_sprt
with(GameCont){
if "rad" in self && (rad >= 10) return global.sprUlNknucklesF1;
else return global.sprUlNknucklesF0;
}

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxUlN" in self return brassrelmaxUlN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapSword;

#define weapon_area
return 20;

#define weapon_text
return "DREAM HANDS";

#define step
if "fistpunchyturnUlN" not in self fistpunchyturnUlN = 0;
if "otherfistwkickUlN" not in self otherfistwkickUlN = 0;
if "mightypunchingpowerUlN" not in self mightypunchingpowerUlN = 0;
if "punchstoredUlN" not in self punchstoredUlN = 0;
if "brassreloadUlN" not in self brassreloadUlN = 0;
brassrelmaxUlN = 10 - (4*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickUlN > 0 otherfistwkickUlN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	brassreloadUlN *= 0.6;
}

if (GameCont.rad >= 10){
ultknukwingsprt = global.sprFistPuffBulletUltra;
ultknukmin = 10;
ultknukmax = 15;
ultknukforce = 0.75;
}
else {
ultknukwingsprt = global.sprFistPuffBullet;
ultknukmin = 2;
ultknukmax = 6;
ultknukforce = 5;
}

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerUlN < 15){
		mightypunchingpowerUlN += 2*(1 + ((maxhealth-my_health)/maxhealth)*skill_get(22));
	}
	if fistpunchyturnUlN = 0 wkick = (mightypunchingpowerUlN);
	else otherfistwkickUlN = -(mightypunchingpowerUlN);

	reload = brassreloadUlN;
	
	if (button_released(index,"fire") || (punchstoredUlN = 1)) && (brassreloadUlN <= 0){
		motion_add(other.gunangle,2+(other.mightypunchingpowerUlN)*(2/15));
		punchstoredUlN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);

		if fistpunchyturnUlN = 0 {
			wkick = -4 - (mightypunchingpowerUlN / 3);
			fistpunchyturnUlN = 1;
		}
		else {
			otherfistwkickUlN = 5 + (mightypunchingpowerUlN / 3);
			fistpunchyturnUlN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			AirPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerUlN/8)));
			team = other.team;
			creator = other;
			damage = int64(other.ultknukmin + (other.mightypunchingpowerUlN)*(other.ultknukmax/15));
			sprite_index = other.ultknukwingsprt
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerUlN / other.ultknukforce;
			image_speed = 0.5;
		}
		mightypunchingpowerUlN = 0;
		brassreloadUlN = brassrelmaxUlN;
		if GameCont.rad >= 10 GameCont.rad -= 10;
	}
	else if button_released(index,"fire") punchstoredUlN = 1;
	if brassreloadUlN > 0 brassreloadUlN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerUlN = 0;

with(Shank) if ("AirPuffBullet" in self) && (image_index > 2.5){
	speed = speed/4;
	mask_index = mskNone;
}

#define draw_backfist
with(Player) if (wep = "ultra knuckles") && ("otherfistwkickUlN" in self){
	draw_sprite_ext(global.sprUlNknucklesO, 1, x+lengthdir_x(otherfistwkickUlN, gunangle)+right, y+lengthdir_y(otherfistwkickUlN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	if (GameCont.rad >= 10) draw_sprite_ext(global.sprUlNknucklesB1, 1, x+lengthdir_x(otherfistwkickUlN, gunangle)+right, y+lengthdir_y(otherfistwkickUlN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
	else draw_sprite_ext(global.sprUlNknucklesB0, 1, x+lengthdir_x(otherfistwkickUlN, gunangle)+right, y+lengthdir_y(otherfistwkickUlN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickUlN = 0;
instance_destroy();