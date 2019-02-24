//Designed so you can hold 1 weapon of each category
//VER 1.4

#define init
if(current_time_scale != 0) global.newver = 1;
if(global.newver){
	global.slow_targ = 30 / room_speed * 0.2;
	global.slow_fact = power(global.slow_targ, 1 / room_speed);
	global.unslow_fact = 1/power(global.slow_fact, 3);
}

global.wepswitch=[	"key1",
					"key2",
					"key3",
					"key4",
					"key5",
					"key6" ];
					
with(Player) game_start();

#define game_start
with(Player){
	if("wepset" not in self) wepset = array_create(array_length_1d(global.wepswitch));
	wepcurse	= array_create(array_length_1d(global.wepswitch));
	wepreload 	= array_create(array_length_1d(global.wepswitch));
	wepset[@weapon_get_type(wep)] = wep;
	wepset[@weapon_get_type(bwep)] = bwep;
	lasta = wep;
	lastb = bwep;
	swap_frame = 0;
	swap_thres = room_speed / 4;
	swap_ring_deg_offset = 90;
	swap_ring_wep_radius = 40;
	slow_thres = room_speed / 2;
	slowing = 0;
}

#define step
//Pressing 1-6 switches weapons from inventory
with(Player) {
	if("wepset" not in self) game_start();
	for(var i = 0; i < array_length_1d(global.wepswitch); i++){
		//Removes Emote Indicators
		with instances_matching(EmoteIndicator, "image_index", i + 1) instance_destroy();
		//Switches Weapon 1-6
		if(button_pressed(index, global.wepswitch[i]) && wepset[i] != 0){
			
			//Put weapon in a slot to inventory
			wepset[@weapon_get_type(wep)] = wep;
			//wepcurse[@weapon_get_type(wep)] = curse;
			wepreload[@weapon_get_type(wep)] = (ultra_get("steroids", 1) ? max(reload, breload) : reload);

			//Put weapon in a slot to b slot when switching 1-6
			if(wepset[i] != wep) {
				if(!ultra_get("steroids", 1)) wepreload[weapon_get_type(bwep)] = breload;
				bwep = wep;
				breload = reload;
				
				//Also, if steroids has ambidextrous, the same weapon will be in both his hands
				if (ultra_get("steroids", 1)) {
				bwep = wepset[i];
				breload = wepreload[i];
				}
			}
			
			//Put weapon from inventory to a slot
			wep = wepset[i];
			//curse = wepcurse[i];
			reload = wepreload[i];
			sound_play(weapon_get_swap(wepset[i]));
		}
	}

	//Weapon switch ring
	if(button_pressed(index, "swap")){
		swap_frame = 0;
		canswap = 0;
		/* if(bwep != 0){
			var wep_temp = bwep;
			bwep = wep;
			wep = wep_temp;
		} */
	}

	if(button_check(index, "swap")){
		//Slow motion
		if(global.newver && instance_number(Player) == 1 && swap_frame >= slow_thres) {
				slowing = 1;
				if(current_time_scale > global.slow_targ) current_time_scale *= global.slow_fact else canfire = 0;
		}
		swap_frame++;
	}
	
	if(button_released(index, "swap")){
		if(swap_frame > swap_thres){
			if(!point_in_circle(mouse_x[index], mouse_y[index], x, y, 30)){
				var i = (point_direction(x, y, mouse_x[index], mouse_y[index]) - swap_ring_deg_offset + 180/array_length_1d(global.wepswitch));	//Adjust the angle of weapons in the ring
				i = (i < 0) ? i + 360 : i;																							//Readjust degrees to 0-360
				i = floor(i/360 * array_length_1d(global.wepswitch));																//Get a value of 0-#inventoryslots

				if(wepset[i] != 0){
					//Put weapon in a slot to inventory
					wepset[@weapon_get_type(wep)] = wep;
					//wepcurse[@weapon_get_type(wep)] = curse;
					wepreload[@weapon_get_type(bwep)] = (ultra_get("steroids", 1) ? max(reload, breload) : reload);

					//Put weapon in a slot to b slot when switching 1-6
					if(wepset[i] != wep) {
						if(!ultra_get("steroids", 1)) wepreload[@weapon_get_type(bwep)] = breload;
						bwep = wep;
						breload = reload;
						
						//Also, if steroids has ambidextrous, the same weapon will be in both his hands
						if (ultra_get("steroids", 1)) {
						bwep = wepset[i];
						breload = wepreload[i];
						}
					}
					
					//Put weapon from inventory to a slot
					wep = wepset[i];
					//curse = wepcurse[i];
					reload = wepreload[i];
					sound_play(weapon_get_swap(wepset[i]));
				}
			}
		} else {
			canswap = 1;
			if(bwep != 0){
				var wep_temp = bwep;
				bwep = wep;
				wep = wep_temp;
				
				var reload_temp = breload;
				breload = reload;
				reload = reload_temp;
				sound_play(weapon_get_swap(wep));
			}
		}
		swap_frame = 0;
		canfire = 1;
	}
	
	if(!button_check(index, "swap")){
		//Normalise speed
		if(global.newver) {
			if(slowing){
				if(current_time_scale < 30 / room_speed) current_time_scale = min(current_time_scale * global.unslow_fact, 30 / room_speed) else slowing = 0;
			}
		}
	}
}



