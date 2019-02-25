#define init
global.sprdrum0 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAM1BMVEUAAAAuNz5MVl1fLyZseoQAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr///9smQX/AAAABXRSTlMAAAAAAMJrBrEAAABuSURBVHgBVc5hDoMgEETh1frQsSzc/7bFMZL6JfrjZSCE8RJPrK3p+NpR+dxVo47P1CAwSXvKshWC++AOvVqXrnqBmLWwReAWo8o66+pX+UdWS7YtJk7Z6e2DLJYsy/+22PmuyPANE8VYvJ2wGH6OmgZq6uSTXgAAAABJRU5ErkJggg==", 0, 0);
global.sprdrum1 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGNJREFUeAFdywtqwDAQA1HNJkr9uf99a6uk4DxQAsNawUFvbGP4/om7ocCrroUHiLB9dUcfhfh7eMFsMe1dN9B/LaSdyX86JlqAfOgteuqLx/GctVd8bys+tzhAR65iTyfIll9qdwNAnBpKBwAAAABJRU5ErkJggg==", 0, 0);
global.sprdrum2 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGVJREFUeAFdzQ0KwyAQROF5m0zqz/3vW5ySgn6gwmNlFWz0xjaG70/cDQVetY3wABG2r+7ooxC/jxfMFtNedQH9ayGtTN7pmFkG5KK36KkvHsez115xzlYcs9g5WxVVdhXasSR+AWnWA0IRNxUwAAAAAElFTkSuQmCC", 0, 0);
global.sprdrum3 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGRJREFUeAFdzW0KhDAYA+HMq3H7cf/7Lo0o1OdHC0NKFWz0xDaGz1+cDQVetY3wABG2j+7ooxD3wwNmi2mvuoDeWkgrk3s6Zj4DctBb9NQHl+Paa6+Cqu/2rp8tDrYqKtCOJfEPaW8DQCkkLMYAAAAASUVORK5CYII=", 0, 0);
global.sprdrum4 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGdJREFUeAFdzWEKwyAQROF9m0y66v3vW3ZKCvr9UHiMGMYm3lhz6v7YXYShrjVNEwKTdA3ZmEnwe3jBKltS1wbxr0lEZ3wv2cJfgQ9GFVQN1xePBNKz15FZlXlu044tMogtpxE7muMXY+4DOp5gy1gAAAAASUVORK5CYII=", 0, 0);
global.sprdrum5 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGdJREFUeAFdzUEOgzAMRFF/w1DH3P++radiEd4ikb4mShibeGJ16/zYWYShqdWmhsAkHUu2Ogn+Dw+4qzKrbmnqgJgKv5pETMb3jJBufwb4YJUt1weX7NrrSntv015bZGw1SCN2DMcvUgoDIqXB7qgAAAAASUVORK5CYII=", 0, 0);
global.sprdrum6 = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAAOCAMAAAD32Kf8AAAAJ1BMVEUAAAAAAAAuNz4yOT4/GRNMVl1UOhhfLyZseoSBaSKKlp7Lpzr////oNyOrAAAAAXRSTlMAQObYZgAAAGZJREFUeAFdzUGOxSAQA1EXiTMN3P++o/ZXFuQtQCoZoeCgN9Zavv/iLhS4a63wAhG2r2mDPddA/B5esKugattdG6hr2wOpM7m3Y+czIAezYqa+eBzPWeeI73bEZ4uDo4oR6ERL/AdYaAMuMjeqUQAAAABJRU5ErkJggg==", 0, 0);

#define weapon_name
return "DRUMMER";
#define weapon_sprt
with(self) if (instance_exists(Player)) && ("wep" in self) && ((wep = "drummer") || (bwep = "drummer")) && ("drummerframe" in self){
	if (drummerframe = 0) return global.sprdrum0;
	else if (drummerframe = 1) return global.sprdrum1;
	else if (drummerframe = 2) return global.sprdrum2;
	else if (drummerframe = 3) return global.sprdrum3;
	else if (drummerframe = 4) return global.sprdrum4;
	else if (drummerframe = 5) return global.sprdrum5;
	else if (drummerframe = 6) return global.sprdrum6;
}
else return global.sprdrum4;
#define weapon_type
return 1;
#define weapon_auto
return false;
#define weapon_load
return 1;
#define weapon_cost
return 0;
#define weapon_swap
return sndSwapMachinegun;
#define weapon_area
return -1;
#define weapon_text
return "THIS WAS A BAD IDEA";

#define weapon_fire
if (drummerstep <= 3) {
	drummercloseness = 6/drummerstep;
} else {
	drummercloseness = drummerstep/6;
}

with instance_create(x,y,Slug) {
	creator = other;
	team = other.team;
	
	direction = other.gunangle;
	image_angle = direction;
	
	speed = 10 * other.drummercloseness;
	damage *= other.drummercloseness;
	
	image_xscale = other.drummercloseness;
	image_yscale = other.drummercloseness;
}

sound_play_pitchvol(sndEmpty, drummerrate + 0.5, drummerrate);

#define step
if ("drummerstep" not in self) {
	drummerstep = 0;
	drummerrate = 0;
	test = 0
}

drummerstep += drummerrate;
if (drummerstep > 6) {
	drummerstep -= 6;
	sound_play_pitchvol(sndEmpty, drummerrate + 0.5, drummerrate/2);
}
	
if (argument0) {
	drummerrate += (0.5 - drummerrate)/120;
} else if (wep != "drummer") {
	if (drummerrate > 0) {drummerrate -= 0.01;}
}

drummerframe = round(drummerstep);