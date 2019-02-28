#define init
	 // Define Sprites:
	global.sprIdle = sprite_add("Sprites/sprIdle.png", 9, 12, 12);
	global.sprWalk = sprite_add("Sprites/sprWalk.png", 6, 16, 16);
	global.sprHurt = sprite_add("Sprites/sprHurt.png", 3, 16, 16);
	global.sprDead = sprite_add("Sprites/sprDead.png", 6, 16, 16);
	global.sprSit1 = sprite_add("Sprites/sprSit1.png", 3, 16, 16);
	global.sprSit2 = sprite_add("Sprites/sprSit2.png", 4, 16, 16);
	global.sprSlct = sprite_add("Sprites/sprSlct.png", 1, 0,  0);
	global.sprIcon = sprite_add("Sprites/sprIcon.png", 1, 11, 7);
	global.sprPort = sprite_add("Sprites/sprPort.png", 1, 47, 205);
	global.sprUltSlct = sprite_add("Sprites/sprUltSlct.png", 2, 12, 16);
	//global.sprUltIcon[0] = sprite_add("Sprites/sprUltIcon1.png", 1, 8, 9);
	//global.sprUltIcon[1] = sprite_add("Sprites/sprUltIcon2.png", 1, 8, 9);

     // Global Step:
    var _newLevel = instance_exists(GenCont);
    while(true){
         // Level Start:
        if(instance_exists(GenCont)) _newLevel = 1;
		else if(_newLevel){
			_newLevel = 0;
			with(instances_matching(Player, "race", mod_current)){
			    level_start();
			}
		}

		wait 1;
    }

/// Text:
#define race_name       return "DETONATOR";
#define race_text       return "@rFLAME @wRESISTANCE#EXPLODE PROJECTILES";
#define race_tb_text    return "@rEXPLOSIONS @sLAST @wLONGER"
#define race_ttip       return [""];

/// Sounds:
#define race_menu_select    return sndSteroidsUpg;

/// Sprites:
#define race_menu_button    sprite_index = global.sprSlct;
#define race_portrait       return global.sprPort;
#define race_mapicon        return global.sprIcon;
#define race_sprite(_skin, _type)
	var _spr = {"spr_idle" : global.sprIdle,
				"spr_walk" : global.sprWalk,
				"spr_hurt" : global.sprHurt,
				"spr_dead" : global.sprDead,
				"spr_sit1" : global.sprSit1,
				"spr_sit2" : global.sprSit2};

	return lq_get(_spr, _type);

#define create
	 // Set Sprites:
	spr_idle = race_sprite(bskin, "spr_idle");
	spr_walk = race_sprite(bskin, "spr_walk");
	spr_hurt = race_sprite(bskin, "spr_hurt");
	spr_dead = race_sprite(bskin, "spr_dead");
	spr_sit1 = race_sprite(bskin, "spr_sit1");
	spr_sit2 = race_sprite(bskin, "spr_sit2");

	 // Set Sounds:
	snd_wrld = sndGuardBob;         // LET'S DO THIS
	snd_hurt = sndJockHurt;         // THE WIND HURTS
	snd_dead = sndMolesargeDead;    // THE STRUGGLE CONTINUES
	snd_lowa = sndMutant7LowA;      // ALWAYS KEEP ONE EYE ON YOUR AMMO
	snd_lowh = sndSteroidsUpg;      // THIS ISN'T GOING TO END WELL
	snd_chst = sndSalamanderCharge; // TRY NOT OPENING WEAPON CHESTS
	snd_valt = sndMutant7Valt;      // AWWW YES
	snd_crwn = sndMutant7Crwn;      // CROWNS ARE LOYAL
	snd_spch = sndMutant7Spch;      // YOU REACHED THE NUCLEAR THRONE
	snd_idpd = sndMutant7IDPD;      // BEYOND THE PORTAL
	snd_cptn = sndMutant7Cptn;      // THE STRUGGLE IS OVER

     // Vars:
    detonate_chrg = 0;
    detonate_heat = 0;
    detonate_heat_max = 30;

#define game_start
    sound_play_pitch(sndMutant1Cnfm, 0.8); // Confirm Sound

#define level_start
     // Pitched snd_wrld:
    if(GameCont.subarea == 1){
        sound_play_pitchvol(snd_wrld, 0.45, 2);
    }