//Switching ground weapons
//Option 1 for switching weapons
with (Player) {
	var player = self;
	if(instance_is(self, Player)){
		if(instance_exists(self)){
			if(button_pressed(index, "pick")) {
				with WepPickup{
					var groundwep = wep;
					var groundcurse = curse;
					
					if(place_meeting(x, y, player)){
						other.canpick = 0;
						if(player.wepcurse[@weapon_get_type(wep)] == 0){
							//Gets the weapon to be replaced on the inventory to be placed on the ground.
							if(player.wepset[@weapon_get_type(groundwep)] != 0){
								with instance_create(	x,	//(x + ((random_range(25, 30)) * ((irandom(1) * 2) - 1))),
														y,	//(y + ((random_range(25, 30)) * ((irandom(1) * 2) - 1))),
														WepPickup) {
									curse = 0;
									rotation = rotation;
									roll = roll;
									rotspeed = rotspeed;
									creator = creator;
									ammo = 0;
									type = type;
									wep = player.wepset[@weapon_get_type(groundwep)];
									name = name;
								}
							}
							//
							
							//Puts the weapon on the ground into the relevant weapon slot and/or hands
							player.wepset[@weapon_get_type(wep)] = wep;
							player.wepcurse[@weapon_get_type(wep)] = curse;
							if(weapon_get_type(player.wep) == weapon_get_type(wep)){
								player.wep = wep;
								//player.curse = curse;
							}
							if(weapon_get_type(player.bwep) == weapon_get_type(wep)){
								player.bwep = wep;
								//player.bcurse = curse;
							}
							if(player.wep == 0) player.wep = wep;
							else if((player.bwep == 0) && player.wep != wep) player.bwep = wep;
							
							
							//If ground weapon is cursed, curses both hands
							if (groundcurse == 1) {
							player.curse = 1;
							player.bcurse = 1;
							}
							
							sound_play(sndWeaponPickup);
							//
							
							
						}
						
						//If relevant inventory weapon is cursed, it will replicate the ground weapon elsewhere
						else {
						//	player.wep = 0;
						
							//instance_destroy();

							// Makes an exact copy of the weapon on the ground and place it in another spot 
							//(so you dont switch in the conventional manner, but straight to inventory and main weapon slot)
							// Need to make sure things dont spawn in walls
							with instance_create(	x,	//x + ((random_range(25, 30)) * ((irandom(1) * 2) - 1)),
													y,	//y + ((random_range(25, 30)) * ((irandom(1) * 2) - 1)),
													WepPickup) {
								curse = groundcurse;
								rotation = rotation;
								roll = roll;
								rotspeed = rotspeed;
								creator = creator;
								ammo = ammo;
								type = type;
								wep = groundwep;
								name = name;
							}
							//
						}
						
						
						//Destroys the ground weapon so you can't switch in the conventional manner
						instance_destroy();
					}
				}
			}
			if(button_released(index, "pick")) canpick = 1;
		}
	}
}



//with(Player) bwep=0;


/*Option 2 for switching weapons 
// WIP Still buggy
with (Player){
	var player = self;
	player.bwep = 27;
	if(button_pressed(index, "swap")) {
		wait 1
		wep = bwep;
		curse = bcurse;
		reload = breload;
		bwep = 27;
	}
	
	if(button_pressed(index, "pick")) {
		with WepPickup{
			if(place_meeting(x, y, player)){
				player.wep = player.wepset[@weapon_get_type(wep)];
				player.curse = player.wepcurse[@weapon_get_type(wep)];
				player.reload = player.wepreload[@weapon_get_type(wep)];
				if(weapon_get_type(player.wep) == weapon_get_type(wep) && player.curse == 0) player.wep = wep;
				//instance_destroy();
				
				//wait 20
				//player.bwep = 0;
			}
		}
	}
}
*/

//Curse system
with(Player) {
	var cursesum = 0;
	if ((curse + bcurse) == 0) wepcurse = [0,0,0,0,0,0]				//Cleans curses from inventory based on slots a & b
	
	//Checks if there are cursed weapons in the inventory
	for(var i = 0; i < array_length_1d(global.wepswitch); i++){
		if(wepset[i] = 0) wepcurse[i] = 0;
		if(wepcurse[i] !=0) cursesum += 1;
	}
	
	if (cursesum == 0) {
		curse = 0;
		bcurse = 0;
	}else{
		curse = 1;
		bcurse = 1;
	}
}

