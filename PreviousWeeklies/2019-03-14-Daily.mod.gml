
/*@rMods@w=#  Balls#  Clasweps#  Auto Bullet Shotgun#  Devastator#  Cooler Hud#@bCharacter@w=#  Choose#@yCrown@w=#  Slaughter#@gWeapon@w=#  ExplosionPistol#@pSeed@w=23130#Limited Tries:false*/
/*|Balls[Boing. Thwakk. Boing. Boing. Thwakk. CRASH!!!]|Clasweps[You got ultra weapons,#you got zappy weapons,#call now and you'll even get#some crowns thrown in for free!]|Auto Bullet Shotgun[BLAM BLAM BLAMMO]|Devastator[Changes the devastator#to make it more interesting]|Cooler Hud[Symphony of the Throne]*/
#define init
#macro weeklyButtonX 6
#macro weeklyButtonY 41
#macro weeklyButtonW 18
#macro weeklyButtonH 24
#macro weeklyButtonLW 12
#macro weeklyButtonLH 8
#macro weeklyCurrentW 2
#macro weeklyCurrentH 8
#macro weeklyCurrentLH 6.6
#macro weeklyCurrentLW 4.4
#macro swapX 35
#macro swapY 36
#macro swapW 17
#macro swapH 10
#macro ChooseCharacter true
#macro ChooseCrown false
#macro LimitedTries false

