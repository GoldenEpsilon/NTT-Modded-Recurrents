#define init
global.sprPlNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAJCAMAAAA8eE0hAAAAElBMVEUAAAAAAABITDx5fmuqr5f///9+axrBAAAAAXRSTlMAQObYZgAAAC5JREFUeNpFjEkKAEAMwpqx/3/zdAPFQwhidIA4UCZDyUOL6owuV120xVs/+PcDFpkAdAAvjfsAAAAASUVORK5CYII=", -4, 4.5);
global.sprPlNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAoAAAAJCAMAAAA8eE0hAAAAElBMVEUAAAAAAAAkJh48PzVVV0v///9YOoa5AAAAAXRSTlMAQObYZgAAAC5JREFUeNpFjEkKAEAMwpqx/3/zdAPFQwhidIA4UCZDyUOL6owuV120xVs/+PcDFpkAdAAvjfsAAAAASUVORK5CYII=", 1, -4, 4.5);
global.sprPlNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAoAAAALCAMAAABxsOwqAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACFJREFUeAFjAAFGRkYGGAPKZoQCEAuTyUiIiWICwlwk2wAT4ABTCd5b6AAAAABJRU5ErkJggg==", 1, -4, 5.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAI5JREFUeNrdlkEKwCAQA7X+/889FDqCYhr2EGiOGjN02eq2ja5ZTQifks4Ys06RHT8+UwtQoTtUfAqxCRkn7Q6g1afZpAiyqDU+A90fEfGdTJpNRi/cAROHzyazXiRrsK6c0zeVT2YvBIbs9GsJzO4fwPlS55sr9julLpDYlZl6JFLPYmgQSI0++WEvNt7eNJcJnZoYxFUAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "PILLBUGS";

#define weapon_sprt
return global.sprPlNknucklesF;

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxPlN" in self return brassrelmaxPlN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapGold;

#define weapon_area
return -1;

#define weapon_text
return "WORN BRASS";

#define step
if "fistpunchyturnPlN" not in self fistpunchyturnPlN = 0;
if "otherfistwkickPlN" not in self otherfistwkickPlN = 0;
if "mightypunchingpowerPlN" not in self mightypunchingpowerPlN = 0;
if "punchstoredPlN" not in self punchstoredPlN = 0;
if "brassreloadPlN" not in self brassreloadPlN = 0;
brassrelmaxPlN = 13 - (5.2*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickPlN > 0 otherfistwkickPlN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	otherfistwkickPlN *= 0.6;
}

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerPlN < 15){
		mightypunchingpowerPlN += 1.1*(1 + ((maxhealth-my_health)/maxhealth)*skill_get(22));
	}
	if fistpunchyturnPlN = 0 wkick = (mightypunchingpowerPlN);
	else otherfistwkickPlN = -(mightypunchingpowerPlN);

	reload = brassreloadPlN;

	if (button_released(index,"fire") || (punchstoredPlN = 1)) && (brassreloadPlN <= 0){
		motion_add(other.gunangle,2+(other.mightypunchingpowerPlN)*(2/15));
		punchstoredPlN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);

		if fistpunchyturnPlN = 0 {
			wkick = -4 - (mightypunchingpowerPlN / 3);
			fistpunchyturnPlN = 1;
		}
		else {
			otherfistwkickPlN = 5 + (mightypunchingpowerPlN / 3);
			fistpunchyturnPlN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			AirPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerPlN/8)));
			team = other.team;
			creator = other;
			damage = int64(2 + (other.mightypunchingpowerPlN)*(14/15));
			sprite_index = global.sprFistPuffBullet;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerPlN / 2;
			image_speed = 0.5;
		}
		mightypunchingpowerPlN = 0;
		brassreloadPlN = brassrelmaxPlN;
	}
	else if button_released(index,"fire") punchstoredPlN = 1;
	if brassreloadPlN > 0 brassreloadPlN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerPlN = 0;

with(Shank) if ("AirPuffBullet" in self) && (image_index > 2.5){
	speed = speed/4;
	mask_index = mskNone;
}

#define draw_backfist
with(Player) if (wep = "pillbugs") && ("otherfistwkickPlN" in self){
	draw_sprite_ext(global.sprPlNknucklesO, 1, x+lengthdir_x(otherfistwkickPlN, gunangle)+right, y+lengthdir_y(otherfistwkickPlN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprPlNknucklesB, 1, x+lengthdir_x(otherfistwkickPlN, gunangle)+right, y+lengthdir_y(otherfistwkickPlN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickPlN = 0;
instance_destroy();