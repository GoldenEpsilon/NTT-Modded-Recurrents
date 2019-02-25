#define init
global.sprHvNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAElBMVEUAAAAAAAAyOT5MVl1seoT///96GMQ/AAAAAXRSTlMAQObYZgAAADFJREFUeAFjwASMQIBgMjOzQHhAJhMzlMfIwsjEyATlgMSBkoQ4CD1opiHswXQBAgAAPkgAvZOu7dgAAAAASUVORK5CYII=", -4, 6.5);
global.sprHvNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAAElBMVEUAAAAAAAAZHB8mKy42PUL///9zl6ttAAAAAXRSTlMAQObYZgAAADFJREFUeAFjwASMQIBgMjOzQHhAJhMzlMfIwsjEyATlgMSBkoQ4CD1opiHswXQBAgAAPkgAvZOu7dgAAAAASUVORK5CYII=", 1, -4, 6.5);
global.sprHvNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAwAAAANCAMAAACq939wAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAACNJREFUeAFjAANGIGCAM+E8RhgAsxE8Rko5EB6m2RguQLgNACjLAHt88KczAAAAAElFTkSuQmCC", 1, -4, 6.5);

global.sprFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAJpJREFUeAHllkEKw0AMA9eT//+50EIxqM3Ke9EhczYeJNqs1w/orA3OnLvj6tytrDZ/qhbhTl3daqkBXcJ1B3+sojbiyRbXLF3LnKuuD7yZmUtSs7Fq4VWq9aOAGVnM9QXmZoBZ2Yo2bkbBmBOzwFi8GHVtmP0KTxIrPECcrzrw4wr8nXIfkMAnM/dIpJ7F3CEQPH1yx17gvH0BEGgKHR3SbAEAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);

#define weapon_name
return "HEAVY KNUCKLES";

#define weapon_sprt
return global.sprHvNknucklesF;

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxHvN" in self return brassrelmaxHvN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 7;

#define weapon_text
return "CRACKED SKULLS";

#define step
if "fistpunchyturnHvN" not in self fistpunchyturnHvN = 0;
if "otherfistwkickHvN" not in self otherfistwkickHvN = 0;
if "mightypunchingpowerHvN" not in self mightypunchingpowerHvN = 0;
if "punchstoredHvN" not in self punchstoredHvN = 0;
if "brassreloadHvN" not in self brassreloadHvN = 0;
brassrelmaxHvN = 25 - (10*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickHvN > 0 otherfistwkickHvN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	otherfistwkickHvN *= 0.6;
}

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerHvN < 15){
		mightypunchingpowerHvN += 0.4*(1 + ((maxhealth-my_health)/maxhealth)*skill_get(22));
	}
	if fistpunchyturnHvN = 0 wkick = (mightypunchingpowerHvN);
	else otherfistwkickHvN = -(mightypunchingpowerHvN);

	reload = brassreloadHvN;
	
	if (button_released(index,"fire") || (punchstoredHvN = 1)) && (brassreloadHvN <= 0){
		motion_add(other.gunangle,4+(other.mightypunchingpowerHvN)*(4/15));
		punchstoredHvN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);
		sound_play_gun(sndHammer, 0.5, 0.2);

		if fistpunchyturnHvN = 0 {
			wkick = -5 - (mightypunchingpowerHvN / 3);
			fistpunchyturnHvN = 1;
		}
		else {
			otherfistwkickHvN = 6 + (mightypunchingpowerHvN / 3);
			fistpunchyturnHvN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			AirPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction;
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerHvN/8)));
			team = other.team;
			creator = other;
			damage = int64(4 + (other.mightypunchingpowerHvN)*(24/15));
			sprite_index = global.sprFistPuffBullet;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerHvN / 1.5;
			image_speed = 0.5;
		}
		repeat(3) with instance_create(x,y+4,Dust) motion_add(other.gunangle + 180,2.5);
		mightypunchingpowerHvN = 0;
		brassreloadHvN = brassrelmaxHvN;
	}
	else if button_released(index,"fire") punchstoredHvN = 1;
	if brassreloadHvN > 0 brassreloadHvN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerHvN = 0;

with(Shank) if ("AirPuffBullet" in self) && (image_index > 2.5){
	speed = speed/4;
	mask_index = mskNone;
}

#define draw_backfist
with(Player) if (wep = "heavy knuckles") && ("otherfistwkickHvN" in self){
	draw_sprite_ext(global.sprHvNknucklesO, 1, x+lengthdir_x(otherfistwkickHvN, gunangle)+right, y+lengthdir_y(otherfistwkickHvN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprHvNknucklesB, 1, x+lengthdir_x(otherfistwkickHvN, gunangle)+right, y+lengthdir_y(otherfistwkickHvN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickHvN = 0;
instance_destroy();