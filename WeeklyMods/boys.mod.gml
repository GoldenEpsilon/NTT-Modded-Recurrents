#define init
	scrHUD(0); // Hide HUD

	 // Create BoyCont:
	with instances_matching(GameObject, "name", "BoyCont") instance_destroy();
	for(var i = 0; i < maxp; i++){
		global.boycont[i] = instance_create(10016, 10016, GameObject);
		with(global.boycont[i]){
			name = "BoyCont";
			persistent = 1;
			mask_index = mskPlayer;
			index = i;
			xspeed = 0;
			yspeed = 0;
			dead = 0;
		}
	}

#define game_start
	init();

#define step
	global.active = 0;
	for(var i = 0; i < maxp; i++) if(player_is_active(i)) global.active++;

	if(instance_exists(Player)){
		with(global.boycont) if(player_is_active(index)){
			var _boys = instances_matching(Player, "index", index),
				_boynum = array_length(_boys),
				_race = player_get_race(index),
				_x = 0,
				_y = 0;

			 // Put BoyCont At Spawn:
			if(instance_exists(GenCont)){
				x = 10016;
				y = 10016;
			}

			 // Boy Related Business:
			if(_boynum > 0){
				 // Fix Co-op:
				with instances_matching(Revive, "p", index) instance_destroy();

				 // Camera:
				view_object[index] = id;

				/// Movement: While Moving Avg. ~200 MS
					 // Find Direction:
					var _moveKeys = ["east", "nort", "west", "sout"];
					for(var i = 0; i < array_length(_moveKeys); i++){
						if(button_check(index, _moveKeys[i])){
							var d = (i * 90);
							_x += lengthdir_x(1, d);
							_y += lengthdir_y(1, d);
						}
					}

					 // Moving & Collisions:
					if(_x != 0 || _y != 0){
						with(_boys[_boynum - 1]){
							var _spd = speed,
								_max = maxspeed,
								_frc = friction;
						}

						var _dis = ((_spd > (_max - _frc)) ? _spd : _max - _frc),
							_dir = point_direction(0, 0, _x, _y),
							_x = lengthdir_x(_dis, _dir),
							_y = lengthdir_y(_dis, _dir);

						if(!place_meeting(x + _x, y, Wall)) x += _x;
						if(!place_meeting(x, y + _y, Wall)) y += _y;
					}

				 // Rebel!
				var a = instance_number(Ally);
				if(_race == "rebel"){
					if(button_pressed(index, "spec") && (a <= 0 || _boynum > 2)){
						 // Sound:
						if(skill_get(5)) sound_play(sndSpawnSuperAlly);
						else sound_play(sndSpawnAlly);

						 // Heal Allies:
						with(Ally){
							my_health = maxhealth;
							alarm2 = 120 + (40 * ultra_get(10, 2));
							instance_create(x, y, HealFX);
						}

						 // Spawn Allies:
						for(var i = 0; i <= (a > 0); i++) with(_boys[i]){
							my_health = 0;
							if(i <= ultra_get(10, 2)){
								var o = 5;
								with instance_create(x + lengthdir_x(o, random(360)), y + lengthdir_y(o, random(360)), Ally){
									index = other.index;
								}
							}
						}
					}

					 // Auto Creatorify Allies:
					with instances_matching(Ally, "index", index) if(!instance_exists(creator)){
						creator = _boys[0];
					}
				}

				 // Boys: Avg ~120 MS Per Player
				var _ammo = [0, 0, 0, 0, 0, 0], _out = 0;
				with(_boys){
					canwalk = 0;

					 // Duplication: Avg. ~5 MS
					if(my_health > 1){
						with(instance_create(x, y, Revive)){
							p = other.index;
							canrevive = 1;
							ammo = other.ammo;
							event_perform(ev_collision, Player);
						}
					}

					 // Movement: While Moving Avg. ~30 MS, Non-Moving Avg. ~20 MS
					if(_x != 0 || _y != 0) motion_add(point_direction(x, y, x + _x, y + _y), 1 + friction);
					if(distance_to_object(other) > 5 + speed + _boynum){
						_out++;
						if(collision_line(x, y, other.x, other.y, Wall, 0, 0)) mp_potential_step(other.x + _x, other.y + _y, maxspeed - 1, 0);
						motion_add(point_direction(x, y, other.x, other.y), 1 + friction);
					}

					 // Cannot Have Bwep (Drop It): Avg. ~5 MS
					if(bwep != 0 && race != "steroids" && canpick){
						with instance_create(x, y, WepPickup){
							wep = other.bwep;
							curse = other.bcurse;
						}
						bwep = 0;
					}

					 // Find Differences In Ammo: Avg. ~100 MS
					if("last_frame_ammo" in self){
						for(var i = 0; i < array_length(ammo); i++){
							_ammo[i] += (ammo[i] - last_frame_ammo[i]);
						}
						ammo = last_frame_ammo;
					}

					 // Death Counter: Avg. ~5 MS
					if(my_health <= 0){
						if(candie && (!skill_get(27) || !canspirit) && (race != "chicken" || bleed >= 120)) other.dead++;
					}
				}

				 // Move To Boys If Too Far Away:
				if(_out > _boynum / 1.5){
					var _x = 0,
						_y = 0;

					with(_boys){
						_x += x;
						_y += y;
					}

					x = (_x / _boynum);
					y = (_y / _boynum);
				}

				 // Shared Ammo: Avg. ~80 MS
				for(var i = 0; i < array_length(_ammo); i++) if(_ammo[i] != 0) with(_boys){
					if("last_frame_ammo" in self){
						ammo[i] = min(ammo[i] + _ammo[i], typ_amax[i]);
					}
				}

				 // Remember Last Ammo / Set New Boy Ammo: Avg. ~10 MS Per Player
				with(_boys){
					if("last_frame_ammo" not in self) with(_boys[_boynum - 1]) other.ammo = ammo;
					last_frame_ammo = array_clone(ammo);
				}
			}
		}
	}
	else with instances_matching(GameObject, "name", "BoyCont") instance_destroy();

