#define crown_name // Crown Name
	return "CODEATH";

#define crown_text // Description
	return "LARGER EXPLOSIONS#EXPLOSIVE DEATH";

#define crown_tip // Loading Tip
	return "I HOPE YOU KNOW WHAT YOU'RE DOING";

#define step
	with(Corpse){
		if "codeath" not in self{
			codeath = 30 * 2;
			_spr_orig = sprite_index
			objectOrigin = string_delete(sprite_get_name(sprite_index),1,3);
			objectOrigin = string_delete(objectOrigin,string_length(objectOrigin)-3,4);
			sprite_index = asset_get_index("spr" + string(objectOrigin) + "Walk");
			image_speed = 0.2;
			if sprite_index = -1{
				sprite_index = _spr_orig;
				codeath = 0;
				image_speed = 0.40;
				image_index = 0;
			}
		}
		image_blend = make_color_rgb(255,255*sin(codeath),255*sin(codeath));
		if (codeath){
			if instance_exists(Player){
				var _target = instance_nearest(x,y,Player);
				move_towards_point(_target.x,_target.y,2);
			}else sprite_index = _spr_orig;
			if distance_to_object(projectile) = 0 && codeath > 1{
				with(instance_nearest(x,y,projectile)){
					if team = 2{
						other.codeath = 1;
					}
				}
				instance_create(x,y,PortalClear);
			}
			if hspeed > 0 image_xscale = 1
				else image_xscale = -1;
			if image_index + image_speed >= image_number{
					image_index = 0;
				}
		}
		if (codeath && !--codeath){
			var _size = sprite_get_width(sprite_index) * sprite_get_height(sprite_index);
			if _size >= 12 * 12{
				with(instance_create(x,y,SmallExplosion)){
					hitid = [other.sprite_index,other.objectOrigin+ " CORPSE"];
					codeath = 0;
				}
			}
			if _size >= 24 * 24{
				with(instance_create(x,y,Explosion)){
					hitid = [other.sprite_index,other.objectOrigin + " CORPSE"];
					codeath = 0;
				}
			}
			if _size >= 48 * 48{
				with(instance_create(x,y,GreenExplosion)){
					hitid = [other.sprite_index,other.objectOrigin + " CORPSE"];
					codeath = 0;
				}
			}
			if _size >= 56 * 56{
				repeat(3){
					with(instance_create(x,y,GreenExplosion)){
						hitid = [other.sprite_index,other.objectOrigin + " CORPSE"];
						codeath = 0;
					}
				}
			}
			sound_play(sndExplosion);
			if instance_number(enemy) + instance_number(becomenemy) = 0 && !(GameCont.area = 106 && GameCont.subarea = 3){
				instance_create(x,y,Portal);
			}
			instance_destroy();
		}
	}
	
	with(Explosion){
		if "codeath" not in self{
			if object_index = Explosion{
				for(var i = 1;i<=3;i++){
					with(instance_create(x+lengthdir_x(16,360/i),y+lengthdir_y(16,360/i),SmallExplosion)){
						codeath = 1;
						hitid = other.hitid;
					}
				}
				}else if object_index = GreenExplosion{
					for(var i = 1;i<=3;i++){
						with(instance_create(x+lengthdir_x(16,360/i),y+lengthdir_y(16,360/i),Explosion)){
							codeath = 1;
							hitid = other.hitid;
						}
					}
				}
			codeath = 1;
		}else{
			if codeath < 1{
				if object_index = Explosion{
				for(var i = 1;i<=3;i++){
					with(instance_create(x+lengthdir_x(16,360/i),y+lengthdir_y(16,360/i),SmallExplosion)){
						codeath = 1;
						hitid = other.hitid;
					}
				}
				}else if object_index = GreenExplosion{
					for(var i = 1;i<=3;i++){
						with(instance_create(x+lengthdir_x(16,360/i),y+lengthdir_y(16,360/i),Explosion)){
							codeath = 1;
							hitid = other.hitid;
						}
					}
				}
				codeath = 1;
			}
		}
	}