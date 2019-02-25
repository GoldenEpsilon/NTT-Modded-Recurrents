#define init
global.sprTrimmer = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAACAAAAAHCAMAAABeDb9IAAAAG1BMVEUAAAD///8AAAAyOT5MVl1cOyOKlp6qbUHZtEWyc55DAAAAAnRSTlMAAHaTzTgAAABESURBVHjabczbDgBBBAPQUTX8/xfvhWSN7PEiUl0F0+pEsI8LzDFeiUPEF1C6vRPJSWoLCMpsSHcg5VKlVHPuB/Eb6C7AmAHJLiVcBQAAAABJRU5ErkJggg==", 10, 3.5);

#define weapon_name
return "TRIMMER";

#define weapon_sprt
return global.sprTrimmer;

#define weapon_type
return 0;

#define weapon_melee
return 0;

#define weapon_auto
return false;

#define weapon_load
return 20;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 2;

#define weapon_text
return "NO TREES TO TRIM";

#define weapon_fire

sound_play_gun(sndWrench, 0.25, 0.6);
wkick = -18;

if (skill_get(13)=1){
	with instance_create(x+lengthdir_x(25, gunangle),y+lengthdir_y(25, gunangle),Shank){
		speed = 7;
		direction = other.gunangle+(random(10)-5)*other.accuracy;
		image_angle = direction;
		team = 2;
		creator = other;
		image_xscale = 1.25;
	}
} else {
	with instance_create(x+lengthdir_x(20, gunangle),y+lengthdir_y(20, gunangle),Shank){
		speed = 2;
		direction = other.gunangle+(random(10)-5)*other.accuracy;
		image_angle = direction;
		team = 2;
		creator = other;
		image_xscale = 1.25;
	}
}

motion_add(other.gunangle,8);