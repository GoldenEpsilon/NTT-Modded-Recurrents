#define init
trace("Current Weekly:#Mods=Compressing Fist#Character=Fish#Crown=Blood#Weapon=Shotgun");
global.seed = 0;
while(!mod_sideload()){wait 1;}
global.modNum = 1;
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
with(Player){
	if(button_check(index, "talk")){
		mod_unload(mod_current);
	}
}
with(CharSelect){race="fish";}
#define draw_pause
var i = 0;
repeat(4){
	if(button_check(i, "talk")){
		mod_unload(mod_current);
	}
	i++
}
#define game_start
game_set_seed(global.seed);
with(Player){
	wep = wep_shotgun;
	bwep = wep_none;
}
with(GameCont){
	crown = crwn_blood;
}
#define cleanup
file_delete("Weeklies/Weekly.mod.gml");