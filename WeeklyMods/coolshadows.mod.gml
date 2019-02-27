#define init
    trace("CoolShadows | Type ''/shadow'' for a list of toggleable shadow types!");

    global.surfShad = -1;
    global.instShad = { // Shadow Categories:
            "Player/Enemy" : {
                object_index : [hitme, BigDogExplo, LilHunterDie, NothingDeath, BecomeNothing],
                active : 1
                },
    
            "Projectile" : {
                object_index : projectile,
                active : 0
                },
    
            "Corpse" : {
                object_index : Corpse,
                active : 0
                },
    
            "Chest" : {
                object_index : chestprop,
                active : 1
                },
    
            "Effect" : {
                object_index : Effect,
                active : 0
                },
    
            "Miscellaneous" : {
                object_index : [Crown, CrystalShield, PopoShield, ReviveArea, NecroReviveArea, RevivePopoFreak, CampChar],
                active : 1
                }
        };

    for(var i = 0; i < lq_size(instShad); i++) lq_get_value(instShad, i).reset = 0;

#macro surfShad global.surfShad
#macro instShad global.instShad

#define draw_shadows
     // Setup:
    var _timeScale = current_time_scale;
    current_time_scale = 0.01; // :VeryLargeBrain:

    var _surfw = 1000, _surfh = 1000;
    if(!surface_exists(surfShad)) surfShad = surface_create(_surfw, _surfh);

     // Shadows:
    for(var i = 0; i < lq_size(instShad); i++){
        var _inst = lq_get_value(instShad, i),
            _obj = _inst.object_index,
            _active = _inst.active;

        if(_active){
             // Set important shadow vars:
            with(instances_matching(_obj, "cool_shadow", null)){
                cool_shadow = true;
                cool_shadow_x = 0;
                cool_shadow_y = (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) - 1);
                cool_shadow_yscale = -0.5;
                cool_shadow_type = ("right" in self);
        
                 // Exceptions:
                if(instance_is(self, projectile) && typ == 0) cool_shadow = false;
                else switch(object_index){
                    case BoltTrail:
                    case Campfire:
                    case MeltSplat:
                    case Nothing2:
                    case NothingInactive:
                    case PopupText:
                    case RainDrop:
                    case SnowFlake:
                    case TrapScorchMark:
                        cool_shadow = false;
                        break;

                    case Ally:
                    case BigSkull:
                    case TV:
                        cool_shadow_y = 8;
                        break;

                    case Anchor:
                        cool_shadow_x = 2;
                        cool_shadow_y = 4;
                        cool_shadow_yscale = 0.5;
                        break;

                    case BecomeNothing:
                    case Nothing:
                    case NothingDeath:
                        cool_shadow_yscale = 0.5;
                        break;

                    case BigDogExplo:
                    case ScrapBoss:
                        cool_shadow_y = 28;
                        break;

                    case BigFlower:
                    case Bush:
                    case IceFlower:
                    case Pillar:
                        cool_shadow_y = 5;
                        break;

                    case chestprop:
                    case Mimic:
                    case SuperMimic:
                        cool_shadow_y = 5;
                        cool_shadow_yscale = -0.6;
                        break;

                    case Corpse:
                        cool_shadow_y = (bbox_bottom - y) - 1
                        break;

                    case CrystalShield:
                        cool_shadow_y = 11;
                        break;

                    case ExploFreak:
                    case ThroneStatue:
                        cool_shadow_y = 10;
                        break;

                    case FrogQueen:
                        cool_shadow_y = 15;
                        break;

                    case Generator:
                    case GeneratorInactive:
                        cool_shadow_y = 76;
                        cool_shadow_yscale = 0.9;
                        break;

                    case JungleAssassinHide:
                        cool_shadow_y = 5;
                        cool_shadow_type = 0;
                        break;

                    case LastIntro:
                        cool_shadow_y = 6;
                        break;

                    case Maggot:
                    case RadMaggot:
                        cool_shadow_y = 3;
                        break;

                    case MaggotSpawn:
                        cool_shadow_y = 10;
                        break;

                    case MeleeFake:
                        cool_shadow_y = 7;
                        cool_shadow_type = 0;
                        break;

                    case NecroReviveArea:
                    case ReviveArea:
                    case RevivePopoFreak:
                        cool_shadow_y = 0;
                        cool_shadow_yscale = -1;
                        break;

                    case PopoShield:
                        cool_shadow_y = 13;
                        break;

                    case Sapling:
                        cool_shadow_y = 1;
                        break;

                    case TechnoMancer:
                        cool_shadow_y = 22;
                        break;

                    case VenuzTV:
                        cool_shadow_y = -10;
                        cool_shadow_yscale = -0.4;
                        break;

                    case Wind:
                    case WindNight:
                        cool_shadow_y = 3;
                        break;
                }
            }
        
             // Drawing:
            with(instances_matching(_obj, "cool_shadow", true)) if(visible){
                var _yscale = cool_shadow_yscale,
                    _x = x - (_surfw / 2),
                    _y = y - (_surfh / 2) + (image_yscale * cool_shadow_y);
        
                surface_set_target(surfShad);
                draw_clear_alpha(0, 0);
        
                 // Set some things before drawing:
                x -= _x;
                y -= _y;
                var _imgAng = image_angle;
                image_angle *= sign(_yscale);

            	if(cool_shadow_type){
            	     // Manually Draw Player:
            	    if(object_index == Player){
                        if(bwep != 0){
                            var f = ((weapon_get_type(bwep) == 0) ? bwepflip : right);
        
                             // Dual Wielding:
                            if(race == "steroids") draw_weapon(weapon_get_sprite(bwep), x, y - (sign(_yscale) * 4), sign(_yscale) * gunangle, sign(_yscale) * bwepangle, bwkick, sign(-_yscale) * f, 0, 1);
        
                             // Back Weapon:
                            else draw_sprite_ext(weapon_get_sprite(bwep), 0, x - (right * 2), y, 1, f, 90 + (15 * right), 0, 1);
                        }
        
                         // Self & Wep:
                        draw_weapon(weapon_get_sprite(wep), x, y, sign(_yscale) * gunangle, sign(_yscale) * wepangle, wkick, sign(_yscale) * ((weapon_get_type(wep) == 0) ? wepflip : right), 0, 1);
                        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * right, image_yscale, sign(_yscale) * (sprite_angle + angle), 0, 1);
            	    }
        
                     // Call Draw Events:
            	    else{
                	    var g = ("gunangle" in self),
                	        w = ("wepangle" in self),
                	        l = ((object_index == Sniper) ? gonnafire : 0),
                	        t = (((object_index == SnowTank || object_index == GoldSnowTank) && ammo > 0) ? ammo : 0);
        
                        if(g) gunangle *= -1;
                        if(w) wepangle *= -1;
                        if(l) gonnafire = 0;
                        if(t) ammo = 0;

                	    event_perform(ev_draw, 0);

                	    if(g) gunangle *= -1;
                        if(w) wepangle *= -1;
                	    if(l) gonnafire = l;
                	    if(t) ammo = t;
            	    }
            	}
            	else draw_self();
        
                 // Reset things:
                image_angle = _imgAng;
            	x += _x;
            	y += _y;
        
                 // Draw to shadow surface:
                surface_reset_target();
                draw_set_projection(0);
                draw_reset_projection();
                draw_surface_ext(surfShad, _x + cool_shadow_x, _y + _surfh - ((_surfh / 2) * (_yscale + 1)), 1, _yscale, 0, 0, 1);
            }
        }
    }
    
     // Don't perpetually slow time:
    current_time_scale = _timeScale;

