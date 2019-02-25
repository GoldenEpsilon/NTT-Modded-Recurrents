#define init
global.sprRail0 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAGtJREFUeNqd0FsKwCAMRNHOTGP2v+Ma46MIRej9EAmHVr3+BOAIUAp6H0Ymd1mkzWBE0p3Z9jk41atG1IrANNarxmQr2jCFs5L7mYYBSeRaTf4j4utAbZvwvoFmYrxfLgwaz3u2Cc5P3CfnHgS4Ai18iEGwAAAAAElFTkSuQmCC", 15, 5);
global.sprRail1 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAGtJREFUeNqdkEsKwDAIRDtj1PvfuKkOoVmUQN8iZOSBn+sPAI4CIiA+HHPLNH+w3cGCZCYbCDkJmpiOdVAG5Ay6mI53M2WXE+AighuaqwfROx31mPC1X31bHAMop/aUsACJ0nvRquB8YlXO3Ax7AjUoWv/EAAAAAElFTkSuQmCC", 15, 5);
global.sprRail2 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAGxJREFUeAGd0EEOAyEIRuF5PwL3v3GtkDEuGpN+S/OMwvMP4BoQQfvRmFum+ZcdDTw0SZkqtGoSZG02JtsE1YyQt9m4+SavJkCvCB2M/g+SWCWz6TcAseeDNxwDVrPmrGBDopZIX0fcV9wndx8URAI97FHhLQAAAABJRU5ErkJggg==", 15, 5);
global.sprRail3 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAG5JREFUeNqdkAEKwDAIAxet+v8fz2YZdINR2EGF6kFqjz8A2ArIhPhwPLzKY+KrA/QRZlZlFxB0ag5dtOO8iFbpjEwL0U4wTFjQSYbctP/Acb+H+aztKKNhXZaWOAZAh3vivbnNAe0JO9h/sTp7ThwVAkUFyYf8AAAAAElFTkSuQmCC", 15, 5);
global.sprRail4 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAHBJREFUeAGd0FEKxDAIhOEdJ+r9b7xqB5J9WAL9oX0oH7Hm8yYAV4AIqD+Gzkx6x8OMhzKzTHs6jkOiMqoyNO4MaLMiwlyVcfrOvE1oiCr/E6H/afNIlNGMat7H0oJrAWNmTwioNhjej47H/Yr15d4XI+4CTWRgCT0AAAAASUVORK5CYII=", 15, 5);
global.sprRail5 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACMAAAANCAMAAAAUoSctAAAAG1BMVEUAAAAAAAAdGyMvLjRITDxRUFh5fmuqr5f///9BecLVAAAAAXRSTlMAQObYZgAAAG5JREFUeAGd0FEOwzAIg+EZh3D/G88NltAepkj9H9tPpfB5E4ArwN5wfwyTVcwnjmkOFxFV0c3nUP2STobBSVRmbRXpZJI5RcpseIiT/4nw/zymJWQ8QwXULA3DtYBjzp4NJoj0EaGOCdxP7Cf3vivPAlXLl1HMAAAAAElFTkSuQmCC", 15, 5);

global.sprRail = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADYAAAAUCAMAAADx/z7SAAAADFBMVEUAAAAn6oOS/9D////Et/51AAAAAXRSTlMAQObYZgAAAFpJREFUeNrNkkEKwCAMBHX2/39u9CCWUImmlM4huOBgiCnfgosx6DelcY6BwIqsoLjWFRld3dEGlA14tGoDR12/NimaaZ5urKy8dtjkuyPJf3d+ufKrjIv/4wKHXQMDioQKdQAAAABJRU5ErkJggg==",2,9,10);

#define weapon_name
return "CICADA";

#define weapon_sprt

with(self) if (instance_exists(Player)) && ("wep" in self) && (wep = "cicada") && ("wkick" in self) && (wkick > 0){
	if (wkick >= 8) return global.sprRail5;
	else if (wkick >= 6) return global.sprRail4;
	else if (wkick >= 5) return global.sprRail3;
	else if (wkick >= 4) return global.sprRail2;
	else return global.sprRail1;
}
else return global.sprRail0

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 15;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapMachinegun;

#define weapon_area
return 17;

#define weapon_text
return "RECOIL IN HORROR";

#define weapon_fire

with instance_create(x+lengthdir_x(2, gunangle),y+lengthdir_y(2, gunangle),HeavyBullet){
	speed = 20;
	direction = other.gunangle;
	image_angle = direction;
	team = 2;
	creator = other;
	damage *= 4;
	sprite_index = global.sprRail;
	force = 25;
}
fireangle = other.gunangle+180
if ("speedcount" in self) {
	speedcount -= 5;
}
else {
	speedcount = -5;
}

sound_play_gun(sndTurretFire, 0.25, -0.5);
sound_play_pitchvol(sndExplosion, 0.5, 0.75);

weapon_post(14, 10, 100);

repeat(5){
	with instance_create(x+lengthdir_x(-15, gunangle),y+lengthdir_y(-15, gunangle),Smoke){
		speed = 2;
		direction = other.gunangle + (random(90) - 45)
	}
}

#define step

if (argument0) {
	if (wkick = 1) {
		sound_play_pitchvol(sndEmpty, 1.75, 0.5);
		sound_play_pitchvol(sndCrystalShield, 2.25, 1);
		
		repeat(2) with instance_create(x,y,Shell) {
			direction = other.gunangle + 180 + random_range(-30,30);
			speed = 10;
			sprite_index = sprHeavyShell;
		}
		
		wkick = -4;
	}
}

if fork() && ("speedcount" in self) && (speedcount < 0){
	motion_add(fireangle,5 - speedcount);
	with instance_create(x,y + 8,Dust){
		speed = 2;
		direction = other.gunangle + (random(45) - 22.5)
	}
	speedcount += 1;
}

if ("speedcount" in self) && (speedcount < 0){
	with collision_circle(x,y,7.5,enemy,0,1) {
		sound_play(snd_hurt);
		sprite_index = spr_hurt;
		image_index = 0;
		my_health -= 20;
		motion_add(other.gunangle + 180,5 * (10 / maxhealth));
	}
}