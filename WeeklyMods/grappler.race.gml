#define init
	global.banditidle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAYCAYAAAAF6fiUAAABvElEQVR4nO1XMU4DQQzcn9BSpqVAQkpDyRMQJQ0VPU0ekYJfpKaj5xO8I+iQHJmJd9fetW+RNsVUSWY8M3ZySXdvKV0wDsMHmB3DB5gdwweYHcMHmB36N6Z0lDDawH9Baz5q8q/Pwy/ed09/4FFCbnjPkqO5KR/MqKahIn993J4IuRChxwjxS+V6lZwCFwjzkTIqaajJcw33GCF+ScOr5MgFyuVjKTp7qhhQyYS1gMS+AtCA5xWsuUClKzAX8HJ/cwpIIuUB7r8fjs8fG3MBpIEGsFwrf/QCce8e+WQFbq+vzgJCcQlaE8SPBpCPG9DwRy8Q8Uv51OZXFYAmFiEJy+sIqwmp4F7+6AWi9/F8evirQguxJnxLARhUCb0FRy1QaX5LPlUhOl+pCBS0FED8tD01A7TR1oKjFojno+FuLgB/xLwCkgqmsDzCGblAlgtWG8AnB07eEn6uYM5PGp78kQvUcsEqgdIzNIn2bmhNw5MfF6j3wqTZ8RJy/CoR6fENt8vbgNcfpcgF8shHbUIiIJHW4aMLXouf8kEOnk9XAdkPK5+dNfy5gns11uJvzac5uAt8MHyA2TF8gNnxA5l637RZ6tP+AAAAAElFTkSuQmCC",4,12,12);
	global.banditwalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAYCAYAAAAF6fiUAAABq0lEQVR4nO2YMU4DQQxF5ya0lLQUSEhpKDkCoqShoqfhECm4BTUdPZfgHEGD9CNjxmuPx6PZMFt8KVLC9/P/s9kN6fo5pU3jNBxgdg0HmF3DAWbXcIDZZf9gSoeSRi9w6vxm+M+Ptx+9vtz/UtQSPQNaM7/J+OludwTGIlStSyAgHk5EQGvnN8NT4MigpBkRAZ0Cv3gpUXNIOkXeBUrwpXBa/dfMXzR9vLk8fodRE9ootP+6PTy8X1QtQP+eB1Q6QZ6AevIvFVzLL4JfnZ/9CYiCS7KCo2QeEPfzFtyLn3++lV8NKC9SUn6fq6aAngFlFvhH83P/Vn616Wxsga8toFfBfOFofvhG8avDcHmVFuHDrAXwr7oleQqu4fceoCh+dRC/yUjt4pL0BqSdIK8/2HEzzK/XxG8ewO/sdIgHngdEF4kKCDP4Ewmuhkh+eNfyq+GXHqmo+E2oBp6HIxXhDUiahTledktGVn7zyUmp/QllyR/B0BJoSC0F8CKoWr3hI/3O0LJR2/WE2xJIj5Ck2ZG+YK3914lq2CN4z2L/1XdouJu2AoZrOMDs+gbjgqswMlJYjwAAAABJRU5ErkJggg==",4,12,12);
	
	global.spr_menuport = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAABCklEQVQ4jWO01ZD/z0ABYGRgYMBpgK2GPEEDWC4c3YIicPbAOjg7uXoeQYMYLxzd8h9Zo7FDEIYiA2sfnIawwDRj0wgDF45uwWkI49zWpP/4NKO7hIEB1UsYXiAGJFfPgxvCgs/vuMDcVoQhLKRohAGIHkgMMZGsGw2MGgBNidgAvnSBkg5wKc6rmg9nf2VEzbAoSXpua9J/BkiWhmPu/4woGFkOmnL/22rI/4eVJSQbkO9hCTeEpEBELjvyPSwZDt94iD0WkP0MY8M0z29uRVHLCA0DeOmDDeR7WGKInXvwjOHwjYcMjLYa8v+NFKSI9ga6ASwwDgMDAwMxBsHUwgALNklsBqFrhAEAoqWRDB55DaQAAAAASUVORK5CYII=",1,0,0);
	global.spr_ultport[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAACXBIWXMAAAsSAAALEgHS3X78AAAB10lEQVRIia2WsWvCQBTG34UMAQsWtVMpIuJYh0KkHTqIUlBc6iD4FwodnIpdKi4FQaGDjiJFpFONGKjgULgOF16e75LTSj8y5C73fvnuvUvuxG3pBogy6RQcp5W3pk2LIg5SBr1+3HjLbIRGRgoDLQPlSKlwi/UaLKhHcQOsSDts9KDXpz06MZNO2eb3q5utkPyp5L5iQaitkI8P9wDgnF9gZ0d0E1LQYTxHaAEvnQIA7VZzKySdnc0QaEFFjsbLg5ZDRwcXCxOjq3CbtlVS8zn3T1wlm1Larab+wkgjo/Eyn3PnYozlC0BbIc1GRuNlseDAftZL7hWWz1JeVGl2my8cRO8NwvJFlJ+xJrPdMUS+IFnw5szG5mS2KxYcNYAtqz1QseCoABVMhT3E3RIASu5VrCOdAgDZZHDjf4NKOarz1E1IUa5XRKNWxRWUvr4zUALW5w+WDymBo3K9MpDhJ46RC1/HQvLSVhOcf4QUwI+2XK8kpPCmQ4MXytIzYCq/Qd50SO3sgdDUwg8nlU3yCS58eH/jFAAQjVqVtiP/h0w6BfTyx/3JqDqiCzXeeWKOdFls5z1NK2/9b46EOkTQ3e355dUcw+qj5iTwNHLaxo2ZsVnXyceaX4G98iRWM2FoAAAAAElFTkSuQmCC",1,12,16);
	global.spr_ultport[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAACXBIWXMAAAsSAAALEgHS3X78AAACL0lEQVRIiY2WsW/aQBTGvzvdxtZm6tJm64LkFkUtQpVALBQx8SdAhywVQ0dmxkxZvOCZicnKFhmp8oSILLF0S7JkSrIxu8Mjj5d3tsMnC92d7/3ue+/OJ0wtN/VvX/Cik/fvUK7k6rrT71L78elZvrISUUFJrq7ViJpvedSfqijy18/A4oh0AOxMzo8iUrjznctCkHYmz9KYu4EZJLm2b323yo6iAMjSeGdylaBlwxRWAWVtVktiyRxtlsb0MM5P9pBUaxC0BuvtLfviaZYXmc9G89mIrRV6oRzPf/+hLs8HYOazEYBGeyiXreWG2p1+l8rk49jBeBrVcmNUIX2W0s7ktDap0R7SZEdhasEsjQNzGKzlRpqS9inBsYlM2WyZQtAayPZ8NlKsoDWwTKHGpNf88fmjpNBmy/Z4Gm1WS5WyY8Svn9/Rw83dw99/9zKSF+c2vVUst0cAAG7uHnC0XmcXWUn5+unD8SAWWTvcRz5FmW+0h35p+BxZFGmzWlJFVLDqMqXT77pCkMy/0R6Glxdn9VMeoe54GgEgCgADYNJr0gwqttw1FSZF2803l8nSmE72pNdUe88UGU+5SATJ4eVcEK7w01MUhTiASNWIN/Wq2PIch5cX1KBrDEC4SMrsaNB6e7ve7uNVaRj3hiNaXwVLyln9NFwkZXYAuGpEoTtfj0/PjiepK4bE53i/6/1SlqumyNKU5UX/JpyiqC8L2HfDRVJBgdw1QhRaq0aQ/gPBrGkkG2YFtQAAAABJRU5ErkJggg==",1,12,16);
	global.spr_ulticon[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABDklEQVQ4jZ2UMW7EIBBFP6ucgVu4dGFq2kiRchW3bIFbrrJSpLTUUFD6FlyCNDsWBiZe7Ug0jHh+80EGmNJBFh1k4fov1RNQALwPI4ixrhjrWBgZU+92BTbWwauMGqaDLF5l0NJBFsFZeZVhrDv2tvsKHSQAoO7R/tDIqyx0kNjua2fG1QFqb8mrLACIEaw27UbB4JbqfWNdmeaFvYiPNo9NrUewbRbTvGCal/9Ha/XbPIx12FPEniJ+fh89aBQsHTTWdYGTUQu7PUc4wWr9FsbV6R1RXgT6+vw+eqOP7ClCBwmvsjhlRGZ7ip0+F/LQiDOra08R07ycbFjQK7Aacln1g6zX6G9wSRwdGpn8AXPT0RJi3/fQAAAAAElFTkSuQmCC",1,9,9);
	global.spr_ulticon[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAABN0lEQVQ4jY1UO6oCMRQ9I7MGdxFwiiAOjoUouAErd/Bq4VVaaKWIu7ByA0IkhREfMoXF7MJN5DUmc5PJjHMgkN899+SeSyJ8weTR1XR9Td/Rt5g6Emf4xAZxE8k1fUNI5exP08ycOcpiGthGpZAqSBbT7J4iV8k4w2y+AGdJMEHHz2aGT7zaHHA5nzAa9u05fUVEFQmpMB1n5RM+c0pGsV0vMXl0SyepOz+ypwFoxgcagBZS6dXmoIVUdk0HPk4GXWN8gCL/g5AKt/sTo2EfADCbL3C7P4M1in0C9VvWywdniSVtJDI47vZ2nhev4LwVkZEfCqR7l/PJFrtCRNXQwLx42R7arpcA4Djm2E/t9TNTmGatdLZBXSE5S2zP+ARBImptXS2CmYjUyneBFl8Hhc3QdLnNZ/YPS2jJzHRPIUwAAAAASUVORK5CYII=",1,9,9);
	global.spr_hand = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADAAAAAYCAYAAAC8/X7cAAABQ0lEQVRYhe2WTYqEMBCFn8O49wAiwxyhGZSGPkUvBuaEggtPIYjSeIRGpA/Q+15kNp0QTeWvZzI/kA9cqLHqvUolBohEIv+a5BtisMDxjTw/+J0Q/fF+JAfUTftgaD98DAjRry9vqMoigBx/bAaE6N1hLx5eLzdy8DAurnlNbUehbUWdAQasRZvgwuVZqcoCddMyIjlzjcuZup6KA4A2wEzVzvIUWZ6uqh26nXaHvdaEsYWul5sibhgXYYKbo1rnPJ9AJfRF164crQFKvOv7+w5kFS+LkwuS5amS414QBa9tlFd/6npjUDiKlwswjIu4p9aUjifrCCmBJD6xXEamrlfEVWXhJZyjnYHtQj3PJ2AGF/8VEgCom5Ztf4LchI8BSoxujw5xLFBM6Azo1lXws4oDq4JZjiZ/0sCWn+yASCTy23wC6NuEd/MIAHQAAAAASUVORK5CYII=",2,12,12);
	global.spr_portrait = sprite_add_base64("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",0,25,240);
	global.spr_mapicon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAACXBIWXMAAAsSAAALEgHS3X78AAABeklEQVQ4ja2UMWvCQBTHfxEHBwcXB7NUumQtdrLt0q3QLYVAVv0A3St0EPwAfoC4FgraqSBdHKw6KY66FLPEoUuHUjoUrkN74c7EJIX+IXB3770f//eOHPyzjAw54i81SUEB4HUaHJ9fMR/1AWi2eom1+4BCggDmo364lvtfcKQ+Dih2XamwNKi6EQC3zVMODq09xnX5L2va3kTj5NUE17FpewOW05tMQOgDE+0kH5cmW83iMEnCdWzhOrbgp/3Uz+s05DpUTknYq6IwKAr9/pbTR82MCsR17ETrcTo6uaTZ6nF9UdfOY2dYO6tjmRXu7gcAvBt6AypksQm0mOxDuI7NOtgCYJkVPt9eAXh4Gkdc7ILGKz9k5eIcroMt/scXhVIZ17HpDmcRUK1qUquakdpYoGVWwrV0KqVCFptAc6cCDTkvFSZHECcFluxwF1IolSOg7nDGeOXjdRoRoPYvqxcTAp5n4aXIWUpQ2uMQQqXkGBKU7flKiSfqGz2IoQjLqbbZAAAAAElFTkSuQmCC",0,10,10);
	
	with(instances_matching(Player,"race",mod_current)) create();
#define race_name
	return "GRAPPLER";

#define race_text
	return "GRAB ENEMIES#LOWER @rHEALTH";
	
#define race_portrait
	return global.spr_portrait;
	
#define race_menu_button
	sprite_index = global.spr_menuport;
	
#define swep
	return 0;
	
#define race_mapicon
return global.spr_mapicon;

#define race_ultra_name
switch(argument0){
	case 1: return "ATOMIC ARMS";
	case 2: return "MEGA MUSCLES";
}

#define race_tb_text
	return "GRAB @rHEALTHIER @sENEMIES";

#define race_ultra_text 
switch (argument0){
	case 1: return "THROWN ENEMIES EXPLODE#BASED ON THEIR SIZE";
	case 2: return "GRAB ANY ENEMY,#REGARDLESS OF SIZE";
}
#define race_ultra_button
	sprite_index = global.spr_ultport[argument0];
#define race_ultra_icon
	return global.spr_ulticon[argument0];

#define race_ttip
return["FHO'FAASHYN!","@qH@qE@qH@qE@qH@qE@qH@qH@qE@qH@qH@qE@qH@qH@qH@qE@q.@q.@q.","YOINK!","THIS THING IS HEAVY..."];

#define create
	grapple_object = -4;
	grapple_sprite = -4;
	grapple_health = 0;
	grapple_cangrab  = 0;
	grapple_processed = 1;
	spr_idle = global.banditidle;
	spr_walk = global.banditwalk;
	spr_hurt = sprBanditHurt;
	spr_dead = sprBanditDead;
	spr_sit1 = spr_hurt;
	spr_sit2 = spr_idle;
	
    snd_hurt = sndBanditHit;
    snd_dead = sndBanditDie;
    snd_lowh = sndBanditHit;
    snd_lowa = sndBanditHit;
   
    snd_wrld = sndSkillPick;
   
    snd_cptn = sndSkillPick;
    snd_thrn = sndSkillPick;
    snd_valt = sndSkillPick;
    snd_wrld = sndSkillPick;
    snd_chst = sndSkillPick;
    snd_spch = sndSkillPick;
    snd_idpd = sndSkillPick;
   
    maxhealth = 4;

#define obj_create
	/// obj_create(x,y,str:name)
	with(instance_create(argument0,argument1,CustomObject)){
		queuedestroy = 0;
		switch(argument2){
			case "grapple":
				creator = other;
				team = other.team;
				mask_index = mskPlayer;
				len = 0;
				lenspd = 6 + (skill_get(13) * 2);
				payload = -4;
				grapple_object = -4;
				grapple_sprite = -4;
				grapple_health = 0;
				grapple_hasitem = 0;
				grapple_cangrab = true;
				direction = other.gunangle;
				if ((direction + 270) mod 360) < 180 right = -1
					else right = 1;
				lendir = 15 * right;
				on_step = script_ref_create(grapple_step);
				on_draw = script_ref_create(grapple_draw);
			break;
			case "mortar":
				payload = Bandit;
				payloadhp = 4;
				spr_air = mskNone;
				mask_index = mskPlayer;
				z = 0;
				zspd = 8;
				direction = random(360);
				speed = 4 + random(3);
				if ((direction + 270) mod 360) > 180{
					rotspd = -128
					image_xscale = -1;
				}else{
					rotspd = 128;
					image_xscale = 1;
				}
				on_step = mortar_step;
				on_draw = mortar_draw;
				friction = 0.1;
			break;
		}
		return self;
	}
	
#define mortar_step
	if !instance_exists(self) exit;
	if place_meeting(x,y,Slash) && z <= 16 && z > 0{
		direction = instance_nearest(x,y,Slash).direction;
		zspd = 8;
		speed = 20;
		rotspd = 32 * image_xscale;
		payloadhp -= 6;
		// // trace("HIT!!");
	}
	if (z + zspd <= 0){
		if !(instance_exists(NothingSpiral)){
			mask_index = mskPlayer;
			if !place_meeting(x,y,Floor) && !place_meeting(x,y,Wall){
				var _nearest = instance_nearest(x,y,Wall);
				direction = point_direction(x,y,_nearest.x,_nearest.y);
				speed = min(point_distance(other.x,other.y,_nearest.x,_nearest.y) * 0.05,8);
				zspd = speed * 2;
				instance_create(x,y,GuardianDeflect);
				rotspd = -16 * image_xscale;
				sound_play(sndCrystalRicochet);
			}else{
				with(instance_create(x,y,SmallExplosion)){
					hitid = [other.spr_air, "THROWN OBJECT"];
					damage = 2;
				}
				with(instance_create(x,y,payload)){
					image_index = 0;
					alarm0 = 60;
					my_health = other.payloadhp;
				}
				instance_create(x,y,PortalClear);
				sound_play_pitch(sndExplosion,random_range(0.75,1.25));
				queuedestroy = 1;
			}
		}
	}
	zspd -= current_time_scale / 2;
	z += zspd * current_time_scale * image_xscale;
	if z < 0{
		image_xscale = 1 + (z / 100);
		image_yscale = image_xscale;
		trace(image_xscale);
		if abs(image_xscale) <= 0.10 queuedestroy = 1;
	}
	rotspd *= 0.80;
	image_angle += (speed * rotspd) * 0.75;
	if z > 16 depth = -10
		else if z < 16 && z > 0 depth = -2;
		else depth = 11;
	if (queuedestroy){
		if z >= 0 && ultra_get("grappler",1) == 1{
			var _size = sprite_get_width(spr_air) * sprite_get_height(spr_air);
			// trace(round(_size / (24 * 24)));
			repeat(round(_size / (24 * 24))){
				instance_create(x,y,Explosion);
			}
		}
		instance_delete(self);
	}

#define mortar_draw
	draw_sprite_ext(spr_air,1,x,y-z,image_xscale,image_yscale,image_angle,c_white,1);
	if distance_to_object(Floor) <= 0 && instance_exists(NothingSpiral) draw_sprite_ext(shd24,0,x,y,1,1,0,c_white,0.4);

#define grapple_step
	len += lenspd * current_time_scale;
	if (len + lenspd > 32 + (skill_get(13)*16) && lenspd > -4) || lenspd < 6{
		lenspd -= current_time_scale;
		lendir -= 3 * right * current_time_scale;
	}
	if ((direction + 270) mod 360) < 180 right = -1
		else right = 1;
	if len + lenspd < 0{
		if instance_exists(creator){
			creator.grapple_sprite = grapple_sprite;
			creator.grapple_object = grapple_object;
			creator.grapple_health = grapple_health;
			creator.grapple_cangrab = 1;
			// // trace(object_get_name(grapple_object));
		}
		queuedestroy = 1;
	}
	if instance_exists(creator){
		x = creator.x + lengthdir_x(len,direction + lendir);
		y = creator.y + lengthdir_y(len,direction + lendir);
		if y < creator.y depth = creator.depth + 1
			else depth = creator.depth - 1;
		direction = creator.gunangle;
	}else queuedestroy = 1;
	if (grapple_object = -4 && grapple_cangrab = true){
		if place_meeting(x,y,enemy){
			with collision_circle(x,y,8,enemy,0,1){
				if (sprite_get_width(sprite_index) * sprite_get_height(sprite_index) <= 48 * 48 || my_health <= maxhealth * (0.10 + (skill_get(5) * 0.23)) || maxhealth <= 4 + (GameCont.loops) || object_index = Van) || ultra_get("grappler",2) == 1{
					other.grapple_object = object_index;
					other.grapple_health = my_health * 0.50;
					other.grapple_sprite = spr_hurt;
					other.grapple_hasitem = 1;
					other.lenspd = 3;
					sound_play(snd_hurt);
					instance_delete(self);
				}// else // trace("TOO BIG!");
			}
		}
		if place_meeting(x,y,prop){
			with collision_circle(x,y,8,prop,0,1){
				other.grapple_object = object_index;
				other.grapple_health = my_health * 0.50;
				other.grapple_sprite = spr_hurt;
				other.lenspd = 4;
				other.grapple_hasitem = 1;
				instance_delete(self);
			}
		}
		if place_meeting(x,y,Nuke){
			with collision_circle(x,y,8,Nuke,0,1){
				other.grapple_object = object_index;
				other.grapple_health = 1
				other.grapple_sprite = sprite_index
				other.lenspd = 4;
				other.grapple_hasitem = 1;
				instance_delete(self);
			}
		}
	}
	if (queuedestroy){
		if instance_exists(creator) creator.grapple_cangrab = 0;
		instance_destroy();
	}
#define grapple_draw
	if instance_exists(creator){
		draw_sprite(grapple_sprite,1,x,y);
		draw_sprite_ext(global.spr_hand,grapple_hasitem,x,y,1,right,direction + lendir,c_white,1);
	}

#define step
	// Makes it so things fall off the stage on 0-1, including the player
	if GameCont.area = 0{
		if !instance_exists(GenCont){
			with(InvisiWall) instance_destroy();
			with(Corpse){
				if !place_meeting(x,y,Floor){
					with(obj_create(x,y,"mortar")){
						z = -1;
						zspd = 1;
						payload = object_index;
						direction = other.direction;
						speed = other.speed;
						spr_air = other.sprite_index;
						// // trace(spr_air);
					}
					instance_delete(self);
				}
			}
			with(Portal){
				if object_index != BigPortal instance_destroy();
			}
			with(hitme){
				canfly = 1;
				if ("roll" not in self) roll = 0;
				if !place_meeting(x,y,Floor) && object_index != Nothing2 && distance_to_object(Floor) > 4 && !roll{
					if visible = true{
						with(obj_create(x,y,"mortar")){
							z = -1;
							zspd = 1;
							if other.object_index = Player zspd = 1;
							payload = object_index;
							direction = other.direction;
							speed = other.speed;
							spr_air = other.spr_hurt;
						}
						sound_play(snd_hurt);
						visible = false;
					}
					if object_index != Player{
						instance_delete(self);
					}else{
						var alrm = 45,msk = mask_index;
						mask_index = mskNone;
						if(fork()){
							while instance_exists(self){
								if(alrm && !--alrm) || (visible){
									if instance_exists(Floor){
										var n = instance_nearest(x,y,Floor);
										x = n.x + 16;
										y = n.y + 16;
									}
									image_index = 0;
									sprite_index = spr_hurt;
									visible = true;
									sound_play(snd_hurt);
									mask_index = msk;
									exit;
								}
								wait 1;
							}
							exit;
						}
					}
				}
			}
		}
	}
	// This one actually pertains to the player
	if grapple_cangrab > 0 grapple_cangrab -= current_time_scale;
		else grapple_cangrab = 0;
	if button_pressed(index,"spec"){
		if grapple_object = -4{
			if grapple_cangrab = 0{
				obj_create(x,y,"grapple");
				grapple_cangrab = 30;
			}
		}else{
			with(obj_create(x,y,"mortar")){
				payload = other.grapple_object;
				spr_air = other.grapple_sprite;
				payloadhp = other.grapple_health;
				speed = min(point_distance(other.x,other.y,mouse_x[other.index],mouse_y[other.index]) * 0.05,6);
				other.grapple_object = -4;
				other.grapple_sprite = -1;
				other.grapple_cangrab = 30;
				other.grapple_health = 0;
				direction = other.gunangle;
			}
			with(obj_create(x,y,"grapple")){
				grapple_cangrab = false;
				lenspd = 4;
			}
		}
	}
	
#define draw
	//with(Player){
	//	if "grapple_processed" in self{
			if grapple_sprite != -4 && grapple_cangrab = 0{
				if gunangle < 180{
					draw_sprite_ext(grapple_sprite,1,x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle + (45 * right)),-right,1,0,c_white,1);
					draw_sprite_ext(global.spr_hand,1,x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle + (45 * right)),1,right,gunangle + (45 * right),c_white,1);
					draw_sprite_ext(sprite_index,image_index,x,y,right,1,angle,c_white,1);
				}else{
					draw_sprite_ext(grapple_sprite,1,x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle + (45 * right)),-right,1,0,c_white,1);
					draw_sprite_ext(global.spr_hand,1,x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle + (45 * right)),1,right,gunangle + (45 * right),c_white,1);
				}
			}
	//	}
	//}