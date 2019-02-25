#define init
global.sprSupperSlugger = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAABUAAAANCAMAAABxTNVSAAAAGFBMVEUAAAAAAAAyOT4/GRNMVl1fLyZseoT///+WV0bDAAAAAXRSTlMAQObYZgAAAFFJREFUeNqdj0EKADEIA6vG/P/Jq8RSSm87BQtDCLp+YMMtAa8HlLeT8wHYMhMgCfZ0hS0yOzMVpGSECgQwtj5pIWvNLmipBc6+KnhvUfb1PT+7wQFgcnxkKwAAAABJRU5ErkJggg==", 5, 5);
global.sprSlugg = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEAAAAAQCAMAAACROYkbAAAAD1BMVEUAAAAAAAD/xC///wD////vRqEsAAAAAXRSTlMAQObYZgAAAFlJREFUeNrtjUEOACEIA4Xy/zfrgkkjPXjbk3MxHaCOx19YcltYD+MHMxARYEWf5wJKcT9F5UhwFMqcf/BAC2TOWKoVaoHOzR0bd9uCsYRGCjtoIi80UjwWE01nAmodasicAAAAAElFTkSuQmCC",4,8,8);
global.sprSluggHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAQCAMAAABncAyDAAAAD1BMVEUAAAAAAAD/xC///wD////vRqEsAAAAAXRSTlMAQObYZgAAAE1JREFUeAHdkEEOgEAIAynt/9+sRLNsSPUBO7fJpAeIw8Gfq9hjEfhyvXSmRALe1XQuCOsag5Uz4Vw7q5PEjfHQOACZT3Xeg/EfeD+ECzCrAjOW4dScAAAAAElFTkSuQmCC",3,8,8);
global.sprSluggDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAMAAADeZIrLAAAAD1BMVEUAAAAAAAD/xC///wD////vRqEsAAAAAXRSTlMAQObYZgAAAH1JREFUeNrt0kEKgDAMRFEnk/uf2SaUjqaIoi5c+FYO6i+Cy+/TMO0HPGxjQUnte7xTju4kUPfNvCgXiLof9HXAyJlh2pcg1X4aPZJo6tbzpYZt3xgA7A8Yt0135+17UcsLnQNrGAx6o37f4fYCXY5MIpHWtPnaj9eVvfxOrQIiA49So6z6AAAAAElFTkSuQmCC",6,8,8);

#define weapon_name
return "SUPPER SLUGGER";

#define weapon_sprt
return global.sprSupperSlugger;

#define weapon_type
return 2;

#define weapon_auto
return true;

#define weapon_load
return 30;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
if GameCont.hard = 4 {
	return 0;
}
return -1;

#define weapon_text
return "SOMETHING IS WRONG";

#define weapon_fire

with instance_create(x+lengthdir_x(10, gunangle),y+lengthdir_y(10, gunangle),Maggot){
	team = 2;
	creator = other;
	
	direction = other.gunangle;
	speed = 2;
	
	maxhealth = 10000;
	my_health = 10000;
	raddrop = 0;
	
	lifetime = 120;
	
	script_bind_step(slugg, 0, id);
	script_bind_draw(sluggg, depth-0.1, id);
}

weapon_post(10, 20, 150);
sound_play_pitchvol(sndMaggotSpawnDie, 0.75, 2);
sound_play_pitchvol(sndMaggotSpawnDie, 0.5, 2);
sound_play_pitchvol(sndBigMaggotUnburrow, 0.8, 2);

#define slugg(Me)
with(Me) {
	if (lifetime = 0) {
		with instance_create(x,y,Bullet2) {
			team = other.team;
			creator = other;
		}
		instance_destroy();
	}
	else {
		lifetime -= 1;
		
		if collision_line(x-2,y,x+2,y,enemy,0,1) {
			with instance_create(x,y,Bullet2) {
				team = other.team;
				creator = other;
			}
			instance_destroy();
		}
	}
}
if (!instance_exists(Me)) {
	instance_destroy();
}

#define sluggg(Me)
with(Me) {
	draw_sprite(global.sprSlugg, image_index, x, y);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(global.sprSlugg, image_index, x, y, 1.75, 1.75, 0, c_white, 0.1);
	draw_set_blend_mode(bm_normal);
}
if (!instance_exists(Me)) {
	instance_destroy();
}