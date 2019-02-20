
#define init
global.qualified = false;
global.alias = "";
global.seed = 7732;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
trace("Current Weekly:");
trace("Mods=Lots O' Muts, Bandit Cannon, Nuke Launcher, MS Paint Shader, NTT X10 Ver 1.0.1");
trace("Character=char_frog");
trace("Crown=crwn_curses");
trace("Weapon=wep_seeker_pistol");
trace("Seed=7732");
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
file_delete(string_trim("Lots O' Muts/Compressing Fist.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Compressing Fist.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Compressing Fist.skill.gml"), string_trim("Lots O' Muts/Compressing Fist.skill.gml"));
file_delete(string_trim("Lots O' Muts/Confidence.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Confidence.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Confidence.skill.gml"), string_trim("Lots O' Muts/Confidence.skill.gml"));
file_delete(string_trim("Lots O' Muts/Duplicators.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Duplicators.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Duplicators.skill.gml"), string_trim("Lots O' Muts/Duplicators.skill.gml"));
file_delete(string_trim("Lots O' Muts/Garment Regenerator.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Garment Regenerator.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Garment Regenerator.skill.gml"), string_trim("Lots O' Muts/Garment Regenerator.skill.gml"));
file_delete(string_trim("Lots O' Muts/Rocket Casings.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Rocket Casings.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Rocket Casings.skill.gml"), string_trim("Lots O' Muts/Rocket Casings.skill.gml"));
file_delete(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Sloppy Fingers.skill.gml"), string_trim("Lots O' Muts/Sloppy Fingers.skill.gml"));
file_delete(string_trim("Lots O' Muts/Steel Nerves.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Steel Nerves.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Steel Nerves.skill.gml"), string_trim("Lots O' Muts/Steel Nerves.skill.gml"));
file_delete(string_trim("Lots O' Muts/Unstable DNA.skill.gml"));while (file_exists(string_trim("Lots O' Muts/Unstable DNA.skill.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Lots O' Muts/Unstable DNA.skill.gml"), string_trim("Lots O' Muts/Unstable DNA.skill.gml"));
file_delete(string_trim("bcannon.wep.gml"));while (file_exists(string_trim("bcannon.wep.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bcannon.wep.gml"), string_trim("bcannon.wep.gml"));
file_delete(string_trim("nukelauncher.race.gml"));while (file_exists(string_trim("nukelauncher.race.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/nukelauncher.race.gml"), string_trim("nukelauncher.race.gml"));
file_delete(string_trim("ShdMSPaint.mod.gml"));while (file_exists(string_trim("ShdMSPaint.mod.gml"))) {wait 1;}file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ShdMSPaint.mod.gml"), string_trim("ShdMSPaint.mod.gml"));
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
wait(5);
wait(file_load(string_trim("Lots O' Muts/Compressing Fist.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Confidence.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Duplicators.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Garment Regenerator.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Rocket Casings.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Sloppy Fingers.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Steel Nerves.skill.gml")));
wait(file_load(string_trim("Lots O' Muts/Unstable DNA.skill.gml")));
wait(file_load(string_trim("bcannon.wep.gml")));
wait(file_load(string_trim("nukelauncher.race.gml")));
wait(file_load(string_trim("ShdMSPaint.mod.gml")));
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
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Compressing Fist.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Confidence.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Duplicators.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Garment Regenerator.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Rocket Casings.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Sloppy Fingers.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Steel Nerves.skill.gml"));
mod_load(string_trim("data/Weekly.mod/Lots O' Muts/Unstable DNA.skill.gml"));
mod_load(string_trim("data/Weekly.mod/bcannon.wep.gml"));
mod_load(string_trim("data/Weekly.mod/nukelauncher.race.gml"));
mod_load(string_trim("data/Weekly.mod/ShdMSPaint.mod.gml"));
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


#define step
if(global.qualified == true){
	var i = 0;
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
		wep = wep_seeker_pistol;
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
with(CharSelect){race=char_frog;}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:Lots O' Muts, Bandit Cannon, Nuke Launcher, MS Paint Shader, NTT X10 Ver 1.0.1" + " Character=char_frog" + " Crown=crwn_curses" + " Weapon=wep_seeker_pistol" + " Seed=7732";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-17 weekly.txt")){
		prevScores = string_load(global.alias + " 2019-02-17 weekly.txt");
		while(!file_loaded(global.alias + " 2019-02-17 weekly.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-17 weekly.txt");
	}else{
		string_save(score, global.alias + " 2019-02-17 weekly.txt");
	}
}
#define draw_pause
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
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
random_set_seed(global.seed);
global.start = true;
with(GameCont){
	crown = crwn_curses;
}