global.sprWeekly = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAABNklEQVRIDWO0doj8z0ABOLJ/GQW6GRhYQLofvbpPliFyYopgfXLalmTpf3T1OAMTWTqpqGnUAYMrBECJAoRxAVrIg3MByMLHYUfg9iKz4YJIDJC87CobJBHy9Q94FMBDAOQdG8coiK8cFqP4DsahhTyKA47isBjmAFrIwx3wv54ZZg9RtNwqVGXk6seaBhgZGRnuPvjAAKcb/0L4jX9RbcXBg+uDmYNHPzwEkM36/x9SP8HpepCsAMN/MI2sEjsbrg9mDh79KCHACHMpzOUwGiZOIATI0Y8SApB4FGAgxQfIYUCO/qEZApPmXkD2OJxNbAgg6ycuBBgZ4ZYga4YLQhk40wAe/cSlAWhqxmc5yA04QwCPfrgDyG1WwUKBXP0oUQAzjJ70gDsAHAWw1i25PsfXiCFkJgCiFgWoHcePfAAAAABJRU5ErkJggg==",2,0,0);
global.sprEvent = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAIAAAAUMWhjAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAFiUAABYlAUlSJPAAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuNWRHWFIAAAC/SURBVEhL7Y+xDQIxDEW9CAswwUk0rMFY9LcTDSUSIzBC+D7fnRzLJHaTArC+IufnWy+m0/mSUkkWAw7HKSgBGLOhP6CrsQBc3GHta4D2tbSPZgUUussDN0abj9gO0L7V5g8HoOF5k1a+AUTyFaArA+iqBgSqAgTKBxDR4/mSE7+QU55cQDvPgYEbLPzEBoE8p35mg+t8s4BmSR5NawOc7C9pBxDIc6q7gaQdwIfSeVxXQFA7IKivAaSEmUSV8gZDGKxrqTAwHQAAAABJRU5ErkJggg==",2,0,0);
global.menu = ("Daily" == "D"+"aily") + ("Daily" == "Event")*2;
global.leaderboard="";
global.leaderboardLoaded = 0;
global.leaderboardPos = 0;
global.leaderboardOpening = 0;
global.descriptionOpening = 0;
global.weekly = "";
global.weeklyFlavor = "";
global.weeklyHeight = 0;
global.weeklyWidth = 0;
global.daily = "";
global.dailyFlavor = "";
global.dailyHeight = 0;
global.dailyWidth = 0;
global.details = "";
global.detailsFlavor = "";
global.detailsHeight = 0;
global.detailsWidth = 0;
global.weeklyCurrentX = 60;
global.weeklyCurrentY = -1000;
global.weeklyCurrentMax = 36;
global.weeklyCurrentBH = 16;
global.weeklyScoreboardX = 159;
global.weeklyScoreboardY = 36;
global.weeklyScoreboardW = 160;
global.weeklyScoreboardH = 0;
global.weeklyScoreboardMin = 0;
global.weeklyScoreboardMax = 152;
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 23130;
global.start = true;
global.finished = false;
global.ModNames = "";
while(!mod_sideload()){wait 1;}
global.qualified = true;
global.alias = "";
global.Race = "Choose";
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
file_delete(string_trim("balls/balls.mod.gml"));while (file_exists(string_trim("balls/balls.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/balls.mod.gml"), string_trim("balls/balls.mod.gml")));
file_delete(string_trim("balls/laserwrench.wep.gml"));while (file_exists(string_trim("balls/laserwrench.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/laserwrench.wep.gml"), string_trim("balls/laserwrench.wep.gml")));
file_delete(string_trim("balls/ball1.ogg"));while (file_exists(string_trim("balls/ball1.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball1.ogg"), string_trim("balls/ball1.ogg")));
file_delete(string_trim("balls/ball2.ogg"));while (file_exists(string_trim("balls/ball2.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball2.ogg"), string_trim("balls/ball2.ogg")));
file_delete(string_trim("balls/ball3.ogg"));while (file_exists(string_trim("balls/ball3.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball3.ogg"), string_trim("balls/ball3.ogg")));
file_delete(string_trim("balls/ball4.ogg"));while (file_exists(string_trim("balls/ball4.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball4.ogg"), string_trim("balls/ball4.ogg")));
file_delete(string_trim("clasweps/widesword.wep.gml"));while (file_exists(string_trim("clasweps/widesword.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/widesword.wep.gml"), string_trim("clasweps/widesword.wep.gml")));
file_delete(string_trim("clasweps/ultrasuperdiscgun.wep.gml"));while (file_exists(string_trim("clasweps/ultrasuperdiscgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultrasuperdiscgun.wep.gml"), string_trim("clasweps/ultrasuperdiscgun.wep.gml")));
file_delete(string_trim("clasweps/ultrasplinter.wep.gml"));while (file_exists(string_trim("clasweps/ultrasplinter.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultrasplinter.wep.gml"), string_trim("clasweps/ultrasplinter.wep.gml")));
file_delete(string_trim("clasweps/ultraseeker.wep.gml"));while (file_exists(string_trim("clasweps/ultraseeker.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraseeker.wep.gml"), string_trim("clasweps/ultraseeker.wep.gml")));
file_delete(string_trim("clasweps/ultrarifle.wep.gml"));while (file_exists(string_trim("clasweps/ultrarifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultrarifle.wep.gml"), string_trim("clasweps/ultrarifle.wep.gml")));
file_delete(string_trim("clasweps/ultrapopgun.wep.gml"));while (file_exists(string_trim("clasweps/ultrapopgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultrapopgun.wep.gml"), string_trim("clasweps/ultrapopgun.wep.gml")));
file_delete(string_trim("clasweps/ultraplasmagun.wep.gml"));while (file_exists(string_trim("clasweps/ultraplasmagun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraplasmagun.wep.gml"), string_trim("clasweps/ultraplasmagun.wep.gml")));
file_delete(string_trim("clasweps/ultralightning.wep.gml"));while (file_exists(string_trim("clasweps/ultralightning.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultralightning.wep.gml"), string_trim("clasweps/ultralightning.wep.gml")));
file_delete(string_trim("clasweps/ultradiscgun.wep.gml"));while (file_exists(string_trim("clasweps/ultradiscgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultradiscgun.wep.gml"), string_trim("clasweps/ultradiscgun.wep.gml")));
file_delete(string_trim("clasweps/torch.wep.gml"));while (file_exists(string_trim("clasweps/torch.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/torch.wep.gml"), string_trim("clasweps/torch.wep.gml")));
file_delete(string_trim("clasweps/swiftsword.wep.gml"));while (file_exists(string_trim("clasweps/swiftsword.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/swiftsword.wep.gml"), string_trim("clasweps/swiftsword.wep.gml")));
file_delete(string_trim("clasweps/splintergatling.wep.gml"));while (file_exists(string_trim("clasweps/splintergatling.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/splintergatling.wep.gml"), string_trim("clasweps/splintergatling.wep.gml")));
file_delete(string_trim("clasweps/snl.wep.gml"));while (file_exists(string_trim("clasweps/snl.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/snl.wep.gml"), string_trim("clasweps/snl.wep.gml")));
file_delete(string_trim("clasweps/slc.wep.gml"));while (file_exists(string_trim("clasweps/slc.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/slc.wep.gml"), string_trim("clasweps/slc.wep.gml")));
file_delete(string_trim("clasweps/shrineroom.area.gml"));while (file_exists(string_trim("clasweps/shrineroom.area.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/shrineroom.area.gml"), string_trim("clasweps/shrineroom.area.gml")));
file_delete(string_trim("clasweps/shine.wep.gml"));while (file_exists(string_trim("clasweps/shine.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/shine.wep.gml"), string_trim("clasweps/shine.wep.gml")));
file_delete(string_trim("clasweps/scorpionarm.wep.gml"));while (file_exists(string_trim("clasweps/scorpionarm.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/scorpionarm.wep.gml"), string_trim("clasweps/scorpionarm.wep.gml")));
file_delete(string_trim("clasweps/scorcher.wep.gml"));while (file_exists(string_trim("clasweps/scorcher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/scorcher.wep.gml"), string_trim("clasweps/scorcher.wep.gml")));
file_delete(string_trim("clasweps/ringofplasma.wep.gml"));while (file_exists(string_trim("clasweps/ringofplasma.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ringofplasma.wep.gml"), string_trim("clasweps/ringofplasma.wep.gml")));
file_delete(string_trim("clasweps/ringoffire.wep.gml"));while (file_exists(string_trim("clasweps/ringoffire.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ringoffire.wep.gml"), string_trim("clasweps/ringoffire.wep.gml")));
file_delete(string_trim("clasweps/racingthoughts.skill.gml"));while (file_exists(string_trim("clasweps/racingthoughts.skill.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/racingthoughts.skill.gml"), string_trim("clasweps/racingthoughts.skill.gml")));
file_delete(string_trim("clasweps/quickdraw.wep.gml"));while (file_exists(string_trim("clasweps/quickdraw.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/quickdraw.wep.gml"), string_trim("clasweps/quickdraw.wep.gml")));
file_delete(string_trim("clasweps/plasmashotty.wep.gml"));while (file_exists(string_trim("clasweps/plasmashotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/plasmashotty.wep.gml"), string_trim("clasweps/plasmashotty.wep.gml")));
file_delete(string_trim("clasweps/orbitalstriker.wep.gml"));while (file_exists(string_trim("clasweps/orbitalstriker.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/orbitalstriker.wep.gml"), string_trim("clasweps/orbitalstriker.wep.gml")));
file_delete(string_trim("clasweps/orbitalbarrage.wep.gml"));while (file_exists(string_trim("clasweps/orbitalbarrage.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/orbitalbarrage.wep.gml"), string_trim("clasweps/orbitalbarrage.wep.gml")));
file_delete(string_trim("clasweps/multislicer.wep.gml"));while (file_exists(string_trim("clasweps/multislicer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/multislicer.wep.gml"), string_trim("clasweps/multislicer.wep.gml")));
file_delete(string_trim("clasweps/multiflakcannon.wep.gml"));while (file_exists(string_trim("clasweps/multiflakcannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/multiflakcannon.wep.gml"), string_trim("clasweps/multiflakcannon.wep.gml")));
file_delete(string_trim("clasweps/longsword.wep.gml"));while (file_exists(string_trim("clasweps/longsword.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/longsword.wep.gml"), string_trim("clasweps/longsword.wep.gml")));
file_delete(string_trim("clasweps/lightningscrew.wep.gml"));while (file_exists(string_trim("clasweps/lightningscrew.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/lightningscrew.wep.gml"), string_trim("clasweps/lightningscrew.wep.gml")));
file_delete(string_trim("clasweps/lightningflak.wep.gml"));while (file_exists(string_trim("clasweps/lightningflak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/lightningflak.wep.gml"), string_trim("clasweps/lightningflak.wep.gml")));
file_delete(string_trim("clasweps/kirbyhammer.wep.gml"));while (file_exists(string_trim("clasweps/kirbyhammer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/kirbyhammer.wep.gml"), string_trim("clasweps/kirbyhammer.wep.gml")));
file_delete(string_trim("clasweps/iceslugger.wep.gml"));while (file_exists(string_trim("clasweps/iceslugger.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/iceslugger.wep.gml"), string_trim("clasweps/iceslugger.wep.gml")));
file_delete(string_trim("clasweps/iceshotgun.wep.gml"));while (file_exists(string_trim("clasweps/iceshotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/iceshotgun.wep.gml"), string_trim("clasweps/iceshotgun.wep.gml")));
file_delete(string_trim("clasweps/hypershotgun.wep.gml"));while (file_exists(string_trim("clasweps/hypershotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/hypershotgun.wep.gml"), string_trim("clasweps/hypershotgun.wep.gml")));
file_delete(string_trim("clasweps/hyperrevolver.wep.gml"));while (file_exists(string_trim("clasweps/hyperrevolver.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/hyperrevolver.wep.gml"), string_trim("clasweps/hyperrevolver.wep.gml")));
file_delete(string_trim("clasweps/hyperflare.wep.gml"));while (file_exists(string_trim("clasweps/hyperflare.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/hyperflare.wep.gml"), string_trim("clasweps/hyperflare.wep.gml")));
file_delete(string_trim("clasweps/hyperflak.wep.gml"));while (file_exists(string_trim("clasweps/hyperflak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/hyperflak.wep.gml"), string_trim("clasweps/hyperflak.wep.gml")));
file_delete(string_trim("clasweps/heavywave.wep.gml"));while (file_exists(string_trim("clasweps/heavywave.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/heavywave.wep.gml"), string_trim("clasweps/heavywave.wep.gml")));
file_delete(string_trim("clasweps/heavystriker.wep.gml"));while (file_exists(string_trim("clasweps/heavystriker.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/heavystriker.wep.gml"), string_trim("clasweps/heavystriker.wep.gml")));
file_delete(string_trim("clasweps/heavyshovel.wep.gml"));while (file_exists(string_trim("clasweps/heavyshovel.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/heavyshovel.wep.gml"), string_trim("clasweps/heavyshovel.wep.gml")));
file_delete(string_trim("clasweps/heavyshot.wep.gml"));while (file_exists(string_trim("clasweps/heavyshot.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/heavyshot.wep.gml"), string_trim("clasweps/heavyshot.wep.gml")));
file_delete(string_trim("clasweps/goldscorpionarm.wep.gml"));while (file_exists(string_trim("clasweps/goldscorpionarm.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/goldscorpionarm.wep.gml"), string_trim("clasweps/goldscorpionarm.wep.gml")));
file_delete(string_trim("clasweps/goldenblazer.wep.gml"));while (file_exists(string_trim("clasweps/goldenblazer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/goldenblazer.wep.gml"), string_trim("clasweps/goldenblazer.wep.gml")));
file_delete(string_trim("clasweps/funnyxd.wep.gml"));while (file_exists(string_trim("clasweps/funnyxd.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/funnyxd.wep.gml"), string_trim("clasweps/funnyxd.wep.gml")));
file_delete(string_trim("clasweps/executioner.wep.gml"));while (file_exists(string_trim("clasweps/executioner.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/executioner.wep.gml"), string_trim("clasweps/executioner.wep.gml")));
file_delete(string_trim("clasweps/evilsbane.wep.gml"));while (file_exists(string_trim("clasweps/evilsbane.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/evilsbane.wep.gml"), string_trim("clasweps/evilsbane.wep.gml")));
file_delete(string_trim("clasweps/energywrench.wep.gml"));while (file_exists(string_trim("clasweps/energywrench.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/energywrench.wep.gml"), string_trim("clasweps/energywrench.wep.gml")));
file_delete(string_trim("clasweps/energyshovel.wep.gml"));while (file_exists(string_trim("clasweps/energyshovel.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/energyshovel.wep.gml"), string_trim("clasweps/energyshovel.wep.gml")));
file_delete(string_trim("clasweps/energyjackhammer.wep.gml"));while (file_exists(string_trim("clasweps/energyjackhammer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/energyjackhammer.wep.gml"), string_trim("clasweps/energyjackhammer.wep.gml")));
file_delete(string_trim("clasweps/enemyloot.mod.gml"));while (file_exists(string_trim("clasweps/enemyloot.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/enemyloot.mod.gml"), string_trim("clasweps/enemyloot.mod.gml")));
file_delete(string_trim("clasweps/doubleiceshotgun.wep.gml"));while (file_exists(string_trim("clasweps/doubleiceshotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/doubleiceshotgun.wep.gml"), string_trim("clasweps/doubleiceshotgun.wep.gml")));
file_delete(string_trim("clasweps/doghead.wep.gml"));while (file_exists(string_trim("clasweps/doghead.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/doghead.wep.gml"), string_trim("clasweps/doghead.wep.gml")));
file_delete(string_trim("clasweps/crowns/slots.crown.gml"));while (file_exists(string_trim("clasweps/crowns/slots.crown.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/slots.crown.gml"), string_trim("clasweps/crowns/slots.crown.gml")));
file_delete(string_trim("clasweps/crowns/Slaughter.crown.gml"));while (file_exists(string_trim("clasweps/crowns/Slaughter.crown.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Slaughter.crown.gml"), string_trim("clasweps/crowns/Slaughter.crown.gml")));
file_delete(string_trim("clasweps/crowns/Pain.crown.gml"));while (file_exists(string_trim("clasweps/crowns/Pain.crown.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Pain.crown.gml"), string_trim("clasweps/crowns/Pain.crown.gml")));
file_delete(string_trim("clasweps/crowns/Choice.crown.gml"));while (file_exists(string_trim("clasweps/crowns/Choice.crown.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Choice.crown.gml"), string_trim("clasweps/crowns/Choice.crown.gml")));
file_delete(string_trim("clasweps/claswepsshit.mod.gml"));while (file_exists(string_trim("clasweps/claswepsshit.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/claswepsshit.mod.gml"), string_trim("clasweps/claswepsshit.mod.gml")));
file_delete(string_trim("clasweps/chimerashell.wep.gml"));while (file_exists(string_trim("clasweps/chimerashell.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/chimerashell.wep.gml"), string_trim("clasweps/chimerashell.wep.gml")));
file_delete(string_trim("clasweps/chimeraexplosive.wep.gml"));while (file_exists(string_trim("clasweps/chimeraexplosive.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/chimeraexplosive.wep.gml"), string_trim("clasweps/chimeraexplosive.wep.gml")));
file_delete(string_trim("clasweps/chimeraenergy.wep.gml"));while (file_exists(string_trim("clasweps/chimeraenergy.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/chimeraenergy.wep.gml"), string_trim("clasweps/chimeraenergy.wep.gml")));
file_delete(string_trim("clasweps/chimerabullet.wep.gml"));while (file_exists(string_trim("clasweps/chimerabullet.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/chimerabullet.wep.gml"), string_trim("clasweps/chimerabullet.wep.gml")));
file_delete(string_trim("clasweps/chimerabolt.wep.gml"));while (file_exists(string_trim("clasweps/chimerabolt.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/chimerabolt.wep.gml"), string_trim("clasweps/chimerabolt.wep.gml")));
file_delete(string_trim("clasweps/catalyst.wep.gml"));while (file_exists(string_trim("clasweps/catalyst.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/catalyst.wep.gml"), string_trim("clasweps/catalyst.wep.gml")));
file_delete(string_trim("clasweps/casey.wep.gml"));while (file_exists(string_trim("clasweps/casey.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/casey.wep.gml"), string_trim("clasweps/casey.wep.gml")));
file_delete(string_trim("clasweps/cannon.wep.gml"));while (file_exists(string_trim("clasweps/cannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/cannon.wep.gml"), string_trim("clasweps/cannon.wep.gml")));
file_delete(string_trim("clasweps/brokenflak.wep.gml"));while (file_exists(string_trim("clasweps/brokenflak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/brokenflak.wep.gml"), string_trim("clasweps/brokenflak.wep.gml")));
file_delete(string_trim("clasweps/bossintros.mod.gml"));while (file_exists(string_trim("clasweps/bossintros.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/bossintros.mod.gml"), string_trim("clasweps/bossintros.mod.gml")));
file_delete(string_trim("clasweps/bloodyrifle.wep.gml"));while (file_exists(string_trim("clasweps/bloodyrifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/bloodyrifle.wep.gml"), string_trim("clasweps/bloodyrifle.wep.gml")));
file_delete(string_trim("clasweps/bloodyrevolver.wep.gml"));while (file_exists(string_trim("clasweps/bloodyrevolver.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/bloodyrevolver.wep.gml"), string_trim("clasweps/bloodyrevolver.wep.gml")));
file_delete(string_trim("clasweps/blazer.wep.gml"));while (file_exists(string_trim("clasweps/blazer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/blazer.wep.gml"), string_trim("clasweps/blazer.wep.gml")));
file_delete(string_trim("clasweps/battleshovel.wep.gml"));while (file_exists(string_trim("clasweps/battleshovel.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/battleshovel.wep.gml"), string_trim("clasweps/battleshovel.wep.gml")));
file_delete(string_trim("clasweps/autoiceshotgun.wep.gml"));while (file_exists(string_trim("clasweps/autoiceshotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/autoiceshotgun.wep.gml"), string_trim("clasweps/autoiceshotgun.wep.gml")));
file_delete(string_trim("clasweps/autoburstshotty.wep.gml"));while (file_exists(string_trim("clasweps/autoburstshotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/autoburstshotty.wep.gml"), string_trim("clasweps/autoburstshotty.wep.gml")));
file_delete(string_trim("clasweps/ZapMachineGun.wep.gml"));while (file_exists(string_trim("clasweps/ZapMachineGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ZapMachineGun.wep.gml"), string_trim("clasweps/ZapMachineGun.wep.gml")));
file_delete(string_trim("clasweps/Zap shotgun.wep.gml"));while (file_exists(string_trim("clasweps/Zap shotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap shotgun.wep.gml"), string_trim("clasweps/Zap shotgun.wep.gml")));
file_delete(string_trim("clasweps/Zap gun.wep.gml"));while (file_exists(string_trim("clasweps/Zap gun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap gun.wep.gml"), string_trim("clasweps/Zap gun.wep.gml")));
file_delete(string_trim("clasweps/Zap Cannon.wep.gml"));while (file_exists(string_trim("clasweps/Zap Cannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap Cannon.wep.gml"), string_trim("clasweps/Zap Cannon.wep.gml")));
file_delete(string_trim("clasweps/Ultraflamethrower.wep.gml"));while (file_exists(string_trim("clasweps/Ultraflamethrower.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ultraflamethrower.wep.gml"), string_trim("clasweps/Ultraflamethrower.wep.gml")));
file_delete(string_trim("clasweps/UltraSlug.wep.gml"));while (file_exists(string_trim("clasweps/UltraSlug.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSlug.wep.gml"), string_trim("clasweps/UltraSlug.wep.gml")));
file_delete(string_trim("clasweps/UltraFlak.wep.gml"));while (file_exists(string_trim("clasweps/UltraFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraFlak.wep.gml"), string_trim("clasweps/UltraFlak.wep.gml")));
file_delete(string_trim("clasweps/UltraBazook.wep.gml"));while (file_exists(string_trim("clasweps/UltraBazook.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraBazook.wep.gml"), string_trim("clasweps/UltraBazook.wep.gml")));
file_delete(string_trim("clasweps/TurboLauncher.wep.gml"));while (file_exists(string_trim("clasweps/TurboLauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TurboLauncher.wep.gml"), string_trim("clasweps/TurboLauncher.wep.gml")));
file_delete(string_trim("clasweps/TrailerPistol.wep.gml"));while (file_exists(string_trim("clasweps/TrailerPistol.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerPistol.wep.gml"), string_trim("clasweps/TrailerPistol.wep.gml")));
file_delete(string_trim("clasweps/TrailerGun.wep.gml"));while (file_exists(string_trim("clasweps/TrailerGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerGun.wep.gml"), string_trim("clasweps/TrailerGun.wep.gml")));
file_delete(string_trim("clasweps/TrailerCannon.wep.gml"));while (file_exists(string_trim("clasweps/TrailerCannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerCannon.wep.gml"), string_trim("clasweps/TrailerCannon.wep.gml")));
file_delete(string_trim("clasweps/Toxinballer.wep.gml"));while (file_exists(string_trim("clasweps/Toxinballer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Toxinballer.wep.gml"), string_trim("clasweps/Toxinballer.wep.gml")));
file_delete(string_trim("clasweps/ToxicShotty.wep.gml"));while (file_exists(string_trim("clasweps/ToxicShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicShotty.wep.gml"), string_trim("clasweps/ToxicShotty.wep.gml")));
file_delete(string_trim("clasweps/ToxicFlak.wep.gml"));while (file_exists(string_trim("clasweps/ToxicFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicFlak.wep.gml"), string_trim("clasweps/ToxicFlak.wep.gml")));
file_delete(string_trim("clasweps/ToxicDiscGun.wep.gml"));while (file_exists(string_trim("clasweps/ToxicDiscGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicDiscGun.wep.gml"), string_trim("clasweps/ToxicDiscGun.wep.gml")));
file_delete(string_trim("clasweps/ToxicBlazer.wep.gml"));while (file_exists(string_trim("clasweps/ToxicBlazer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicBlazer.wep.gml"), string_trim("clasweps/ToxicBlazer.wep.gml")));
file_delete(string_trim("clasweps/ToxicBazooka.wep.gml"));while (file_exists(string_trim("clasweps/ToxicBazooka.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicBazooka.wep.gml"), string_trim("clasweps/ToxicBazooka.wep.gml")));
file_delete(string_trim("clasweps/ThroneGun.wep.gml"));while (file_exists(string_trim("clasweps/ThroneGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneGun.wep.gml"), string_trim("clasweps/ThroneGun.wep.gml")));
file_delete(string_trim("clasweps/ThroneCannon.wep.gml"));while (file_exists(string_trim("clasweps/ThroneCannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneCannon.wep.gml"), string_trim("clasweps/ThroneCannon.wep.gml")));
file_delete(string_trim("clasweps/ThroneBeam.wep.gml"));while (file_exists(string_trim("clasweps/ThroneBeam.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneBeam.wep.gml"), string_trim("clasweps/ThroneBeam.wep.gml")));
file_delete(string_trim("clasweps/SuperIceFlakCannon.wep.gml"));while (file_exists(string_trim("clasweps/SuperIceFlakCannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperIceFlakCannon.wep.gml"), string_trim("clasweps/SuperIceFlakCannon.wep.gml")));
file_delete(string_trim("clasweps/SuperFocusedFlak.wep.gml"));while (file_exists(string_trim("clasweps/SuperFocusedFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperFocusedFlak.wep.gml"), string_trim("clasweps/SuperFocusedFlak.wep.gml")));
file_delete(string_trim("clasweps/SuperBurstShotty.wep.gml"));while (file_exists(string_trim("clasweps/SuperBurstShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperBurstShotty.wep.gml"), string_trim("clasweps/SuperBurstShotty.wep.gml")));
file_delete(string_trim("clasweps/Sniper.wep.gml"));while (file_exists(string_trim("clasweps/Sniper.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Sniper.wep.gml"), string_trim("clasweps/Sniper.wep.gml")));
file_delete(string_trim("clasweps/SlotMachine.wep.gml"));while (file_exists(string_trim("clasweps/SlotMachine.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SlotMachine.wep.gml"), string_trim("clasweps/SlotMachine.wep.gml")));
file_delete(string_trim("clasweps/Ricochetcrossbow.wep.gml"));while (file_exists(string_trim("clasweps/Ricochetcrossbow.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ricochetcrossbow.wep.gml"), string_trim("clasweps/Ricochetcrossbow.wep.gml")));
file_delete(string_trim("clasweps/RapidPistol.wep.gml"));while (file_exists(string_trim("clasweps/RapidPistol.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/RapidPistol.wep.gml"), string_trim("clasweps/RapidPistol.wep.gml")));
file_delete(string_trim("clasweps/RageBlaster.wep.gml"));while (file_exists(string_trim("clasweps/RageBlaster.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/RageBlaster.wep.gml"), string_trim("clasweps/RageBlaster.wep.gml")));
file_delete(string_trim("clasweps/Poposcorcher.wep.gml"));while (file_exists(string_trim("clasweps/Poposcorcher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Poposcorcher.wep.gml"), string_trim("clasweps/Poposcorcher.wep.gml")));
file_delete(string_trim("clasweps/PopoZapper.wep.gml"));while (file_exists(string_trim("clasweps/PopoZapper.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoZapper.wep.gml"), string_trim("clasweps/PopoZapper.wep.gml")));
file_delete(string_trim("clasweps/PopoSpreader.wep.gml"));while (file_exists(string_trim("clasweps/PopoSpreader.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoSpreader.wep.gml"), string_trim("clasweps/PopoSpreader.wep.gml")));
file_delete(string_trim("clasweps/PopoSMG.wep.gml"));while (file_exists(string_trim("clasweps/PopoSMG.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoSMG.wep.gml"), string_trim("clasweps/PopoSMG.wep.gml")));
file_delete(string_trim("clasweps/PopoRevolver.wep.gml"));while (file_exists(string_trim("clasweps/PopoRevolver.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoRevolver.wep.gml"), string_trim("clasweps/PopoRevolver.wep.gml")));
file_delete(string_trim("clasweps/PopoGuider.wep.gml"));while (file_exists(string_trim("clasweps/PopoGuider.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoGuider.wep.gml"), string_trim("clasweps/PopoGuider.wep.gml")));
file_delete(string_trim("clasweps/PopoGenocide.wep.gml"));while (file_exists(string_trim("clasweps/PopoGenocide.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoGenocide.wep.gml"), string_trim("clasweps/PopoGenocide.wep.gml")));
file_delete(string_trim("clasweps/PopoFireballer.wep.gml"));while (file_exists(string_trim("clasweps/PopoFireballer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoFireballer.wep.gml"), string_trim("clasweps/PopoFireballer.wep.gml")));
file_delete(string_trim("clasweps/PopoExplosionGun.wep.gml"));while (file_exists(string_trim("clasweps/PopoExplosionGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoExplosionGun.wep.gml"), string_trim("clasweps/PopoExplosionGun.wep.gml")));
file_delete(string_trim("clasweps/PopoCharger.wep.gml"));while (file_exists(string_trim("clasweps/PopoCharger.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoCharger.wep.gml"), string_trim("clasweps/PopoCharger.wep.gml")));
file_delete(string_trim("clasweps/PopoBurstShotty.wep.gml"));while (file_exists(string_trim("clasweps/PopoBurstShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoBurstShotty.wep.gml"), string_trim("clasweps/PopoBurstShotty.wep.gml")));
file_delete(string_trim("clasweps/PopoBADS.wep.gml"));while (file_exists(string_trim("clasweps/PopoBADS.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoBADS.wep.gml"), string_trim("clasweps/PopoBADS.wep.gml")));
file_delete(string_trim("clasweps/PlasmaNuker.wep.gml"));while (file_exists(string_trim("clasweps/PlasmaNuker.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaNuker.wep.gml"), string_trim("clasweps/PlasmaNuker.wep.gml")));
file_delete(string_trim("clasweps/PlasmaFlak.wep.gml"));while (file_exists(string_trim("clasweps/PlasmaFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaFlak.wep.gml"), string_trim("clasweps/PlasmaFlak.wep.gml")));
file_delete(string_trim("clasweps/PlasmaBazooka.wep.gml"));while (file_exists(string_trim("clasweps/PlasmaBazooka.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaBazooka.wep.gml"), string_trim("clasweps/PlasmaBazooka.wep.gml")));
file_delete(string_trim("clasweps/OmegaRevolver.wep.gml"));while (file_exists(string_trim("clasweps/OmegaRevolver.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/OmegaRevolver.wep.gml"), string_trim("clasweps/OmegaRevolver.wep.gml")));
file_delete(string_trim("clasweps/NecroMachine.wep.gml"));while (file_exists(string_trim("clasweps/NecroMachine.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/NecroMachine.wep.gml"), string_trim("clasweps/NecroMachine.wep.gml")));
file_delete(string_trim("clasweps/MiniNukeLauncher.wep.gml"));while (file_exists(string_trim("clasweps/MiniNukeLauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniNukeLauncher.wep.gml"), string_trim("clasweps/MiniNukeLauncher.wep.gml")));
file_delete(string_trim("clasweps/MineShotgun.wep.gml"));while (file_exists(string_trim("clasweps/MineShotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MineShotgun.wep.gml"), string_trim("clasweps/MineShotgun.wep.gml")));
file_delete(string_trim("clasweps/MineLauncher.wep.gml"));while (file_exists(string_trim("clasweps/MineLauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MineLauncher.wep.gml"), string_trim("clasweps/MineLauncher.wep.gml")));
file_delete(string_trim("clasweps/MegaNuker.wep.gml"));while (file_exists(string_trim("clasweps/MegaNuker.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MegaNuker.wep.gml"), string_trim("clasweps/MegaNuker.wep.gml")));
file_delete(string_trim("clasweps/LilGunther.wep.gml"));while (file_exists(string_trim("clasweps/LilGunther.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LilGunther.wep.gml"), string_trim("clasweps/LilGunther.wep.gml")));
file_delete(string_trim("clasweps/LightningWrench.wep.gml"));while (file_exists(string_trim("clasweps/LightningWrench.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LightningWrench.wep.gml"), string_trim("clasweps/LightningWrench.wep.gml")));
file_delete(string_trim("clasweps/Laserwave.wep.gml"));while (file_exists(string_trim("clasweps/Laserwave.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Laserwave.wep.gml"), string_trim("clasweps/Laserwave.wep.gml")));
file_delete(string_trim("clasweps/KingBlade.wep.gml"));while (file_exists(string_trim("clasweps/KingBlade.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/KingBlade.wep.gml"), string_trim("clasweps/KingBlade.wep.gml")));
file_delete(string_trim("clasweps/InvCrystalLaser.wep.gml"));while (file_exists(string_trim("clasweps/InvCrystalLaser.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/InvCrystalLaser.wep.gml"), string_trim("clasweps/InvCrystalLaser.wep.gml")));
file_delete(string_trim("clasweps/IceFlakCannon.wep.gml"));while (file_exists(string_trim("clasweps/IceFlakCannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceFlakCannon.wep.gml"), string_trim("clasweps/IceFlakCannon.wep.gml")));
file_delete(string_trim("clasweps/IceCannon.wep.gml"));while (file_exists(string_trim("clasweps/IceCannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceCannon.wep.gml"), string_trim("clasweps/IceCannon.wep.gml")));
file_delete(string_trim("clasweps/HuntingRifle.wep.gml"));while (file_exists(string_trim("clasweps/HuntingRifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HuntingRifle.wep.gml"), string_trim("clasweps/HuntingRifle.wep.gml")));
file_delete(string_trim("clasweps/Hellfire.wep.gml"));while (file_exists(string_trim("clasweps/Hellfire.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Hellfire.wep.gml"), string_trim("clasweps/Hellfire.wep.gml")));
file_delete(string_trim("clasweps/HeavySMG.wep.gml"));while (file_exists(string_trim("clasweps/HeavySMG.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavySMG.wep.gml"), string_trim("clasweps/HeavySMG.wep.gml")));
file_delete(string_trim("clasweps/HeavyLaser.wep.gml"));while (file_exists(string_trim("clasweps/HeavyLaser.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyLaser.wep.gml"), string_trim("clasweps/HeavyLaser.wep.gml")));
file_delete(string_trim("clasweps/HeavyGlove.wep.gml"));while (file_exists(string_trim("clasweps/HeavyGlove.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyGlove.wep.gml"), string_trim("clasweps/HeavyGlove.wep.gml")));
file_delete(string_trim("clasweps/HeavyFlare.wep.gml"));while (file_exists(string_trim("clasweps/HeavyFlare.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyFlare.wep.gml"), string_trim("clasweps/HeavyFlare.wep.gml")));
file_delete(string_trim("clasweps/HeavyFlak.wep.gml"));while (file_exists(string_trim("clasweps/HeavyFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyFlak.wep.gml"), string_trim("clasweps/HeavyFlak.wep.gml")));
file_delete(string_trim("clasweps/GuiderShotty.wep.gml"));while (file_exists(string_trim("clasweps/GuiderShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuiderShotty.wep.gml"), string_trim("clasweps/GuiderShotty.wep.gml")));
file_delete(string_trim("clasweps/GuiderPistol.wep.gml"));while (file_exists(string_trim("clasweps/GuiderPistol.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuiderPistol.wep.gml"), string_trim("clasweps/GuiderPistol.wep.gml")));
file_delete(string_trim("clasweps/GuiderMinigun.wep.gml"));while (file_exists(string_trim("clasweps/GuiderMinigun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuiderMinigun.wep.gml"), string_trim("clasweps/GuiderMinigun.wep.gml")));
file_delete(string_trim("clasweps/GuiderBlaster.wep.gml"));while (file_exists(string_trim("clasweps/GuiderBlaster.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuiderBlaster.wep.gml"), string_trim("clasweps/GuiderBlaster.wep.gml")));
file_delete(string_trim("clasweps/GoldenFireballer.wep.gml"));while (file_exists(string_trim("clasweps/GoldenFireballer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GoldenFireballer.wep.gml"), string_trim("clasweps/GoldenFireballer.wep.gml")));
file_delete(string_trim("clasweps/GigaHammer.wep.gml"));while (file_exists(string_trim("clasweps/GigaHammer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GigaHammer.wep.gml"), string_trim("clasweps/GigaHammer.wep.gml")));
file_delete(string_trim("clasweps/Genocide.wep.gml"));while (file_exists(string_trim("clasweps/Genocide.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Genocide.wep.gml"), string_trim("clasweps/Genocide.wep.gml")));
file_delete(string_trim("clasweps/GatlingNader.wep.gml"));while (file_exists(string_trim("clasweps/GatlingNader.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GatlingNader.wep.gml"), string_trim("clasweps/GatlingNader.wep.gml")));
file_delete(string_trim("clasweps/GatlingMiniNader.wep.gml"));while (file_exists(string_trim("clasweps/GatlingMiniNader.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GatlingMiniNader.wep.gml"), string_trim("clasweps/GatlingMiniNader.wep.gml")));
file_delete(string_trim("clasweps/FocusedFlak.wep.gml"));while (file_exists(string_trim("clasweps/FocusedFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/FocusedFlak.wep.gml"), string_trim("clasweps/FocusedFlak.wep.gml")));
file_delete(string_trim("clasweps/FocusShotty.wep.gml"));while (file_exists(string_trim("clasweps/FocusShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/FocusShotty.wep.gml"), string_trim("clasweps/FocusShotty.wep.gml")));
file_delete(string_trim("clasweps/Flamesword.wep.gml"));while (file_exists(string_trim("clasweps/Flamesword.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Flamesword.wep.gml"), string_trim("clasweps/Flamesword.wep.gml")));
file_delete(string_trim("clasweps/Fireballer.wep.gml"));while (file_exists(string_trim("clasweps/Fireballer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Fireballer.wep.gml"), string_trim("clasweps/Fireballer.wep.gml")));
file_delete(string_trim("clasweps/ExplosionPistol.wep.gml"));while (file_exists(string_trim("clasweps/ExplosionPistol.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ExplosionPistol.wep.gml"), string_trim("clasweps/ExplosionPistol.wep.gml")));
file_delete(string_trim("clasweps/ExplosionGun.wep.gml"));while (file_exists(string_trim("clasweps/ExplosionGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ExplosionGun.wep.gml"), string_trim("clasweps/ExplosionGun.wep.gml")));
file_delete(string_trim("clasweps/DemolitionsLauncher.wep.gml"));while (file_exists(string_trim("clasweps/DemolitionsLauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DemolitionsLauncher.wep.gml"), string_trim("clasweps/DemolitionsLauncher.wep.gml")));
file_delete(string_trim("clasweps/DartlingGun.wep.gml"));while (file_exists(string_trim("clasweps/DartlingGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DartlingGun.wep.gml"), string_trim("clasweps/DartlingGun.wep.gml")));
file_delete(string_trim("clasweps/DartGun.wep.gml"));while (file_exists(string_trim("clasweps/DartGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DartGun.wep.gml"), string_trim("clasweps/DartGun.wep.gml")));
file_delete(string_trim("clasweps/CrystalLaser.wep.gml"));while (file_exists(string_trim("clasweps/CrystalLaser.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/CrystalLaser.wep.gml"), string_trim("clasweps/CrystalLaser.wep.gml")));
file_delete(string_trim("clasweps/ChargeSlugger.wep.gml"));while (file_exists(string_trim("clasweps/ChargeSlugger.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeSlugger.wep.gml"), string_trim("clasweps/ChargeSlugger.wep.gml")));
file_delete(string_trim("clasweps/ChargePlasma.wep.gml"));while (file_exists(string_trim("clasweps/ChargePlasma.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargePlasma.wep.gml"), string_trim("clasweps/ChargePlasma.wep.gml")));
file_delete(string_trim("clasweps/ChargeLaser.wep.gml"));while (file_exists(string_trim("clasweps/ChargeLaser.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeLaser.wep.gml"), string_trim("clasweps/ChargeLaser.wep.gml")));
file_delete(string_trim("clasweps/ChargeGun.wep.gml"));while (file_exists(string_trim("clasweps/ChargeGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeGun.wep.gml"), string_trim("clasweps/ChargeGun.wep.gml")));
file_delete(string_trim("clasweps/ChargeFlamethrower.wep.gml"));while (file_exists(string_trim("clasweps/ChargeFlamethrower.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeFlamethrower.wep.gml"), string_trim("clasweps/ChargeFlamethrower.wep.gml")));
file_delete(string_trim("clasweps/ChargeFlak.wep.gml"));while (file_exists(string_trim("clasweps/ChargeFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeFlak.wep.gml"), string_trim("clasweps/ChargeFlak.wep.gml")));
file_delete(string_trim("clasweps/ChargeDisc.wep.gml"));while (file_exists(string_trim("clasweps/ChargeDisc.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeDisc.wep.gml"), string_trim("clasweps/ChargeDisc.wep.gml")));
file_delete(string_trim("clasweps/ChargeCrossbow.wep.gml"));while (file_exists(string_trim("clasweps/ChargeCrossbow.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeCrossbow.wep.gml"), string_trim("clasweps/ChargeCrossbow.wep.gml")));
file_delete(string_trim("clasweps/ChargeBlade.wep.gml"));while (file_exists(string_trim("clasweps/ChargeBlade.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeBlade.wep.gml"), string_trim("clasweps/ChargeBlade.wep.gml")));
file_delete(string_trim("clasweps/ChargeBazooka.wep.gml"));while (file_exists(string_trim("clasweps/ChargeBazooka.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeBazooka.wep.gml"), string_trim("clasweps/ChargeBazooka.wep.gml")));
file_delete(string_trim("clasweps/BusterGun.wep.gml"));while (file_exists(string_trim("clasweps/BusterGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BusterGun.wep.gml"), string_trim("clasweps/BusterGun.wep.gml")));
file_delete(string_trim("clasweps/BurstShotty.wep.gml"));while (file_exists(string_trim("clasweps/BurstShotty.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BurstShotty.wep.gml"), string_trim("clasweps/BurstShotty.wep.gml")));
file_delete(string_trim("clasweps/BoxingGlove.wep.gml"));while (file_exists(string_trim("clasweps/BoxingGlove.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BoxingGlove.wep.gml"), string_trim("clasweps/BoxingGlove.wep.gml")));
file_delete(string_trim("clasweps/BouncerFlak.wep.gml"));while (file_exists(string_trim("clasweps/BouncerFlak.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BouncerFlak.wep.gml"), string_trim("clasweps/BouncerFlak.wep.gml")));
file_delete(string_trim("clasweps/BluntHammer.wep.gml"));while (file_exists(string_trim("clasweps/BluntHammer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BluntHammer.wep.gml"), string_trim("clasweps/BluntHammer.wep.gml")));
file_delete(string_trim("clasweps/Bloodballer.wep.gml"));while (file_exists(string_trim("clasweps/Bloodballer.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Bloodballer.wep.gml"), string_trim("clasweps/Bloodballer.wep.gml")));
file_delete(string_trim("clasweps/BloodMineLauncher.wep.gml"));while (file_exists(string_trim("clasweps/BloodMineLauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodMineLauncher.wep.gml"), string_trim("clasweps/BloodMineLauncher.wep.gml")));
file_delete(string_trim("clasweps/BloodGenocide.wep.gml"));while (file_exists(string_trim("clasweps/BloodGenocide.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodGenocide.wep.gml"), string_trim("clasweps/BloodGenocide.wep.gml")));
file_delete(string_trim("clasweps/BloodExplosionGun.wep.gml"));while (file_exists(string_trim("clasweps/BloodExplosionGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodExplosionGun.wep.gml"), string_trim("clasweps/BloodExplosionGun.wep.gml")));
file_delete(string_trim("clasweps/BlinkSword.Wep.gml"));while (file_exists(string_trim("clasweps/BlinkSword.Wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BlinkSword.Wep.gml"), string_trim("clasweps/BlinkSword.Wep.gml")));
file_delete(string_trim("clasweps/BigBlaster.wep.gml"));while (file_exists(string_trim("clasweps/BigBlaster.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BigBlaster.wep.gml"), string_trim("clasweps/BigBlaster.wep.gml")));
file_delete(string_trim("clasweps/BanditBlaster.wep.gml"));while (file_exists(string_trim("clasweps/BanditBlaster.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BanditBlaster.wep.gml"), string_trim("clasweps/BanditBlaster.wep.gml")));
file_delete(string_trim("clasweps/BallMomBlaster.wep.gml"));while (file_exists(string_trim("clasweps/BallMomBlaster.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BallMomBlaster.wep.gml"), string_trim("clasweps/BallMomBlaster.wep.gml")));
file_delete(string_trim("clasweps/BADS.wep.gml"));while (file_exists(string_trim("clasweps/BADS.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BADS.wep.gml"), string_trim("clasweps/BADS.wep.gml")));
file_delete(string_trim("clasweps/Acelauncher.wep.gml"));while (file_exists(string_trim("clasweps/Acelauncher.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Acelauncher.wep.gml"), string_trim("clasweps/Acelauncher.wep.gml")));
file_delete(string_trim("clasweps/AccuserHand.wep.gml"));while (file_exists(string_trim("clasweps/AccuserHand.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/AccuserHand.wep.gml"), string_trim("clasweps/AccuserHand.wep.gml")));
file_delete(string_trim("clasweps/widesword.png"));while (file_exists(string_trim("clasweps/widesword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/widesword.png"), string_trim("clasweps/widesword.png")));
file_delete(string_trim("clasweps/ultraseekerpro.png"));while (file_exists(string_trim("clasweps/ultraseekerpro.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraseekerpro.png"), string_trim("clasweps/ultraseekerpro.png")));
file_delete(string_trim("clasweps/ultraplasmaproj.png"));while (file_exists(string_trim("clasweps/ultraplasmaproj.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraplasmaproj.png"), string_trim("clasweps/ultraplasmaproj.png")));
file_delete(string_trim("clasweps/ultraplasmaimpact.png"));while (file_exists(string_trim("clasweps/ultraplasmaimpact.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraplasmaimpact.png"), string_trim("clasweps/ultraplasmaimpact.png")));
file_delete(string_trim("clasweps/ultramegaseeker.png"));while (file_exists(string_trim("clasweps/ultramegaseeker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultramegaseeker.png"), string_trim("clasweps/ultramegaseeker.png")));
file_delete(string_trim("clasweps/ultraflame.png"));while (file_exists(string_trim("clasweps/ultraflame.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ultraflame.png"), string_trim("clasweps/ultraflame.png")));
file_delete(string_trim("clasweps/thoughtslightning.png"));while (file_exists(string_trim("clasweps/thoughtslightning.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/thoughtslightning.png"), string_trim("clasweps/thoughtslightning.png")));
file_delete(string_trim("clasweps/swiftsword.png"));while (file_exists(string_trim("clasweps/swiftsword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/swiftsword.png"), string_trim("clasweps/swiftsword.png")));
file_delete(string_trim("clasweps/sprBaseball.png"));while (file_exists(string_trim("clasweps/sprBaseball.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/sprBaseball.png"), string_trim("clasweps/sprBaseball.png")));
file_delete(string_trim("clasweps/shine.ogg"));while (file_exists(string_trim("clasweps/shine.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/shine.ogg"), string_trim("clasweps/shine.ogg")));
file_delete(string_trim("clasweps/ringofplasma.png"));while (file_exists(string_trim("clasweps/ringofplasma.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ringofplasma.png"), string_trim("clasweps/ringofplasma.png")));
file_delete(string_trim("clasweps/ringoffire.png"));while (file_exists(string_trim("clasweps/ringoffire.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ringoffire.png"), string_trim("clasweps/ringoffire.png")));
file_delete(string_trim("clasweps/racingthoughtsbutton.png"));while (file_exists(string_trim("clasweps/racingthoughtsbutton.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/racingthoughtsbutton.png"), string_trim("clasweps/racingthoughtsbutton.png")));
file_delete(string_trim("clasweps/orbitalstriker.png"));while (file_exists(string_trim("clasweps/orbitalstriker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/orbitalstriker.png"), string_trim("clasweps/orbitalstriker.png")));
file_delete(string_trim("clasweps/orbitalbarrage.png"));while (file_exists(string_trim("clasweps/orbitalbarrage.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/orbitalbarrage.png"), string_trim("clasweps/orbitalbarrage.png")));
file_delete(string_trim("clasweps/multiflakcannon.png"));while (file_exists(string_trim("clasweps/multiflakcannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/multiflakcannon.png"), string_trim("clasweps/multiflakcannon.png")));
file_delete(string_trim("clasweps/longsword.png"));while (file_exists(string_trim("clasweps/longsword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/longsword.png"), string_trim("clasweps/longsword.png")));
file_delete(string_trim("clasweps/lightningshank.png"));while (file_exists(string_trim("clasweps/lightningshank.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/lightningshank.png"), string_trim("clasweps/lightningshank.png")));
file_delete(string_trim("clasweps/lightningflak.png"));while (file_exists(string_trim("clasweps/lightningflak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/lightningflak.png"), string_trim("clasweps/lightningflak.png")));
file_delete(string_trim("clasweps/heavy shovel.png"));while (file_exists(string_trim("clasweps/heavy shovel.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/heavy shovel.png"), string_trim("clasweps/heavy shovel.png")));
file_delete(string_trim("clasweps/evilsbane.png"));while (file_exists(string_trim("clasweps/evilsbane.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/evilsbane.png"), string_trim("clasweps/evilsbane.png")));
file_delete(string_trim("clasweps/crowns/Crown of Slots.png"));while (file_exists(string_trim("clasweps/crowns/Crown of Slots.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Crown of Slots.png"), string_trim("clasweps/crowns/Crown of Slots.png")));
file_delete(string_trim("clasweps/crowns/Crown of Slaughter.png"));while (file_exists(string_trim("clasweps/crowns/Crown of Slaughter.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Crown of Slaughter.png"), string_trim("clasweps/crowns/Crown of Slaughter.png")));
file_delete(string_trim("clasweps/crowns/Crown of Pain.png"));while (file_exists(string_trim("clasweps/crowns/Crown of Pain.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/Crown of Pain.png"), string_trim("clasweps/crowns/Crown of Pain.png")));
file_delete(string_trim("clasweps/crowns/ChoiceBuddyWalk.png"));while (file_exists(string_trim("clasweps/crowns/ChoiceBuddyWalk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/ChoiceBuddyWalk.png"), string_trim("clasweps/crowns/ChoiceBuddyWalk.png")));
file_delete(string_trim("clasweps/crowns/ChoiceBuddyIdle.png"));while (file_exists(string_trim("clasweps/crowns/ChoiceBuddyIdle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/crowns/ChoiceBuddyIdle.png"), string_trim("clasweps/crowns/ChoiceBuddyIdle.png")));
file_delete(string_trim("clasweps/catalyst.png"));while (file_exists(string_trim("clasweps/catalyst.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/catalyst.png"), string_trim("clasweps/catalyst.png")));
file_delete(string_trim("clasweps/bulletcannon.png"));while (file_exists(string_trim("clasweps/bulletcannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/bulletcannon.png"), string_trim("clasweps/bulletcannon.png")));
file_delete(string_trim("clasweps/barragemarker.png"));while (file_exists(string_trim("clasweps/barragemarker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/barragemarker.png"), string_trim("clasweps/barragemarker.png")));
file_delete(string_trim("clasweps/bads.png"));while (file_exists(string_trim("clasweps/bads.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/bads.png"), string_trim("clasweps/bads.png")));
file_delete(string_trim("clasweps/ZapSlug.png"));while (file_exists(string_trim("clasweps/ZapSlug.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ZapSlug.png"), string_trim("clasweps/ZapSlug.png")));
file_delete(string_trim("clasweps/ZapMG.png"));while (file_exists(string_trim("clasweps/ZapMG.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ZapMG.png"), string_trim("clasweps/ZapMG.png")));
file_delete(string_trim("clasweps/ZapBullet.png"));while (file_exists(string_trim("clasweps/ZapBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ZapBullet.png"), string_trim("clasweps/ZapBullet.png")));
file_delete(string_trim("clasweps/Zap Shotgun.png"));while (file_exists(string_trim("clasweps/Zap Shotgun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap Shotgun.png"), string_trim("clasweps/Zap Shotgun.png")));
file_delete(string_trim("clasweps/Zap Gun.png"));while (file_exists(string_trim("clasweps/Zap Gun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap Gun.png"), string_trim("clasweps/Zap Gun.png")));
file_delete(string_trim("clasweps/Zap Cannon.png"));while (file_exists(string_trim("clasweps/Zap Cannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Zap Cannon.png"), string_trim("clasweps/Zap Cannon.png")));
file_delete(string_trim("clasweps/Ultrasuperdiscgun.png"));while (file_exists(string_trim("clasweps/Ultrasuperdiscgun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ultrasuperdiscgun.png"), string_trim("clasweps/Ultrasuperdiscgun.png")));
file_delete(string_trim("clasweps/UltraslugDissapear.png"));while (file_exists(string_trim("clasweps/UltraslugDissapear.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraslugDissapear.png"), string_trim("clasweps/UltraslugDissapear.png")));
file_delete(string_trim("clasweps/Ultradiscgun.png"));while (file_exists(string_trim("clasweps/Ultradiscgun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ultradiscgun.png"), string_trim("clasweps/Ultradiscgun.png")));
file_delete(string_trim("clasweps/Ultrabazooka.png"));while (file_exists(string_trim("clasweps/Ultrabazooka.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ultrabazooka.png"), string_trim("clasweps/Ultrabazooka.png")));
file_delete(string_trim("clasweps/UltraSuperDisc.png"));while (file_exists(string_trim("clasweps/UltraSuperDisc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSuperDisc.png"), string_trim("clasweps/UltraSuperDisc.png")));
file_delete(string_trim("clasweps/UltraSplinterPro.png"));while (file_exists(string_trim("clasweps/UltraSplinterPro.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSplinterPro.png"), string_trim("clasweps/UltraSplinterPro.png")));
file_delete(string_trim("clasweps/UltraSplinter.png"));while (file_exists(string_trim("clasweps/UltraSplinter.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSplinter.png"), string_trim("clasweps/UltraSplinter.png")));
file_delete(string_trim("clasweps/UltraSmoke.png"));while (file_exists(string_trim("clasweps/UltraSmoke.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSmoke.png"), string_trim("clasweps/UltraSmoke.png")));
file_delete(string_trim("clasweps/UltraSlugger.png"));while (file_exists(string_trim("clasweps/UltraSlugger.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSlugger.png"), string_trim("clasweps/UltraSlugger.png")));
file_delete(string_trim("clasweps/UltraSlugHit.png"));while (file_exists(string_trim("clasweps/UltraSlugHit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSlugHit.png"), string_trim("clasweps/UltraSlugHit.png")));
file_delete(string_trim("clasweps/UltraSlug.png"));while (file_exists(string_trim("clasweps/UltraSlug.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSlug.png"), string_trim("clasweps/UltraSlug.png")));
file_delete(string_trim("clasweps/UltraSeeker.png"));while (file_exists(string_trim("clasweps/UltraSeeker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraSeeker.png"), string_trim("clasweps/UltraSeeker.png")));
file_delete(string_trim("clasweps/UltraRocketFlame.png"));while (file_exists(string_trim("clasweps/UltraRocketFlame.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraRocketFlame.png"), string_trim("clasweps/UltraRocketFlame.png")));
file_delete(string_trim("clasweps/UltraRocket.png"));while (file_exists(string_trim("clasweps/UltraRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraRocket.png"), string_trim("clasweps/UltraRocket.png")));
file_delete(string_trim("clasweps/UltraRifle.png"));while (file_exists(string_trim("clasweps/UltraRifle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraRifle.png"), string_trim("clasweps/UltraRifle.png")));
file_delete(string_trim("clasweps/UltraPop.png"));while (file_exists(string_trim("clasweps/UltraPop.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraPop.png"), string_trim("clasweps/UltraPop.png")));
file_delete(string_trim("clasweps/UltraPlasmaTrail.png"));while (file_exists(string_trim("clasweps/UltraPlasmaTrail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraPlasmaTrail.png"), string_trim("clasweps/UltraPlasmaTrail.png")));
file_delete(string_trim("clasweps/UltraPlasma.png"));while (file_exists(string_trim("clasweps/UltraPlasma.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraPlasma.png"), string_trim("clasweps/UltraPlasma.png")));
file_delete(string_trim("clasweps/UltraMainRocket.png"));while (file_exists(string_trim("clasweps/UltraMainRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraMainRocket.png"), string_trim("clasweps/UltraMainRocket.png")));
file_delete(string_trim("clasweps/UltraLightning.png"));while (file_exists(string_trim("clasweps/UltraLightning.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraLightning.png"), string_trim("clasweps/UltraLightning.png")));
file_delete(string_trim("clasweps/UltraFlamethrower.png"));while (file_exists(string_trim("clasweps/UltraFlamethrower.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraFlamethrower.png"), string_trim("clasweps/UltraFlamethrower.png")));
file_delete(string_trim("clasweps/UltraFlakBullet.png"));while (file_exists(string_trim("clasweps/UltraFlakBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraFlakBullet.png"), string_trim("clasweps/UltraFlakBullet.png")));
file_delete(string_trim("clasweps/UltraFlak.png"));while (file_exists(string_trim("clasweps/UltraFlak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraFlak.png"), string_trim("clasweps/UltraFlak.png")));
file_delete(string_trim("clasweps/UltraDisc.png"));while (file_exists(string_trim("clasweps/UltraDisc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/UltraDisc.png"), string_trim("clasweps/UltraDisc.png")));
file_delete(string_trim("clasweps/TurboRocket.png"));while (file_exists(string_trim("clasweps/TurboRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TurboRocket.png"), string_trim("clasweps/TurboRocket.png")));
file_delete(string_trim("clasweps/TurboLauncher.png"));while (file_exists(string_trim("clasweps/TurboLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TurboLauncher.png"), string_trim("clasweps/TurboLauncher.png")));
file_delete(string_trim("clasweps/TrueUltraSuperDiscGun.png"));while (file_exists(string_trim("clasweps/TrueUltraSuperDiscGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrueUltraSuperDiscGun.png"), string_trim("clasweps/TrueUltraSuperDiscGun.png")));
file_delete(string_trim("clasweps/TrailerPistol.png"));while (file_exists(string_trim("clasweps/TrailerPistol.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerPistol.png"), string_trim("clasweps/TrailerPistol.png")));
file_delete(string_trim("clasweps/TrailerGun.png"));while (file_exists(string_trim("clasweps/TrailerGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerGun.png"), string_trim("clasweps/TrailerGun.png")));
file_delete(string_trim("clasweps/TrailerCannon.png"));while (file_exists(string_trim("clasweps/TrailerCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/TrailerCannon.png"), string_trim("clasweps/TrailerCannon.png")));
file_delete(string_trim("clasweps/ToxinBaller.png"));while (file_exists(string_trim("clasweps/ToxinBaller.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxinBaller.png"), string_trim("clasweps/ToxinBaller.png")));
file_delete(string_trim("clasweps/Toxicball.png"));while (file_exists(string_trim("clasweps/Toxicball.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Toxicball.png"), string_trim("clasweps/Toxicball.png")));
file_delete(string_trim("clasweps/ToxicShotty.png"));while (file_exists(string_trim("clasweps/ToxicShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicShotty.png"), string_trim("clasweps/ToxicShotty.png")));
file_delete(string_trim("clasweps/ToxicRocket.png"));while (file_exists(string_trim("clasweps/ToxicRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicRocket.png"), string_trim("clasweps/ToxicRocket.png")));
file_delete(string_trim("clasweps/ToxicFlak.png"));while (file_exists(string_trim("clasweps/ToxicFlak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicFlak.png"), string_trim("clasweps/ToxicFlak.png")));
file_delete(string_trim("clasweps/ToxicDiscGun.png"));while (file_exists(string_trim("clasweps/ToxicDiscGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicDiscGun.png"), string_trim("clasweps/ToxicDiscGun.png")));
file_delete(string_trim("clasweps/ToxicDisc.png"));while (file_exists(string_trim("clasweps/ToxicDisc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicDisc.png"), string_trim("clasweps/ToxicDisc.png")));
file_delete(string_trim("clasweps/ToxicBlazer.png"));while (file_exists(string_trim("clasweps/ToxicBlazer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicBlazer.png"), string_trim("clasweps/ToxicBlazer.png")));
file_delete(string_trim("clasweps/ToxicBazooka.png"));while (file_exists(string_trim("clasweps/ToxicBazooka.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ToxicBazooka.png"), string_trim("clasweps/ToxicBazooka.png")));
file_delete(string_trim("clasweps/Torch.png"));while (file_exists(string_trim("clasweps/Torch.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Torch.png"), string_trim("clasweps/Torch.png")));
file_delete(string_trim("clasweps/ThroneGun.png"));while (file_exists(string_trim("clasweps/ThroneGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneGun.png"), string_trim("clasweps/ThroneGun.png")));
file_delete(string_trim("clasweps/ThroneCannon.png"));while (file_exists(string_trim("clasweps/ThroneCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneCannon.png"), string_trim("clasweps/ThroneCannon.png")));
file_delete(string_trim("clasweps/ThroneBeam.png"));while (file_exists(string_trim("clasweps/ThroneBeam.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ThroneBeam.png"), string_trim("clasweps/ThroneBeam.png")));
file_delete(string_trim("clasweps/SuperNukeLauncher.png"));while (file_exists(string_trim("clasweps/SuperNukeLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperNukeLauncher.png"), string_trim("clasweps/SuperNukeLauncher.png")));
file_delete(string_trim("clasweps/SuperIceFlakCannon.png"));while (file_exists(string_trim("clasweps/SuperIceFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperIceFlakCannon.png"), string_trim("clasweps/SuperIceFlakCannon.png")));
file_delete(string_trim("clasweps/SuperIceFlakBullet.png"));while (file_exists(string_trim("clasweps/SuperIceFlakBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperIceFlakBullet.png"), string_trim("clasweps/SuperIceFlakBullet.png")));
file_delete(string_trim("clasweps/SuperFocusedFlakCannon.png"));while (file_exists(string_trim("clasweps/SuperFocusedFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperFocusedFlakCannon.png"), string_trim("clasweps/SuperFocusedFlakCannon.png")));
file_delete(string_trim("clasweps/SuperBurstShotty.png"));while (file_exists(string_trim("clasweps/SuperBurstShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SuperBurstShotty.png"), string_trim("clasweps/SuperBurstShotty.png")));
file_delete(string_trim("clasweps/Super Laser Cannon.png"));while (file_exists(string_trim("clasweps/Super Laser Cannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Super Laser Cannon.png"), string_trim("clasweps/Super Laser Cannon.png")));
file_delete(string_trim("clasweps/Strikemarker.png"));while (file_exists(string_trim("clasweps/Strikemarker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Strikemarker.png"), string_trim("clasweps/Strikemarker.png")));
file_delete(string_trim("clasweps/SniperBullet.png"));while (file_exists(string_trim("clasweps/SniperBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SniperBullet.png"), string_trim("clasweps/SniperBullet.png")));
file_delete(string_trim("clasweps/Sniper.png"));while (file_exists(string_trim("clasweps/Sniper.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Sniper.png"), string_trim("clasweps/Sniper.png")));
file_delete(string_trim("clasweps/SlotMachine.png"));while (file_exists(string_trim("clasweps/SlotMachine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/SlotMachine.png"), string_trim("clasweps/SlotMachine.png")));
file_delete(string_trim("clasweps/ShineMask.png"));while (file_exists(string_trim("clasweps/ShineMask.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ShineMask.png"), string_trim("clasweps/ShineMask.png")));
file_delete(string_trim("clasweps/Shine.png"));while (file_exists(string_trim("clasweps/Shine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Shine.png"), string_trim("clasweps/Shine.png")));
file_delete(string_trim("clasweps/ScorpionArm.png"));while (file_exists(string_trim("clasweps/ScorpionArm.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ScorpionArm.png"), string_trim("clasweps/ScorpionArm.png")));
file_delete(string_trim("clasweps/Scorcher.png"));while (file_exists(string_trim("clasweps/Scorcher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Scorcher.png"), string_trim("clasweps/Scorcher.png")));
file_delete(string_trim("clasweps/Ricochetcrossbow.png"));while (file_exists(string_trim("clasweps/Ricochetcrossbow.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ricochetcrossbow.png"), string_trim("clasweps/Ricochetcrossbow.png")));
file_delete(string_trim("clasweps/Ricochetbolt.png"));while (file_exists(string_trim("clasweps/Ricochetbolt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ricochetbolt.png"), string_trim("clasweps/Ricochetbolt.png")));
file_delete(string_trim("clasweps/Reflector.png"));while (file_exists(string_trim("clasweps/Reflector.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Reflector.png"), string_trim("clasweps/Reflector.png")));
file_delete(string_trim("clasweps/RapidPistol.png"));while (file_exists(string_trim("clasweps/RapidPistol.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/RapidPistol.png"), string_trim("clasweps/RapidPistol.png")));
file_delete(string_trim("clasweps/RageBlaster.png"));while (file_exists(string_trim("clasweps/RageBlaster.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/RageBlaster.png"), string_trim("clasweps/RageBlaster.png")));
file_delete(string_trim("clasweps/RacingThoughtsIcon.png"));while (file_exists(string_trim("clasweps/RacingThoughtsIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/RacingThoughtsIcon.png"), string_trim("clasweps/RacingThoughtsIcon.png")));
file_delete(string_trim("clasweps/Quickdraw.png"));while (file_exists(string_trim("clasweps/Quickdraw.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Quickdraw.png"), string_trim("clasweps/Quickdraw.png")));
file_delete(string_trim("clasweps/PopoZapper.png"));while (file_exists(string_trim("clasweps/PopoZapper.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoZapper.png"), string_trim("clasweps/PopoZapper.png")));
file_delete(string_trim("clasweps/PopoSpreader.png"));while (file_exists(string_trim("clasweps/PopoSpreader.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoSpreader.png"), string_trim("clasweps/PopoSpreader.png")));
file_delete(string_trim("clasweps/PopoScorcher.png"));while (file_exists(string_trim("clasweps/PopoScorcher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoScorcher.png"), string_trim("clasweps/PopoScorcher.png")));
file_delete(string_trim("clasweps/PopoSMG.png"));while (file_exists(string_trim("clasweps/PopoSMG.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoSMG.png"), string_trim("clasweps/PopoSMG.png")));
file_delete(string_trim("clasweps/PopoRevolver.png"));while (file_exists(string_trim("clasweps/PopoRevolver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoRevolver.png"), string_trim("clasweps/PopoRevolver.png")));
file_delete(string_trim("clasweps/PopoGuider.png"));while (file_exists(string_trim("clasweps/PopoGuider.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoGuider.png"), string_trim("clasweps/PopoGuider.png")));
file_delete(string_trim("clasweps/PopoGenocide.png"));while (file_exists(string_trim("clasweps/PopoGenocide.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoGenocide.png"), string_trim("clasweps/PopoGenocide.png")));
file_delete(string_trim("clasweps/PopoFireballer.png"));while (file_exists(string_trim("clasweps/PopoFireballer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoFireballer.png"), string_trim("clasweps/PopoFireballer.png")));
file_delete(string_trim("clasweps/PopoFireball.png"));while (file_exists(string_trim("clasweps/PopoFireball.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoFireball.png"), string_trim("clasweps/PopoFireball.png")));
file_delete(string_trim("clasweps/PopoExplosiongun.png"));while (file_exists(string_trim("clasweps/PopoExplosiongun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoExplosiongun.png"), string_trim("clasweps/PopoExplosiongun.png")));
file_delete(string_trim("clasweps/PopoCharger.png"));while (file_exists(string_trim("clasweps/PopoCharger.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoCharger.png"), string_trim("clasweps/PopoCharger.png")));
file_delete(string_trim("clasweps/PopoBurstShotty.png"));while (file_exists(string_trim("clasweps/PopoBurstShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoBurstShotty.png"), string_trim("clasweps/PopoBurstShotty.png")));
file_delete(string_trim("clasweps/PopoBads.png"));while (file_exists(string_trim("clasweps/PopoBads.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PopoBads.png"), string_trim("clasweps/PopoBads.png")));
file_delete(string_trim("clasweps/PlasmaShotty.png"));while (file_exists(string_trim("clasweps/PlasmaShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaShotty.png"), string_trim("clasweps/PlasmaShotty.png")));
file_delete(string_trim("clasweps/PlasmaRocket.png"));while (file_exists(string_trim("clasweps/PlasmaRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaRocket.png"), string_trim("clasweps/PlasmaRocket.png")));
file_delete(string_trim("clasweps/PlasmaNukeLauncher.png"));while (file_exists(string_trim("clasweps/PlasmaNukeLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaNukeLauncher.png"), string_trim("clasweps/PlasmaNukeLauncher.png")));
file_delete(string_trim("clasweps/PlasmaNuke.png"));while (file_exists(string_trim("clasweps/PlasmaNuke.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaNuke.png"), string_trim("clasweps/PlasmaNuke.png")));
file_delete(string_trim("clasweps/PlasmaFlak.png"));while (file_exists(string_trim("clasweps/PlasmaFlak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaFlak.png"), string_trim("clasweps/PlasmaFlak.png")));
file_delete(string_trim("clasweps/PlasmaBazooka.png"));while (file_exists(string_trim("clasweps/PlasmaBazooka.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/PlasmaBazooka.png"), string_trim("clasweps/PlasmaBazooka.png")));
file_delete(string_trim("clasweps/OmegaRevolver.png"));while (file_exists(string_trim("clasweps/OmegaRevolver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/OmegaRevolver.png"), string_trim("clasweps/OmegaRevolver.png")));
file_delete(string_trim("clasweps/NecroMachine.png"));while (file_exists(string_trim("clasweps/NecroMachine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/NecroMachine.png"), string_trim("clasweps/NecroMachine.png")));
file_delete(string_trim("clasweps/NecroAllyRez.png"));while (file_exists(string_trim("clasweps/NecroAllyRez.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/NecroAllyRez.png"), string_trim("clasweps/NecroAllyRez.png")));
file_delete(string_trim("clasweps/NecroAllyArea.png"));while (file_exists(string_trim("clasweps/NecroAllyArea.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/NecroAllyArea.png"), string_trim("clasweps/NecroAllyArea.png")));
file_delete(string_trim("clasweps/Multislicer.gif"));while (file_exists(string_trim("clasweps/Multislicer.gif"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Multislicer.gif"), string_trim("clasweps/Multislicer.gif")));
file_delete(string_trim("clasweps/MiniNukeLauncher.png"));while (file_exists(string_trim("clasweps/MiniNukeLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniNukeLauncher.png"), string_trim("clasweps/MiniNukeLauncher.png")));
file_delete(string_trim("clasweps/MiniNuke.png"));while (file_exists(string_trim("clasweps/MiniNuke.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniNuke.png"), string_trim("clasweps/MiniNuke.png")));
file_delete(string_trim("clasweps/MiniMineBlink.png"));while (file_exists(string_trim("clasweps/MiniMineBlink.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniMineBlink.png"), string_trim("clasweps/MiniMineBlink.png")));
file_delete(string_trim("clasweps/MiniMine.png"));while (file_exists(string_trim("clasweps/MiniMine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniMine.png"), string_trim("clasweps/MiniMine.png")));
file_delete(string_trim("clasweps/MiniGrenadeGatling.png"));while (file_exists(string_trim("clasweps/MiniGrenadeGatling.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MiniGrenadeGatling.png"), string_trim("clasweps/MiniGrenadeGatling.png")));
file_delete(string_trim("clasweps/MineShotgun.png"));while (file_exists(string_trim("clasweps/MineShotgun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MineShotgun.png"), string_trim("clasweps/MineShotgun.png")));
file_delete(string_trim("clasweps/MineLaunchr.png"));while (file_exists(string_trim("clasweps/MineLaunchr.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MineLaunchr.png"), string_trim("clasweps/MineLaunchr.png")));
file_delete(string_trim("clasweps/Mine.png"));while (file_exists(string_trim("clasweps/Mine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Mine.png"), string_trim("clasweps/Mine.png")));
file_delete(string_trim("clasweps/MegaNukeLauncher.png"));while (file_exists(string_trim("clasweps/MegaNukeLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MegaNukeLauncher.png"), string_trim("clasweps/MegaNukeLauncher.png")));
file_delete(string_trim("clasweps/MegaNuke.png"));while (file_exists(string_trim("clasweps/MegaNuke.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/MegaNuke.png"), string_trim("clasweps/MegaNuke.png")));
file_delete(string_trim("clasweps/LilGunther.png"));while (file_exists(string_trim("clasweps/LilGunther.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LilGunther.png"), string_trim("clasweps/LilGunther.png")));
file_delete(string_trim("clasweps/LightningWrench.png"));while (file_exists(string_trim("clasweps/LightningWrench.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LightningWrench.png"), string_trim("clasweps/LightningWrench.png")));
file_delete(string_trim("clasweps/LightningScrewdriver.png"));while (file_exists(string_trim("clasweps/LightningScrewdriver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LightningScrewdriver.png"), string_trim("clasweps/LightningScrewdriver.png")));
file_delete(string_trim("clasweps/LightningFlakCannon.png"));while (file_exists(string_trim("clasweps/LightningFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LightningFlakCannon.png"), string_trim("clasweps/LightningFlakCannon.png")));
file_delete(string_trim("clasweps/LaserWave.png"));while (file_exists(string_trim("clasweps/LaserWave.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LaserWave.png"), string_trim("clasweps/LaserWave.png")));
file_delete(string_trim("clasweps/LULDisc.png"));while (file_exists(string_trim("clasweps/LULDisc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/LULDisc.png"), string_trim("clasweps/LULDisc.png")));
file_delete(string_trim("clasweps/KirbyHammer.png"));while (file_exists(string_trim("clasweps/KirbyHammer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/KirbyHammer.png"), string_trim("clasweps/KirbyHammer.png")));
file_delete(string_trim("clasweps/KingBladeSword.png"));while (file_exists(string_trim("clasweps/KingBladeSword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/KingBladeSword.png"), string_trim("clasweps/KingBladeSword.png")));
file_delete(string_trim("clasweps/KingBladeGhost.png"));while (file_exists(string_trim("clasweps/KingBladeGhost.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/KingBladeGhost.png"), string_trim("clasweps/KingBladeGhost.png")));
file_delete(string_trim("clasweps/Jab.png"));while (file_exists(string_trim("clasweps/Jab.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Jab.png"), string_trim("clasweps/Jab.png")));
file_delete(string_trim("clasweps/InvCrystalGun.png"));while (file_exists(string_trim("clasweps/InvCrystalGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/InvCrystalGun.png"), string_trim("clasweps/InvCrystalGun.png")));
file_delete(string_trim("clasweps/IceSlugger.png"));while (file_exists(string_trim("clasweps/IceSlugger.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceSlugger.png"), string_trim("clasweps/IceSlugger.png")));
file_delete(string_trim("clasweps/IceSlugHit.png"));while (file_exists(string_trim("clasweps/IceSlugHit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceSlugHit.png"), string_trim("clasweps/IceSlugHit.png")));
file_delete(string_trim("clasweps/IceSlugDissapear.png"));while (file_exists(string_trim("clasweps/IceSlugDissapear.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceSlugDissapear.png"), string_trim("clasweps/IceSlugDissapear.png")));
file_delete(string_trim("clasweps/IceSlug.png"));while (file_exists(string_trim("clasweps/IceSlug.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceSlug.png"), string_trim("clasweps/IceSlug.png")));
file_delete(string_trim("clasweps/IceShot.png"));while (file_exists(string_trim("clasweps/IceShot.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceShot.png"), string_trim("clasweps/IceShot.png")));
file_delete(string_trim("clasweps/IceShellHit.png"));while (file_exists(string_trim("clasweps/IceShellHit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceShellHit.png"), string_trim("clasweps/IceShellHit.png")));
file_delete(string_trim("clasweps/IceShellDissapear.png"));while (file_exists(string_trim("clasweps/IceShellDissapear.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceShellDissapear.png"), string_trim("clasweps/IceShellDissapear.png")));
file_delete(string_trim("clasweps/IceShell.png"));while (file_exists(string_trim("clasweps/IceShell.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceShell.png"), string_trim("clasweps/IceShell.png")));
file_delete(string_trim("clasweps/IceShard.png"));while (file_exists(string_trim("clasweps/IceShard.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceShard.png"), string_trim("clasweps/IceShard.png")));
file_delete(string_trim("clasweps/IceFlakCannon.png"));while (file_exists(string_trim("clasweps/IceFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceFlakCannon.png"), string_trim("clasweps/IceFlakCannon.png")));
file_delete(string_trim("clasweps/IceFlakBullet.png"));while (file_exists(string_trim("clasweps/IceFlakBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceFlakBullet.png"), string_trim("clasweps/IceFlakBullet.png")));
file_delete(string_trim("clasweps/IceCannon.png"));while (file_exists(string_trim("clasweps/IceCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/IceCannon.png"), string_trim("clasweps/IceCannon.png")));
file_delete(string_trim("clasweps/Hyper_Revolver.png"));while (file_exists(string_trim("clasweps/Hyper_Revolver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Hyper_Revolver.png"), string_trim("clasweps/Hyper_Revolver.png")));
file_delete(string_trim("clasweps/HyperShotty.png"));while (file_exists(string_trim("clasweps/HyperShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HyperShotty.png"), string_trim("clasweps/HyperShotty.png")));
file_delete(string_trim("clasweps/HyperFlaregun.png"));while (file_exists(string_trim("clasweps/HyperFlaregun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HyperFlaregun.png"), string_trim("clasweps/HyperFlaregun.png")));
file_delete(string_trim("clasweps/HyperFlakCannon.png"));while (file_exists(string_trim("clasweps/HyperFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HyperFlakCannon.png"), string_trim("clasweps/HyperFlakCannon.png")));
file_delete(string_trim("clasweps/HuntingRifle.png"));while (file_exists(string_trim("clasweps/HuntingRifle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HuntingRifle.png"), string_trim("clasweps/HuntingRifle.png")));
file_delete(string_trim("clasweps/Hellfire.png"));while (file_exists(string_trim("clasweps/Hellfire.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Hellfire.png"), string_trim("clasweps/Hellfire.png")));
file_delete(string_trim("clasweps/Heavystrikemarker.png"));while (file_exists(string_trim("clasweps/Heavystrikemarker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Heavystrikemarker.png"), string_trim("clasweps/Heavystrikemarker.png")));
file_delete(string_trim("clasweps/HeavyWaveGun.png"));while (file_exists(string_trim("clasweps/HeavyWaveGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyWaveGun.png"), string_trim("clasweps/HeavyWaveGun.png")));
file_delete(string_trim("clasweps/HeavyStriker.png"));while (file_exists(string_trim("clasweps/HeavyStriker.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyStriker.png"), string_trim("clasweps/HeavyStriker.png")));
file_delete(string_trim("clasweps/HeavySMG.png"));while (file_exists(string_trim("clasweps/HeavySMG.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavySMG.png"), string_trim("clasweps/HeavySMG.png")));
file_delete(string_trim("clasweps/HeavyLaser.png"));while (file_exists(string_trim("clasweps/HeavyLaser.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyLaser.png"), string_trim("clasweps/HeavyLaser.png")));
file_delete(string_trim("clasweps/HeavyJab.png"));while (file_exists(string_trim("clasweps/HeavyJab.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyJab.png"), string_trim("clasweps/HeavyJab.png")));
file_delete(string_trim("clasweps/HeavyGlove.png"));while (file_exists(string_trim("clasweps/HeavyGlove.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyGlove.png"), string_trim("clasweps/HeavyGlove.png")));
file_delete(string_trim("clasweps/HeavyFlaregun.png"));while (file_exists(string_trim("clasweps/HeavyFlaregun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyFlaregun.png"), string_trim("clasweps/HeavyFlaregun.png")));
file_delete(string_trim("clasweps/HeavyFlare.png"));while (file_exists(string_trim("clasweps/HeavyFlare.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyFlare.png"), string_trim("clasweps/HeavyFlare.png")));
file_delete(string_trim("clasweps/HeavyFlak.png"));while (file_exists(string_trim("clasweps/HeavyFlak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/HeavyFlak.png"), string_trim("clasweps/HeavyFlak.png")));
file_delete(string_trim("clasweps/Heavy shotty.png"));while (file_exists(string_trim("clasweps/Heavy shotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Heavy shotty.png"), string_trim("clasweps/Heavy shotty.png")));
file_delete(string_trim("clasweps/GuidedShotty.png"));while (file_exists(string_trim("clasweps/GuidedShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuidedShotty.png"), string_trim("clasweps/GuidedShotty.png")));
file_delete(string_trim("clasweps/GuidedPistol.png"));while (file_exists(string_trim("clasweps/GuidedPistol.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuidedPistol.png"), string_trim("clasweps/GuidedPistol.png")));
file_delete(string_trim("clasweps/GuidedMinigun.png"));while (file_exists(string_trim("clasweps/GuidedMinigun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuidedMinigun.png"), string_trim("clasweps/GuidedMinigun.png")));
file_delete(string_trim("clasweps/GuidedBlaster.png"));while (file_exists(string_trim("clasweps/GuidedBlaster.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GuidedBlaster.png"), string_trim("clasweps/GuidedBlaster.png")));
file_delete(string_trim("clasweps/Greensmallexplosion.png"));while (file_exists(string_trim("clasweps/Greensmallexplosion.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Greensmallexplosion.png"), string_trim("clasweps/Greensmallexplosion.png")));
file_delete(string_trim("clasweps/GoldenFireballer.png"));while (file_exists(string_trim("clasweps/GoldenFireballer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GoldenFireballer.png"), string_trim("clasweps/GoldenFireballer.png")));
file_delete(string_trim("clasweps/GoldenBlazer.png"));while (file_exists(string_trim("clasweps/GoldenBlazer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GoldenBlazer.png"), string_trim("clasweps/GoldenBlazer.png")));
file_delete(string_trim("clasweps/GoldScorpionArm.png"));while (file_exists(string_trim("clasweps/GoldScorpionArm.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GoldScorpionArm.png"), string_trim("clasweps/GoldScorpionArm.png")));
file_delete(string_trim("clasweps/GigaHammer.png"));while (file_exists(string_trim("clasweps/GigaHammer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GigaHammer.png"), string_trim("clasweps/GigaHammer.png")));
file_delete(string_trim("clasweps/Genocide.png"));while (file_exists(string_trim("clasweps/Genocide.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Genocide.png"), string_trim("clasweps/Genocide.png")));
file_delete(string_trim("clasweps/GatlingSplinter.png"));while (file_exists(string_trim("clasweps/GatlingSplinter.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GatlingSplinter.png"), string_trim("clasweps/GatlingSplinter.png")));
file_delete(string_trim("clasweps/GatlingLauncher.png"));while (file_exists(string_trim("clasweps/GatlingLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/GatlingLauncher.png"), string_trim("clasweps/GatlingLauncher.png")));
file_delete(string_trim("clasweps/FocusedFlakCannon.png"));while (file_exists(string_trim("clasweps/FocusedFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/FocusedFlakCannon.png"), string_trim("clasweps/FocusedFlakCannon.png")));
file_delete(string_trim("clasweps/FocusShotgun.png"));while (file_exists(string_trim("clasweps/FocusShotgun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/FocusShotgun.png"), string_trim("clasweps/FocusShotgun.png")));
file_delete(string_trim("clasweps/FlameSword.png"));while (file_exists(string_trim("clasweps/FlameSword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/FlameSword.png"), string_trim("clasweps/FlameSword.png")));
file_delete(string_trim("clasweps/Fireballer.png"));while (file_exists(string_trim("clasweps/Fireballer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Fireballer.png"), string_trim("clasweps/Fireballer.png")));
file_delete(string_trim("clasweps/Explosiongun.png"));while (file_exists(string_trim("clasweps/Explosiongun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Explosiongun.png"), string_trim("clasweps/Explosiongun.png")));
file_delete(string_trim("clasweps/ExplosionPistol.png"));while (file_exists(string_trim("clasweps/ExplosionPistol.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ExplosionPistol.png"), string_trim("clasweps/ExplosionPistol.png")));
file_delete(string_trim("clasweps/ExecutionerHand.png"));while (file_exists(string_trim("clasweps/ExecutionerHand.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ExecutionerHand.png"), string_trim("clasweps/ExecutionerHand.png")));
file_delete(string_trim("clasweps/Executioner.png"));while (file_exists(string_trim("clasweps/Executioner.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Executioner.png"), string_trim("clasweps/Executioner.png")));
file_delete(string_trim("clasweps/Evilsbanebeam.png"));while (file_exists(string_trim("clasweps/Evilsbanebeam.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Evilsbanebeam.png"), string_trim("clasweps/Evilsbanebeam.png")));
file_delete(string_trim("clasweps/Energy Wrench.png"));while (file_exists(string_trim("clasweps/Energy Wrench.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Energy Wrench.png"), string_trim("clasweps/Energy Wrench.png")));
file_delete(string_trim("clasweps/Energy Shovel.png"));while (file_exists(string_trim("clasweps/Energy Shovel.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Energy Shovel.png"), string_trim("clasweps/Energy Shovel.png")));
file_delete(string_trim("clasweps/Energy Jackhammer.png"));while (file_exists(string_trim("clasweps/Energy Jackhammer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Energy Jackhammer.png"), string_trim("clasweps/Energy Jackhammer.png")));
file_delete(string_trim("clasweps/DoubleIceShot.png"));while (file_exists(string_trim("clasweps/DoubleIceShot.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DoubleIceShot.png"), string_trim("clasweps/DoubleIceShot.png")));
file_delete(string_trim("clasweps/DogHead.png"));while (file_exists(string_trim("clasweps/DogHead.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DogHead.png"), string_trim("clasweps/DogHead.png")));
file_delete(string_trim("clasweps/DemolitionsLauncher.png"));while (file_exists(string_trim("clasweps/DemolitionsLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DemolitionsLauncher.png"), string_trim("clasweps/DemolitionsLauncher.png")));
file_delete(string_trim("clasweps/Demolitionbomb.png"));while (file_exists(string_trim("clasweps/Demolitionbomb.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Demolitionbomb.png"), string_trim("clasweps/Demolitionbomb.png")));
file_delete(string_trim("clasweps/DartlingGun.png"));while (file_exists(string_trim("clasweps/DartlingGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DartlingGun.png"), string_trim("clasweps/DartlingGun.png")));
file_delete(string_trim("clasweps/DartGun.png"));while (file_exists(string_trim("clasweps/DartGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/DartGun.png"), string_trim("clasweps/DartGun.png")));
file_delete(string_trim("clasweps/Dart.png"));while (file_exists(string_trim("clasweps/Dart.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Dart.png"), string_trim("clasweps/Dart.png")));
file_delete(string_trim("clasweps/CrystalGun.png"));while (file_exists(string_trim("clasweps/CrystalGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/CrystalGun.png"), string_trim("clasweps/CrystalGun.png")));
file_delete(string_trim("clasweps/ChimeraShell.png"));while (file_exists(string_trim("clasweps/ChimeraShell.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChimeraShell.png"), string_trim("clasweps/ChimeraShell.png")));
file_delete(string_trim("clasweps/ChimeraExplosive.png"));while (file_exists(string_trim("clasweps/ChimeraExplosive.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChimeraExplosive.png"), string_trim("clasweps/ChimeraExplosive.png")));
file_delete(string_trim("clasweps/ChimeraEnergy.png"));while (file_exists(string_trim("clasweps/ChimeraEnergy.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChimeraEnergy.png"), string_trim("clasweps/ChimeraEnergy.png")));
file_delete(string_trim("clasweps/ChimeraBullet.png"));while (file_exists(string_trim("clasweps/ChimeraBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChimeraBullet.png"), string_trim("clasweps/ChimeraBullet.png")));
file_delete(string_trim("clasweps/ChimeraBolt.png"));while (file_exists(string_trim("clasweps/ChimeraBolt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChimeraBolt.png"), string_trim("clasweps/ChimeraBolt.png")));
file_delete(string_trim("clasweps/ChargeSlugger.png"));while (file_exists(string_trim("clasweps/ChargeSlugger.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeSlugger.png"), string_trim("clasweps/ChargeSlugger.png")));
file_delete(string_trim("clasweps/ChargePlasmagun.png"));while (file_exists(string_trim("clasweps/ChargePlasmagun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargePlasmagun.png"), string_trim("clasweps/ChargePlasmagun.png")));
file_delete(string_trim("clasweps/ChargeLaser.png"));while (file_exists(string_trim("clasweps/ChargeLaser.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeLaser.png"), string_trim("clasweps/ChargeLaser.png")));
file_delete(string_trim("clasweps/ChargeGun.png"));while (file_exists(string_trim("clasweps/ChargeGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeGun.png"), string_trim("clasweps/ChargeGun.png")));
file_delete(string_trim("clasweps/ChargeFlamethrower.png"));while (file_exists(string_trim("clasweps/ChargeFlamethrower.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeFlamethrower.png"), string_trim("clasweps/ChargeFlamethrower.png")));
file_delete(string_trim("clasweps/ChargeFlakCannon.png"));while (file_exists(string_trim("clasweps/ChargeFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeFlakCannon.png"), string_trim("clasweps/ChargeFlakCannon.png")));
file_delete(string_trim("clasweps/ChargeDiscGun.png"));while (file_exists(string_trim("clasweps/ChargeDiscGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeDiscGun.png"), string_trim("clasweps/ChargeDiscGun.png")));
file_delete(string_trim("clasweps/ChargeCrossbow.png"));while (file_exists(string_trim("clasweps/ChargeCrossbow.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeCrossbow.png"), string_trim("clasweps/ChargeCrossbow.png")));
file_delete(string_trim("clasweps/ChargeBlade.png"));while (file_exists(string_trim("clasweps/ChargeBlade.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeBlade.png"), string_trim("clasweps/ChargeBlade.png")));
file_delete(string_trim("clasweps/ChargeBazooka.png"));while (file_exists(string_trim("clasweps/ChargeBazooka.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/ChargeBazooka.png"), string_trim("clasweps/ChargeBazooka.png")));
file_delete(string_trim("clasweps/Casey.png"));while (file_exists(string_trim("clasweps/Casey.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Casey.png"), string_trim("clasweps/Casey.png")));
file_delete(string_trim("clasweps/Cannon.png"));while (file_exists(string_trim("clasweps/Cannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Cannon.png"), string_trim("clasweps/Cannon.png")));
file_delete(string_trim("clasweps/BusterGun.png"));while (file_exists(string_trim("clasweps/BusterGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BusterGun.png"), string_trim("clasweps/BusterGun.png")));
file_delete(string_trim("clasweps/BurstShotty.png"));while (file_exists(string_trim("clasweps/BurstShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BurstShotty.png"), string_trim("clasweps/BurstShotty.png")));
file_delete(string_trim("clasweps/BrokenFlakCannon.png"));while (file_exists(string_trim("clasweps/BrokenFlakCannon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BrokenFlakCannon.png"), string_trim("clasweps/BrokenFlakCannon.png")));
file_delete(string_trim("clasweps/BoxingGlove.png"));while (file_exists(string_trim("clasweps/BoxingGlove.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BoxingGlove.png"), string_trim("clasweps/BoxingGlove.png")));
file_delete(string_trim("clasweps/Bouncer Flak.png"));while (file_exists(string_trim("clasweps/Bouncer Flak.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Bouncer Flak.png"), string_trim("clasweps/Bouncer Flak.png")));
file_delete(string_trim("clasweps/BluntHammer.png"));while (file_exists(string_trim("clasweps/BluntHammer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BluntHammer.png"), string_trim("clasweps/BluntHammer.png")));
file_delete(string_trim("clasweps/BloodyTrail.png"));while (file_exists(string_trim("clasweps/BloodyTrail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodyTrail.png"), string_trim("clasweps/BloodyTrail.png")));
file_delete(string_trim("clasweps/BloodyRifle.png"));while (file_exists(string_trim("clasweps/BloodyRifle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodyRifle.png"), string_trim("clasweps/BloodyRifle.png")));
file_delete(string_trim("clasweps/BloodyRevolver.png"));while (file_exists(string_trim("clasweps/BloodyRevolver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodyRevolver.png"), string_trim("clasweps/BloodyRevolver.png")));
file_delete(string_trim("clasweps/BloodyBullet.png"));while (file_exists(string_trim("clasweps/BloodyBullet.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodyBullet.png"), string_trim("clasweps/BloodyBullet.png")));
file_delete(string_trim("clasweps/BloodsuckerProj.png"));while (file_exists(string_trim("clasweps/BloodsuckerProj.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodsuckerProj.png"), string_trim("clasweps/BloodsuckerProj.png")));
file_delete(string_trim("clasweps/Bloodballer.png"));while (file_exists(string_trim("clasweps/Bloodballer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Bloodballer.png"), string_trim("clasweps/Bloodballer.png")));
file_delete(string_trim("clasweps/Bloodball.png"));while (file_exists(string_trim("clasweps/Bloodball.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Bloodball.png"), string_trim("clasweps/Bloodball.png")));
file_delete(string_trim("clasweps/BloodMineLauncher.png"));while (file_exists(string_trim("clasweps/BloodMineLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodMineLauncher.png"), string_trim("clasweps/BloodMineLauncher.png")));
file_delete(string_trim("clasweps/BloodMine.png"));while (file_exists(string_trim("clasweps/BloodMine.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodMine.png"), string_trim("clasweps/BloodMine.png")));
file_delete(string_trim("clasweps/BloodGenocide.png"));while (file_exists(string_trim("clasweps/BloodGenocide.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodGenocide.png"), string_trim("clasweps/BloodGenocide.png")));
file_delete(string_trim("clasweps/BloodFlame.png"));while (file_exists(string_trim("clasweps/BloodFlame.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodFlame.png"), string_trim("clasweps/BloodFlame.png")));
file_delete(string_trim("clasweps/BloodExplosionGun.png"));while (file_exists(string_trim("clasweps/BloodExplosionGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BloodExplosionGun.png"), string_trim("clasweps/BloodExplosionGun.png")));
file_delete(string_trim("clasweps/BlinkSword.png"));while (file_exists(string_trim("clasweps/BlinkSword.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BlinkSword.png"), string_trim("clasweps/BlinkSword.png")));
file_delete(string_trim("clasweps/Blazer.png"));while (file_exists(string_trim("clasweps/Blazer.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Blazer.png"), string_trim("clasweps/Blazer.png")));
file_delete(string_trim("clasweps/BigBlaster.png"));while (file_exists(string_trim("clasweps/BigBlaster.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BigBlaster.png"), string_trim("clasweps/BigBlaster.png")));
file_delete(string_trim("clasweps/Battleshovel.png"));while (file_exists(string_trim("clasweps/Battleshovel.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Battleshovel.png"), string_trim("clasweps/Battleshovel.png")));
file_delete(string_trim("clasweps/BanditBlaster.png"));while (file_exists(string_trim("clasweps/BanditBlaster.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BanditBlaster.png"), string_trim("clasweps/BanditBlaster.png")));
file_delete(string_trim("clasweps/BallMomBlaster.png"));while (file_exists(string_trim("clasweps/BallMomBlaster.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BallMomBlaster.png"), string_trim("clasweps/BallMomBlaster.png")));
file_delete(string_trim("clasweps/BADSRocket.png"));while (file_exists(string_trim("clasweps/BADSRocket.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/BADSRocket.png"), string_trim("clasweps/BADSRocket.png")));
file_delete(string_trim("clasweps/AutoIceShot.png"));while (file_exists(string_trim("clasweps/AutoIceShot.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/AutoIceShot.png"), string_trim("clasweps/AutoIceShot.png")));
file_delete(string_trim("clasweps/AutoBurstShotty.png"));while (file_exists(string_trim("clasweps/AutoBurstShotty.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/AutoBurstShotty.png"), string_trim("clasweps/AutoBurstShotty.png")));
file_delete(string_trim("clasweps/AceLauncher.png"));while (file_exists(string_trim("clasweps/AceLauncher.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/AceLauncher.png"), string_trim("clasweps/AceLauncher.png")));
file_delete(string_trim("clasweps/Ace.png"));while (file_exists(string_trim("clasweps/Ace.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/Ace.png"), string_trim("clasweps/Ace.png")));
file_delete(string_trim("clasweps/AccuserHand.png"));while (file_exists(string_trim("clasweps/AccuserHand.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/clasweps/AccuserHand.png"), string_trim("clasweps/AccuserHand.png")));
file_delete(string_trim("Auto_Bullet_Shotgun.wep.gml"));while (file_exists(string_trim("Auto_Bullet_Shotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Auto_Bullet_Shotgun.wep.gml"), string_trim("Auto_Bullet_Shotgun.wep.gml")));
file_delete(string_trim("devastator.mod.gml"));while (file_exists(string_trim("devastator.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/devastator.mod.gml"), string_trim("devastator.mod.gml")));
file_delete(string_trim("coolerhud.mod.gml"));while (file_exists(string_trim("coolerhud.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/coolerhud.mod.gml"), string_trim("coolerhud.mod.gml")));
while (!file_loaded(string_trim("balls/balls.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("balls/laserwrench.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball1.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball2.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball3.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball4.ogg"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/widesword.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultrasuperdiscgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultrasplinter.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraseeker.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultrarifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultrapopgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraplasmagun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultralightning.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultradiscgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/torch.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/swiftsword.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/splintergatling.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/snl.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/slc.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/shrineroom.area.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/shine.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/scorpionarm.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/scorcher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ringofplasma.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ringoffire.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/racingthoughts.skill.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/quickdraw.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/plasmashotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/orbitalstriker.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/orbitalbarrage.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/multislicer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/multiflakcannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/longsword.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/lightningscrew.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/lightningflak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/kirbyhammer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/iceslugger.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/iceshotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/hypershotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/hyperrevolver.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/hyperflare.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/hyperflak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/heavywave.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/heavystriker.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/heavyshovel.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/heavyshot.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/goldscorpionarm.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/goldenblazer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/funnyxd.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/executioner.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/evilsbane.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/energywrench.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/energyshovel.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/energyjackhammer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/enemyloot.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/doubleiceshotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/doghead.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/slots.crown.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Slaughter.crown.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Pain.crown.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Choice.crown.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/claswepsshit.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/chimerashell.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/chimeraexplosive.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/chimeraenergy.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/chimerabullet.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/chimerabolt.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/catalyst.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/casey.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/cannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/brokenflak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/bossintros.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/bloodyrifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/bloodyrevolver.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/blazer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/battleshovel.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/autoiceshotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/autoburstshotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ZapMachineGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap shotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap gun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap Cannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ultraflamethrower.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSlug.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraBazook.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TurboLauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerPistol.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerCannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Toxinballer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicDiscGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicBlazer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicBazooka.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneCannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneBeam.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperIceFlakCannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperFocusedFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperBurstShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Sniper.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SlotMachine.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ricochetcrossbow.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/RapidPistol.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/RageBlaster.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Poposcorcher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoZapper.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoSpreader.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoSMG.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoRevolver.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoGuider.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoGenocide.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoFireballer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoExplosionGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoCharger.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoBurstShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoBADS.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaNuker.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaBazooka.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/OmegaRevolver.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/NecroMachine.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniNukeLauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MineShotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MineLauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MegaNuker.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LilGunther.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LightningWrench.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Laserwave.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/KingBlade.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/InvCrystalLaser.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceFlakCannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceCannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HuntingRifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Hellfire.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavySMG.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyLaser.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyGlove.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyFlare.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuiderShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuiderPistol.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuiderMinigun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuiderBlaster.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GoldenFireballer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GigaHammer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Genocide.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GatlingNader.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GatlingMiniNader.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/FocusedFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/FocusShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Flamesword.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Fireballer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ExplosionPistol.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ExplosionGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DemolitionsLauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DartlingGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DartGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/CrystalLaser.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeSlugger.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargePlasma.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeLaser.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeFlamethrower.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeDisc.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeCrossbow.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeBlade.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeBazooka.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BusterGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BurstShotty.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BoxingGlove.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BouncerFlak.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BluntHammer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Bloodballer.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodMineLauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodGenocide.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodExplosionGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BlinkSword.Wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BigBlaster.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BanditBlaster.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BallMomBlaster.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BADS.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Acelauncher.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/AccuserHand.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/widesword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraseekerpro.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraplasmaproj.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraplasmaimpact.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultramegaseeker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ultraflame.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/thoughtslightning.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/swiftsword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/sprBaseball.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/shine.ogg"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ringofplasma.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ringoffire.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/racingthoughtsbutton.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/orbitalstriker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/orbitalbarrage.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/multiflakcannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/longsword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/lightningshank.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/lightningflak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/heavy shovel.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/evilsbane.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Crown of Slots.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Crown of Slaughter.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/Crown of Pain.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/ChoiceBuddyWalk.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/crowns/ChoiceBuddyIdle.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/catalyst.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/bulletcannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/barragemarker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/bads.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ZapSlug.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ZapMG.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ZapBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap Shotgun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap Gun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Zap Cannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ultrasuperdiscgun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraslugDissapear.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ultradiscgun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ultrabazooka.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSuperDisc.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSplinterPro.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSplinter.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSmoke.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSlugger.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSlugHit.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSlug.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraSeeker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraRocketFlame.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraRifle.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraPop.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraPlasmaTrail.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraPlasma.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraMainRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraLightning.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraFlamethrower.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraFlakBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraFlak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/UltraDisc.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TurboRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TurboLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrueUltraSuperDiscGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerPistol.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/TrailerCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxinBaller.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Toxicball.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicFlak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicDiscGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicDisc.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicBlazer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ToxicBazooka.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Torch.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ThroneBeam.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperNukeLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperIceFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperIceFlakBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperFocusedFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SuperBurstShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Super Laser Cannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Strikemarker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SniperBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Sniper.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/SlotMachine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ShineMask.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Shine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ScorpionArm.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Scorcher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ricochetcrossbow.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ricochetbolt.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Reflector.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/RapidPistol.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/RageBlaster.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/RacingThoughtsIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Quickdraw.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoZapper.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoSpreader.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoScorcher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoSMG.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoRevolver.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoGuider.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoGenocide.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoFireballer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoFireball.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoExplosiongun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoCharger.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoBurstShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PopoBads.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaNukeLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaNuke.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaFlak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/PlasmaBazooka.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/OmegaRevolver.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/NecroMachine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/NecroAllyRez.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/NecroAllyArea.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Multislicer.gif"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniNukeLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniNuke.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniMineBlink.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniMine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MiniGrenadeGatling.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MineShotgun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MineLaunchr.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Mine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MegaNukeLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/MegaNuke.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LilGunther.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LightningWrench.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LightningScrewdriver.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LightningFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LaserWave.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/LULDisc.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/KirbyHammer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/KingBladeSword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/KingBladeGhost.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Jab.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/InvCrystalGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceSlugger.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceSlugHit.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceSlugDissapear.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceSlug.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceShot.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceShellHit.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceShellDissapear.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceShell.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceShard.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceFlakBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/IceCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Hyper_Revolver.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HyperShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HyperFlaregun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HyperFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HuntingRifle.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Hellfire.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Heavystrikemarker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyWaveGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyStriker.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavySMG.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyLaser.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyJab.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyGlove.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyFlaregun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyFlare.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/HeavyFlak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Heavy shotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuidedShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuidedPistol.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuidedMinigun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GuidedBlaster.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Greensmallexplosion.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GoldenFireballer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GoldenBlazer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GoldScorpionArm.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GigaHammer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Genocide.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GatlingSplinter.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/GatlingLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/FocusedFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/FocusShotgun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/FlameSword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Fireballer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Explosiongun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ExplosionPistol.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ExecutionerHand.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Executioner.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Evilsbanebeam.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Energy Wrench.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Energy Shovel.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Energy Jackhammer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DoubleIceShot.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DogHead.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DemolitionsLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Demolitionbomb.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DartlingGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/DartGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Dart.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/CrystalGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChimeraShell.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChimeraExplosive.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChimeraEnergy.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChimeraBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChimeraBolt.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeSlugger.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargePlasmagun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeLaser.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeFlamethrower.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeDiscGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeCrossbow.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeBlade.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/ChargeBazooka.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Casey.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Cannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BusterGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BurstShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BrokenFlakCannon.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BoxingGlove.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Bouncer Flak.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BluntHammer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodyTrail.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodyRifle.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodyRevolver.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodyBullet.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodsuckerProj.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Bloodballer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Bloodball.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodMineLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodMine.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodGenocide.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodFlame.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BloodExplosionGun.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BlinkSword.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Blazer.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BigBlaster.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Battleshovel.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BanditBlaster.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BallMomBlaster.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/BADSRocket.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/AutoIceShot.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/AutoBurstShotty.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/AceLauncher.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/Ace.png"))) {wait 1;}
while (!file_loaded(string_trim("clasweps/AccuserHand.png"))) {wait 1;}
while (!file_loaded(string_trim("Auto_Bullet_Shotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("devastator.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("coolerhud.mod.gml"))) {wait 1;}
wait mod_load(string_trim("data/Daily.mod/balls/balls.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/balls/laserwrench.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/widesword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrasuperdiscgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrasplinter.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraseeker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrarifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultrapopgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultraplasmagun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultralightning.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ultradiscgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/torch.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/swiftsword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/splintergatling.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/snl.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/slc.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/shrineroom.area.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/shine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/scorpionarm.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/scorcher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ringofplasma.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ringoffire.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/racingthoughts.skill.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/quickdraw.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/plasmashotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/orbitalstriker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/orbitalbarrage.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/multislicer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/multiflakcannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/longsword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lightningscrew.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/lightningflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/kirbyhammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/iceslugger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/iceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hypershotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperrevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperflare.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/hyperflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavywave.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavystriker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/heavyshot.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/goldscorpionarm.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/goldenblazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/funnyxd.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/executioner.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/evilsbane.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energywrench.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energyshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/energyjackhammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/enemyloot.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/doubleiceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/doghead.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/slots.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/Slaughter.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/Pain.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/crowns/Choice.crown.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/claswepsshit.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerashell.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimeraexplosive.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimeraenergy.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerabullet.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/chimerabolt.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/catalyst.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/casey.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/cannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/brokenflak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bossintros.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bloodyrifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/bloodyrevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/blazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/battleshovel.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/autoiceshotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/autoburstshotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ZapMachineGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Zap shotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Zap gun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Zap Cannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Ultraflamethrower.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/UltraSlug.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/UltraFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/UltraBazook.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/TurboLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/TrailerPistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/TrailerGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/TrailerCannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Toxinballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ToxicShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ToxicFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ToxicDiscGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ToxicBlazer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ToxicBazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ThroneGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ThroneCannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ThroneBeam.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/SuperIceFlakCannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/SuperFocusedFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/SuperBurstShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Sniper.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/SlotMachine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Ricochetcrossbow.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/RapidPistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/RageBlaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Poposcorcher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoZapper.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoSpreader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoSMG.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoRevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoGuider.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoGenocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoFireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoExplosionGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoCharger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoBurstShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PopoBADS.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PlasmaNuker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PlasmaFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/PlasmaBazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/OmegaRevolver.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/NecroMachine.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MiniNukeLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MineShotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MineLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/MegaNuker.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/LilGunther.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/LightningWrench.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Laserwave.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/KingBlade.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/InvCrystalLaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/IceFlakCannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/IceCannon.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HuntingRifle.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Hellfire.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavySMG.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavyLaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavyGlove.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavyFlare.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/HeavyFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GuiderShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GuiderPistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GuiderMinigun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GuiderBlaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GoldenFireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GigaHammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Genocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GatlingNader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/GatlingMiniNader.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/FocusedFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/FocusShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Flamesword.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Fireballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ExplosionPistol.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ExplosionGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DemolitionsLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DartlingGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/DartGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/CrystalLaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeSlugger.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargePlasma.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeLaser.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeFlamethrower.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeDisc.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeCrossbow.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeBlade.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/ChargeBazooka.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BusterGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BurstShotty.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BoxingGlove.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BouncerFlak.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BluntHammer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Bloodballer.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodMineLauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodGenocide.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BloodExplosionGun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BlinkSword.Wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BigBlaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BanditBlaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BallMomBlaster.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/BADS.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/Acelauncher.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/clasweps/AccuserHand.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/Auto_Bullet_Shotgun.wep.gml"));
wait mod_load(string_trim("data/Daily.mod/devastator.mod.gml"));
wait mod_load(string_trim("data/Daily.mod/coolerhud.mod.gml"));


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
trace("Mods=Balls,Clasweps,Auto Bullet Shotgun,Devastator,Cooler Hud");
trace("Character:Choose");
trace("Crown:Slaughter");
trace("Weapon:ExplosionPistol");
trace("Seed:23130");

global.canStart = true;
global.headers = ds_map_create();
ds_map_set(global.headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
ds_map_set(global.headers, "Cache-Control", "no-cache");	
ds_map_set(global.headers, "Accept", "application/vnd.github.full+json");	file_delete("dl.txt");
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
	array_push(global.leaderboard, [string_split(leaderboard[i], ":")[0], string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(string_split(leaderboard[i], "Character: ")[0], "Kills: ")[1]), array_length(string_split(leaderboard[i], "Character: ")) > 1 ? string_split(leaderboard[i], "Character: ")[1] : ""]);
}
array_sort_sub(global.leaderboard, 2, 0);
global.leaderboardLoaded = 1;
file_unload("dl.txt");


file_delete("Daily.txt");
while (file_exists("Daily.txt")) {wait 1;}
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/Daily.mod.gml", "Daily.txt");
while (!file_loaded("Daily.txt")) {wait 1;}
global.Daily = string_replace_all(string_replace_all(string_split(string_split(string_load("Daily.txt"), "*/")[0], "/*")[1],chr(10),""),chr(13),"");
global.Flavor = string_replace_all(string_replace_all(string_split(string_split(string_load("Daily.txt"), "*/")[1], "/*")[1],chr(10),""),chr(13),"");
global.DailyHeight = string_count("#", global.Daily);
global.DailyWidth = 0;
var temp = string_split(global.Daily, "#");
for(var i = 0; i < array_length(temp); i++){
	if(string_length(temp[i]) > global.DailyWidth){global.DailyWidth = string_length(temp[i]);}
}
file_unload("Daily.txt");

global.details = global.Daily;
global.detailsHeight = global.DailyHeight;
global.detailsWidth = global.DailyWidth;
global.detailsFlavor = global.Flavor;
global.weeklyCurrentY = -(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax);

#define step
if(instance_exists(Menu)){
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX, global.weeklyScoreboardY, global.weeklyScoreboardX + global.weeklyScoreboardW, global.weeklyScoreboardY + global.weeklyScoreboardH/2) && global.menu >= 0){
		global.leaderboardPos-=floor(((global.weeklyScoreboardH)/15)/2);
		global.leaderboardPos = max(global.leaderboardPos, 0);
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX, global.weeklyScoreboardY + global.weeklyScoreboardH/2, global.weeklyScoreboardX + global.weeklyScoreboardW, global.weeklyScoreboardY + global.weeklyScoreboardH) && global.menu >= 0){
		global.leaderboardPos+=floor(((global.weeklyScoreboardH)/15)/2);
		global.leaderboardPos = min(global.leaderboardPos, max(array_length(global.leaderboard)-floor((global.weeklyScoreboardH)/15), 0));
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyScoreboardX + global.weeklyScoreboardW/4, 35 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW * 3/4, 48 + global.weeklyScoreboardH) && global.menu >= 0){
		global.leaderboardOpening = !global.leaderboardOpening;
	}
	if(global.leaderboardOpening){
		global.weeklyScoreboardH += (global.weeklyScoreboardMax - global.weeklyScoreboardH)/2;
		if(abs(global.weeklyScoreboardMax - global.weeklyScoreboardH) <= 8){global.weeklyScoreboardH = global.weeklyScoreboardMax;}
	}else{
		global.weeklyScoreboardH += (global.weeklyScoreboardMin - global.weeklyScoreboardH)/2;
		if(abs(global.weeklyScoreboardMin - global.weeklyScoreboardH) <= 8){global.weeklyScoreboardH = global.weeklyScoreboardMin;}
	}
	if(button_pressed(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY, global.weeklyCurrentX+(weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH) && global.menu >= 0){
		global.descriptionOpening = !global.descriptionOpening;
	}
	if(global.descriptionOpening){
		global.weeklyCurrentY += (global.weeklyCurrentMax - global.weeklyCurrentY)/2;
		if(abs(global.weeklyCurrentMax - global.weeklyCurrentY) <= 8){global.weeklyCurrentY = global.weeklyCurrentMax;}
	}else{
		global.weeklyCurrentY += (-(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax) - global.weeklyCurrentY)/2;
		if(abs(-(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax) - global.weeklyCurrentY) <= 8){global.weeklyCurrentY = -(weeklyCurrentH+weeklyCurrentLH*global.detailsHeight-global.weeklyCurrentMax);}
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
		give_wep(string_trim("ExplosionPistol"));
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
if(!global.canStart){
	with(CharSelect){
		temp_image_index = image_index;
		instance_change(CustomObject, 0);
		name=mod_current;
		if(!ChooseCharacter){
			race=Choose;
		}
	}
}
else{
	with(instances_matching(CustomObject, "name", mod_current)){
		instance_change(CharSelect, 0);
	}
	with(CharSelect){
		if(instance_exists(self)){
			if(variable_instance_exists(self, "temp_image_index")){image_index = temp_image_index;}
			xstart=5+(game_width-10)*(index/instance_number(CharSelect));
			visible=true;
		}
		if(instance_exists(self) && !ChooseCharacter){
			if(string_lower(string_trim(race))!=string_lower(string_trim("Choose"))){
				instance_destroy();
			}
		}
		with(CharSelect){
			if(instance_exists(self) && instance_exists(other) && id != other.id && race==other.race){
				instance_destroy();
			}
		}
	}
}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Character: " + (ChooseCharacter ? global.Race : "") + " Mods:Balls,Clasweps,Auto Bullet Shotgun,Devastator,Cooler Hud" + " Character:Choose" + " Crown:Slaughter" + " Weapon:ExplosionPistol" + " Seed:23130";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-03-14 Daily.txt")){
		prevScores = string_load(global.alias + " 2019-03-14 Daily.txt");
		while(!file_loaded(global.alias + " 2019-03-14 Daily.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-03-14 Daily.txt");
	}else{
		string_save(score, global.alias + " 2019-03-14 Daily.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
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
			if(array_length(string_split(string_load("dl.txt"), '"message":"Not Found"')) == 1 || array_length(string_split(string_load("dl.txt"), '"Bad Credentials"')) == 1){dl = string_split(string_split(string_load("dl.txt"), '","encoding":"base64"')[0],'"content":"')[1];
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
			"content":"'+base64("Mods:Balls,Clasweps,Auto Bullet Shotgun,Devastator,Cooler Hud" + " Character:Choose" + " Crown:Slaughter" + " Weapon:ExplosionPistol" + " Seed:23130" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(string_replace_all(string_replace_all(leaderboard,chr(10),""),chr(13),""), string_replace_all(string_replace_all(":Balls,Clasweps,Auto Bullet Shotgun,Devastator,Cooler Hud" + " Character:Choose" + " Crown:Slaughter" + " Weapon:ExplosionPistol" + " Seed:23130",chr(10),""),chr(13),""))) > 1){
			var fail = 0;
			for(var i = 0; i < array_length(string_split(global.alias, ",")); i++){
				if(array_length(string_split(leaderboard, string_split(global.alias, ",")[i])) > 1){fail=1;}
			}
			if(!LimitedTries || !fail){
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
				trace("You've already played this Daily!");
			}
		}else{
			trace("You are playing on an older modded Daily, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
		}
		wait(60);
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
			array_push(global.leaderboard, [string_split(leaderboard[i], ":")[0], string_split(string_split(leaderboard[i], "Area ")[1], "Kills")[0], real(string_split(string_split(leaderboard[i], "Character: ")[0], "Kills: ")[1]), array_length(string_split(leaderboard[i], "Character: ")) > 1 ? string_split(leaderboard[i], "Character: ")[1] : ""]);
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
draw_set_font(fntSmall);
if(global.qualified == true){
	draw_text_nt(game_width - 25, game_height - 6, "Daily");
}else{
	draw_text_nt(game_width - 7*4 - 25, game_height - 12, "DISQUALIFIED#       Daily");
}
if(instance_exists(Menu)){
	var valign = draw_get_valign();
	var halign = draw_get_halign();
	draw_set_color(make_color_rgb(0,0,0));
	draw_roundrect(weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10, 0);
	draw_sprite_stretched(global.menu==0?global.sprWeekly:(global.menu==1?1600:(global.menu==2?global.sprEvent:1599)), point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10), weeklyButtonX, weeklyButtonY, weeklyButtonW, weeklyButtonH);
	draw_set_halign(1);
	draw_set_font(fntSmall);
	draw_set_color(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10)?make_color_rgb(255,255,255):make_color_rgb(100,100,100));
	draw_text(weeklyButtonX + weeklyButtonW/2, weeklyButtonY + weeklyButtonH + 1, global.menu==0?"Weekly":(global.menu==1?"Daily":(global.menu==2?"Event":"")));
	if(global.details != ""){
		draw_set_color(make_color_rgb(0,0,0));
		draw_roundrect(global.weeklyCurrentX, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)+global.weeklyCurrentBH, 0);
		draw_set_color(make_color_rgb(100,100,100));
		draw_rectangle(global.weeklyCurrentX+1, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)-1, 0);
		draw_set_color(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY, global.weeklyCurrentX+(weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH)?make_color_rgb(255,255,255):make_color_rgb(100,100,100));
		draw_text(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/2, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight) + global.weeklyCurrentBH/2-2, string_copy("Description", 1, floor((weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/4)));
		draw_set_halign(0);
		draw_set_font(fntSmall);
		draw_text_nt(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/20 + 1, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1, global.details);
		draw_set_color(make_color_rgb(0,0,0));
		draw_rectangle(global.weeklyCurrentX, 0, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), 35, 0);
	}
	draw_set_color(make_color_rgb(100,100,100));
	draw_roundrect(global.weeklyScoreboardX + global.weeklyScoreboardW/4, 30 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW*3/4, 48 + global.weeklyScoreboardH, 0);
	draw_roundrect(global.weeklyScoreboardX, 32 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW, 35 + global.weeklyScoreboardH, 0);
	draw_set_color(make_color_rgb(150,150,150));
	draw_roundrect(global.weeklyScoreboardX + global.weeklyScoreboardW/2-10, 30 + global.weeklyScoreboardH, global.weeklyScoreboardX+global.weeklyScoreboardW/2+10, 46 + global.weeklyScoreboardH, 0);
	draw_set_color(make_color_rgb(0,0,0));
	draw_rectangle(global.weeklyScoreboardX, 30, global.weeklyScoreboardX+global.weeklyScoreboardW, 33 + global.weeklyScoreboardH, 0);
	draw_rectangle(global.weeklyScoreboardX, 30, global.weeklyScoreboardX+global.weeklyScoreboardW, 35, 0);
	draw_triangle(global.weeklyScoreboardX + global.weeklyScoreboardW/2-8, 37 + floor(global.weeklyScoreboardH), global.weeklyScoreboardX + global.weeklyScoreboardW/2+8, 37 + floor(global.weeklyScoreboardH), global.weeklyScoreboardX + global.weeklyScoreboardW/2, 45 + floor(global.weeklyScoreboardH), 0);
	if(global.leaderboardLoaded && array_length(global.leaderboard) > 0){
		draw_set_valign(0);
		draw_set_halign(0);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		for(var i = 0; (i+global.leaderboardPos) < array_length(global.leaderboard) && i < floor((global.weeklyScoreboardH)/15); i++){
			draw_set_font(fntM0);
			draw_text_nt(global.weeklyScoreboardX + 1, global.weeklyScoreboardY + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:"+string(make_color_rgb(255, 175, 0))+")" : (i+global.leaderboardPos)==1 ? "@(color:"+string(make_color_rgb(200, 200, 200))+")" : (i+global.leaderboardPos)==2 ? "@(color:"+string(make_color_rgb(150, 100, 0))+")" : "") + "\#" + string_copy(string(i+global.leaderboardPos+1), 1, floor((global.weeklyScoreboardW)/8) + (0 - string_length(string(i+global.leaderboardPos+1)))));
			draw_text_nt(global.weeklyScoreboardX + 35 - (10 * (2 - string_length(string(i+global.leaderboardPos+1)))), global.weeklyScoreboardY + i*15 + 1, ((i+global.leaderboardPos) == 0 ? "@(color:"+string(make_color_rgb(255, 175, 0))+")" : (i+global.leaderboardPos)==1 ? "@(color:"+string(make_color_rgb(200, 200, 200))+")" : (i+global.leaderboardPos)==2 ? "@(color:"+string(make_color_rgb(150, 100, 0))+")" : "") + string_copy(string(global.leaderboard[i+global.leaderboardPos][0]), 1, floor((global.weeklyScoreboardW)/8) + (-2 - string_length(string(i+global.leaderboardPos+1)))));
			draw_set_font(fntSmall);
			draw_text_nt(global.weeklyScoreboardX  + 37 - (10 * (2 - string_length(string(i+global.leaderboardPos+1)))), global.weeklyScoreboardY + i*15 + 9, string_copy("L: " + global.leaderboard[i+global.leaderboardPos][1] + " K: " + string(global.leaderboard[i+global.leaderboardPos][2]) + ((global.leaderboard[i+global.leaderboardPos][3] != "") ? (" C: " + global.leaderboard[i+global.leaderboardPos][3]) : ""), 1, floor((global.weeklyScoreboardW)/4) + (-5 - 2*string_length(string(i+global.leaderboardPos+1)))));
		}
	}else if(global.leaderboardOpening){
		draw_set_valign(1);
		draw_set_halign(1);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_nt(global.weeklyScoreboardX + global.weeklyScoreboardW/2 + 1, global.weeklyScoreboardY + global.weeklyScoreboardH/2 + 1, "LOADING SCORES#(if there are any!)")
	}
	if(global.details != ""){
		temp = string_split(global.detailsFlavor, "|");
		for(var i = 0; i < array_length(temp); i++){
			temp2 = string_split(temp[i], "[")[0];
			if(array_length(string_split(global.details, temp2)) > 1){
				if(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], global.weeklyCurrentX, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6 - 6, global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth), global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6) && array_length(string_split(temp[i], "[")) > 1){
					draw_set_font(fntSmall);
					draw_tooltip(global.weeklyCurrentX + (weeklyCurrentW+weeklyCurrentLW*global.detailsWidth)/2, global.weeklyCurrentY + (weeklyCurrentH+weeklyCurrentLH*global.detailsHeight)/20 + 1 + array_length(string_split(string_split(global.details, temp2)[0], "#")) * 6 - 6, string_split(string_split(temp[i], "[")[1], "]")[0]);
				}
			}
		}
	}
	draw_set_valign(valign);
	draw_set_halign(halign);
}
#define game_start
room_speed = 30;
current_time_scale = 1;
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(Player){if(!ChooseCharacter){race=Choose;}else{global.Race = race;}}
if(!ChooseCrown){give_crown();}

//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = string_trim("Slaughter");
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

