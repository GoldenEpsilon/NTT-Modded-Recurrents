#define init
global.spr_PatrolIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAWgAAAAYCAMAAADgbpeSAAAAJFBMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5fY4vEbzHGgAAAAAXRSTlMAQObYZgAAATdJREFUeAHt1MGOgkAQhOGtmYFh4P3fdylpWdNYJhy8bHcd1HyQn2RI/Mnlcv95OCf9+w8I4GjPeV9s9/s6FNXJH3ys+3xHu+/oUDgnf/C+9u47wkVfhtLN+/rneHf/2B3QHRFKd07YfV3HsgL+/lonruLaGezoULr30ZbK8/QHyvur7dIZ9gJ0KKhDemttnoGZH4DrzMdMdd9CdEb4FdT5++HbPu/zedKm1llIuDrIcC+GIbxcCexle845zpM2tY500GH+GjqfHNrbto//0tubg6NfO3bS3mnWdyGAISC0l7L1Tu/e4f3s2AvQfR0K6uillDYGfWi/39eheM4dfgza7/d1KKBzKGUqbdnXyMpdh677OhTVOUwTwFXt9/s6FNkJqNpv992FB6R/1SkHIP1bfn+5XC73C3ZzOotXzGopAAAAAElFTkSuQmCC",15,12,12);
global.spr_PatrolWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAOVBMVEUAAAAAAAAVJC8dGhcgN0YjIB4mO0oyLis2MzBITDxKXHxMUEFVepJXepF5fmt6f22nrZeqr5f///9G7xiwAAAAAXRSTlMAQObYZgAAAatJREFUeAHtk2GPmzAQRP1I7Za4HPD//2w3ZlvMaK1cG6nSSZkPnHQ2b4YnJb3zcviT/8wZ3KcsHl7klPI3HCgehGOYj92iIMLmMcdygD7HKaEI/655n2cdRDDUe2OO5QAJJxxKERHhIHkjGEqJRYwHEf9/KIK6t4N9/1h2GA593luNdIAYv6C9gQjj/Lzdbt9bbsigNnQFpDcc1EgBp5xD6XtDEdS1PPZgsT/dC5sNyvlHS+bSKyL8wEgOsufVXHZQpu8NRdjNAnc4Hr25bbn/DtdeEeGgPE12E+yh5pTTrscibNAEvkjMnTultxfRHxSORag530ka9KKGoG7bBik0p6Cg15fCvRqJFJu7cr5J71kwYVrtoA6+QEBRrxcXqhyIOdkvvRaok3HW9XGwksbm4l4FHSSemoNZez3OacmZsbmwV0D2O2ogPmFuPnu5GDLIVJZH+kGxubjXgx1YioF4bs6un739fUPQpS82uJqz4LXe2wWL08Rc8U8gRc2Gv1JSmFNd1jeM5BgJEQ0zpOYaH8YLgtCl73YCukfYag41B+mfQ9j9AuFr5Z1fjs4hmuqBr1oAAAAASUVORK5CYII=",6,12,12);
global.spr_PatrolHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAKlBMVEUAAAAAAAAVJC8jIB4mO0o2MzBITDxMUEFXepF5fmt6f22nrZeqr5f////dOi/5AAAAAXRSTlMAQObYZgAAAM9JREFUeNrllMsOgzAMBFnHEB7x//9uMakCLk23x0qd44gdkgMMP4s1okfjO2+dEHR+Au5jx+Lz+2ApOz7g3johqA+mMk0+4H6wTgm5nANwP1jkMsjFB6UscwGIv4fsHKw6p5TGg4SeZyFAVZsEED0AMzj0Zvs7L6Gb95DVDA9JJyQ1Ejw/Ud62zRA9EDw/kVjOPsh48WiehzCJiK6rD1b0PA8NdVABPnj+jYiMovOOJhBPSuOIg5QSmHfa/k2o/X+Ir4R9WID7GHrvAeL/gAdz9BYnIWyK7wAAAABJRU5ErkJggg==",3,12,12);
global.spr_PatrolDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAANlBMVEUAAABAgABITDx5fmuqr5cAAAAVJC8jIB4mO0o2MzBITDxMUEFXepF5fmt6f22nrZeqr5f///9KDyuZAAAABXRSTlMAAAAAAMJrBrEAAAGmSURBVHgB7ZbRbusgEETvJhkgxnHg/3/2LsTZLg5kncqV+tDz4IdJxRyheuR/f+yAmCwQ6RyCkR8slAdCCPMKjPxYoTwQQuDiW2Jm2PlhUB4IIZTiKU0TF9u5yflS+VAoq+KYpBgwc5PT5cR8LJRVcUylOKXbnAAjP15I+Cpewuy9v1Y8jHyHUOH8bSEghCAhgDYHUB6SfwgJLwuSB/9D4DtQQi85UB+kz99OSNurmyXGvLJLyA2EHMSoEdq+sbpXUEKob2wozPtvKN7v9+0NAW3e0REh3cs0QqGdNPuGXI6xFEdsckhuCuleRgvpSbOFMDnnwrKU4gXj3BaSXkYLoTtpfSHmUfwAGOW2kO6V5hq7dtLWCqLBUhOcu7owM8HjfS4+fSHplWYOvXMuLuE5aDIg25PUUoD/rOK9xziXQ7pCgPSqZnhfhPipJrY5iwodIRmRtznlLvUidK80o/o4DgH5CfoDjZ6oYm7Gvjz36feWZgCcgyMolBD1i2HkppDu1c3r9a4/LAxAP/XZKZDujXF5EKGWmokxSnwY1lJr1h0SVPz7+A/Tx0A6RJ0BBwAAAABJRU5ErkJggg==",6,12,12);

