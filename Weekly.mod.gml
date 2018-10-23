#define init
trace("Current Weekly:#Mods=Compressing Fist#Character=Fish#Crown=Blood#Weapon=Shotgun");
global.seed = 0;
while(!mod_sideload()){wait 1;}
global.modNum = 1;
global.start = true;
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
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Compressing Fist.skill.gml", "Compressing Fist.skill.gml");
while (!file_loaded("Compressing Fist.skill.gml")) {wait 1;}
mod_load("data/Weekly.mod/Compressing Fist.skill.gml");

#define step
//Anti-Cheat
/*var i = 0;
repeat(4){
	if(button_check(i, "talk")){
		mod_unload(mod_current);
	}
	i++
}*/
if(global.start){
	with(Player){
		wep = 5;
		ammo[0] = 0;
		ammo[1] = 0;
		ammo[2] = 0;
		ammo[3] = 0;
		ammo[4] = 0;
		ammo[5] = 0;
		if(fork()){while(instance_exists(GenCont)){wait 1;}repeat(3){instance_create(x,y,AmmoPickup)}exit;}
	}
	global.start = false;
}
with(CharSelect){race="fish";}
#define draw_pause
//Anti-Cheat
/*var i = 0;
repeat(4){
	if(button_check(i, "talk")){
		mod_unload(mod_current);
	}
	i++
}*/
#define game_start
game_set_seed(global.seed);
global.start = true;
with(GameCont){
	crown = crwn_blood;
}
#define cleanup
file_delete("Weeklies/Weekly.mod.gml");