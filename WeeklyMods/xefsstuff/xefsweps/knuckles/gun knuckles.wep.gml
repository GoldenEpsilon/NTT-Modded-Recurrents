#define init
global.sprGnNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAA8AAAANCAMAAABBwMRzAAAAIVBMVEUAAAAAAAAOEBEeIyYsMzgyOT4/GRNMVl1fLyZseoT////eplciAAAAAXRSTlMAQObYZgAAAEpJREFUeNptzkEKwEAIQ9FmtGruf+GmgpQp83dvEfE6BvxIvI3yjlKBJjNRrgpogzLpxc+mNpNWidnHyrTQfu4vFWIH5Q5sL4mHHruIAcFZ7dirAAAAAElFTkSuQmCC", -4, 6.5);
global.sprGnNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAANCAMAAABBwMRzAAAAIVBMVEUAAAAAAAAHCAgPERMWGRwZHB8fDAkmKy4vFxM2PUL///88L/k4AAAAAXRSTlMAQObYZgAAAEpJREFUeNptzkEKwEAIQ9FmtGruf+GmgpQp83dvEfE6BvxIvI3yjlKBJjNRrgpogzLpxc+mNpNWidnHyrTQfu4vFWIH5Q5sL4mHHruIAcFZ7dirAAAAAElFTkSuQmCC", 1, -4, 6.5);
global.sprGnNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAA8AAAANCAMAAABBwMRzAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACdJREFUeAFjAANGRgZkwAgFUB4CwLkIAUZUQDEfKIDbQnT3IQCMCwA67QCSaV3+qAAAAABJRU5ErkJggg==", 1, -4, 6.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAI5JREFUeNrdlkEKwCAQA7X+/889FDqCYhr2EGiOGjN02eq2ja5ZTQifks4Ys06RHT8+UwtQoTtUfAqxCRkn7Q6g1afZpAiyqDU+A90fEfGdTJpNRi/cAROHzyazXiRrsK6c0zeVT2YvBIbs9GsJzO4fwPlS55sr9julLpDYlZl6JFLPYmgQSI0++WEvNt7eNJcJnZoYxFUAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "GUN KNUCKLES";

#define weapon_sprt
return global.sprGnNknucklesF;

#define weapon_type
return 1;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxGnN" in self return brassrelmaxGnN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapMotorized;

#define weapon_area
return 12;

#define weapon_text
return "BROKEN FINGERS";

#define step
if "fistpunchyturnGnN" not in self fistpunchyturnGnN = 0;
if "otherfistwkickGnN" not in self otherfistwkickGnN = 0;
if "mightypunchingpowerGnN" not in self mightypunchingpowerGnN = 0;
if "punchstoredGnN" not in self punchstoredGnN = 0;
if "brassreloadGnN" not in self brassreloadGnN = 0;
brassrelmaxGnN = 20 - (8*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickGnN > 0 otherfistwkickGnN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	brassreloadGnN *= 0.6;
}

if (mightypunchingpowerGnN >= 14) && (gunfisttripped = 0) && (ammo[1] >= 2){
	sound_play_pitchvol(sndEmpty, 1.25, 1.25);
	gunfisttripped = 1;
}
else if (mightypunchingpowerGnN < 14) || "gunfisttripped" not in self gunfisttripped = 0;

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerGnN < 15){
		mightypunchingpowerGnN += 1 + ((maxhealth-my_health)/maxhealth)*skill_get(22);
	}
	if fistpunchyturnGnN = 0 wkick = (mightypunchingpowerGnN/1.25);
	else otherfistwkickGnN = -(mightypunchingpowerGnN/1.25);

	reload = brassreloadGnN;
	
	if (button_released(index,"fire") || (punchstoredGnN = 1)) && (brassreloadGnN <= 0){
		punchstoredGnN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);

		if fistpunchyturnGnN = 0 {
			wkick = -3 - (mightypunchingpowerGnN / 3);
			fistpunchyturnGnN = 1;
		}
		else {
			otherfistwkickGnN = 4 + (mightypunchingpowerGnN / 3);
			fistpunchyturnGnN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			AirPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction;
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerGnN/8)));
			team = other.team;
			creator = other;
			damage = int64(2 + (other.mightypunchingpowerGnN)*(14/15));
			sprite_index = global.sprFistPuffBullet;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerGnN / 2;
			image_speed = 0.5;
		}
		if (mightypunchingpowerGnN > 14) && ammo[1] >= 2{
			repeat (2) with instance_create(x,y,Bullet1){
				speed = 7.5 + 2.5 * (skill_get(13)=1);
				direction = other.gunangle + (random(30)-15)*other.accuracy;
				image_angle = direction;
				team = other.team;
				creator = other;
			}
			sound_play_gun(sndMachinegun, 0.5, 0.6);
			motion_add(other.gunangle+180,1.5+(other.mightypunchingpowerGnN)*(1.5/15));
			ammo[1] -= 2;
		}
		else motion_add(other.gunangle,2+(other.mightypunchingpowerGnN)*(2/15));
		mightypunchingpowerGnN = 0;
		brassreloadGnN = brassrelmaxGnN;
		
	}
	else if button_released(index,"fire") punchstoredGnN = 1;
	if brassreloadGnN > 0 brassreloadGnN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerGnN = 0;

with(Shank) if ("AirPuffBullet" in self) && (image_index > 2.5){
	speed = speed/4;
	mask_index = mskNone;
}

#define draw_backfist
with(Player) if (wep = "gun knuckles") && ("otherfistwkickGnN" in self){
	draw_sprite_ext(global.sprGnNknucklesO, 1, x+lengthdir_x(otherfistwkickGnN, gunangle)+right, y+lengthdir_y(otherfistwkickGnN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprGnNknucklesB, 1, x+lengthdir_x(otherfistwkickGnN, gunangle)+right, y+lengthdir_y(otherfistwkickGnN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickGnN = 0;
instance_destroy();