#define draw
	 // BoyCont Player Indicators: Singleplayer Avg. ~60 MS, Coop Avg. ~350-500 Per Player
	if(instance_exists(Player)){
		with(global.boycont) if(player_is_active(index) && (global.active > 1 || button_check(index, "talk"))){
			var	_x = x,
				_y = y,
				_col = player_get_color(index);

			 // Marker:
			draw_sprite_ext(sprPlayerIndicator, index + 1, _x, _y, 1, 1, 0, _col, 1);

			 // Chat Indicator:
			if(button_check(index, "talk")){
				var	_x1 = _x - 5,	_x2 = _x1 + 9,
					_y1 = _y - 25,	_y2 = _y1 + 7;

				 // Black BG:
				draw_set_color(c_black);
				draw_rectangle(_x1, _y1, _x2, _y2, 0); 

				 // Blips:
				draw_set_color(_col);
				for(var i = 0; i < 3; i++){
					if((current_frame mod 60) >= ((i + 1) * 15)){
						var	__x = _x - 4 + (i * 3),
							__y = _y1 - 1 + round((_y2 - _y1) / 2);

						draw_rectangle(__x, __y, __x + 1, __y + 1, 0);
					}
				}
			}

			 // Boy Count:
			var	_count = string(array_length(instances_matching(Player, "index", index)));
			_y -= 23;

			draw_set_font(fntChat); // fntChat is the only font that works centered
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);

						// y'know //
			draw_set_color(c_black);
			draw_text(_x + 1,	_y,		_count);
			draw_text(_x - 1,	_y,		_count);
			draw_text(_x,		_y + 1,	_count);
			draw_text(_x,		_y - 1,	_count);
			draw_text(_x + 1,	_y + 1,	_count);
			draw_text(_x + 1,	_y - 1,	_count);
			draw_text(_x - 1,	_y + 1,	_count);
			draw_text(_x - 1,	_y - 1,	_count);
			draw_text(_x,		_y + 2,	_count);
			draw_set_color(_col);
			draw_text(_x,		_y,		_count);
		}
	}

