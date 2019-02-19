
#define init
global.qualified = false;
global.alias = "";
global.seed = 22905;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
trace("Current Weekly:");
trace("Mods=NTT X10 Ver 1.0.1, Lots O' Muts, Bandit Cannon, MS Paint Shader, Paper Mario");
trace("Character=char_venuz");
trace("Crown=crwn_curses");
trace("Weapon=wep_wrench");
trace("Seed=22905");
global.qualified = true;
global.alias = "";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again.");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again.");
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
file_delete(string_trim("NTT X10 Ver. 1.0.1/backmusclex10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/backmusclex10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/backmusclex10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/backmusclex10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/bossx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/bossx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/bossx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/bossx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/copx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/copx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/copx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/copx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/crystalx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/crystalx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/crystalx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/crystalx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/euphoriax10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/euphoriax10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/euphoriax10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/euphoriax10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/lastwishx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/lastwishx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/lastwishx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/lastwishx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/longarmsx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/longarmsx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/longarmsx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/longarmsx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/loophpx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/loophpx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/loophpx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/loophpx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/openmindx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/openmindx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/openmindx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/openmindx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/partytruckx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/partytruckx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/partytruckx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/partytruckx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/spsx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/spsx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/spsx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/spsx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/stressx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/stressx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/stressx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/stressx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml"), string_trim("NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/ultrax10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/ultrax10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/ultrax10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/ultrax10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/venuzx10.mod.gml"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/venuzx10.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/venuzx10.mod.gml"), string_trim("NTT X10 Ver. 1.0.1/venuzx10.mod.gml"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/scrSwapWep"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/scrSwapWep"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/scrSwapWep"), string_trim("NTT X10 Ver. 1.0.1/scrSwapWep"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprAmmoIcons.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprAmmoIcons.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprAmmoIcons.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprAmmoIcons.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_1.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_1.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_1.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_1.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_2.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_2.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_2.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_2.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_3.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_3.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_3.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_3.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_4.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_4.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_4.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_4.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_5.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_5.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_5.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_5.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_6.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_6.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_6.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_6.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_7.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_7.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_7.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_7.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_8.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_8.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_8.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_8.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_9.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_9.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_9.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_9.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_10.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_10.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_10.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_10.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_11.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_11.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_11.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_11.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_12.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_12.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_12.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_12.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_13.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_13.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_13.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_13.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_14.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_14.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_14.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_14.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_15.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_15.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_15.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_15.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_16.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_16.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_16.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_16.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_17.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_17.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_17.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_17.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_18.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_18.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_18.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_18.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_19.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_19.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_19.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_19.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_20.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_20.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_20.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_20.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_21.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_21.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_21.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_21.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_22.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_22.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_22.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_22.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_23.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_23.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_23.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_23.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_24.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_24.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_24.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_24.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_25.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_25.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_25.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_25.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_26.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_26.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_26.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_26.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_27.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_27.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_27.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_27.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_28.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_28.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_28.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_28.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"));
file_delete(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"));while (file_exists(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"), string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png"));
file_delete(string_trim("Lots O' Muts/Compressing Fist.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Compressing Fist.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Compressing Fist.skill.gml"), string_trim("Lots O' Muts/Compressing Fist.skill.gml"));
file_delete(string_trim("Lots O' Muts/Confidence.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Confidence.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Confidence.skill.gml"), string_trim("Lots O' Muts/Confidence.skill.gml"));
file_delete(string_trim("Lots O' Muts/Duplicators.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Duplicators.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Duplicators.skill.gml"), string_trim("Lots O' Muts/Duplicators.skill.gml"));
file_delete(string_trim("Lots O' Muts/Garment Regenerator.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Garment Regenerator.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Garment Regenerator.skill.gml"), string_trim("Lots O' Muts/Garment Regenerator.skill.gml"));
file_delete(string_trim("Lots O' Muts/Rocket Casings.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Rocket Casings.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Rocket Casings.skill.gml"), string_trim("Lots O' Muts/Rocket Casings.skill.gml"));
file_delete(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Sloppy Fingers.skill.gml"), string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"));
file_delete(string_trim("Lots O' Muts/Steel Nerves.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Steel Nerves.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Steel Nerves.skill.gml"), string_trim("Lots O' Muts/Steel Nerves.skill.gml"));
file_delete(string_trim("Lots O' Muts/Unstable DNA.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Unstable DNA.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Unstable DNA.skill.gml"), string_trim("Lots O' Muts/Unstable DNA.skill.gml"));
file_delete(string_trim("bcannon.wep.gml"));while (file_exists(string_trim("bcannon.wep.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bcannon.wep.gml"), string_trim("bcannon.wep.gml"));
file_delete(string_trim("ShdMSPaint.mod.gml"));while (file_exists(string_trim("ShdMSPaint.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ShdMSPaint.mod.gml"), string_trim("ShdMSPaint.mod.gml"));
file_delete(string_trim("papermario.mod.gml"));while (file_exists(string_trim("papermario.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/papermario.mod.gml"), string_trim("papermario.mod.gml"));
wait(5);
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/backmusclex10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/bossx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/copx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/crystalx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/euphoriax10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/lastwishx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/longarmsx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/loophpx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/openmindx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/partytruckx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/spsx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/stressx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/ultrax10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/venuzx10.mod.gml")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/scrSwapWep")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprAmmoIcons.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_1.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_2.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_3.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_4.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_5.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_6.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_7.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_8.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_9.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_10.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_11.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_12.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_13.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_14.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_15.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_16.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_17.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_18.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_19.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_20.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_21.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_22.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_23.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_24.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_25.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_26.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_27.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_28.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png")));
wait(file_load(string_trim("NTT X10 Ver. 1.0.1/MutationHUD/sprSkillIconHUD_29.png")));
wait(file_load(string_trim("Lots O' Muts/Compressing Fist.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Confidence.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Duplicators.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Garment Regenerator.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Rocket Casings.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Steel Nerves.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Unstable DNA.skill.gml")));
wait(file_load(string_trim("bcannon.wep.gml")));
wait(file_load(string_trim("ShdMSPaint.mod.gml")));
wait(file_load(string_trim("papermario.mod.gml")));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/backmusclex10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/bloodlustx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/boilingveinsx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/boilingveinsx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/boltmarrowx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/bossx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/copx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/crystalx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/eagleeyesx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/euphoriax10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/extrafeetx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/gammagutsx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/hammerheadx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/heavyheartx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/impactwristsx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/laserbrainx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/lastwishx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/longarmsx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/loophpx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/luckyshotx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/openmindx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/partytruckx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/plutoniumhungerx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/rabbitpawx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/recycleglandx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/rhinoskinx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/scarierfacex10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/secondstomachx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/sharpteethx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/shotgunshouldersx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/spsx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/stressx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/strongspiritx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/thronebuttx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/triggerfingersx10.skill.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/ultrax10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/utilitiesx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/NTT X10 Ver. 1.0.1/venuzx10.mod.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Compressing Fist.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Confidence.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Duplicators.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Garment Regenerator.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Rocket Casings.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Sloppy Fingers.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Steel Nerves.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Unstable DNA.skill.gml"));
mod_load(string_trim("data/Weekly.mod/bcannon.wep.gml"));
mod_load(string_trim("data/Weekly.mod/ShdMSPaint.mod.gml"));
mod_load(string_trim("data/Weekly.mod/papermario.mod.gml"));


#define step
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again.");
		}
		i++
	}
}
if(global.start){
	global.alias = "";
	with(Player){
		wep = wep_wrench;
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
with(CharSelect){race=char_venuz;}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:NTT X10 Ver 1.0.1, Lots O' Muts, Bandit Cannon, MS Paint Shader, Paper Mario" + " Character=char_venuz" + " Crown=crwn_curses" + " Weapon=wep_wrench" + " Seed=22905";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-19 weekly.txt")){
		prevScores = string_load(global.alias + " 2019-02-19 weekly.txt");
		while(!file_loaded(global.alias + " 2019-02-19 weekly.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-19 weekly.txt");
	}else{
		string_save(score, global.alias + " 2019-02-19 weekly.txt");
	}
	if(global.qualified){
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/leaderboards/2019-02-19 weekly.txt", "dl.txt");
		while (!file_loaded("dl.txt")) {wait 1;}
		leaderboard = string_load("dl.txt");
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 332d41ff727ad978568"+"da5708b685138ac544244");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		if(string_copy(leaderboard, 0, 4) == "404:"){
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/2019-02-19 weekly.txt'
		, "PUT", headers,
		'{
		"message":"Leaderboard Update",
		"content":"'+base64(string_split(score, "Mods:")[0])+'"
		}'
		, "out.txt");
	}else{
		file_delete("sha.txt");
		while (file_exists("sha.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/2019-02-19 weekly.txt'
		, "GET", headers,
		''
		, "sha.txt");
		while (!file_loaded("sha.txt")) {wait 1;}
		sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/2019-02-19 weekly.txt'
		, "PUT", headers,
		'{
		"message":"Leaderboard Update",
		"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
		"sha":"'+sha+'"
		}'
		, "out.txt");
	}
	}
}
#define draw_pause
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again.");
		}
		i++
	}
}
#define game_start
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(GameCont){
	crown = crwn_curses;
}
#define base64(str)
var retVal = "";
for(var i = 0; i < string_length(str)/3; i++){
	if(string_length(str)/3-i>=1){
		ord1 = string_ord_at(str, i*3+1);
		ord2 = string_ord_at(str, (i*3)+2);
		ord3 = string_ord_at(str, (i*3)+3);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16+(ord2&240)/16);
		char3 = base64Char((ord2&15)*4+(ord3&192)/64);
		char4 = base64Char(ord3&63);
		retVal += string(char1)+string(char2)+string(char3)+string(char4);
	}else if(string_length(str) - i*3 == 2){
		ord1 = string_ord_at(str, i*3+1);
		ord2 = string_ord_at(str, (i*3)+2);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16+(ord2&240)/16);
		char3 = base64Char((ord2&15)*4);
		retVal += string(char1)+string(char2)+string(char3)+"=";
	}else if(string_length(str) - i*3 == 1){
		ord1 = string_ord_at(str, i*3+1);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16);
		retVal += string(char1)+string(char2)+"==";
	}
}
return retVal;
#define base64Char(num)
var retVal = "=";
switch(num){
	case 0:retVal = "A";break;
	case 1:retVal = "B";break;
	case 2:retVal = "C";break;
	case 3:retVal = "D";break;
	case 4:retVal = "E";break;
	case 5:retVal = "F";break;
	case 6:retVal = "G";break;
	case 7:retVal = "H";break;
	case 8:retVal = "I";break;
	case 9:retVal = "J";break;
	case 10:retVal = "K";break;
	case 11:retVal = "L";break;
	case 12:retVal = "M";break;
	case 13:retVal = "N";break;
	case 14:retVal = "O";break;
	case 15:retVal = "P";break;
	case 16:retVal = "Q";break;
	case 17:retVal = "R";break;
	case 18:retVal = "S";break;
	case 19:retVal = "T";break;
	case 20:retVal = "U";break;
	case 21:retVal = "V";break;
	case 22:retVal = "W";break;
	case 23:retVal = "X";break;
	case 24:retVal = "Y";break;
	case 25:retVal = "Z";break;
	case 26:retVal = "a";break;
	case 27:retVal = "b";break;
	case 28:retVal = "c";break;
	case 29:retVal = "d";break;
	case 30:retVal = "e";break;
	case 31:retVal = "f";break;
	case 32:retVal = "g";break;
	case 33:retVal = "h";break;
	case 34:retVal = "i";break;
	case 35:retVal = "j";break;
	case 36:retVal = "k";break;
	case 37:retVal = "l";break;
	case 38:retVal = "m";break;
	case 39:retVal = "n";break;
	case 40:retVal = "o";break;
	case 41:retVal = "p";break;
	case 42:retVal = "q";break;
	case 43:retVal = "r";break;
	case 44:retVal = "s";break;
	case 45:retVal = "t";break;
	case 46:retVal = "u";break;
	case 47:retVal = "v";break;
	case 48:retVal = "w";break;
	case 49:retVal = "x";break;
	case 50:retVal = "y";break;
	case 51:retVal = "z";break;
	case 52:retVal = "0";break;
	case 53:retVal = "1";break;
	case 54:retVal = "2";break;
	case 55:retVal = "3";break;
	case 56:retVal = "4";break;
	case 57:retVal = "5";break;
	case 58:retVal = "6";break;
	case 59:retVal = "7";break;
	case 60:retVal = "8";break;
	case 61:retVal = "9";break;
	case 62:retVal = "+";break;
	case 63:retVal = "/";break;
}
return retVal;

