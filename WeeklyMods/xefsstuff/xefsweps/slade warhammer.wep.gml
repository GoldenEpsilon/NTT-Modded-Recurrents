#define init
global.sprBIIGhammer = sprite_add_weapon("iVBORw0KGgoAAAANSUhEUgAAAEQAAAAeCAMAAACi2EgRAAAAG1BMVEUAAAAAAAAaFyYgHSstKzZOS11cOyOqbUHZtEXMkCB5AAAAAXRSTlMAQObYZgAAAS9JREFUeAGtlYGOgyAQRDuwzvD/X3w72OtBmoievpCtIfFlKCu8roFvXpcB1VqO5gej/0giti3HBpckMMW8LYHOxkIpESUAhCljkNZwcT07cV0C4yghyTkKzLCc9T8DtR0xi3MUNjXMSexaO0bJXxCgShWwSzhokV9oSZQsnxyoEWREauTJRbMW0yWUKHwcSqctTnJmk4ukMF7Pe9NaJwJZsURtQuhB1ARkiZpzmet4aDbAlh7EMkexxL10NCZJf7FLSD+TvYeWSTjSX4SXQxGgGNWSFdQAgd30nmet8OwSaqQ7HKUyyR+QPLfFJKctdpRKZnE0nWs2kmVstrHtJR62fdsRJZWioe2HD5B2rC3fH+CFo4Da4XwUPH0o3T8eyRsH9ZNXhnlc8vw1ur7QfwDN1hEERuI8pAAAAABJRU5ErkJggg==", 20, 15);

global.sprBIIGarrow0 = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAMAAADzapwJAAAADFBMVEUAAAAAAACjo6P////ChiFpAAAAAXRSTlMAQObYZgAAAF5JREFUeAGN0AEKQyEQA1Fncv87l1pCKyv0LyjsIwRxXYc7P89C70P9cPjFrhioYRoiEdiWWN5bNHuq9Xy5jlU5X6VnuJyD60lMnOxkBJ3dvI/l2cT83xn/43j1BZtfPNMBUP8yNagAAAAASUVORK5CYII=",1,10,10);

global.sprBIIGslash = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAPwAAABECAMAAACS7KhNAAAADFBMVEUAAAByn7+fw93///9dJDQaAAAAAXRSTlMAQObYZgAAAb1JREFUeAHs1/9qwjAUx9Hk5P3fecyJILdxtH4jFPv5c8OLp/mhtlfZqr1bfGQ+GFsB0anQgjGOz+ud8TqQgKcfAMYtjsCn9BJ73xO1tx8A49BKV7mxJ+w65tN/1omhGOPIbk8tP+w5E2F9mTihA3SPBv7nR6IOzDen97/2nPy6VsdPAcrAUMztd3jZ/3k9Xt1wBPTG5vaf2H+bXHrZi79e9BM+8WVm2/7mpXd0rbD1SvOB8frmyQfC+hqW6dXBbVrXb9VtGtTXyOtn57z8oez+GhhDWD9PaKCK31d/Wnsf1Gvx2CTO4FV7An2gfg+sxAN5fSxgmb7+qJHFByKvn323EcYHQh5f+Xl9KIL6ym+PpPA+w5e848VW3ojyF+k9TaCFIq9P49cf9Ewk8fmDvjiL8KfQf/vSOw3eOfZ9swQ/4hPPg28nwa/JN+PjGb4Kf+Ev/IUfF/76qPtp546tAIZhEIgG9h86CyS9n/kz2IUEd7p8yDHeWmystN+/fiLH+kU0D314AaboWmmhrlJUqqjBCUNYCiAJivY06S6E2EH8tNPgcZNOIOdkg13NhGBELSMV0kmJxBRyxwNWzka83oYkH+ouw6YAAAAASUVORK5CYII=",3,0,34);
global.mskBIIGslash = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAPwAAABECAMAAACS7KhNAAAACVBMVEUAAAAAAAD///+D3c/SAAAAAXRSTlMAQObYZgAAANJJREFUeNrt3LENw0AMA0Br/6VTqnDgVET48HEAAtfa4l9PmW+5fibdmc88J9PZD98kOuvhm0Rnv3yT6KynbxKd9fRNorOdvkl0tts3ic56+ybR2W7fJDrb7ZtEZ7t9E+zsx0+is92+CXb24yfX2W+fW+eb8JPoPAY/iU74E/CT6IQ/AT+JTnh4+AC+OfDw8PDw8PDw8PDw8PDw8D5mwMPD+2kB70clvOOEf5+lOEhyiuYI0fmpw2Mn58YGZiYGRqZlRoXmpIbEJuQeD7jlvc9GfACCvCYVuQxhpgAAAABJRU5ErkJggg==",3,0,34);