global.spr_PatrolSit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAAJFBMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFXepF6f22nrZf////91/UiAAAAAXRSTlMAQObYZgAAAHlJREFUeAGtyTESwzAIRFEWgwHd/8CR7NFkUZnJb37x5P9hJz3krgssc6wyjQUTbETEmAcJiqAYxoJZrTOEpb2lBQPs8rfL0OC+AewROIl3+EoHBcYK0AMiHojoAK16oEpBIFDbKaSBu2WmuXcQuGO2JgeAzwLab30AS84ERiCowCoAAAAASUVORK5CYII=",1,12,12);
global.spr_PatrolGoSit = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAIVBMVEUAAAAAAAAVJC8jIB4mO0o2MzBKXHxMUEFXepF6f22nrZcdCFSvAAAAAXRSTlMAQObYZgAAAM5JREFUeAHdjbuuxCAMRHNYjIH//+BLiCJ5Cq6L7fY0lsbzuH4fXr7001/IA//4qb3Pm94raeDsZz3qdPe5LqSBs3+Ex+AUSP0XS7CHZcgDzFtf7H8s8vph0Rqf6nkAD8MeinYFvEcG7EEHCMNIkTQFPRRBOnxh4WV5AAsPk6IC8waKxUB7Ak0DOqxF7rvIXYtKa1tvEjgNX1DG2I8xCqQDB31BqS8lDlgYME7DUmRWe+/VTIpkgPOwFHGjRTqQ6wuMcEXfJHoAwvlC/0X+ABeyDDNAuR4VAAAAAElFTkSuQmCC",3,12,12);

global.spr_PatrolPort = sprite_add_base64("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",1,40,243);
global.spr_PatrolIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAMAAAC6V+0/AAAAKlBMVEUAAAAAAAAVJC8jIB4mO0o2MzBITDxKXHxMUEFXepF5fmt6f22nrZeqr5dy02zBAAAAAXRSTlMAQObYZgAAAGxJREFUeNqV0MEWgCAIRNFGxrTM///dUIlo2dso1+OG7WfwgvGwiI91LSgGsu9750AsPCOehnPQ3+vRsJKSZ0JWQ1AEQCkQIQwlF2ApsrzoGlDHpukRMKFcGpAc9d7qwNoSoGj6oNt3SyG3n93mKwRsIWQWMgAAAABJRU5ErkJggg==",1,10,10);
global.spr_PatrolSlct = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAMAAADEfo0+AAAAKlBMVEUAAAAOHikZIDMdGhcgN0YyLiszNik7YntGWntITDxVepJ5fmuqr5f///+T/ARIAAAAbklEQVR4AW3MURLCMAiEYRAsbej9z+uKSzQZ/wdm9ntAHlt/QJYwY3wL3ba7ykA3c/QLOSE/XQ3BnQVRIOhIfYMXHCgJMXwFD8CNJrhe/ApQqcNUXXHt2Zlhc7aYbJvQNRgj4DBD0vM8i7gobJUXuN4HW9TjGxoAAAAASUVORK5CYII=",1,0,0);