#define draw_weapon(_sprite, _x, _y, _ang, _meleeAng, _wkick, _flip, _blend, _alpha)
	draw_sprite_ext(_sprite, 0, _x - lengthdir_x(_wkick, _ang), _y - lengthdir_y(_wkick, _ang), 1, _flip, _ang + (_meleeAng * (1 - (_wkick / 20))), _blend, _alpha);

#define step
    for(var i = 0; i < lq_size(instShad); i++){
        with(lq_get_value(instShad, i)){
             // Disable Shadows:
            if(active){
                reset = 1;
                with(instances_matching_ne(object_index, "spr_shadow", sprVoid, undefined)){
                    spr_shadow_coolsave = spr_shadow;
                    spr_shadow = sprVoid;
                }
            }

             // Reset Shadows:
            else if(reset){
                reset = 0;
                with(instances_matching_ne(object_index, "spr_shadow_coolsave", undefined)){
                    spr_shadow = spr_shadow_coolsave;
                }
            }
        }
    }

#define chat_command(_cmd, _arg, _player)
    if(_cmd == "shadow"){
        if(_arg != ""){
             // Toggle All:
            if(_arg == "0" || _arg == "All"){
                var a = 0;
                for(var i = 0; i < lq_size(instShad); i++){
                    var v = lq_get_value(instShad, i);
                    if(!v.active){
                        a = 1;
                        break;
                    }
                }
                for(var i = 0; i < lq_size(instShad); i++){
                    var v = lq_get_value(instShad, i);
                    v.active = a;
                }
                trace_color("CoolShadows | All Shadow Types " + (a ? "ENABLED (Lag likely)" : "DISABLED"), (a ? c_lime : c_red));
            }

             // Specific Toggle:
            else{
                var _name = _arg;

                 // Index Input:
                var _index = real(_arg);
                if(_index > 0 && _index <= lq_size(instShad)){
                    _name = lq_get_key(instShad, _index - 1);
                }
    
                var _inst = lq_defget(instShad, _name, -1);
                if(is_object(_inst)){
                    _inst.active = !_inst.active;
                    var _active = _inst.active;
                    trace_color("CoolShadows | " + _name + " Shadows " + (_active ? "ENABLED" + ((_name == "Effect") ? " (Lag likely)" : "") : "DISABLED"), (_active ? c_lime : c_red));
                }
                else trace_color("CoolShadows | The type ''" + _arg + "'' could not be found, ''/shadow'' for help.", c_red);
            }
        }

         // Trace Shadow Categories:
        else{
            trace("CoolShadows | (Usage: /shadow [name/index])");

            var a = 1;
            for(var i = 0; i < lq_size(instShad); i++){
                var v = lq_get_value(instShad, i);
                if(!v.active){
                    a = 0;
                    break;
                }
            }
            trace_color("0 All", (a ? c_lime : c_red));

            for(var i = 0; i < lq_size(instShad); i++){
                var _name = lq_get_key(instShad, i),
                    _inst = lq_get(instShad, _name),
                    _object = _inst.object_index,
                    _active = _inst.active;
    
                trace_color(string(i + 1) + " " + _name, (_active ? c_lime : c_red));
            }
        }

        return true;
    }

#define cleanup
    surface_destroy(surfShad);

     // Reset Shadows:
    for(var i = 0; i < lq_size(instShad); i++){
        with(lq_get_value(instShad, i)){
            with(instances_matching_ne(object_index, "spr_shadow_coolsave", undefined)){
                spr_shadow = spr_shadow_coolsave;
            }
        }
    }