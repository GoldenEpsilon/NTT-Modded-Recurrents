#define init
	// Create this object to handle rendering the sprites. would
	// just do a script_bind_draw, but that only executes once. 
	// Additionally, destroys existing CustomObject with same 'name' variable. 
	with(CustomObject){
		if ("name" in self){
			if name = "PaperController" instance_destroy();
		}
	}
	with(instance_create(0,0,CustomObject)){
		persistent = 1;
		depth = -3;
		name = "PaperController"
		on_draw = script_ref_create(drawpaper,-2);
	}
#define cycle
    /// cycle(value, min, max)
	/// Thanks yal
    var result, delta;
    delta = (argument2 - argument1);
    result = (argument0 - argument1) mod delta;
    if (result < 0) result += delta;
    return result + argument1;
	
#define step
	with(RatkingRage){
		if ("paper_processed" not in self){
			right = 1;
			oldright = right;
			image_alpha = 0;
			wepangle = 0;
			meleeangle = 0;
			isEnemy = true;
			wepspr = mskNone;
			bwepspr = mskNone;
			wep = 0;
			bwep = 0;
			gunangle = 0;
			wepangle = 0;
			wkick = 0;
			
			paper_processed = 1;
		}
	}
	with(hitme){
		if ("paper_processed" not in self){
			right = 1;
			oldright = right;
			image_alpha = 0;
			wepangle = 0;
			meleeangle = 0;
			wkick = 0;
			wepflip = -1;
			wepspr = mskNone;
			bwepspr = mskNone;
			isEnemy = false;
			if ("gunangle" not in self) gunangle = 0;
			if ("bwep" not in self) bwep = -1;
			if ("wep" not in self){
				wep = -1;
				isEnemy = true;
				switch(object_index){
					case Bandit: wepspr = sprBanditGun; break;
					case Sniper: wepspr = sprSniperGun; break;
					case Gator: wepspr = sprShotgun; break;
					case BuffGator: wepspr = sprFlakCannon; break;
					case Raven: wepspr = sprRavenGun; break;
					case MeleeBandit: wepspr = sprPipe; break;
					case Necromancer: wepspr = sprNecrogun; break;
					case Grunt: case Inspector: wepspr = sprPopoGun; break;
					case Shielder: wepspr = sprPopoHeavyGun; break;
					case EliteGrunt: wepspr = sprElitePopoGun; break;
					case EliteInspector: wepspr = sprEnergyBaton; break;
					case EliteShielder: wepspr = sprPopoPlasmaMinigun; break;
					case PopoFreak: wepspr = sprPopoFreakGun; break;
					case Molefish: wepspr = sprMolefishGun; break;
					case Molesarge: wepspr = sprMolesargeGun; break;
					case JungleBandit: wepspr = sprJungleBanditGun; break;
					case LilHunter: wepspr = sprLilHunterGun; break;
					case BanditBoss: wepspr = sprBanditBossGun; break;
					default: wepspr = mskNone; break;
				}
			}
			paper_processed = 1;
		}
		if oldright != right{
			oldright += (right - oldright) * 0.40;
			oldright = clamp(oldright,-1,1);
		}
	}

#define drawpaper
	with(LilHunterFly) image_alpha = 1;
	with(LilHunter) image_alpha = 0;
	with(Raven) image_alpha = 0;
	with(RavenFly) image_alpha = 1;
	with(hitme){
		if object_index != Nothing && object_index != HyperCrystal && object_index != TechnoMancer{
			if ("paper_processed" in self){
				if wep != -1 wepspr = weapon_get_sprite(wep);
				if bwep != -1 bwepspr = weapon_get_sprite(bwep);
				if ("angle" in self) image_angle = angle;
				if visible = false alpha = 0
					else alpha = 1;
				
				if weapon_get_type(wep) = 0  || wep = 53 || wep = 24 || wep = 36{
					if (abs(wepangle - meleeangle) > 0.20){
						meleeangle += (wepangle - meleeangle) * 0.66;
					}else meleeangle = wepangle;
				}else{
					meleeangle = wepangle;
					wepflip = right;
				}
				
				if wep = -1{
					wepflip = right;
				}
				draw_sprite_ext(bwepspr, 0, x, y, 1, oldright, 90 + (45 * right), make_color_rgb(160,160,160), 1);
				
				if ((gunangle + meleeangle + 180) mod 360) >= 180 draw_sprite_ext(wepspr, 0, x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle), 1, wepflip, gunangle+meleeangle, image_blend, 1);
				if "drawspr" not in self{
					draw_sprite_ext(sprite_index,image_index,x,y,oldright,image_yscale,image_angle,image_blend,alpha);
				}else{
					draw_sprite_ext(drawspr,drawimg,x,y,oldright,image_yscale,image_angle,image_blend,alpha);
				}
				if ((gunangle + meleeangle + 180) mod 360) < 180 draw_sprite_ext(wepspr, 0, x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle), 1, wepflip, gunangle+meleeangle, image_blend, 1);
			}
		}else{
			if image_alpha != 1 && object_index != HyperCrystal image_alpha = 1;
		}
	}