with(Player){
	//Fix for any effect which removes weapons

	if(wep == 0 || bwep == 0){
		if(lasta != wep && lasta != bwep){
				wepset[@weapon_get_type(lasta)] = 0;
				wepcurse[@weapon_get_type(lasta)] = 0;
		}
		if(lastb != wep && lastb != bwep){
				wepset[@weapon_get_type(lastb)] = 0;
				wepcurse[@weapon_get_type(lastb)] = 0;
		}
	}
	lasta = wep;
	lastb = bwep;
	
	//Fix for any effect which forcibly puts weapons into hand
	var slots = [wep, bwep];
	//if(slots[0] == 1) trace("GOT IT") else trace("DONT GOT IT");
	for(var b = 0; b < array_length_1d(slots); b++){
		//trace("DIFFERENT");
		if(slots[b] != wepset[@weapon_get_type(slots[b])] && slots[b] != 0){
			if(wep != bwep && weapon_get_type(wep) == weapon_get_type(bwep) && bwep != 0){
				//trace("SAME TYPE");
				wep = bwep;
				bwep = 0;
				
				/* switch(irandom(1)){
					case 0: bwep = wep; break;
					case 1: wep = bwep; break;
				} */
			}
			//Throw out old weapon
			with instance_create(x, y, WepPickup){
				//curse = 0;
				//rotation = rotation;
				//roll = roll;
				//rotspeed = rotspeed;
				ammo = 0;
				wep = player.wepset[@weapon_get_type(slots[b])];
			}
			wepset[@weapon_get_type(slots[b])] = slots[b];
		}
	}
}

with(WepPickup) if(wep == 0) instance_destroy();

/*Fix for robot & chicken
with (Player){
	if(button_released(index, "spec") && bwep == 0){
		for(var get = 0; get < array_length_1d(wepset); get++){
			if(wepset[get] != 0 && wepset[get] != wep){
				bwep = wepset[get];
				break;
			}
		}
	}
} */



#define draw
//Draws inventory weapons in the hud
with(Player) {
	if("wepset" not in self) game_start();
	if(swap_frame > swap_thres){
		var swap_ring_wep_thick = 10;
		draw_primitive_begin(pr_trianglestrip);
		draw_vertex_colour(x, y - swap_ring_wep_radius - swap_ring_wep_thick, c_silver, 0.5);
		for(var deg = 0; deg < 360; deg += 2){
			deg1 = deg + 90;
			//INNER RING
			draw_vertex_colour(	x - dcos(deg1) * (swap_ring_wep_radius - swap_ring_wep_thick),
								y - dsin(deg1) * (swap_ring_wep_radius - swap_ring_wep_thick),
								c_silver,
								0.5);
							
			//OUTER RING
			draw_vertex_colour(	x - dcos(deg1 + 1) * (swap_ring_wep_radius + swap_ring_wep_thick),
								y - dsin(deg1 + 1) * (swap_ring_wep_radius + swap_ring_wep_thick),
								c_silver,
								0.5);
		}
		draw_vertex_colour(x, y - swap_ring_wep_radius + swap_ring_wep_thick, c_silver, 0.5);
		draw_vertex_colour(x, y - swap_ring_wep_radius - swap_ring_wep_thick, c_silver, 0.5);
		draw_primitive_end();
		
		var j = -1;
		if(!point_in_circle(mouse_x[index], mouse_y[index], x, y, 30)){
			j = (point_direction(x, y, mouse_x[index], mouse_y[index]) - swap_ring_deg_offset + 180/array_length_1d(global.wepswitch));		//Adjust the angle of weapons in the ring
			j = (j < 0) ? j + 360 : j;																							//Readjust degrees to 0-360
			j = floor(j/360 * array_length_1d(global.wepswitch));																//Get a value of 0-#inventoryslots
		}
		for(var i = 0; i < array_length_1d(global.wepswitch); i++){
			draw_sprite_ext(	weapon_get_sprite(wepset[i]),
								0,
								x - swap_ring_wep_radius * dcos(90 - i * 360/array_length_1d(global.wepswitch)) + (sprite_get_xoffset(weapon_get_sprite(wepset[i])) - sprite_get_width(weapon_get_sprite(wepset[i]))) / 2 * (i = j ? 1.5 : 1),
								y - swap_ring_wep_radius * dsin(90 - i * 360/array_length_1d(global.wepswitch)) + (sprite_get_yoffset(weapon_get_sprite(wepset[i])) - sprite_get_height(weapon_get_sprite(wepset[i]))) / 2 * (i = j ? 1.5 : 1),
								i = j ? 1.5 : 1,
								i = j ? 1.5 : 1,
								0,
								wepcurse[i] ? c_purple : c_white,
								i = j ? 1 : 0.7);
		}
	}
}