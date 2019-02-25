#define init
global.sprLiNknucklesF = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAMAAACecocUAAAAGFBMVEUAAAAAAAAPJ04RS6waFyYfcv8tKzZOS11SmOvyAAAAAXRSTlMAQObYZgAAADJJREFUeAFjQAeMIABlsbGzs7MxgphsjCyMLMysEDYLGyMbEzOEDYIY4gj1qOYgzEcBADoRAOGlT10RAAAAAElFTkSuQmCC", -4, 5.5);
global.sprLiNknucklesB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAMAAACecocUAAAAG1BMVEUAAAAAAAANCxMPJ04RS6wWFRsfcv8nJS7///+NyZ+QAAAAAXRSTlMAQObYZgAAADJJREFUeAFjQAeMIABlsbKzs7MygpisjEyMTCxsEDYTKyMrMwuEDYIY4gj1qOYgzEcBADWDAND0MoPYAAAAAElFTkSuQmCC", 1, -4, 5.5);
global.sprLiNknucklesO = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAsAAAALCAMAAACecocUAAAABlBMVEUAAAD///+l2Z/dAAAAAXRSTlMAQObYZgAAAB1JREFUeAFjAAFGEICwoADMhHMYKWAjcVDNR9gLABpyAGbHYUlhAAAAAElFTkSuQmCC", 1, -4, 5.5);

global.sprFistPuffBulletLightning = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAADFBMVEUAAAAAAACfw93///+j7EZdAAAAAXRSTlMAQObYZgAAANxJREFUeAG109GKhTAMRdFzsv//nwcuLZg7McRxuh/0QWRRmugTOV9a33UXK/0tkOQ6QLToG9rg20SPzuiIWJZ2/tTI9OpI9rJtJ7Z02S/VPZG9sJBrt4StrrFsKyKsa7iK/VDfCLYvV71j70wJ/4ts6TecfvmC8QAe73OWQakkn4OLLjAewZrCbmEdg60ZvN3TMMk9AFslDMndTWDenBiJgj0OIwnfNHDHU11NE6ddhSOJb2CYwxGWarnSe/GRG7IqGoOhd7lpwn7l3TKp3d6eq7nH1ztnZ73f30E/oTQG/LOhVWkAAAAASUVORK5CYII=",3,20,12);
global.mskFistPuffBullet = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAYCAMAAAC/Wk/yAAAAD1BMVEUAAAByn7+fw90AAAD///+ZwqRsAAAAA3RSTlMAAAD6dsTeAAAASElEQVR4AWOAACZkwIwMGJAApgKsShkZGeGKcCplBCIgQAjhMxSqjLBKZqIACQqZiQR0VjiqkOpxTXQyIzLhkpAViM9cRGdXAFg8Cg/vnLYcAAAAAElFTkSuQmCC",1,20,12);
#define weapon_name
return "LIGHTNING KNUCKLES";

#define weapon_sprt
return global.sprLiNknucklesF;

#define weapon_type
return 0;

#define weapon_melee
return false;

#define weapon_auto
return false;

#define weapon_load
if "brassrelmaxLiN" in self return brassrelmaxLiN;
else return 0;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 11;

#define weapon_text
return "SHOCKER";

#define step
if "fistpunchyturnLiN" not in self fistpunchyturnLiN = 0;
if "otherfistwkickLiN" not in self otherfistwkickLiN = 0;
if "mightypunchingpowerLiN" not in self mightypunchingpowerLiN = 0;
if "punchstoredLiN" not in self punchstoredLiN = 0;
if "brassreloadLiN" not in self brassreloadLiN = 0;
brassrelmaxLiN = 15 - (6*(maxhealth-my_health)/maxhealth)*skill_get(22);
if otherfistwkickLiN > 0 otherfistwkickLiN -= 1;

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	otherfistwkickLiN *= 0.6;
}

if (argument0){
	if button_check(index,"fire") && (mightypunchingpowerLiN < 15){
		mightypunchingpowerLiN += 0.75*(1 + ((maxhealth-my_health)/maxhealth)*skill_get(22));
	}
	if fistpunchyturnLiN = 0 wkick = (mightypunchingpowerLiN);
	else otherfistwkickLiN = -(mightypunchingpowerLiN);

	reload = brassreloadLiN
	
	if (button_released(index,"fire") || (punchstoredLiN = 1)) && (brassreloadLiN <= 0){
		motion_add(other.gunangle,2+(other.mightypunchingpowerLiN)*(2/15));
		punchstoredLiN = 0;
		sound_play_gun(sndWrench, 0.5, 0.6);

		if fistpunchyturnLiN = 0 {
			wkick = -4 - (mightypunchingpowerLiN / 3);
			fistpunchyturnLiN = 1;
		}
		else {
			otherfistwkickLiN = 5 + (mightypunchingpowerLiN / 3);
			fistpunchyturnLiN = 0;
		}

		with instance_create((x+lengthdir_x(30 + 10*skill_get(13), gunangle)),(y+lengthdir_y(30 + 10*skill_get(13), gunangle)),Shank){
			LightningPuffBullet = 1;
			speed = other.speed / 2;
			direction = other.direction;
			image_angle = other.gunangle;
			motion_add(other.gunangle + (random(30)-15)*other.accuracy,(3 * skill_get(13) + (other.mightypunchingpowerLiN/8)));
			team = other.team;
			creator = other;
			damage = int64(2 + (other.mightypunchingpowerLiN)*(10/15));
			sprite_index = global.sprFistPuffBulletLightning;
			mask_index = global.mskFistPuffBullet;
			force = other.mightypunchingpowerLiN / 3;
			image_speed = 0.5;
		}
		mightypunchingpowerLiN = 0;
		brassreloadLiN = brassrelmaxLiN;
	}
	else if button_released(index,"fire") punchstoredLiN = 1;
	if brassreloadLiN > 0 brassreloadLiN -= 1;
	script_bind_draw(draw_backfist, depth);
}
else mightypunchingpowerLiN = 0;


with(Shank) if ("LightningPuffBullet" in self){
	if (image_index > 2.5) {
		speed = speed/4;
		mask_index = mskNone;
	}
	with (hitme) if (team != other.team) && (sprite_index = spr_hurt) && (("shocking" not in self) || (shocking = 0))
	&& (place_meeting(x, y, other)) {
		with(other){
			with (instance_create(x, y, Lightning)) {
				sound_play(sndLightningHammer);
				image_angle = other.direction + random(30) - 15;
				team = other.team;
				creator = other.creator;
				ammo = 8;
				event_perform(ev_alarm, 0);
				visible = false;
				with (instance_create(x, y, LightningSpawn)) image_angle = other.image_angle;
			}
		}
		shocking = 1;
	}
}

with (hitme) if (sprite_index != spr_hurt) && ("shocking" in self) shocking = 0;

#define draw_backfist
with(Player) if (wep = "lightning knuckles") && ("otherfistwkickLiN" in self){
	draw_sprite_ext(global.sprLiNknucklesO, 1, x+lengthdir_x(otherfistwkickLiN, gunangle)+right, y+lengthdir_y(otherfistwkickLiN, gunangle)-2, 1, right, gunangle,player_get_color(index),image_alpha);
	draw_sprite_ext(global.sprLiNknucklesB, 1, x+lengthdir_x(otherfistwkickLiN, gunangle)+right, y+lengthdir_y(otherfistwkickLiN, gunangle)-2, 1, right, gunangle,c_white,image_alpha);
}
else otherfistwkickLiN = 0;
instance_destroy();