#define draw_gui
	 // Draw HUD: Avg. ~2300 MS Per Player
	var _coop = (global.active <= 1);
	if(instance_exists(Player)) with(global.boycont) if(player_is_active(index)){
		for(var i = 0; i < maxp; i++) draw_set_visible(i, (index == i));

		var _boys = instances_matching(Player, "index", index);
		if(array_length(_boys) > 0){
			var p = _boys[array_length(_boys) - 1],
				__x = 4,
				o = (_coop * 16);

			/// Boy Count:
				var _x = __x + o,
					_y = 4;

				 // Boy Count Bar:
				draw_sprite(sprHealthBar, 0, _x, _y);

				 // Boy Count Bar Filling:
				var	_alive = array_length(_boys),
					_max = 83,
					_x1 = _x + 2.1,
					_y1 = _y + 3.1,
					_x2 = _x1 + _max - 0.1,
					_y2 = _y1 + 7;

				draw_set_color(player_get_color(index));
				draw_rectangle(_x1, _y1, min(_x1 + (_max * (_alive / (_alive + dead))), _x2), _y2, 0);

				 // Boy Count Text:
				draw_set_font(fntM);
				draw_set_halign(fa_center);
				draw_set_valign(fa_top);
				draw_text_nt(_x1 + ((_max + 7) / 2), _y1, string(max(0, _alive)) + "/" + string(_alive + dead));

			/// Rads:
				if(_coop){
					var _x = __x,
						_y = 4;

					 // HUD Canister:
					if(GameCont.skillpoints > 0) draw_sprite(sprExpBarLevel, 0, _x, _y);
					draw_sprite(sprExpBar, (GameCont.rad / (60 * GameCont.level)) * 16, _x, _y);

					 // Level Text:
					draw_set_font(fntM);
					draw_set_halign(fa_center);
					draw_set_valign(fa_middle);
					draw_text_nt(_x + 7, _y + 12, ((GameCont.level == 10) ? "@(sprUltraLevel)" : string(GameCont.level)));
				}

			/// Ammo:
				var	_x = __x + o,
					_y = 19,
					_icon = ["Bullet", "Shot", "Bolt", "Explo", "Energy"];

				draw_set_font(fntSmall);
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				for(var i = 0; i < array_length(_icon); i++){
					 // Determine If Weapon Is Held:
					var _img = 0;
					with(_boys){
						if(weapon_get_type(wep) == (i + 1) || weapon_get_type(bwep) == (i + 1)) _img = 2;
					}

					 // Draw Icons:
					draw_sprite(asset_get_index("spr" + _icon[i] + "IconBG"	), _img, _x, _y);
					draw_sprite(asset_get_index("spr" + _icon[i] + "Icon"	), 7 - ceil((p.ammo[i + 1]/ p.typ_amax[i + 1]) * 7), _x, _y);

					 // Draw Ammo Count:
					var _str = string(p.ammo[i + 1]);
					draw_text_nt(_x + 12, _y + 6, _str);

					_x += 12 + string_width(_str);
				}

			/// Portal Strike Ammo:
				if(player_get_race(index) == "rogue"){
					var	_x = __x + o + 90,
						_y = 4,
						_spr = (ultra_get(12, 1) ? sprRogueAmmoHUDTB : sprRogueAmmoHUD),
						_ammo = 0;

					with(_boys) _ammo += rogueammo;

					 // Rogue Ammo HUD:
					var _img = min(_ammo, sprite_get_number(_spr) - 1);
					draw_sprite(_spr, _img, _x, _y);

					 // Ammo Count:
					if(_ammo > _img){
						draw_set_font(fntSmall);
						draw_set_halign(fa_left);
						draw_set_valign(fa_top);
						draw_text_nt(_x + 10 + ultra_get(12, 1), _y + 1, "+" + string(_ammo - _img));
					}
				}
		}
	}

#define scrHUD(_show)
	for(var i = 0; i < maxp; i++){
		for(var j = 0; j < maxp; j++){
			player_set_show_hud(i, j, _show);
			player_set_show_marker(i, j, _show);
		}
	}

#define cleanup
	scrHUD(1);
	with instances_matching(GameObject, "name", "BoyCont") instance_destroy();
	with(Player) canwalk = 1;