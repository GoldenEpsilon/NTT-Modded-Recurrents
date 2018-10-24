
#define init
trace("
Current Weekly:
Mods=Chaos Guns, Bloom Shader, Paper Mario, Level Balls, MS Paint Shader
Character=char_fish
Crown=crwn_curses
Weapon=wep_super_flak_cannon
Seed=15754");
global.qualified = false;
global.alias = "";
global.seed = 15754;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
global.qualified = true;
global.alias = "";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("DON'T MAKE ME TURN ANTI-CHEAT ON");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("DON'T MAKE ME TURN ANTI-CHEAT ON");
	}
}
var i = 0;
for(i = 0; array_length(mod_get_names("mod")) > 1; i=i){
	if(mod_get_names("mod")[i] != mod_current){mod_unload(mod_get_names("mod")[i]);}
}
for(i = 0; array_length(mod_get_names("weapon")) > 0; i=i){
	mod_unload(mod_get_names("weapon")[i]);
}
for(i = 0; array_length(mod_get_names("area")) > 0; i=i){
	mod_unload(mod_get_names("area")[i]);
}
for(i = 0; array_length(mod_get_names("crown")) > 0; i=i){
	mod_unload(mod_get_names("crown")[i]);
}
for(i = 0; array_length(mod_get_names("race")) > 0; i=i){
	mod_unload(mod_get_names("race")[i]);
}
for(i = 0; array_length(mod_get_names("skill")) > 0; i=i){
	mod_unload(mod_get_names("skill")[i]);
}
for(i = 0; array_length(mod_get_names("skin")) > 0; i=i){
	mod_unload(mod_get_names("skin")[i]);
}
file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Chaos Guns/Blunderbuss.wep.gml"), string_trim("Chaos Guns/Blunderbuss.wep.gml"));
file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Chaos Guns/Super Blunderbuss.wep.gml"), string_trim("Chaos Guns/Super Blunderbuss.wep.gml"));
file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Chaos Guns/Chaos Minigun.wep.gml"), string_trim("Chaos Guns/Chaos Minigun.wep.gml"));
file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Chaos Guns/Super Chaos Minigun.wep.gml"), string_trim("Chaos Guns/Super Chaos Minigun.wep.gml"));
file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Chaos Guns/Hyper Chaos Minigun.wep.gml"), string_trim("Chaos Guns/Hyper Chaos Minigun.wep.gml"));
while (!file_loaded(string_trim("Chaos Guns/Blunderbuss.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Chaos Guns/Super Blunderbuss.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Chaos Guns/Chaos Minigun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Chaos Guns/Super Chaos Minigun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Chaos Guns/Hyper Chaos Minigun.wep.gml"))) {wait 1;}
mod_load(string_trim("data/Weekly.mod/Chaos Guns/Blunderbuss.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Chaos Guns/Super Blunderbuss.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Chaos Guns/Chaos Minigun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Chaos Guns/Super Chaos Minigun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Chaos Guns/Hyper Chaos Minigun.wep.gml"));


#define step
if(global.qualified == true){
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("DON'T MAKE ME TURN ANTI-CHEAT ON");
		}
		i++
	}
}
if(global.start){
	global.alias = "";
	with(Player){
		wep = wep_super_flak_cannon;
		ammo[0] = 0;
		ammo[1] = 0;
		ammo[2] = 0;
		ammo[3] = 0;
		ammo[4] = 0;
		ammo[5] = 0;
		if(fork()){while(instance_exists(GenCont)){wait 1;}repeat(3){instance_create(x,y,AmmoPickup)}exit;}
		if(global.alias != ""){
			global.alias += ", "
		}
		global.alias += alias;
	}
	global.start = false;
}
with(CharSelect){race=char_fish;}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills);
	}
	trace(score);
	global.finished = true;
	string_save(score, global.alias + " " + 2018-10-23 + " weekly.txt");
}
#define draw_pause
//Anti-Cheat
var i = 0;
if(global.qualified == true){
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("DON'T MAKE ME TURN ANTI-CHEAT ON");
		}
		i++
	}
}
#define game_start
global.finished = false;
game_set_seed(global.seed);
global.start = true;
with(GameCont){
	crown = crwn_curses;
}

