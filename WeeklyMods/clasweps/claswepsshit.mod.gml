#define init
global.gcecheck = 0;
global.secrets = 0;
global.hatch = 0;
global.popoguns = 0

#define game_start
global.secrets = 0;
global.popoguns = 0;

#define step
//Cursed Crystal Gun
with(Player){
if wep = "invcrystallaser" && curse = 0{
wep = "crystallaser"
  }
if bwep = "invcrystallaser" && bcurse = 0{
bwep = "crystallaser"
  }
if wep = "crystallaser" && curse = 1{
wep = "invcrystallaser"
  }
if bwep = "crystallaser" && bcurse = 1{
bwep = "invcrystallaser"
  }
}

//Popo Weapons
if GameCont.area = 106{
with(WepPickup){
if "poporoll" not in self && ammo = 1{
poporoll = 1
if irandom(2) = 0{
wep = choose("popocharger","popogenocide","popoexplosiongun","popobads","popoguider","popozapper","popospreader","popofireballer","poposcorcher","popoburstshotty")
   }
  }
 }
with(WeaponChest){
if distance_to_object(Player) < 20{
if "poporoll" not in self{
poporoll = 1
if irandom(3) != 0{
with instance_create(x,y,WepPickup){
wep = choose("popocharger","popogenocide","popoexplosiongun","popobads","popoguider","popozapper","popospreader","popofireballer","poposcorcher","popoburstshotty")
	}
sound_play(sndWeaponChest)
instance_destroy()
      }
    }
  }
}
}

if global.popoguns = 1{
with(WepPickup){
if "poporoll" not in self && ammo = 1{
poporoll = 1
if irandom(39) = 0{
wep = choose("popocharger","popogenocide","popoexplosiongun","popobads","popoguider","popozapper","popospreader","popofireballer","poposcorcher","popoburstshotty")
   }
  }
 }
with(WeaponChest){
if distance_to_object(Player) < 20{
if "poporoll" not in self{
poporoll = 1
if irandom(19) = 0{
with instance_create(x,y,WepPickup){
wep = choose("popocharger","popogenocide","popoexplosiongun","popobads","popoguider","popozapper","popospreader","popofireballer","poposcorcher","popoburstshotty")
	}
sound_play(sndWeaponChest)
instance_destroy()
      }
    }
  }
}
}
//Enterance
if(instance_exists(GenCont)){
	if(!global.gcecheck){
		global.gcecheck = 1;
		if GameCont.area = 106{
		global.popoguns = 1
		}
		if GameCont.area = 101 || GameCont.area = 102 || GameCont.area = 103 || GameCont.area = 104 || GameCont.area = 105{
		global.secrets += 1;
		if global.secrets < 2{
		sound_play_pitchvol(sndMenuCrown,3,0.7)
		}
		if global.secrets = 3{
		sound_play_pitchvol(sndMenuCrown,1.5,2)
		sound_play_pitchvol(sndCrownRandom,1,2)
		sound_play_pitchvol(sndStrongSpiritGain,1.6,2)
		}
		}
	}
}
else{ 
	if(global.gcecheck){
		global.gcecheck = 0;
		global.hatch = 0;
	}
}

if global.hatch = 0 && global.secrets >= 3{
if GameCont.area = 7 && GameCont.subarea = 1 && !instance_exists(GenCont){
with(instance_furthest(10016, 10016, Guardian)){
		global.hatch = 1;
		var _x = x
		var _y = y
		with(instance_create(_x, _y, CrownPed)) depth = 4;
		with(instance_create(_x, _y, CustomObject)){
			instance_create(x, y, PortalClear);
			on_step = script_ref_create(hatch_step);
			on_draw = script_ref_create(hatch_draw);
			Tele = 0;
			depth = -10;
			}
		}
	}
}

#define hatch_step
	with(Player) if distance_to_object(other) < 16 && button_pressed(index, "pick") && !instance_exists(Spiral){
		if other.Tele != 1 with(other){
			script_execute(hatch_time);
			Tele = 1;
		}
	}
		
#define hatch_draw
	if distance_to_object(Player) < 16{
			draw_set_halign(fa_center);
		draw_text_nt(x, y-32, "@gENTER");
		draw_set_halign(fa_left);
		draw_sprite(sprEPickup, 0, x, y-8);
		}
	
#define hatch_time
	with(instance_create(x, y, Portal)) type = 2;
	GameCont.area = "shrineroom";
	GameCont.subarea = 0;