global.spr_PatrolDashF = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAYCAMAAACLI47uAAAAJ1BMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxOcIdUeJBVepJ5fmuqr5c3G//kAAAAAXRSTlMAQObYZgAAALBJREFUeAHVz9FqwCAMheH+Njab+v7PO7M2sBMGvd3+CwvfQaTHH46scPUMG0+oJ1txMxtz7QbFx+8egy93GWCzeIYvywGE0z/1wpYY1ppjIWyPf5QL08b5hLB4BmYW1r8jOb2nZ2wzODvR/vxgS6ZcaHDBc4hfQXHUF3bxe2+eQ2u4x+C8+gHeWrM5Y5i8eHQPd/J078HqOTQbOyvcg8VzIOI8Ua+cAzcA4sIyHP+5L/tsCJioljJVAAAAAElFTkSuQmCC",2,12,12);
global.spr_PatrolDashB = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAYCAMAAACLI47uAAAAJFBMVEUAAAAAAAAOHikdGhcgN0YyLitGWntITDxVepJ5fmuqr5f///8+GmDeAAAAAXRSTlMAQObYZgAAAKpJREFUeNrN0kEOgzAMRNFOsOuG+x+441RiCC5ZMwuQ3ldYRLwePBy7Cxc2+/yG2UeoPrjvnMLaM8QewXBxk2uIXQfw1y1dgcKw+Rhm38Sn0C3DNpZJPrOuwkjI5evGdYDHDXgD+ahO42O4QsNxojqDXF8CghcOrFyhNURkCMgznF0hWmvWe4Z+DtUVWMaAhas0dxb+Y7Z2FXfXbRdXUIGnANUVpglKYHnyvhwBBzQUg1XBAAAAAElFTkSuQmCC",2,12,12);

global.spr_PGrenade = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAKCAMAAADFPS1+AAAAHlBMVEUAAAD///8AAAAdGyMvLjRITDxRUFh5fmuqr5f///+OSGeCAAAAAnRSTlMAAHaTzTgAAABcSURBVHjanY9LCkAxCAPT1NfP/S/8sLoIFDfNYhgMIoJX9knl4BjWKcyicoBmncEWfgp1qIPzI4PNmYU6qG6+LczTlYNrrUlhFpWD5g8Js7j8YeH1B4+yyVwd4T9A8AnPGaLUfgAAAABJRU5ErkJggg==",8,3,5);
global.spr_PPin = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAAsAAAAHCAMAAADpsEdvAAAAD1BMVEUAAAAAAABITDx5fmuqr5cuRlLEAAAAAXRSTlMAQObYZgAAACpJREFUeNpNjEEKADAMwoz2/2/eCj0oBIKIkgBdyITTARb4vsQ23fe+fx4OmQBW1feuswAAAABJRU5ErkJggg==",1,5.5,3.5);

//global.spr_ult[1] = sprite_add_base64("",1,12,16);
//global.spr_ult[2] = sprite_add_base64("",1,12,16);

//Pick sound by Zandorum -- thanks!
var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
 
  for(var i = 0; i < maxp; i++){
    var r = player_get_race(i);
    if(_race[i] != r && r == "patrol"){
      sound_play_pitch(sndEliteGruntEnter, 1.25);
    }
    _race[i] = r;
  }
 
  wait(1);
 
}

// old purp : #7863ff
// new blue : #638fff
///////////////////////////////////////////////////////////////////////////////////////////
#define game_start
global.ultra[1] = 0;
global.ultra[2] = 0;

GameCont.PatrolB_DB = false;
/*
	for debugging blink
	/gml GameCont.PatrolB_DB = true;
*/

#define create

maxhealth = 8;

snd_hurt = sndGruntHurtF;
snd_dead = sndGruntDeadF;
snd_lowh = sndGruntThrowNadeF;
snd_lowa = sndGruntThrowNadeF;
	
snd_wrld = sndGruntEnterF;
	
snd_cptn = sndGruntEnterF;
snd_thrn = sndGruntEnterF;
snd_valt = sndGruntEnterF;
snd_chst = sndGruntEnterF;
snd_spch = sndGruntEnterF;
snd_idpd = sndGruntEnterF;

snd_dash = sndSwapEnergy;

spr_idle = global.spr_PatrolIdle;
spr_walk = global.spr_PatrolWalk;
spr_hurt = global.spr_PatrolHurt;
spr_dead = global.spr_PatrolDead;
spr_sit1 = global.spr_PatrolGoSit;
spr_sit2 = global.spr_PatrolSit;
spr_dashf = global.spr_PatrolDashF;
spr_dashb = global.spr_PatrolDashB;

if ("wep" in self) && (wep = 1) && mod_exists("weapon", "pillbugs"){
    wep = "pillbugs";
}

lastx = -1;
lasty = -1;
blinkheat = 0;
bliheamax = 0;
blinkangle = -1;