global.sprSmost = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHgAAAAYCAMAAAAGTsm6AAAAD1BMVEUAAAAuHkJdPYWBUrysjtJCHvouAAAAAXRSTlMAQObYZgAAAT1JREFUeAHtlOFqxDAMg2s+vf8zb0SljS+CawZjDE73z7b0hbi546M/EPoWvzJvATnG4jG3qjbIBhDKm2RVbZC59BozieCJYJOfsAGqAhr54qx0FaxRBr8nO8QAYB7HdcDdZolkkAbYA+krWkLGKQehNbjB6isAaEUbZjBLk7hHm0RPdx0z+grw9CnmDDqGdV+4AKCawbgsawEPcgPfp9crGNXZIW64gS8usIJhWFq4j29kB7s1KA1cBqMEBkWwzGhgVxLYX1AA2xDAo7WCBb66Bvawm93gX/pCpev+5vRxFCexeKoQ66OvAqkbMGN5k1hTz+kDnB+OBR0MkJ4xrM+eCTzPc4Kl4Glc6+bawvu/WEewXBCxbNGTDJYm8PFAmpTyeRKCrBPMsUfm+LHY41pk7j56NyZvf1845t/pCwt9DP97ghiVAAAAAElFTkSuQmCC",5,12,12);


global.SWHdrawer = noone;

#define weapon_name
return "SLADE WARHAMMER";

#define weapon_sprt
return global.sprBIIGhammer;

#define weapon_type
return 0;

#define weapon_melee
return true;

#define weapon_auto
return false;

#define weapon_load
if "BigsrdRestmax" in self return SWHheat;
else return 1;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapHammer;

#define weapon_area
return 40;

#define weapon_text
return "@q@pALL CRAFTSDWARF SHIP#IS OF THE HIGHEST#QUALITY";

#define step

if !instance_exists(global.SWHdrawer) {
	global.SWHdrawer = instance_create(0, 0, CustomObject);
	with(global.SWHdrawer){
		script_bind_draw(SWHdraw, -6.1);
	}
}

if mod_exists("mod", "triggerknuckles") && (GameCont.decknucreload > 0){
	SWHheat *= 0.6;
}
else if (skill_get(23) = 1){
	with(Corpse) if "TriggerPbNd" not in self{
		TriggerPbNd = 1;
		other.SWHheat *= 0.6;
	}
}

if (argument0){
	if "SWHangle" not in self {
		SWHangle = gunangle; // current angle for swing
		SWHangbk = SWHangle; // angle player flies after swinging
		SWHforce = 0;
		SWHcharge = 0;
		SWHheat = 0;
		SWHturn = 1;
	}

	SWHangle += angle_difference(gunangle,SWHangle)/15;
	
	if SWHheat > 0 {
		SWHheat -= 1;
		reload = SWHheat - 1;

		if SWHforce > 0.1 {
			motion_add(SWHangbk, SWHforce);
			SWHforce /= 2;
		}
	}
	else {
		if button_check(index,"fire") && (SWHcharge < 30) && (SWHheat <= 0){
			SWHcharge += 0.5 + (0.5*(maxhealth-my_health)/maxhealth)*skill_get(22);
		}
		
		if button_released(index,"fire") {
			with instance_create(x+lengthdir_x(20 + 10*skill_get(13), SWHangle),y+lengthdir_y(20 + 10*skill_get(13), SWHangle),Slash){
				speed = other.speed / 2;
				direction = other.direction;
				image_angle = other.SWHangle;
				motion_add(other.SWHangle + (random(30)-15)*other.accuracy,2 + (3 * skill_get(13)));
				team = other.team;
				creator = other;
				damage = 10 + (other.SWHcharge)*(40/15);
				sprite_index = global.sprBIIGslash;
				mask_index = global.mskBIIGslash;
				force = other.SWHcharge / 1;
			
				image_xscale = 1.1;
				image_yscale = 1.1;
			}
			repeat(3) with instance_create(x,y+4,Dust) motion_add(other.SWHangle + 180,2.5);
			SWHheat = 45 - (12*(maxhealth-my_health)/maxhealth)*skill_get(22);
			SWHcharge = 0;
			SWHturn *= -1;
			wkick = 2;
			sound_play_gun(sndHammer, 0.5, -0.2);
			sound_play_pitchvol(sndExplosion, 0.5, 0.75);
			
			SWHangbk = SWHangle;
			SWHforce = 10;
			
			direction = SWHangbk;
			speed = 10;
			
			repeat(18) with instance_create(x,y,Smoke) {
				direction = other.gunangle + random_range(-60,60);
				speed = random_range(10,15);
				sprite_index = global.sprSmost;
			}
		}
		
	}
	
	wepflip = -SWHturn;
	wepangle = -1*angle_difference(gunangle,SWHangle) + (120 + sqrt(SWHcharge*120) - power(SWHheat/7.5,2)) * SWHturn;
}

#define SWHdraw
with instances_matching(Player, "wep", "slade warhammer") {
	if SWHcharge > 0 repeat(SWHcharge/6){
		draw_sprite_ext(global.sprBIIGarrow0,0,x+lengthdir_x(35,SWHangle),y+lengthdir_y(35,SWHangle),1,1,SWHangle-45,player_get_color(index),image_alpha*SWHcharge/15);
	}
}