#define step
     // Passive : Flame Resistance*
     // *Flame is too hot at the origin point to resist damage (Confirmed lore)
    with(instances_matching_ne([TrapFire, Flame], "team", team)){
        if(distance_to_object(other) < 12 + other.speed) instance_destroy();
    }

     // Active : Detonate Projectiles
    if(detonate_chrg > 0){
        var _detonate = 0;

         // Charge Detonation:
        if(usespec > 0 || button_check(index, "spec")){
            var _lastChrg = detonate_chrg,
                n = ((detonate_chrg + 10) * 0.92);

            detonate_chrg += (n - _lastChrg) * current_time_scale;

             // Overheat:
            if(detonate_chrg - _lastChrg < (0.5 * current_time_scale)){
                detonate_heat += current_time_scale;
                sound_play_pitchvol(sndFlamerStart, 0.5 + (detonate_heat / detonate_heat_max), 0.75 * (detonate_heat / detonate_heat_max));

                 // Explode:
                if(detonate_heat > detonate_heat_max){
                    _detonate = 1;

                     // Splosions:
                    with(scrExplosion(x, y, 0)) creator = other;
                    var _ang = random(360),
                        l = 12;

                    for(var a = _ang; a < _ang + 360; a += (360 / 3)){
                        with(scrExplosion(x + lengthdir_x(l, a), y + lengthdir_y(l, a), 1)) creator = other
                    }

                     // Effects:
                    repeat(maxhealth) instance_create(x + random_range(-16, 16), y + random_range(-16, 16), GroundFlame);
                    repeat(10) with(instance_create(x, y, Smoke)){
                        motion_add(random(360), 1 + random(1));
                        gravity = -0.1;
                        depth = -7;
                    }
                    sound_play(sndExplosionL);
                }
            }
        }
        else _detonate = 1;

         // Detonation:
        var _chrg = detonate_chrg,
            _draw = [],
            _team = team;

        with(instances_matching_ne([projectile, BoltStick], "typ", 0)){
            var t = (("team" in self) ? team : _team),
                c = (("creator" in self) ? creator : other);

            if(
                c == other
                ||
                (
                    !instance_is(c, Player) &&
                    (
                        t == _team
                        ||
                        (ultra_get(mod_current, 2) && other.detonate_heat > 0) // Ultra B : Detonate Enemy Projectiles While Overheating
                    )
                )
            ){
                if(point_distance(x, y, other.x, other.y) < _chrg){
                     // Target Sound:
                    if(t != _team && "detonate_target_sound" not in self){
                        detonate_target_sound = 1;
                        sound_play_pitch(sndSniperTarget, 2);
                    }

                    if(_detonate){
                        /// Determine Explosion Type:
                            var _explo,
                                _power = (("damage" in self) ? damage : 3);
    
                             // Big:
                            if(_power > 6){
                                _explo = 0;
                                sound_play(sndExplosion);

                                 // Spicy:
                                repeat(((_power / 2) + irandom(_power)) / 2){
                                    var l = random(min(_power * 2, 25)),
                                        d = random(360);

                                    with(instance_create(x + lengthdir_x(l, d), y + lengthdir_y(l, d), GroundFlame)){
                                        direction = other.direction;
                                        speed = min(other.speed, 20);
                                        friction = 4;
                                    }
                                }
                            }

                             // Small:
                            else{
                                _explo = 1;
                                sound_play(sndExplosionS);
                            }

                         // Explosion:
                        var c = other;
                        with(scrExplosion(x, y, _explo)){
                            direction = other.direction;
                            speed = min(other.speed, 20);
                            friction = 2.5;
                            creator = c;
                        }

                         // Effects:
                        view_shake_at(x, y, _power);
                        repeat(5) with(instance_create(x, y, choose(Smoke, Dust))){
                            motion_add(other.direction, other.speed / 3);
                        }
                        with(instance_create(other.x, other.y, Smoke)){
                            motion_add(point_direction(x, y, other.x, other.y), 1);
                        }
    
                        instance_destroy();
                    }

                     // Target Drawing:
                    else _draw[array_length(_draw)] = id;
                }
            }
        }
        if(_detonate){
            detonate_chrg = 0;

             // Effects:
            sound_stop(sndSalamanderCharge);
            sound_stop(sndSalamanderEndFire);
            sound_play_pitchvol(sndBigBanditMeleeHit, 1, 1);
            view_shake_at(x, y, 6);
        }

         // Draw Targeting Markers:
        else script_bind_draw(target_draw, -6, _draw, index);
    }
    else{
        detonate_heat = 0;

         // Start Charging Detonation:
        if(canspec && (usespec > 0 || button_pressed(index, "spec"))){
            detonate_chrg = 1;
            sound_play_pitch(sndSalamanderCharge, 0.7 + random(0.2));
            sound_play_pitch(sndSalamanderEndFire, 0.6 + random(0.2));
        }
    }

     // Throne Butt : Explosions Last 25% Longer
    if(skill_get(mut_throne_butt)){
        with(instances_matching_ge(instances_matching(Explosion, "detonator_butt", null), "image_index", 1)){
            detonator_butt = 1;
            image_speed *= 0.75;
            image_alpha *= 1.75; // +Bloom
        }
    }

     // Ultra A :
    /*with(instances_matching(instances_matching(projectile, "flame_death", null), "creator", id)){
        flame_death = 1;
        if(fork()){
            var _x, _y, _hspd, _vspd, _team, _num;
            while(instance_exists(self)){
                _x = x;
                _y = y;
                _hspd = hspeed;
                _vspd = vspeed;
                _team = team;
                _num = damage;
                wait 1;
            }
            repeat(_num) with(instance_create(_x, _y, Flame)){
                team = _team;
                hspeed = _hspd / 5;
                vspeed = _vspd / 5;
                motion_add(random(360), 1 + random(_num / 5));
            }
            exit;
        }
    }*/

    script_bind_draw(charge_draw, -7, index);