#define step
// Passive
with (AmmoPickup) if (distance_to_point(other.x,other.y) <= 100) && ("patrolpassive" not in self){
	patrolpassive = 1;
	if (irandom(4) = 1){
		with instance_create(x,y,AmmoPickup){passive = 1;}
	}
}
with (HPPickup) if (distance_to_point(other.x,other.y) <= 100) && ("patrolpassive" not in self){
	patrolpassive = 1;
	if (irandom(5) = 1){
		with instance_create(x,y,HPPickup){passive = 1;}
	}
}

// Active

if (button_pressed(index,"spec")) && (blinkheat < 5){
	if button_check(index, "east") blinkangle = 000;
	if button_check(index, "nort") blinkangle = 090;
	if button_check(index, "west") blinkangle = 180;
	if button_check(index, "sout") blinkangle = 270;

	if button_check(index, "east") && button_check(index, "nort") blinkangle = 045;
	if button_check(index, "nort") && button_check(index, "west") blinkangle = 135;
	if button_check(index, "west") && button_check(index, "sout") blinkangle = 225;
	if button_check(index, "sout") && button_check(index, "east") blinkangle = 315;

	if !(button_check(index, "east") || button_check(index, "nort") || button_check(index, "west") || button_check(index, "sout"))  blinkangle = -1;

	if blinkangle != -1 {
		
		var keepgoin = true;
		if ((global.ultra[1]) && (collision_line(x,y,x+lengthdir_x(7,blinkangle),y+lengthdir_y(7,blinkangle),Wall,0,1))) {
			blinklength = 50;
			while (keepgoin) {
				if ((!collision_point(x+lengthdir_x(blinklength,blinkangle),y+lengthdir_y(blinklength,blinkangle),Wall,0,1)) && (collision_point(x+lengthdir_x(blinklength,blinkangle),y+lengthdir_y(blinklength,blinkangle),Floor,0,1))) {
					if (collision_point(x+lengthdir_x(blinklength+7,blinkangle),y+lengthdir_y(blinklength+7,blinkangle),Wall,0,1)) {
						blinklength -= 12;
						if (GameCont.PatrolB_DB) {trace("UB F| AN" + string(blinkangle)+ " OL" + string(blinklength));}
					}
					else if (GameCont.PatrolB_DB) {trace("UB N| AN" + string(blinkangle)+ " OL" + string(blinklength));}
					keepgoin = false;
				}
				else if (blinklength <= 0) {
					if (GameCont.PatrolB_DB) {trace("UB failed");}
					keepgoin = false;
				}
				else blinklength -= 1;
			}
		} else {
			blinklength = 0;
			while (keepgoin) {
				if ((collision_line(x,y,x+lengthdir_x(blinklength,blinkangle),y+lengthdir_y(blinklength,blinkangle),Wall,0,1)) || (blinklength >= 50)) {
					var blinklengthfix;
					var blink50fix;
					if (blinklength >= 40) {
						blink50fix = (blinklength - 40) / 10 * 8;
					}
					while (place_meeting(x + lengthdir_x(blinklength - blinklengthfix + blink50fix,blinkangle), y + lengthdir_y(blinklength - blinklengthfix + blink50fix,blinkangle), Wall) && (blinklengthfix <= 14)) {
						blinklengthfix += 2;
					}
					blinklengthfix *= 2;
					if (GameCont.PatrolB_DB) {trace("NB |AN" + string(blinkangle)+ " OL" + string(blinklength)+ " BF" + string(blinklengthfix)+ " BE" + string(blink50fix));}
					blinklength -= blinklengthfix;
					keepgoin = false;
				}
				else blinklength += 1;
			}
		}
		if (GameCont.PatrolB_DB) {trace("- - - -");}
		
		lastx = x;
		lasty = y;
		x = x + lengthdir_x(blinklength,blinkangle);
		y = y + lengthdir_y(blinklength,blinkangle);
		repeat(5) with instance_create(x, y+10,Dust){
			direction = other.blinkangle + random_range(-30,30);
			speed = random_range(5,7) * other.blinklength/50;
		}
		sound_play_pitchvol(snd_dash, random_range(1.25,1.75), 0.5);
	
		blinkheat = 7 + 2*floor(blinklength/10) - 5 * skill_get(5);
		bliheamax = blinkheat;
		
		if ((global.ultra[2]) && (blinkheat >= (7 - 3 * skill_get(5)))) {
			sound_play_pitchvol(sndGrenadeHitWall, 2.4 + random(0.2), 0.5);
		
			with instance_create(lastx,lasty,Shell) {
				team = other.team;
				creator = other;
				direction = other.blinkangle + 180 + random_range(-10, 10);
				image_angle = direction;
				speed = 3;
				
				image_speed = 0.5;
				sprite_index = global.spr_PGrenade;
				
				script_bind_step(PGrenade, 0, id);
			}
			
			with instance_create(lastx,lasty,Shell) {
				direction = other.blinkangle + 90 + random_range(-20, 20);
				speed = 4;
				sprite_index = global.spr_PPin;
				
				image_alpha = 4;
				script_bind_step(PPin, 0, id);
			}
		}
	}
}

