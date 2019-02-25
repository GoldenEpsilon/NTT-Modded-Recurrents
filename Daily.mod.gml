
/*@rMods@w=#  2 Hour Area#  Afterburn#  BL2#  bosshudredux#  Bioluminary Oscillator#@bCharacter@w=#  Choose#@yCrown@w=#  crown of blood#@gWeapon@w=#  blood launcher#@pSeed@w=15053#Limited Tries:false*/
/*#2 Hour Area[...Just play it.]#Afterburn[Buffs Flames]*/
#define init
#macro DailyScoreboardX 155
#macro DailyScoreboardY 36
#macro DailyScoreboardW 165
#macro DailyScoreboardH 83
#macro DailyCurrentX 0
#macro DailyCurrentY 36
#macro DailyCurrentW 2
#macro DailyCurrentH 8
#macro DailyCurrentLH 6.6
#macro DailyCurrentLW 4.4
#macro ChooseCharacter true
#macro ChooseCrown false
#macro LimitedTries false
global.menu = 0;
global.leaderboard="";
global.leaderboardLoaded = 0;
global.leaderboardPos = 0;
global.Daily = "";
global.DailyHeight = 0;
global.DailyWidth = 0;
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 15053;
global.start = true;
global.finished = false;
global.ModNames = "";
while(!mod_sideload()){wait 1;}
global.qualified = true;
global.alias = "";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
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
file_delete(string_trim("2 hour area/2hours.area.gml"));while (file_exists(string_trim("2 hour area/2hours.area.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/2hours.area.gml"), string_trim("2 hour area/2hours.area.gml")));
file_delete(string_trim("2 hour area/gfx/sprArrow.png"));while (file_exists(string_trim("2 hour area/gfx/sprArrow.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprArrow.png"), string_trim("2 hour area/gfx/sprArrow.png")));
file_delete(string_trim("2 hour area/gfx/sprBow.png"));while (file_exists(string_trim("2 hour area/gfx/sprBow.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprBow.png"), string_trim("2 hour area/gfx/sprBow.png")));
file_delete(string_trim("2 hour area/gfx/sprClouds.png"));while (file_exists(string_trim("2 hour area/gfx/sprClouds.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprClouds.png"), string_trim("2 hour area/gfx/sprClouds.png")));
file_delete(string_trim("2 hour area/gfx/sprDebris.png"));while (file_exists(string_trim("2 hour area/gfx/sprDebris.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprDebris.png"), string_trim("2 hour area/gfx/sprDebris.png")));
file_delete(string_trim("2 hour area/gfx/sprDecoration.png"));while (file_exists(string_trim("2 hour area/gfx/sprDecoration.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprDecoration.png"), string_trim("2 hour area/gfx/sprDecoration.png")));
file_delete(string_trim("2 hour area/gfx/sprFloor.png"));while (file_exists(string_trim("2 hour area/gfx/sprFloor.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloor.png"), string_trim("2 hour area/gfx/sprFloor.png")));
file_delete(string_trim("2 hour area/gfx/sprFloorB.png"));while (file_exists(string_trim("2 hour area/gfx/sprFloorB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloorB.png"), string_trim("2 hour area/gfx/sprFloorB.png")));
file_delete(string_trim("2 hour area/gfx/sprFloorExplo.png"));while (file_exists(string_trim("2 hour area/gfx/sprFloorExplo.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloorExplo.png"), string_trim("2 hour area/gfx/sprFloorExplo.png")));
file_delete(string_trim("2 hour area/gfx/sprSpiderHurt.png"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderHurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderHurt.png"), string_trim("2 hour area/gfx/sprSpiderHurt.png")));
file_delete(string_trim("2 hour area/gfx/sprSpiderIdle.png"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderIdle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderIdle.png"), string_trim("2 hour area/gfx/sprSpiderIdle.png")));
file_delete(string_trim("2 hour area/gfx/sprSpiderWalk.png"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderWalk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderWalk.png"), string_trim("2 hour area/gfx/sprSpiderWalk.png")));
file_delete(string_trim("2 hour area/gfx/sprTreeBot.png"));while (file_exists(string_trim("2 hour area/gfx/sprTreeBot.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreeBot.png"), string_trim("2 hour area/gfx/sprTreeBot.png")));
file_delete(string_trim("2 hour area/gfx/sprTreetop.pdn"));while (file_exists(string_trim("2 hour area/gfx/sprTreetop.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreetop.pdn"), string_trim("2 hour area/gfx/sprTreetop.pdn")));
file_delete(string_trim("2 hour area/gfx/sprTreetop.png"));while (file_exists(string_trim("2 hour area/gfx/sprTreetop.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreetop.png"), string_trim("2 hour area/gfx/sprTreetop.png")));
file_delete(string_trim("2 hour area/gfx/sprWallBot.png"));while (file_exists(string_trim("2 hour area/gfx/sprWallBot.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallBot.png"), string_trim("2 hour area/gfx/sprWallBot.png")));
file_delete(string_trim("2 hour area/gfx/sprWallTop.png"));while (file_exists(string_trim("2 hour area/gfx/sprWallTop.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallTop.png"), string_trim("2 hour area/gfx/sprWallTop.png")));
file_delete(string_trim("2 hour area/gfx/sprWallTrans.png"));while (file_exists(string_trim("2 hour area/gfx/sprWallTrans.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallTrans.png"), string_trim("2 hour area/gfx/sprWallTrans.png")));
file_delete(string_trim("2 hour area/gfx/sprZombieHurt.png"));while (file_exists(string_trim("2 hour area/gfx/sprZombieHurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieHurt.png"), string_trim("2 hour area/gfx/sprZombieHurt.png")));
file_delete(string_trim("2 hour area/gfx/sprZombieIdle.png"));while (file_exists(string_trim("2 hour area/gfx/sprZombieIdle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieIdle.png"), string_trim("2 hour area/gfx/sprZombieIdle.png")));
file_delete(string_trim("2 hour area/gfx/sprZombieWalk.png"));while (file_exists(string_trim("2 hour area/gfx/sprZombieWalk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieWalk.png"), string_trim("2 hour area/gfx/sprZombieWalk.png")));
file_delete(string_trim("afterburn.mod.gml"));while (file_exists(string_trim("afterburn.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/afterburn.mod.gml"), string_trim("afterburn.mod.gml")));
file_delete(string_trim("BL2/bigweaponchest.mod.gml"));while (file_exists(string_trim("BL2/bigweaponchest.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/bigweaponchest.mod.gml"), string_trim("BL2/bigweaponchest.mod.gml")));
file_delete(string_trim("BL2/gamblechest.mod.gml"));while (file_exists(string_trim("BL2/gamblechest.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/gamblechest.mod.gml"), string_trim("BL2/gamblechest.mod.gml")));
file_delete(string_trim("BL2/idpdgamblechest.mod.gml"));while (file_exists(string_trim("BL2/idpdgamblechest.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/idpdgamblechest.mod.gml"), string_trim("BL2/idpdgamblechest.mod.gml")));
file_delete(string_trim("BL2/pgw.mod.gml"));while (file_exists(string_trim("BL2/pgw.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/pgw.mod.gml"), string_trim("BL2/pgw.mod.gml")));
file_delete(string_trim("BL2/procwep.wep.gml"));while (file_exists(string_trim("BL2/procwep.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/procwep.wep.gml"), string_trim("BL2/procwep.wep.gml")));
file_delete(string_trim("BL2/reloadindicator.mod.gml"));while (file_exists(string_trim("BL2/reloadindicator.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/reloadindicator.mod.gml"), string_trim("BL2/reloadindicator.mod.gml")));
file_delete(string_trim("BL2/sharedammo.mod.gml"));while (file_exists(string_trim("BL2/sharedammo.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/sharedammo.mod.gml"), string_trim("BL2/sharedammo.mod.gml")));
file_delete(string_trim("BL2/mods/pgw_bl2.mod.gml"));while (file_exists(string_trim("BL2/mods/pgw_bl2.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/pgw_bl2.mod.gml"), string_trim("BL2/mods/pgw_bl2.mod.gml")));
file_delete(string_trim("BL2/mods/pgw_idpd.mod.gml"));while (file_exists(string_trim("BL2/mods/pgw_idpd.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/pgw_idpd.mod.gml"), string_trim("BL2/mods/pgw_idpd.mod.gml")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ref.pdn"), string_trim("BL2/mods/res/bl2/ban/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/bod0.png"), string_trim("BL2/mods/res/bl2/ban/ar/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/bod1.png"), string_trim("BL2/mods/res/bl2/ban/ar/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/han0.png"), string_trim("BL2/mods/res/bl2/ban/ar/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/han1.png"), string_trim("BL2/mods/res/bl2/ban/ar/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/muz0.png"), string_trim("BL2/mods/res/bl2/ban/ar/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/ar/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/ar/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/ar/muz1.png"), string_trim("BL2/mods/res/bl2/ban/ar/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/bod0.png"), string_trim("BL2/mods/res/bl2/ban/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/bod1.png"), string_trim("BL2/mods/res/bl2/ban/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/han0.png"), string_trim("BL2/mods/res/bl2/ban/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/han1.png"), string_trim("BL2/mods/res/bl2/ban/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/muz0.png"), string_trim("BL2/mods/res/bl2/ban/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/pis/muz1.png"), string_trim("BL2/mods/res/bl2/ban/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/bod0.png"), string_trim("BL2/mods/res/bl2/ban/rl/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/bod1.png"), string_trim("BL2/mods/res/bl2/ban/rl/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/han0.png"), string_trim("BL2/mods/res/bl2/ban/rl/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/han1.png"), string_trim("BL2/mods/res/bl2/ban/rl/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/muz0.png"), string_trim("BL2/mods/res/bl2/ban/rl/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/rl/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/rl/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/rl/muz1.png"), string_trim("BL2/mods/res/bl2/ban/rl/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/bod0.png"), string_trim("BL2/mods/res/bl2/ban/shot/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/bod1.png"), string_trim("BL2/mods/res/bl2/ban/shot/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/han0.png"), string_trim("BL2/mods/res/bl2/ban/shot/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/han1.png"), string_trim("BL2/mods/res/bl2/ban/shot/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/muz0.png"), string_trim("BL2/mods/res/bl2/ban/shot/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/shot/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/shot/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/shot/muz1.png"), string_trim("BL2/mods/res/bl2/ban/shot/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/bod0.png"), string_trim("BL2/mods/res/bl2/ban/smg/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/bod1.png"), string_trim("BL2/mods/res/bl2/ban/smg/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/han0.png"), string_trim("BL2/mods/res/bl2/ban/smg/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/han1.png"), string_trim("BL2/mods/res/bl2/ban/smg/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/muz0.png"), string_trim("BL2/mods/res/bl2/ban/smg/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ban/smg/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ban/smg/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ban/smg/muz1.png"), string_trim("BL2/mods/res/bl2/ban/smg/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ref.pdn"), string_trim("BL2/mods/res/bl2/dah/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/bod0.png"), string_trim("BL2/mods/res/bl2/dah/ar/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/bod1.png"), string_trim("BL2/mods/res/bl2/dah/ar/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/han0.png"), string_trim("BL2/mods/res/bl2/dah/ar/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/han1.png"), string_trim("BL2/mods/res/bl2/dah/ar/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/muz0.png"), string_trim("BL2/mods/res/bl2/dah/ar/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/ar/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/ar/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/ar/muz1.png"), string_trim("BL2/mods/res/bl2/dah/ar/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/bod0.png"), string_trim("BL2/mods/res/bl2/dah/lsr/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/bod1.png"), string_trim("BL2/mods/res/bl2/dah/lsr/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/han0.png"), string_trim("BL2/mods/res/bl2/dah/lsr/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/han1.png"), string_trim("BL2/mods/res/bl2/dah/lsr/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/muz0.png"), string_trim("BL2/mods/res/bl2/dah/lsr/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/lsr/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/lsr/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/lsr/muz1.png"), string_trim("BL2/mods/res/bl2/dah/lsr/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/bod0.png"), string_trim("BL2/mods/res/bl2/dah/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/bod1.png"), string_trim("BL2/mods/res/bl2/dah/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/han0.png"), string_trim("BL2/mods/res/bl2/dah/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/han1.png"), string_trim("BL2/mods/res/bl2/dah/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/muz0.png"), string_trim("BL2/mods/res/bl2/dah/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/pis/muz1.png"), string_trim("BL2/mods/res/bl2/dah/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/bod0.png"), string_trim("BL2/mods/res/bl2/dah/smg/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/bod1.png"), string_trim("BL2/mods/res/bl2/dah/smg/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/han0.png"), string_trim("BL2/mods/res/bl2/dah/smg/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/han1.png"), string_trim("BL2/mods/res/bl2/dah/smg/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/muz0.png"), string_trim("BL2/mods/res/bl2/dah/smg/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/smg/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/smg/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/smg/muz1.png"), string_trim("BL2/mods/res/bl2/dah/smg/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/bod0.png"), string_trim("BL2/mods/res/bl2/dah/sni/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/bod1.png"), string_trim("BL2/mods/res/bl2/dah/sni/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/han0.png"), string_trim("BL2/mods/res/bl2/dah/sni/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/han1.png"), string_trim("BL2/mods/res/bl2/dah/sni/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/muz0.png"), string_trim("BL2/mods/res/bl2/dah/sni/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/dah/sni/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/dah/sni/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/dah/sni/muz1.png"), string_trim("BL2/mods/res/bl2/dah/sni/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/ref.pdn"), string_trim("BL2/mods/res/bl2/hyp/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/bod0.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/bod1.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/han0.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/han1.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/muz0.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/lsr/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/lsr/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/lsr/muz1.png"), string_trim("BL2/mods/res/bl2/hyp/lsr/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/bod0.png"), string_trim("BL2/mods/res/bl2/hyp/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/bod1.png"), string_trim("BL2/mods/res/bl2/hyp/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/han0.png"), string_trim("BL2/mods/res/bl2/hyp/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/han1.png"), string_trim("BL2/mods/res/bl2/hyp/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/muz0.png"), string_trim("BL2/mods/res/bl2/hyp/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/pis/muz1.png"), string_trim("BL2/mods/res/bl2/hyp/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/bod0.png"), string_trim("BL2/mods/res/bl2/hyp/shot/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/bod1.png"), string_trim("BL2/mods/res/bl2/hyp/shot/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/han0.png"), string_trim("BL2/mods/res/bl2/hyp/shot/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/han1.png"), string_trim("BL2/mods/res/bl2/hyp/shot/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/muz0.png"), string_trim("BL2/mods/res/bl2/hyp/shot/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/shot/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/shot/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/shot/muz1.png"), string_trim("BL2/mods/res/bl2/hyp/shot/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/bod0.png"), string_trim("BL2/mods/res/bl2/hyp/smg/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/bod1.png"), string_trim("BL2/mods/res/bl2/hyp/smg/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/han0.png"), string_trim("BL2/mods/res/bl2/hyp/smg/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/han1.png"), string_trim("BL2/mods/res/bl2/hyp/smg/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/muz0.png"), string_trim("BL2/mods/res/bl2/hyp/smg/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/smg/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/smg/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/smg/muz1.png"), string_trim("BL2/mods/res/bl2/hyp/smg/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/bod0.png"), string_trim("BL2/mods/res/bl2/hyp/sni/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/bod1.png"), string_trim("BL2/mods/res/bl2/hyp/sni/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/han0.png"), string_trim("BL2/mods/res/bl2/hyp/sni/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/han1.png"), string_trim("BL2/mods/res/bl2/hyp/sni/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/muz0.png"), string_trim("BL2/mods/res/bl2/hyp/sni/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/hyp/sni/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/hyp/sni/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/hyp/sni/muz1.png"), string_trim("BL2/mods/res/bl2/hyp/sni/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ref.pdn"), string_trim("BL2/mods/res/bl2/jak/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/bod0.png"), string_trim("BL2/mods/res/bl2/jak/ar/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/bod1.png"), string_trim("BL2/mods/res/bl2/jak/ar/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/han0.png"), string_trim("BL2/mods/res/bl2/jak/ar/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/han1.png"), string_trim("BL2/mods/res/bl2/jak/ar/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/muz0.png"), string_trim("BL2/mods/res/bl2/jak/ar/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/ar/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/ar/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/ar/muz1.png"), string_trim("BL2/mods/res/bl2/jak/ar/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/bod0.png"), string_trim("BL2/mods/res/bl2/jak/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/bod1.png"), string_trim("BL2/mods/res/bl2/jak/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/han0.png"), string_trim("BL2/mods/res/bl2/jak/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/han1.png"), string_trim("BL2/mods/res/bl2/jak/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/muz0.png"), string_trim("BL2/mods/res/bl2/jak/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/pis/muz1.png"), string_trim("BL2/mods/res/bl2/jak/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/bod0.png"), string_trim("BL2/mods/res/bl2/jak/shot/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/bod1.png"), string_trim("BL2/mods/res/bl2/jak/shot/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/han0.png"), string_trim("BL2/mods/res/bl2/jak/shot/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/han1.png"), string_trim("BL2/mods/res/bl2/jak/shot/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/muz0.png"), string_trim("BL2/mods/res/bl2/jak/shot/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/shot/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/shot/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/shot/muz1.png"), string_trim("BL2/mods/res/bl2/jak/shot/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/bod0.png"), string_trim("BL2/mods/res/bl2/jak/sni/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/bod1.png"), string_trim("BL2/mods/res/bl2/jak/sni/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/han0.png"), string_trim("BL2/mods/res/bl2/jak/sni/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/han1.png"), string_trim("BL2/mods/res/bl2/jak/sni/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/muz0.png"), string_trim("BL2/mods/res/bl2/jak/sni/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/jak/sni/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/jak/sni/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/jak/sni/muz1.png"), string_trim("BL2/mods/res/bl2/jak/sni/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/ref.pdn"), string_trim("BL2/mods/res/bl2/mal/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/bod0.png"), string_trim("BL2/mods/res/bl2/mal/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/bod1.png"), string_trim("BL2/mods/res/bl2/mal/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/han0.png"), string_trim("BL2/mods/res/bl2/mal/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/han1.png"), string_trim("BL2/mods/res/bl2/mal/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/muz0.png"), string_trim("BL2/mods/res/bl2/mal/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/pis/muz1.png"), string_trim("BL2/mods/res/bl2/mal/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/bod0.png"), string_trim("BL2/mods/res/bl2/mal/rl/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/bod1.png"), string_trim("BL2/mods/res/bl2/mal/rl/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/han0.png"), string_trim("BL2/mods/res/bl2/mal/rl/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/han1.png"), string_trim("BL2/mods/res/bl2/mal/rl/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/muz0.png"), string_trim("BL2/mods/res/bl2/mal/rl/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/rl/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/rl/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/rl/muz1.png"), string_trim("BL2/mods/res/bl2/mal/rl/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/bod0.png"), string_trim("BL2/mods/res/bl2/mal/smg/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/bod1.png"), string_trim("BL2/mods/res/bl2/mal/smg/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/han0.png"), string_trim("BL2/mods/res/bl2/mal/smg/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/han1.png"), string_trim("BL2/mods/res/bl2/mal/smg/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/muz0.png"), string_trim("BL2/mods/res/bl2/mal/smg/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/smg/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/smg/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/smg/muz1.png"), string_trim("BL2/mods/res/bl2/mal/smg/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/bod0.png"), string_trim("BL2/mods/res/bl2/mal/sni/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/bod1.png"), string_trim("BL2/mods/res/bl2/mal/sni/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/han0.png"), string_trim("BL2/mods/res/bl2/mal/sni/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/han1.png"), string_trim("BL2/mods/res/bl2/mal/sni/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/muz0.png"), string_trim("BL2/mods/res/bl2/mal/sni/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/mal/sni/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/mal/sni/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/mal/sni/muz1.png"), string_trim("BL2/mods/res/bl2/mal/sni/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/ref.pdn"), string_trim("BL2/mods/res/bl2/ted/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/bod0.png"), string_trim("BL2/mods/res/bl2/ted/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/bod1.png"), string_trim("BL2/mods/res/bl2/ted/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/han0.png"), string_trim("BL2/mods/res/bl2/ted/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/han1.png"), string_trim("BL2/mods/res/bl2/ted/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/muz0.png"), string_trim("BL2/mods/res/bl2/ted/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/pis/muz1.png"), string_trim("BL2/mods/res/bl2/ted/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/bod0.png"), string_trim("BL2/mods/res/bl2/ted/rl/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/bod1.png"), string_trim("BL2/mods/res/bl2/ted/rl/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/han0.png"), string_trim("BL2/mods/res/bl2/ted/rl/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/han1.png"), string_trim("BL2/mods/res/bl2/ted/rl/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/muz0.png"), string_trim("BL2/mods/res/bl2/ted/rl/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/rl/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/rl/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/rl/muz1.png"), string_trim("BL2/mods/res/bl2/ted/rl/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/bod0.png"), string_trim("BL2/mods/res/bl2/ted/shot/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/bod1.png"), string_trim("BL2/mods/res/bl2/ted/shot/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/han0.png"), string_trim("BL2/mods/res/bl2/ted/shot/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/han1.png"), string_trim("BL2/mods/res/bl2/ted/shot/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/muz0.png"), string_trim("BL2/mods/res/bl2/ted/shot/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/shot/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/shot/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/shot/muz1.png"), string_trim("BL2/mods/res/bl2/ted/shot/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/bod0.png"), string_trim("BL2/mods/res/bl2/ted/smg/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/bod1.png"), string_trim("BL2/mods/res/bl2/ted/smg/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/han0.png"), string_trim("BL2/mods/res/bl2/ted/smg/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/han1.png"), string_trim("BL2/mods/res/bl2/ted/smg/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/muz0.png"), string_trim("BL2/mods/res/bl2/ted/smg/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/ted/smg/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/ted/smg/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/ted/smg/muz1.png"), string_trim("BL2/mods/res/bl2/ted/smg/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ref.pdn"), string_trim("BL2/mods/res/bl2/tor/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/bod0.png"), string_trim("BL2/mods/res/bl2/tor/ar/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/bod1.png"), string_trim("BL2/mods/res/bl2/tor/ar/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/han0.png"), string_trim("BL2/mods/res/bl2/tor/ar/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/han1.png"), string_trim("BL2/mods/res/bl2/tor/ar/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/muz0.png"), string_trim("BL2/mods/res/bl2/tor/ar/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/ar/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/ar/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/ar/muz1.png"), string_trim("BL2/mods/res/bl2/tor/ar/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/bod0.png"), string_trim("BL2/mods/res/bl2/tor/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/bod1.png"), string_trim("BL2/mods/res/bl2/tor/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/han0.png"), string_trim("BL2/mods/res/bl2/tor/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/han1.png"), string_trim("BL2/mods/res/bl2/tor/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/muz0.png"), string_trim("BL2/mods/res/bl2/tor/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/pis/muz1.png"), string_trim("BL2/mods/res/bl2/tor/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/bod0.png"), string_trim("BL2/mods/res/bl2/tor/rl/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/bod1.png"), string_trim("BL2/mods/res/bl2/tor/rl/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/han0.png"), string_trim("BL2/mods/res/bl2/tor/rl/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/han1.png"), string_trim("BL2/mods/res/bl2/tor/rl/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/muz0.png"), string_trim("BL2/mods/res/bl2/tor/rl/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/rl/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/rl/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/rl/muz1.png"), string_trim("BL2/mods/res/bl2/tor/rl/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/bod0.png"), string_trim("BL2/mods/res/bl2/tor/shot/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/bod1.png"), string_trim("BL2/mods/res/bl2/tor/shot/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/han0.png"), string_trim("BL2/mods/res/bl2/tor/shot/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/han1.png"), string_trim("BL2/mods/res/bl2/tor/shot/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/muz0.png"), string_trim("BL2/mods/res/bl2/tor/shot/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/tor/shot/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/tor/shot/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/tor/shot/muz1.png"), string_trim("BL2/mods/res/bl2/tor/shot/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ref.pdn"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ref.pdn"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ref.pdn"), string_trim("BL2/mods/res/bl2/vla/ref.pdn")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/bod0.png"), string_trim("BL2/mods/res/bl2/vla/ar/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/bod1.png"), string_trim("BL2/mods/res/bl2/vla/ar/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/han0.png"), string_trim("BL2/mods/res/bl2/vla/ar/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/han1.png"), string_trim("BL2/mods/res/bl2/vla/ar/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/muz0.png"), string_trim("BL2/mods/res/bl2/vla/ar/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/ar/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/ar/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/ar/muz1.png"), string_trim("BL2/mods/res/bl2/vla/ar/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/bod0.png"), string_trim("BL2/mods/res/bl2/vla/pis/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/bod1.png"), string_trim("BL2/mods/res/bl2/vla/pis/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/han0.png"), string_trim("BL2/mods/res/bl2/vla/pis/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/han1.png"), string_trim("BL2/mods/res/bl2/vla/pis/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/muz0.png"), string_trim("BL2/mods/res/bl2/vla/pis/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/pis/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/pis/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/pis/muz1.png"), string_trim("BL2/mods/res/bl2/vla/pis/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/bod0.png"), string_trim("BL2/mods/res/bl2/vla/rl/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/bod1.png"), string_trim("BL2/mods/res/bl2/vla/rl/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/han0.png"), string_trim("BL2/mods/res/bl2/vla/rl/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/han1.png"), string_trim("BL2/mods/res/bl2/vla/rl/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/muz0.png"), string_trim("BL2/mods/res/bl2/vla/rl/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/rl/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/rl/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/rl/muz1.png"), string_trim("BL2/mods/res/bl2/vla/rl/muz1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/bod0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/bod0.png"), string_trim("BL2/mods/res/bl2/vla/sni/bod0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/bod1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/bod1.png"), string_trim("BL2/mods/res/bl2/vla/sni/bod1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/han0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/han0.png"), string_trim("BL2/mods/res/bl2/vla/sni/han0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/han1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/han1.png"), string_trim("BL2/mods/res/bl2/vla/sni/han1.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/muz0.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/muz0.png"), string_trim("BL2/mods/res/bl2/vla/sni/muz0.png")));
file_delete(string_trim("BL2/mods/res/bl2/vla/sni/muz1.png"));while (file_exists(string_trim("BL2/mods/res/bl2/vla/sni/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/bl2/vla/sni/muz1.png"), string_trim("BL2/mods/res/bl2/vla/sni/muz1.png")));
file_delete(string_trim("BL2/mods/res/idpd/bod0.png"));while (file_exists(string_trim("BL2/mods/res/idpd/bod0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/bod0.png"), string_trim("BL2/mods/res/idpd/bod0.png")));
file_delete(string_trim("BL2/mods/res/idpd/bod1.png"));while (file_exists(string_trim("BL2/mods/res/idpd/bod1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/bod1.png"), string_trim("BL2/mods/res/idpd/bod1.png")));
file_delete(string_trim("BL2/mods/res/idpd/bod2.png"));while (file_exists(string_trim("BL2/mods/res/idpd/bod2.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/bod2.png"), string_trim("BL2/mods/res/idpd/bod2.png")));
file_delete(string_trim("BL2/mods/res/idpd/bod3.png"));while (file_exists(string_trim("BL2/mods/res/idpd/bod3.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/bod3.png"), string_trim("BL2/mods/res/idpd/bod3.png")));
file_delete(string_trim("BL2/mods/res/idpd/bod4.png"));while (file_exists(string_trim("BL2/mods/res/idpd/bod4.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/bod4.png"), string_trim("BL2/mods/res/idpd/bod4.png")));
file_delete(string_trim("BL2/mods/res/idpd/han0.png"));while (file_exists(string_trim("BL2/mods/res/idpd/han0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/han0.png"), string_trim("BL2/mods/res/idpd/han0.png")));
file_delete(string_trim("BL2/mods/res/idpd/han1.png"));while (file_exists(string_trim("BL2/mods/res/idpd/han1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/han1.png"), string_trim("BL2/mods/res/idpd/han1.png")));
file_delete(string_trim("BL2/mods/res/idpd/han2.png"));while (file_exists(string_trim("BL2/mods/res/idpd/han2.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/han2.png"), string_trim("BL2/mods/res/idpd/han2.png")));
file_delete(string_trim("BL2/mods/res/idpd/han3.png"));while (file_exists(string_trim("BL2/mods/res/idpd/han3.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/han3.png"), string_trim("BL2/mods/res/idpd/han3.png")));
file_delete(string_trim("BL2/mods/res/idpd/han4.png"));while (file_exists(string_trim("BL2/mods/res/idpd/han4.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/han4.png"), string_trim("BL2/mods/res/idpd/han4.png")));
file_delete(string_trim("BL2/mods/res/idpd/muz0.png"));while (file_exists(string_trim("BL2/mods/res/idpd/muz0.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/muz0.png"), string_trim("BL2/mods/res/idpd/muz0.png")));
file_delete(string_trim("BL2/mods/res/idpd/muz1.png"));while (file_exists(string_trim("BL2/mods/res/idpd/muz1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/muz1.png"), string_trim("BL2/mods/res/idpd/muz1.png")));
file_delete(string_trim("BL2/mods/res/idpd/muz2.png"));while (file_exists(string_trim("BL2/mods/res/idpd/muz2.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/muz2.png"), string_trim("BL2/mods/res/idpd/muz2.png")));
file_delete(string_trim("BL2/mods/res/idpd/muz3.png"));while (file_exists(string_trim("BL2/mods/res/idpd/muz3.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/muz3.png"), string_trim("BL2/mods/res/idpd/muz3.png")));
file_delete(string_trim("BL2/mods/res/idpd/muz4.png"));while (file_exists(string_trim("BL2/mods/res/idpd/muz4.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/muz4.png"), string_trim("BL2/mods/res/idpd/muz4.png")));
file_delete(string_trim("BL2/mods/res/idpd/sprElitePopoGun.png"));while (file_exists(string_trim("BL2/mods/res/idpd/sprElitePopoGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/sprElitePopoGun.png"), string_trim("BL2/mods/res/idpd/sprElitePopoGun.png")));
file_delete(string_trim("BL2/mods/res/idpd/sprPopoGun.png"));while (file_exists(string_trim("BL2/mods/res/idpd/sprPopoGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/sprPopoGun.png"), string_trim("BL2/mods/res/idpd/sprPopoGun.png")));
file_delete(string_trim("BL2/mods/res/idpd/sprPopoHeavyGun.png"));while (file_exists(string_trim("BL2/mods/res/idpd/sprPopoHeavyGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/sprPopoHeavyGun.png"), string_trim("BL2/mods/res/idpd/sprPopoHeavyGun.png")));
file_delete(string_trim("BL2/mods/res/idpd/sprPopoSlugger.png"));while (file_exists(string_trim("BL2/mods/res/idpd/sprPopoSlugger.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/mods/res/idpd/sprPopoSlugger.png"), string_trim("BL2/mods/res/idpd/sprPopoSlugger.png")));
file_delete(string_trim("BL2/res/bigweaponchest/bigWeaponChest.ase"));while (file_exists(string_trim("BL2/res/bigweaponchest/bigWeaponChest.ase"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/bigweaponchest/bigWeaponChest.ase"), string_trim("BL2/res/bigweaponchest/bigWeaponChest.ase")));
file_delete(string_trim("BL2/res/bigweaponchest/sprBigWeaponChest.png"));while (file_exists(string_trim("BL2/res/bigweaponchest/sprBigWeaponChest.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/bigweaponchest/sprBigWeaponChest.png"), string_trim("BL2/res/bigweaponchest/sprBigWeaponChest.png")));
file_delete(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpen.png"));while (file_exists(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpen.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/bigweaponchest/sprBigWeaponChestOpen.png"), string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpen.png")));
file_delete(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpening.png"));while (file_exists(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpening.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/bigweaponchest/sprBigWeaponChestOpening.png"), string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpening.png")));
file_delete(string_trim("BL2/res/bigweaponchest/sprWeaponChestBig_strip7.png"));while (file_exists(string_trim("BL2/res/bigweaponchest/sprWeaponChestBig_strip7.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/bigweaponchest/sprWeaponChestBig_strip7.png"), string_trim("BL2/res/bigweaponchest/sprWeaponChestBig_strip7.png")));
file_delete(string_trim("BL2/res/gamblechest/gambleChest.ase"));while (file_exists(string_trim("BL2/res/gamblechest/gambleChest.ase"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/gambleChest.ase"), string_trim("BL2/res/gamblechest/gambleChest.ase")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChest.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChest.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChest.png"), string_trim("BL2/res/gamblechest/sprGambleChest.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestBounce.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestBounce.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestBounce.png"), string_trim("BL2/res/gamblechest/sprGambleChestBounce.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestPrizeBottom.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestPrizeBottom.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestPrizeBottom.png"), string_trim("BL2/res/gamblechest/sprGambleChestPrizeBottom.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestPrizeLeft.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestPrizeLeft.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestPrizeLeft.png"), string_trim("BL2/res/gamblechest/sprGambleChestPrizeLeft.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestPulling.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestPulling.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestPulling.png"), string_trim("BL2/res/gamblechest/sprGambleChestPulling.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestRolling.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestRolling.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestRolling.png"), string_trim("BL2/res/gamblechest/sprGambleChestRolling.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestTransformed.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestTransformed.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestTransformed.png"), string_trim("BL2/res/gamblechest/sprGambleChestTransformed.png")));
file_delete(string_trim("BL2/res/gamblechest/sprGambleChestTransforming.png"));while (file_exists(string_trim("BL2/res/gamblechest/sprGambleChestTransforming.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/gamblechest/sprGambleChestTransforming.png"), string_trim("BL2/res/gamblechest/sprGambleChestTransforming.png")));
file_delete(string_trim("BL2/res/idpdgamblechest/idpdGambleChest.ase"));while (file_exists(string_trim("BL2/res/idpdgamblechest/idpdGambleChest.ase"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/idpdgamblechest/idpdGambleChest.ase"), string_trim("BL2/res/idpdgamblechest/idpdGambleChest.ase")));
file_delete(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChest.png"));while (file_exists(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChest.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/idpdgamblechest/sprIDPDGambleChest.png"), string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChest.png")));
file_delete(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransformed.png"));while (file_exists(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransformed.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/idpdgamblechest/sprIDPDGambleChestTransformed.png"), string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransformed.png")));
file_delete(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransforming.png"));while (file_exists(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransforming.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/idpdgamblechest/sprIDPDGambleChestTransforming.png"), string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransforming.png")));
file_delete(string_trim("BL2/res/pgw/mskProcwep.png"));while (file_exists(string_trim("BL2/res/pgw/mskProcwep.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BL2/res/pgw/mskProcwep.png"), string_trim("BL2/res/pgw/mskProcwep.png")));
file_delete(string_trim("bosshudredux.mod.gml"));while (file_exists(string_trim("bosshudredux.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bosshudredux.mod.gml"), string_trim("bosshudredux.mod.gml")));
file_delete(string_trim("Bioluminary_Oscillator.gml"));while (file_exists(string_trim("Bioluminary_Oscillator.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Bioluminary_Oscillator.gml"), string_trim("Bioluminary_Oscillator.gml")));
while (!file_loaded(string_trim("2 hour area/2hours.area.gml"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprArrow.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprBow.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprClouds.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprDebris.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprDecoration.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloor.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloorB.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloorExplo.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderHurt.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderIdle.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderWalk.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreeBot.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreetop.pdn"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreetop.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallBot.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallTop.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallTrans.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieHurt.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieIdle.png"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieWalk.png"))) {wait 1;}
while (!file_loaded(string_trim("afterburn.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/bigweaponchest.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/gamblechest.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/idpdgamblechest.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/pgw.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/procwep.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/reloadindicator.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/sharedammo.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/pgw_bl2.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/pgw_idpd.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/ar/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/rl/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/shot/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ban/smg/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/ar/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/lsr/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/smg/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/dah/sni/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/lsr/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/shot/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/smg/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/hyp/sni/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/ar/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/shot/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/jak/sni/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/rl/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/smg/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/mal/sni/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/rl/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/shot/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/ted/smg/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/ar/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/rl/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/tor/shot/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ref.pdn"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/ar/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/pis/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/rl/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/bl2/vla/sni/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/bod0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/bod1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/bod2.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/bod3.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/bod4.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/han0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/han1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/han2.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/han3.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/han4.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/muz0.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/muz1.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/muz2.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/muz3.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/muz4.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/sprElitePopoGun.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/sprPopoGun.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/sprPopoHeavyGun.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/mods/res/idpd/sprPopoSlugger.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/bigweaponchest/bigWeaponChest.ase"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/bigweaponchest/sprBigWeaponChest.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpen.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/bigweaponchest/sprBigWeaponChestOpening.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/bigweaponchest/sprWeaponChestBig_strip7.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/gambleChest.ase"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChest.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestBounce.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestPrizeBottom.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestPrizeLeft.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestPulling.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestRolling.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestTransformed.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/gamblechest/sprGambleChestTransforming.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/idpdgamblechest/idpdGambleChest.ase"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChest.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransformed.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/idpdgamblechest/sprIDPDGambleChestTransforming.png"))) {wait 1;}
while (!file_loaded(string_trim("BL2/res/pgw/mskProcwep.png"))) {wait 1;}
while (!file_loaded(string_trim("bosshudredux.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("Bioluminary_Oscillator.gml"))) {wait 1;}
wait mod_load(string_trim("data/Daily.mod/2 hour area/2hours.area.gml"));
wait mod_load(string_trim("data/Daily.mod/afterburn.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/bigweaponchest.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/gamblechest.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/idpdgamblechest.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/pgw.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/procwep.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/reloadindicator.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/sharedammo.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/mods/pgw_bl2.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/BL2/mods/pgw_idpd.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/bosshudredux.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/Bioluminary_Oscillator.gml"));


global.ModNames = "";
		     
var i = 0;
for(i = 0; array_length(mod_get_names("mod")) > i; i++){
	global.ModNames += mod_get_names("mod")[i]
}
for(i = 0; array_length(mod_get_names("weapon")) > i; i++){
	global.ModNames += mod_get_names("weapon")[i]
}
for(i = 0; array_length(mod_get_names("area")) > i; i++){
	global.ModNames += mod_get_names("area")[i]
}
for(i = 0; array_length(mod_get_names("crown")) > i; i++){
	global.ModNames += mod_get_names("crown")[i]
}
for(i = 0; array_length(mod_get_names("race")) > i; i++){
	global.ModNames += mod_get_names("race")[i]
}
for(i = 0; array_length(mod_get_names("skill")) > i; i++){
	global.ModNames += mod_get_names("skill")[i]
}
for(i = 0; array_length(mod_get_names("skin")) > i; i++){
	global.ModNames += mod_get_names("skin")[i]
}

trace("Current Daily:");
trace("Mods=2 Hour Area,Afterburn,BL2,bosshudredux,Bioluminary Oscillator");
trace("Character=Choose");
trace("Crown=crown of blood");
trace("Weapon=blood launcher");
trace("Seed=15053");

global.canStart = true;
global.headers = ds_map_create();
ds_map_set(global.headers, "Authorization", "token 21df58cedf37bef276512"+"7ee22846b1cfc9705f4");
ds_map_set(global.headers, "Cache-Control", "no-cache");	
ds_map_set(global.headers, "Accept", "application/vnd.github.full+json");	
file_delete("dl.txt");
while (file_exists("dl.txt")) {wait 1;}
http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
, "GET", global.headers,
''
, "dl.txt");
while (!file_loaded("dl.txt")) {wait 1;}
var dl = "";
if(array_length(string_split(string_load("dl.txt"), chr(34)+"message"+chr(34)+":"+chr(34)+"Not Found"+chr(34))) == 1){dl = string_split(string_split(string_load("dl.txt"), chr(34)+","+chr(34)+"encoding"+chr(34)+":"+chr(34)+"base64"+chr(34))[0],chr(34)+"content"+chr(34)+":"+chr(34))[1];}
file_unload("dl.txt");
dl = string_replace_all(dl, "\" + "n", "");
var leaderboard = string_split(base64Decode(dl), "|");
global.leaderboard = [];
for(var i = 1; i < array_length(leaderboard); i++){
	array_push(global.leaderboard, [string_copy(string_split(leaderboard[i], ":")[0], 1, 15), string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(leaderboard[i], "Kills: ")[1])]);
}
array_sort_sub(global.leaderboard, 2, 0);
global.leaderboardLoaded = 1;
file_unload("dl.txt");

file_delete("Daily.txt");
while (file_exists("Daily.txt")) {wait 1;}
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/Daily.mod.gml", "Daily.txt");
while (!file_loaded("Daily.txt")) {wait 1;}
global.Daily = string_replace_all(string_replace_all(string_split(string_split(string_load("Daily.txt"), "*/")[0], "/*")[1],chr(10),""),chr(13),"");
global.DailyHeight = string_count("#", global.Daily);
global.DailyWidth = 0;
var temp = string_split(global.Daily, "#");
for(var i = 0; i < array_length(temp); i++){
	if(string_length(temp[i]) > global.DailyWidth){global.DailyWidth = string_length(temp[i]);}
}
file_unload("Daily.txt");

#define step
if(instance_exists(Menu)){
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], DailyScoreboardX, DailyScoreboardY, DailyScoreboardX + DailyScoreboardW, DailyScoreboardY + DailyScoreboardH/2) && global.menu == 0){
		global.leaderboardPos-=5;
		global.leaderboardPos = max(global.leaderboardPos, 0);
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], DailyScoreboardX, DailyScoreboardY + DailyScoreboardH/2, DailyScoreboardX + DailyScoreboardW, DailyScoreboardY + DailyScoreboardH) && global.menu == 0){
		global.leaderboardPos+=5;
		global.leaderboardPos = min(global.leaderboardPos, max(array_length(global.leaderboard)-5, 0));
	}
}

if(global.qualified == true && global.canStart && global.ModNames != ""){
	var ModNames = "";
		     
	var i = 0;
	for(i = 0; array_length(mod_get_names("mod")) > i; i++){
		ModNames += mod_get_names("mod")[i]
	}
	for(i = 0; array_length(mod_get_names("weapon")) > i; i++){
		ModNames += mod_get_names("weapon")[i]
	}
	for(i = 0; array_length(mod_get_names("area")) > i; i++){
		ModNames += mod_get_names("area")[i]
	}
	for(i = 0; array_length(mod_get_names("crown")) > i; i++){
		ModNames += mod_get_names("crown")[i]
	}
	for(i = 0; array_length(mod_get_names("race")) > i; i++){
		ModNames += mod_get_names("race")[i]
	}
	for(i = 0; array_length(mod_get_names("skill")) > i; i++){
		ModNames += mod_get_names("skill")[i]
	}
	for(i = 0; array_length(mod_get_names("skin")) > i; i++){
		ModNames += mod_get_names("skin")[i]
	}
	if(ModNames != global.ModNames){
		trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again. Reason: Incorrect mod list");
		global.qualified = false;
	}
}

if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
		}
		i++
	}
}
var i = 0;
repeat(4){
	if(button_check(i, "talk")){
		global.qualified = false;
	}
	i++
}
if(global.start){
	global.alias = "";
	with(Player){
		give_wep(string_trim("blood launcher"));
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
if(!global.canStart){with(CharSelect){instance_change(CustomObject, 0);name=mod_current;if(!ChooseCharacter){race=string_lower(string_trim("Choose"));}}}
else{with(instances_matching(CustomObject, "name", mod_current)){instance_change(CharSelect, 0);}with(CharSelect){if(!ChooseCharacter){race=string_lower(string_trim("Choose"));}visible=true;}}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:2 Hour Area,Afterburn,BL2,bosshudredux,Bioluminary Oscillator" + " Character=Choose" + " Crown=crown of blood" + " Weapon=blood launcher" + " Seed=15053";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-25 Daily.txt")){
		prevScores = string_load(global.alias + " 2019-02-25 Daily.txt");
		while(!file_loaded(global.alias + " 2019-02-25 Daily.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-25 Daily.txt");
	}else{
		string_save(score, global.alias + " 2019-02-25 Daily.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 21df58cedf37bef276512" + "7ee22846b1cfc9705f4");
		ds_map_set(headers, "Cache-Control", "no-cache");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
		, "GET", headers,
		''
		, "dl.txt");
		while (!file_loaded("dl.txt")) {wait 1;}
		var dl = "404";
			if(array_length(string_split(string_load("dl.txt"), '"message":"Not Found"')) == 1){dl = string_split(string_split(string_load("dl.txt"), '","encoding":"base64"')[0],'"content":"')[1];
			dl = string_replace_all(dl, "\" + "n", "");
			var leaderboard = base64Decode(dl);
		}else{
			leaderboard = dl;
		}
		file_unload("dl.txt");
		if(string_copy(leaderboard, 0, 3) == "404"){
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64("Mods:2 Hour Area,Afterburn,BL2,bosshudredux,Bioluminary Oscillator" + " Character=Choose" + " Crown=crown of blood" + " Weapon=blood launcher" + " Seed=15053" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(leaderboard, "Mods:2 Hour Area,Afterburn,BL2,bosshudredux,Bioluminary Oscillator" + " Character=Choose" + " Crown=crown of blood" + " Weapon=blood launcher")) > 1){
			var fail = 0;
			for(var i = 0; i < array_length(string_split(global.alias, ",")); i++){
				if(array_length(string_split(leaderboard, string_split(global.alias, ",")[i])) > 1){fail=1;}
			}
			if(LimitedTries && !fail){
				file_delete("sha.txt");
				while (file_exists("sha.txt")) {wait 1;}
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
				, "GET", headers,
				''
				, "sha.txt");
				while (!file_loaded("sha.txt")) {wait 1;}
				wait file_load("sha.txt");
				sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
				file_unload("sha.txt");
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
				, "PUT", headers,
				'{
				"message":"Leaderboard Update",
				"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
				"sha":"'+sha+'"
				}'
				, "out.txt");
			}else{
				trace("You've already played this daily!");
			}
		}else{
			trace("You are playing on an older modded Daily, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
		}
		global.leaderboardLoaded = 0;
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Daily.txt'
		, "GET", global.headers,
		''
		, "dl.txt");
		while (!file_loaded("dl.txt")) {wait 1;}
		var dl = "";
		if(array_length(string_split(string_load("dl.txt"), chr(34)+"message"+chr(34)+":"+chr(34)+"Not Found"+chr(34))) == 1){dl = string_split(string_split(string_load("dl.txt"), chr(34)+","+chr(34)+"encoding"+chr(34)+":"+chr(34)+"base64"+chr(34))[0],chr(34)+"content"+chr(34)+":"+chr(34))[1];}
		file_unload("dl.txt");
		dl = string_replace_all(dl, "\" + "n", "");
		var leaderboard = string_split(base64Decode(dl), "|");
		global.leaderboard = [];
		for(var i = 1; i < array_length(leaderboard); i++){
			array_push(global.leaderboard, [string_copy(string_split(leaderboard[i], ":")[0], 1, 15), string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(leaderboard[i], "Kills: ")[1])]);
		}
		array_sort_sub(global.leaderboard, 2, 0);
		global.leaderboardLoaded = 1;
		file_unload("dl.txt");
	}else{
		trace("You were disqualified, so your scores were not uploaded.");
	}
}
#define draw_pause
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			global.qualified = false;
			trace("Disqualified for uploading results. reload the Daily mod from the character select screen to qualify again.");
		}
		i++
	}
}
#define draw_gui
if(instance_exists(Menu)){
	draw_set_color(make_color_rgb(0,100,100));
	draw_rectangle(DailyCurrentX, DailyCurrentY, DailyCurrentX + (DailyCurrentW+DailyCurrentLW*global.DailyWidth), DailyCurrentY + (DailyCurrentH+DailyCurrentLH*global.DailyHeight), 0);
	draw_set_color(make_color_rgb(0,150,150));
	draw_rectangle(DailyCurrentX + (DailyCurrentW+DailyCurrentLW*global.DailyWidth)/20, DailyCurrentY + (DailyCurrentH+DailyCurrentLH*global.DailyHeight)/20, DailyCurrentX + (DailyCurrentW+DailyCurrentLW*global.DailyWidth)*19/20, DailyCurrentY + (DailyCurrentH+DailyCurrentLH*global.DailyHeight)*19/20, 0);
	if(global.Daily != undefined){
		draw_set_font(fntSmall);
		draw_text_nt(DailyCurrentX + (DailyCurrentW+DailyCurrentLW*global.DailyWidth)/20 + 1, DailyCurrentY + (DailyCurrentH+DailyCurrentLH*global.DailyHeight)/20 + 1, global.Daily);
	}
	draw_set_color(make_color_rgb(100,100,100));
	draw_rectangle(DailyScoreboardX, DailyScoreboardY, DailyScoreboardX + DailyScoreboardW, DailyScoreboardY + DailyScoreboardH, 0);
	draw_set_color(make_color_rgb(0,0,0));
	draw_rectangle(DailyScoreboardX + DailyScoreboardW/40, DailyScoreboardY + DailyScoreboardH/20, DailyScoreboardX + DailyScoreboardW*39/40, DailyScoreboardY + DailyScoreboardH*19/20, 0);
	if(global.leaderboardLoaded && array_length(global.leaderboard) > 0){
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		for(var i = 0; (i+global.leaderboardPos) < array_length(global.leaderboard) && i < 5; i++){
			draw_set_font(fntM0);
			draw_text_nt(DailyScoreboardX + DailyScoreboardW/40 + 1, DailyScoreboardY + DailyScoreboardH/20 + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:" + make_color_rgb(255, 175, 0) + ")" : (i+global.leaderboardPos)==1 ? "@(color:" + make_color_rgb(200, 200, 200) + ")" : (i+global.leaderboardPos)==2 ? "@(color:" + make_color_rgb(150, 100, 0) + ")" : "") + "\#" + string(i+global.leaderboardPos+1));
			draw_text_nt(DailyScoreboardX + DailyScoreboardW/40 + 35, DailyScoreboardY + DailyScoreboardH/20 + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:" + make_color_rgb(255, 175, 0) + ")" : (i+global.leaderboardPos)==1 ? "@(color:" + make_color_rgb(200, 200, 200) + ")" : (i+global.leaderboardPos)==2 ? "@(color:" + make_color_rgb(150, 100, 0) + ")" : "") + global.leaderboard[i+global.leaderboardPos][0]);
			draw_set_font(fntSmall);
			draw_text_nt(DailyScoreboardX + DailyScoreboardW/40 + 37, DailyScoreboardY + DailyScoreboardH/20 + i*15 + 9, "Level: " + global.leaderboard[i+global.leaderboardPos][1] + " Kills: " + string(global.leaderboard[i+global.leaderboardPos][2]));
		}
	}else{
		var valign = draw_get_valign();
		var halign = draw_get_halign();
		draw_set_valign(1);
		draw_set_halign(1);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_nt(DailyScoreboardX + DailyScoreboardW/2 + 1, DailyScoreboardY + DailyScoreboardH/2 + 1, "LOADING SCORES#(if there are any!)")
		draw_set_valign(valign);
		draw_set_halign(halign);
	}
}
#define game_start
room_speed = 30;
current_time_scale = 1;
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(Player){if(!ChooseCharacter){race=string_lower(string_trim("Choose"));}}
if(!ChooseCrown){give_crown();}

//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = "crown of blood"
if(name == ""){return;}
var lqn = string_lower(name);
//
var pre = "crown of ";
var prl = string_length(pre);
if (string_length(lqn) >= prl && string_copy(lqn, 1, prl) == pre) {
    lqn = string_delete(lqn, 1, prl);
}
//
var r = null;
var i, n = array_length_1d(cmd_crown_names);
for (i = 0; i < n; i++) {
    if (cmd_crown_names[i] == lqn) { r = i; break; }
}
if (r == null) {
    var m = mod_get_names("crown");
    n = array_length_1d(m);
    for (i = 0; i < n; i++) {
        if (string_lower(scr_crown_name(m[i])) == lqn) { r = m[i]; break; }
    }
    if (r == null) for (i = 0; i < n; i++) {
        if (string_lower(m[i]) == lqn) { r = m[i]; break; }
    }
}
if (r != null) {
    var c = GameCont.crown;
    if (c != r) {
        if (is_string(c)) mod_script_call("crown", c, "crown_lose");
        if (c == crwn_death) {
            with (Player) maxhealth += 1;
            with (Revive) maxhealth += 1;
        }
        if (c == crwn_destiny) GameCont.skillpoints = max(GameCont.skillpoints - 1, 0);
        if (r == crwn_none) {
            with (Crown) instance_destroy();
            GameCont.crown = r;
            exit;
        }
        if (is_string(r)) mod_script_call("crown", r, "crown_take");
        //
        GameCont.crown = r;
        if (r == crwn_death) {
            with (Player) {
                maxhealth -= 1;
                my_health = min(my_health, maxhealth);
            }
            with (Revive) maxhealth -= 1;
        }
        if (r == crwn_destiny) if (GameCont.candestiny) {
            GameCont.candestiny = false;
            GameCont.skillpoints += 1;
        }
        if (c != crwn_none) {
            if (is_real(r)) with (Crown) {
                spr_idle = asset_get_index("sprCrown" + string(r) + "Idle");
                spr_walk = asset_get_index("sprCrown" + string(r) + "Walk");
            } else with (Crown) {
                spr_idle = sprCrown1Idle;
                spr_walk = sprCrown1Walk;
                mod_script_call("crown", r, "crown_object");
            }
        } else {
            if (!instance_exists(Crown)) instance_create(player_find(0).x, player_find(0).y, Crown);
        }
    }
}
#define scr_crown_name(crwn)
if (is_string(crwn)) {
    var s = mod_script_call("crown", crwn, "crown_name");
    return is_string(s) ? s : "";
} else {
    if (crwn >= 0 && crwn < array_length_1d(cmd_crown_names)) {
        return "CROWN OF " + string_upper(cmd_crown_names[crwn]);
    } else return "";
}
#define give_wep(name)
var lq_name = string_lower(name);
var r = null, i;
for (i = 1; i < 128; i++) {
    if (string_lower(weapon_get_name(i)) == lq_name) { r = i; break; }
}
if (r == null) {
    var m = mod_get_names("weapon");
    var n = array_length_1d(m);
    for (i = 0; i < n; i++) {
        var s = m[i];
        if (string_lower(weapon_get_name(s)) == lq_name) { r = s; break; }
    }
    if (r == null) for (i = 0; i < n; i++) {
        var s = m[i];
        if (string_lower(s) == lq_name) { r = s; break; }
    }
}
//
if (r != null) {
	wep = r;
	reload = 0;
	wkick = 0;
	can_shoot = 1;
	curse = 0;
	exit;
}
//end of stealing from YAL's debug mod
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
#define base64Decode(str)
var retVal = "";
for(var i = 0; i < string_length(str)/4; i++){
	if(string_length(str)/4-i>=1){
		ord1 = base64CharDecode(string_char_at(str, (i*4)+1));
		ord2 = base64CharDecode(string_char_at(str, (i*4)+2));
		ord3 = base64CharDecode(string_char_at(str, (i*4)+3));
		ord4 = base64CharDecode(string_char_at(str, (i*4)+4));
		char1 = chr(ord1 * 4 + (ord2 & 48) / 16);
		char2 = chr((ord2 & 15) * 16 + (ord3 & 60)/4);
		char3 = chr((ord3&3)*64+ord4);
		retVal += string(char1)+string(char2)+string(char3);
	}
}
return retVal;
#define base64CharDecode(str)
var retVal = 0;
switch(str){
	case "A":retVal = 0;break;
	case "B":retVal = 1;break;
	case "C":retVal = 2;break;
	case "D":retVal = 3;break;
	case "E":retVal = 4;break;
	case "F":retVal = 5;break;
	case "G":retVal = 6;break;
	case "H":retVal = 7;break;
	case "I":retVal = 8;break;
	case "J":retVal = 9;break;
	case "K":retVal = 10;break;
	case "L":retVal = 11;break;
	case "M":retVal = 12;break;
	case "N":retVal = 13;break;
	case "O":retVal = 14;break;
	case "P":retVal = 15;break;
	case "Q":retVal = 16;break;
	case "R":retVal = 17;break;
	case "S":retVal = 18;break;
	case "T":retVal = 19;break;
	case "U":retVal = 20;break;
	case "V":retVal = 21;break;
	case "W":retVal = 22;break;
	case "X":retVal = 23;break;
	case "Y":retVal = 24;break;
	case "Z":retVal = 25;break;
	case "a":retVal = 26;break;
	case "b":retVal = 27;break;
	case "c":retVal = 28;break;
	case "d":retVal = 29;break;
	case "e":retVal = 30;break;
	case "f":retVal = 31;break;
	case "g":retVal = 32;break;
	case "h":retVal = 33;break;
	case "i":retVal = 34;break;
	case "j":retVal = 35;break;
	case "k":retVal = 36;break;
	case "l":retVal = 37;break;
	case "m":retVal = 38;break;
	case "n":retVal = 39;break;
	case "o":retVal = 40;break;
	case "p":retVal = 41;break;
	case "q":retVal = 42;break;
	case "r":retVal = 43;break;
	case "s":retVal = 44;break;
	case "t":retVal = 45;break;
	case "u":retVal = 46;break;
	case "v":retVal = 47;break;
	case "w":retVal = 48;break;
	case "x":retVal = 49;break;
	case "y":retVal = 50;break;
	case "z":retVal = 51;break;
	case "0":retVal = 52;break;
	case "1":retVal = 53;break;
	case "2":retVal = 54;break;
	case "3":retVal = 55;break;
	case "4":retVal = 56;break;
	case "5":retVal = 57;break;
	case "6":retVal = 58;break;
	case "7":retVal = 59;break;
	case "8":retVal = 60;break;
	case "9":retVal = 61;break;
	case "+":retVal = 62;break;
	case "/":retVal = 63;break;
}
return retVal;