#define scrExplosion(_x, _y, _small)
    with(instance_create(_x, _y, (_small ? SmallExplosion : Explosion))){
        hitid = (_small ? 56 : 55);
        return id;
    }

#define charge_draw(_index)
    draw_set_visible_solo(_index);

    var a = 1;
    with(player_find(_index)) if(detonate_chrg > 0){
        repeat(2){
            var _x = x,
                _y = y,
                _col = player_get_color(_index),
                _chrg = detonate_chrg,
                _heat = (detonate_heat / detonate_heat_max);
    
            if(detonate_heat > 0){
                _chrg += random_range(-1, 1);
                draw_set_color(merge_color(_col, c_red, min(0.25 + (0.75 * _heat), 1)));
            }
            else draw_set_color(_col);
    
            draw_set_alpha(a ? 0.15 : 0.075);
            draw_circle(_x, _y, _chrg, 0);
            if(a){
                draw_set_alpha(0.8);
                draw_circle(_x, _y, _chrg, 1);
            }
    
            if(detonate_heat > 0){
                draw_set_color(_col);
                draw_set_alpha(a ? 0.1 : 0.05);
                draw_circle(_x, _y, _chrg * (1 - _heat), 0);
                draw_set_alpha(0.05);
                draw_set_color(c_black);
                draw_circle(_x, _y, _chrg * (1 - _heat), 1);
            }

             // Draw for other players at lower alpha:
            a = 0;
            draw_set_visible_all(1);
            draw_set_visible(_index, 0);
        }
    }

    draw_set_alpha(1);
    draw_set_visible_all(1);
    instance_destroy();

#define target_draw(_inst, _index)
    draw_set_visible_solo(_index);
    d3d_set_fog(1, make_color_rgb(255, 20, 0), 0, 0);

    repeat(2){
        with(_inst) if(instance_exists(self)){
            var _img = 5,
                _power = (("damage" in self) ? damage : 3),
                _scale = sqrt(_power) / 2.33;
    
            if(_power > 6){
                _img = 6;
                _scale /= 1.5;
            }
    
            draw_sprite_ext(sprCrosshair, _img, x, y, _scale, _scale, image_angle - (10 * current_frame), 0, 1);
        }

         // Draw for other players at lower alpha:
        draw_set_visible_all(1);
        draw_set_visible(_index, 0);
        d3d_set_fog(1, player_get_color(_index), 0, 0);
    }

    d3d_set_fog(0, 0, 0, 0);
    draw_set_visible_all(1);
    instance_destroy();

#define draw_set_visible_solo(_index)
    draw_set_visible_all(0);
    draw_set_visible(_index, 1);

#define race_ultra_name(i)
	switch(i){
		case 1: return "Ultra A";
		case 2: return "OVERCHARGE";
	}

#define race_ultra_text(i)
	switch(i){
		case 1: return "Ultra A";
		case 2: return "@rDETONATE @sENEMY @wPROJECTILES#@sAT @rMAX CHARGE";
	}

#define race_ultra_button(i)
	sprite_index = global.sprUltSlct;
	image_index = i + 1;

#define race_ultra_icon(i)
    //return global.sprUltIcon[argument0 - 1];

#define race_ultra_take(_ultra, _get)
	if(_get && instance_exists(EGSkillIcon)){
		sound_play(sndBasicUltra);
		switch(_ultra){
			case 1: // Ultra A Sounds
				if(fork()){
					 exit;
				}
				break;

			case 2: // Ultra B Sounds:
				if(fork()){
					exit;
				}
				break;
		}
	}