if blinkheat > 0 {
	if blinkheat > 1 image_speed = 0.2;
	if ((hspeed >= 0) && (right = 1)) || ((hspeed <= 0) && (right = -1)) {sprite_index = spr_dashf;}
	if ((hspeed < 0) && (right = 1)) || ((hspeed > 0) && (right = -1)) {sprite_index = spr_dashb;}
	if blinkheat = 1 image_speed = 0.4;
	direction = blinkangle;
	speed = blinkheat/(3 - 1.5 * skill_get(5));
	script_bind_draw(draw_trail, depth + 0.1);
	blinkheat -= 1;
}

#define PGrenade(Me)
with(Me){
	if (image_index >= 7) {
		with instance_create(x, y, PlasmaImpact) {
			damage = 8;
			creator = other.creator;
			team = other.team;
			
			image_xscale = 0.8;
			image_yscale = 0.8;
		}
		sound_play_pitchvol(sndPlasma,1.6 + random(0.2) , 0.5);
		sound_play_pitchvol(sndPlasmaRifle,1 + random(0.3) , 0.5);
		instance_destroy();
	}
}

#define PPin(Me)
with(Me){
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}

#define draw_trail
with(Player) if string_lower(race) = "patrol" && blinkheat > 4{
	draw_triangle_colour(
		lastx+lengthdir_x(3*(bliheamax - 4)-3*(blinkheat - 4),blinkangle),lasty+lengthdir_y(3*(bliheamax - 4)-3*(blinkheat - 4),blinkangle),
		x+lengthdir_x((15/(bliheamax - 4))*(blinkheat - 4)*0.7,blinkangle+90),y+lengthdir_y((15/(bliheamax - 4))*(blinkheat - 4)*0.85,blinkangle+90),
		x+lengthdir_x((15/(bliheamax - 4))*(blinkheat - 4)*0.7,blinkangle-90),y+lengthdir_y((15/(bliheamax - 4))*(blinkheat - 4)*0.85,blinkangle-90),
		player_get_color(index),player_get_color(index),player_get_color(index),0);
	draw_triangle(
		lastx+lengthdir_x(6*(bliheamax - 4)-5*(blinkheat - 4),blinkangle),lasty+lengthdir_y(6*(bliheamax - 4)-5*(blinkheat - 4),blinkangle),
		x+lengthdir_x((15/(bliheamax - 4))*(blinkheat - 4)*0.35,blinkangle+90),y+lengthdir_y((15/(bliheamax - 4))*(blinkheat - 4)*0.4,blinkangle+90),
		x+lengthdir_x((15/(bliheamax - 4))*(blinkheat - 4)*0.35,blinkangle-90),y+lengthdir_y((15/(bliheamax - 4))*(blinkheat - 4)*0.4,blinkangle-90),
		0);
}
instance_destroy();

#define race_ultra_take
global.ultra[argument0] = 1;
if(global.ultra[1] = 1){
}
if(global.ultra[2] = 1){
}
sound_play(sndBasicUltra);

///////////////////////////////////////////////////////////////////////////////////////////
#define race_name
return "PATROL";

#define race_text
return "HYPER SPEED DODGING#EXTRA PICKUPS";

#define race_portrait
return global.spr_PatrolPort;

#define race_menu_button
sprite_index = global.spr_PatrolSlct;

#define race_mapicon
return global.spr_PatrolIcon;

#define race_ttip
return["HYPER LIGHT OFFICER", "QUITE DASHING", "DODGING RESPONCIBILITIES"];

#define race_tb_text
return "QUICKER DODGE RECOVERY";

//#define race_ultra_button
//sprite_index = global.spr_ult[1];

#define race_ultra_name
switch(argument0){
case 1: return "WARPER'S WADERS";
case 2: return "GRENADER'S GALOSHES";
default: return "";
}

#define race_ultra_text 
switch (argument0){
	case 1: return "DODGE THROUGH WALLS#WHEN PRESSED#AGAINST THEM";
	case 2: return "DROP GRENADES#WHEN DODGING";
}

#define race_skins
return 1;