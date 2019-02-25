#define init
global.sprBrNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAJCAMAAAA8eE0hAAAAElBMVEUAAAAAAAAyOT5MVl1seoT///96GMQ/AAAAAXRSTlMAQObYZgAAAC1JREFUeNpFzFEKAEAIQsFeev8zLxuFfg0i1g9QC9mM1I2OkswQmmXabPOQ3wcWZQBzmejJ8gAAAABJRU5ErkJggg==", -4, 4.5);
global.sprBrNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAJCAMAAAA8eE0hAAAAElBMVEUAAAAAAAAZHB8mKy42PUL///9zl6ttAAAAAXRSTlMAQObYZgAAAC1JREFUeNpFzFEKAEAIQsFeev8zLxuFfg0i1g9QC9mM1I2OkswQmmXabPOQ3wcWZQBzmejJ8gAAAABJRU5ErkJggg==", 1, -4, 4.5);
global.sprBrNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAoAAAALCAMAAABxsOwqAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACFJREFUeAFjAAFGRkYGGAPKZoQCEAuTyUiIiWICwlwk2wAT4ABTCd5b6AAAAABJRU5ErkJggg==", 1, -4, 5.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAI5JREFUeNrdlkEKwCAQA7X+/889FDqCYhr2EGiOGjN02eq2ja5ZTQifks4Ys06RHT8+UwtQoTtUfAqxCRkn7Q6g1afZpAiyqDU+A90fEfGdTJpNRi/cAROHzyazXiRrsK6c0zeVT2YvBIbs9GsJzO4fwPlS55sr9julLpDYlZl6JFLPYmgQSI0++WEvNt7eNJcJnZoYxFUAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "KNUCKLES";

#define weapon_sprt
return global.sprBrNknucklesF;

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxBrN" in self return brassrelmaxBrN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 2;

#define weapon_text
return "HEAVY HANDS";

#define step
if "fistpunchyturnBrN" not in self fistpunchyturnBrN = 0;
if "otherfistwkickBrN" not in self otherfistwkickBrN = 0;
if "mightypunchingpowerBrN" not in self mightypunchingpowerBrN = 0;
if "punchstoredBrN" not in self punchstoredBrN = 0;
if "brassreloadBrN" not in self brassreloadBrN = 0;
brassrelmaxBrN = 15 - (6*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickBrN > 0 otherfistwkickBrN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	brassreloadBrN *= 0.6;
}

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerBrN < 15){
		mightypunchingpowerBrN += 1 + ((maxhealth-my_health)/maxhealth)*skill_get(22);
	}
	if fistpunchyturnBrN = 0 wkick = (mightypunchingpowerBrN);
	else otherfistwkickBrN = -(mightypunchingpowerBrN);

	reload = brassreloadBrN;
	
	if (button_released(index,"fire") || (punchstoredBrN = 1)) && (brassreloadBrN <= 0){
		motion_add(other.gunangle,2+(other.mightypunchingpowerBrN)*(2/15));
		punchstoredBrN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);

		if fistpunchyturnBrN = 0 {
			wkick = -4 - (mightypunchingpowerBrN / 3);
			fistpunchyturnBrN = 1;
		}
		else {
			otherfistwkickBrN = 5 + (mightypunchingpowerBrN / 3);
			fistpunchyturnBrN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			AirPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerBrN/8)));
			team = other.team;
			creator = other;
			damage = int64(2 + (other.mightypunchingpowerBrN)*(14/15));
			sprite_index = global.sprFistPuffBullet;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerBrN / 2;
			image_speed = 0.5;
		}
		mightypunchingpowerBrN = 0;
		brassreloadBrN = brassrelmaxBrN;
	}
	else if button_released(index,"fire") punchstoredBrN = 1;
	if brassreloadBrN > 0 brassreloadBrN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerBrN = 0;

with(Shank) if ("AirPuffBullet" in self) && (image_index > 2.5){
	speed = speed/4;
	mask_index = mskNone;
}

#define draw_backfist
with(Player) if (wep = "knuckles") && ("otherfistwkickBrN" in self){
	draw_sprite_ext(global.sprBrNknucklesO, 1, x+lengthdir_x(otherfistwkickBrN, gunangle)+right, y+lengthdir_y(otherfistwkickBrN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprBrNknucklesB, 1, x+lengthdir_x(otherfistwkickBrN, gunangle)+right, y+lengthdir_y(otherfistwkickBrN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickBrN = 0;
instance_destroy();