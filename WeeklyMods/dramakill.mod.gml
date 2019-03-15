#macro basescale 30/room_speed

#define init 
	global.bullettime = 0;
	global.bosscooleffect = 0;
	global.timer = 0;
	global.delayreturn = 0;

#define projectile_meeting_future 
	var _x,_y,_r,_xsc,_ysc;
	_r = -4;
	_xsc = image_xscale;
	_ysc = image_yscale;
	image_xscale *= 1.5;
	image_yscale *= 1.5;
	for(var i = 0;i<=argument3;i++){
		with(argument2){
			if distance_to_object(other) <= speed * argument3{
				if !place_meeting(x+hspeed,y+vspeed,Wall){
					x += hspeed;
					y += vspeed;
					if place_meeting(x,y,other){
						_r = id;
						break;
					}
				}
			}
		}
	}
	with(argument2){
		x = xprevious;
		y = yprevious;
	}
	image_xscale = _xsc;
	image_yscale = _ysc;
	return _r;
#define step
	with(Nothing) if "intro" not in self intro = 1;
	with(instances_matching_ne(enemy,"intro",undefined)){
		var proj = projectile_meeting_future(x,y,instances_matching(projectile,"team",2),20);
		if proj != -4{
			if proj.damage >= my_health && view_object[0] = -4{
				global.bosscooleffect = (room_speed * basescale) * 5;
				view_object[0] = proj;
				view_pan_factor[0] = 1000;
			}
		}
		if my_health <= 0{
			if global.bosscooleffect = 0
				global.bosscooleffect = (room_speed * basescale) * 5;
			with(instance_create(x,y,CustomObject)){
				view_object[0] = id;
				global.delayreturn = (room_speed * basescale) * 12;
			}
		}
	}
	if (global.delayreturn) > 0
		global.delayreturn -= basescale;
	if global.bosscooleffect <= 0 && global.delayreturn <= 0{
			view_object[0] = -4;
			view_pan_factor[0] = undefined;
		}
	if (global.bullettime) || (global.bosscooleffect - basescale >= 0){
		if (global.bosscooleffect){
			global.bosscooleffect -= basescale;
		}
		if current_time_scale > basescale * 0.1
			current_time_scale *= 0.80
		else current_time_scale = basescale * 0.1;
	}else{
		if current_time_scale < basescale
			current_time_scale *= 1.05
		else current_time_scale = basescale;
	}