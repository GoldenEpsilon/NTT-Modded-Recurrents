
/*@rMods@w=#  blackholes#  bow#  blaac48#  !ARMAGGEDNN#  Baldi#@bCharacter@w=#  Choose#@yCrown@w=#  crown of luck#@gWeapon@w=#  Force Hungreed Of Nature#@pSeed@w=24090#Limited Tries:false*/
/*|blackholes[All projectiles attract enemies of the user#that means you get pulled into enemy bullets, too.#this is going to be a hard one...]|bow[It's a bow.]|blaac48[The jungle is deeper]|!ARMAGGEDNN[This big mod for NTT is adding 36 new Suppa CrAzY WeaPONs##Also there is a customarea (you will die)]|Baldi[Baldi's Basics in Education and Learning#is a state-of-the-art, fully 3D interactive,#fun-time educational game that teaches a slew of subjects!]*/
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
global.menu = ("Event" == "D"+"aily") + ("Event" == "Event")*2;
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
global.seed = 24090;
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
		trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
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
file_delete(string_trim("blackholes.mod.gml"));while (file_exists(string_trim("blackholes.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/blackholes.mod.gml"), string_trim("blackholes.mod.gml")));
file_delete(string_trim("bow.wep.gml"));while (file_exists(string_trim("bow.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bow.wep.gml"), string_trim("bow.wep.gml")));
file_delete(string_trim("blaac48.area.gml"));while (file_exists(string_trim("blaac48.area.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/blaac48.area.gml"), string_trim("blaac48.area.gml")));
file_delete(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"));while (file_exists(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/crimson.area.gml"), string_trim("!ARMAGGEDNN/areas/crimson.area.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/autoSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/axeFire.wep.gml"), string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/blodSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/boltednightmare.wep.gml"), string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ded.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ded.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ded.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ded.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/dubstepGun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/dubstepGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/dubstepGun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/dubstepGun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/enrgSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/enrgSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/enrgSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/enrgSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/expllSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/expllSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/expllSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/expllSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/fireeSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/fireeSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/fireeSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/fireeSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"), string_trim("!ARMAGGEDNN/weapons/Force100OfNature.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/gldnSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/gldnSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/gldnSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/gldnSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/grabli.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/grabli.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/grabli.wep.gml"), string_trim("!ARMAGGEDNN/weapons/grabli.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/grnt.skin.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/grnt.skin.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/grnt.skin.gml"), string_trim("!ARMAGGEDNN/weapons/grnt.skin.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/heavSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/heavSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/heavSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/heavSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/lightSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/lightSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/lightSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/lightSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/LyapasGun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/LyapasGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/LyapasGun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/LyapasGun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/M16Rifle.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/M16Rifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/M16Rifle.wep.gml"), string_trim("!ARMAGGEDNN/weapons/M16Rifle.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/Porzygun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/SCR.mod.gml"), string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/shd.skin.gml"), string_trim("!ARMAGGEDNN/weapons/shd.skin.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spctr.skin.gml"), string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"), string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ultraKatana.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ultraKatana.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ultraKatana.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ultraKatana.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/UltraM16.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/UltraM16.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/UltraM16.wep.gml"), string_trim("!ARMAGGEDNN/weapons/UltraM16.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ultrascrew.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/usnk.wep.gml"), string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/vamSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/F1.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/F1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/F1.png"), string_trim("!ARMAGGEDNN/areas/spr/F1.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/F1E.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/F1E.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/F1E.png"), string_trim("!ARMAGGEDNN/areas/spr/F1E.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/sprGrave1.png"), string_trim("!ARMAGGEDNN/areas/spr/sprGrave1.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/sprGrave2.png"), string_trim("!ARMAGGEDNN/areas/spr/sprGrave2.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1B.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1B.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1B.png"), string_trim("!ARMAGGEDNN/areas/spr/W1B.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1O.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1O.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1O.png"), string_trim("!ARMAGGEDNN/areas/spr/W1O.png")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1T.png"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1T.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1T.png"), string_trim("!ARMAGGEDNN/areas/spr/W1T.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/boltm.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/boltm.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/boltm.png"), string_trim("!ARMAGGEDNN/weapons/spr/boltm.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/fireaxe.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/fireaxe.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/fireaxe.png"), string_trim("!ARMAGGEDNN/weapons/spr/fireaxe.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/flail.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/flail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/flail.png"), string_trim("!ARMAGGEDNN/weapons/spr/flail.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/grabli.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/grabli.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/grabli.png"), string_trim("!ARMAGGEDNN/weapons/spr/grabli.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/olDuspc.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/olDuspc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/olDuspc.png"), string_trim("!ARMAGGEDNN/weapons/spr/olDuspc.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/shild.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/shild.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/shild.png"), string_trim("!ARMAGGEDNN/weapons/spr/shild.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprASH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprASH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprASH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprASH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprBSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprBSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprBSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprBSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprESH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprESH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprESH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprESH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprExSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprExSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprExSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprExSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprForce100OfNature.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprForce100OfNature.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprForce100OfNature.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprForce100OfNature.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprFSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprFSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprFSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprFSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprGSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprGSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprGSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprGSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprHSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprHSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprHSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprHSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprISH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprISH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprISH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprISH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprLSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprLSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprLSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprLSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/sprVSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/sprVSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/sprVSH.png"), string_trim("!ARMAGGEDNN/weapons/spr/sprVSH.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/swipe_flail.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/swipe_flail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/swipe_flail.png"), string_trim("!ARMAGGEDNN/weapons/spr/swipe_flail.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/ucaber.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/ucaber.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/ucaber.png"), string_trim("!ARMAGGEDNN/weapons/spr/ucaber.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/ultradriver.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/ultradriver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/ultradriver.png"), string_trim("!ARMAGGEDNN/weapons/spr/ultradriver.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/ushank.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/ushank.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/ushank.png"), string_trim("!ARMAGGEDNN/weapons/spr/ushank.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/usnk.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/usnk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/usnk.png"), string_trim("!ARMAGGEDNN/weapons/spr/usnk.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/uspc.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/uspc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/uspc.png"), string_trim("!ARMAGGEDNN/weapons/spr/uspc.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/zExplosiveSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/zExplosiveSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/zExplosiveSlash.png"), string_trim("!ARMAGGEDNN/weapons/spr/zExplosiveSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/zFlameSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/zFlameSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/zFlameSlash.png"), string_trim("!ARMAGGEDNN/weapons/spr/zFlameSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/zGoldSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/zGoldSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/zGoldSlash.png"), string_trim("!ARMAGGEDNN/weapons/spr/zGoldSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/zVampirSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/zVampirSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/zVampirSlash.png"), string_trim("!ARMAGGEDNN/weapons/spr/zVampirSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/snd/FHONshot.ogg"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/snd/FHONshot.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/snd/FHONshot.ogg"), string_trim("!ARMAGGEDNN/weapons/snd/FHONshot.ogg")));
file_delete(string_trim("!ARMAGGEDNN/weapons/snd/uspcShot.ogg"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/snd/uspcShot.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/snd/uspcShot.ogg"), string_trim("!ARMAGGEDNN/weapons/snd/uspcShot.ogg")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/bubsteb.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/bubsteb.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/bubsteb.png"), string_trim("!ARMAGGEDNN/weapons/spr/bubsteb.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/lyapas.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/lyapas.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/lyapas.png"), string_trim("!ARMAGGEDNN/weapons/spr/lyapas.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/LyapasGun.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/LyapasGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/LyapasGun.png"), string_trim("!ARMAGGEDNN/weapons/spr/LyapasGun.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/lyapasP.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/lyapasP.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/lyapasP.png"), string_trim("!ARMAGGEDNN/weapons/spr/lyapasP.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/M16.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/M16.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/M16.png"), string_trim("!ARMAGGEDNN/weapons/spr/M16.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/Shovel.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/Shovel.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/Shovel.png"), string_trim("!ARMAGGEDNN/weapons/spr/Shovel.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/ukatana.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/ukatana.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/ukatana.png"), string_trim("!ARMAGGEDNN/weapons/spr/ukatana.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spr/ULTRA_M16.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spr/ULTRA_M16.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spr/ULTRA_M16.png"), string_trim("!ARMAGGEDNN/weapons/spr/ULTRA_M16.png")));
file_delete(string_trim("Baldi/baldi.race.gml"));while (file_exists(string_trim("Baldi/baldi.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/baldi.race.gml"), string_trim("Baldi/baldi.race.gml")));
file_delete(string_trim("Baldi/ruler.wep.gml"));while (file_exists(string_trim("Baldi/ruler.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ruler.wep.gml"), string_trim("Baldi/ruler.wep.gml")));
file_delete(string_trim("Baldi/ultraruler.wep.gml"));while (file_exists(string_trim("Baldi/ultraruler.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ultraruler.wep.gml"), string_trim("Baldi/ultraruler.wep.gml")));
file_delete(string_trim("Baldi/aha.ogg"));while (file_exists(string_trim("Baldi/aha.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/aha.ogg"), string_trim("Baldi/aha.ogg")));
file_delete(string_trim("Baldi/baldi.png"));while (file_exists(string_trim("Baldi/baldi.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/baldi.png"), string_trim("Baldi/baldi.png")));
file_delete(string_trim("Baldi/dead.png"));while (file_exists(string_trim("Baldi/dead.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/dead.png"), string_trim("Baldi/dead.png")));
file_delete(string_trim("Baldi/goodjob.ogg"));while (file_exists(string_trim("Baldi/goodjob.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/goodjob.ogg"), string_trim("Baldi/goodjob.ogg")));
file_delete(string_trim("Baldi/GoSit.png"));while (file_exists(string_trim("Baldi/GoSit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/GoSit.png"), string_trim("Baldi/GoSit.png")));
file_delete(string_trim("Baldi/hurt.png"));while (file_exists(string_trim("Baldi/hurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/hurt.png"), string_trim("Baldi/hurt.png")));
file_delete(string_trim("Baldi/mapicon.png"));while (file_exists(string_trim("Baldi/mapicon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/mapicon.png"), string_trim("Baldi/mapicon.png")));
file_delete(string_trim("Baldi/nothing.ogg"));while (file_exists(string_trim("Baldi/nothing.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/nothing.ogg"), string_trim("Baldi/nothing.ogg")));
file_delete(string_trim("Baldi/nothing.png"));while (file_exists(string_trim("Baldi/nothing.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/nothing.png"), string_trim("Baldi/nothing.png")));
file_delete(string_trim("Baldi/Portrait.png"));while (file_exists(string_trim("Baldi/Portrait.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/Portrait.png"), string_trim("Baldi/Portrait.png")));
file_delete(string_trim("Baldi/reee.ogg"));while (file_exists(string_trim("Baldi/reee.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/reee.ogg"), string_trim("Baldi/reee.ogg")));
file_delete(string_trim("Baldi/ruler.png"));while (file_exists(string_trim("Baldi/ruler.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ruler.png"), string_trim("Baldi/ruler.png")));
file_delete(string_trim("Baldi/select.ogg"));while (file_exists(string_trim("Baldi/select.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/select.ogg"), string_trim("Baldi/select.ogg")));
file_delete(string_trim("Baldi/select.png"));while (file_exists(string_trim("Baldi/select.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/select.png"), string_trim("Baldi/select.png")));
file_delete(string_trim("Baldi/sit.png"));while (file_exists(string_trim("Baldi/sit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/sit.png"), string_trim("Baldi/sit.png")));
file_delete(string_trim("Baldi/smack.ogg"));while (file_exists(string_trim("Baldi/smack.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/smack.ogg"), string_trim("Baldi/smack.ogg")));
file_delete(string_trim("Baldi/sprMapIcon.png"));while (file_exists(string_trim("Baldi/sprMapIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/sprMapIcon.png"), string_trim("Baldi/sprMapIcon.png")));
file_delete(string_trim("Baldi/ultraa.png"));while (file_exists(string_trim("Baldi/ultraa.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ultraa.png"), string_trim("Baldi/ultraa.png")));
file_delete(string_trim("Baldi/ultrab.png"));while (file_exists(string_trim("Baldi/ultrab.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ultrab.png"), string_trim("Baldi/ultrab.png")));
file_delete(string_trim("Baldi/ultraruler.png"));while (file_exists(string_trim("Baldi/ultraruler.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ultraruler.png"), string_trim("Baldi/ultraruler.png")));
file_delete(string_trim("Baldi/ultras.png"));while (file_exists(string_trim("Baldi/ultras.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/ultras.png"), string_trim("Baldi/ultras.png")));
file_delete(string_trim("Baldi/wow.ogg"));while (file_exists(string_trim("Baldi/wow.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/wow.ogg"), string_trim("Baldi/wow.ogg")));
while (!file_loaded(string_trim("blackholes.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("bow.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("blaac48.area.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ded.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/dubstepGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/enrgSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/expllSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/fireeSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/gldnSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/grabli.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/grnt.skin.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/heavSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/lightSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/LyapasGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/M16Rifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ultraKatana.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/UltraM16.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/F1.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/F1E.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1B.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1O.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1T.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/boltm.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/fireaxe.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/flail.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/grabli.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/olDuspc.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/shild.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprASH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprBSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprESH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprExSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprForce100OfNature.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprFSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprGSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprHSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprISH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprLSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/sprVSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/swipe_flail.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/ucaber.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/ultradriver.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/ushank.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/usnk.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/uspc.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/zExplosiveSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/zFlameSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/zGoldSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/zVampirSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/snd/FHONshot.ogg"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/snd/uspcShot.ogg"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/bubsteb.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/lyapas.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/LyapasGun.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/lyapasP.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/M16.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/Shovel.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/ukatana.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spr/ULTRA_M16.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/baldi.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ruler.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ultraruler.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/aha.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/baldi.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/dead.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/goodjob.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/GoSit.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/hurt.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/mapicon.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/nothing.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/nothing.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/Portrait.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/reee.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ruler.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/select.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/select.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/sit.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/smack.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/sprMapIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ultraa.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ultrab.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ultraruler.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/ultras.png"))) {wait 1;}
while (!file_loaded(string_trim("Baldi/wow.ogg"))) {wait 1;}
wait mod_load(string_trim("data/Event.mod/blackholes.mod.gml"));
wait mod_load(string_trim("data/Event.mod/bow.wep.gml"));
wait mod_load(string_trim("data/Event.mod/blaac48.area.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/areas/crimson.area.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/autoSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/axeFire.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/blodSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/boltednightmare.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/ded.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/dubstepGun.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/enrgSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/expllSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/fireeSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/gldnSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/grabli.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/grnt.skin.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/heavSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/lightSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/LyapasGun.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/M16Rifle.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/Porzygun.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/SCR.mod.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/shd.skin.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/spctr.skin.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/ultraKatana.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/UltraM16.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/ultrascrew.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/usnk.wep.gml"));
wait mod_load(string_trim("data/Event.mod/!ARMAGGEDNN/weapons/vamSh.weapon.gml"));
wait mod_load(string_trim("data/Event.mod/Baldi/baldi.race.gml"));
wait mod_load(string_trim("data/Event.mod/Baldi/ruler.wep.gml"));
wait mod_load(string_trim("data/Event.mod/Baldi/ultraruler.wep.gml"));


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

trace("Current Event:");
trace("Mods=blackholes,bow,blaac48,!ARMAGGEDNN,Baldi");
trace("Character=Choose");
trace("Crown=crown of luck");
trace("Weapon=Force Hungreed Of Nature");
trace("Seed=24090");

global.canStart = true;
global.headers = ds_map_create();
ds_map_set(global.headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
ds_map_set(global.headers, "Cache-Control", "no-cache");	
ds_map_set(global.headers, "Accept", "application/vnd.github.full+json");		
file_delete("dl.txt");
while (file_exists("dl.txt")) {wait 1;}
http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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

file_delete("Event.txt");
while (file_exists("Event.txt")) {wait 1;}
file_download("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/Event.mod.gml", "Event.txt");
while (!file_loaded("Event.txt")) {wait 1;}
global.Event = string_replace_all(string_replace_all(string_split(string_split(string_load("Event.txt"), "*/")[0], "/*")[1],chr(10),""),chr(13),"");
global.Flavor = string_replace_all(string_replace_all(string_split(string_split(string_load("Event.txt"), "*/")[1], "/*")[1],chr(10),""),chr(13),"");
global.EventHeight = string_count("#", global.Event);
global.EventWidth = 0;
var temp = string_split(global.Event, "#");
for(var i = 0; i < array_length(temp); i++){
	if(string_length(temp[i]) > global.EventWidth){global.EventWidth = string_length(temp[i]);}
}
file_unload("Event.txt");

global.details = global.Event;
global.detailsHeight = global.EventHeight;
global.detailsWidth = global.EventWidth;
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
			trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
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
		give_wep(string_trim("Force Hungreed Of Nature"));
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
			race=string_lower(string_trim("Choose"));
		}
	}
}
else{
	with(instances_matching(CustomObject, "name", mod_current)){
		instance_change(CharSelect, 0);
	}
	with(CharSelect){
		if(variable_instance_exists(self, "temp_image_index")){image_index = temp_image_index;}
		xstart=5+(game_width-10)*(index/instance_number(CharSelect));
		if(instance_exists(self) && !ChooseCharacter){
			if(race!=string_lower(string_trim("Choose"))){
				instance_destroy();
			}
		}
		if(instance_exists(self)){
			visible=true;
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
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Character: " + (ChooseCharacter ? global.Race : "") + " Mods:blackholes,bow,blaac48,!ARMAGGEDNN,Baldi" + " Character=Choose" + " Crown=crown of luck" + " Weapon=Force Hungreed Of Nature" + " Seed=24090";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-27 Event.txt")){
		prevScores = string_load(global.alias + " 2019-02-27 Event.txt");
		while(!file_loaded(global.alias + " 2019-02-27 Event.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-27 Event.txt");
	}else{
		string_save(score, global.alias + " 2019-02-27 Event.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 7349069d71cc5b8e1165"+"40e940c2ad5650ea32de");
		ds_map_set(headers, "Cache-Control", "no-cache");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64("Mods:blackholes,bow,blaac48,!ARMAGGEDNN,Baldi" + " Character=Choose" + " Crown=crown of luck" + " Weapon=Force Hungreed Of Nature" + " Seed=24090" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(string_replace_all(string_replace_all(leaderboard,chr(10),""),chr(13),""), string_replace_all(string_replace_all("ods:blackholes,bow,blaac48,!ARMAGGEDNN,Baldi" + " Character=Choose" + " Crown=crown of luck" + " Weapon=Force Hungreed Of Nature" + " Seed=24090",chr(10),""),chr(13),""))) > 1){
			var fail = 0;
			for(var i = 0; i < array_length(string_split(global.alias, ",")); i++){
				if(array_length(string_split(leaderboard, string_split(global.alias, ",")[i])) > 1){fail=1;}
			}
			if(!LimitedTries || !fail){
				file_delete("sha.txt");
				while (file_exists("sha.txt")) {wait 1;}
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
				, "GET", headers,
				''
				, "sha.txt");
				while (!file_loaded("sha.txt")) {wait 1;}
				wait file_load("sha.txt");
				sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
				file_unload("sha.txt");
				http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
				, "PUT", headers,
				'{
				"message":"Leaderboard Update",
				"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
				"sha":"'+sha+'"
				}'
				, "out.txt");
			}else{
				trace("You've already played this Event!");
			}
		}else{
			trace("You are playing on an older modded Event, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
		}
		wait(60);
		global.leaderboardLoaded = 0;
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/Event.txt'
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
			trace("Disqualified for uploading results. reload the Event mod from the character select screen to qualify again.");
		}
		i++
	}
}
#define draw_gui
draw_set_font(fntSmall);
if(global.qualified == true){
	draw_text_nt(game_width - 25, game_height - 6, "Event");
}else{
	draw_text_nt(game_width - 7*4 - 25, game_height - 12, "DISQUALIFIED#       Event");
}
if(instance_exists(Menu)){
	draw_set_color(make_color_rgb(0,0,0));
	draw_roundrect(weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10, 0);
	draw_sprite_stretched(global.menu==0?global.sprWeekly:(global.menu==1?1600:(global.menu==2?global.sprEvent:1599)), point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10), weeklyButtonX, weeklyButtonY, weeklyButtonW, weeklyButtonH);
	draw_set_halign(1);
	draw_set_font(fntSmall);
	draw_set_color(point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], weeklyButtonX-5, 32, weeklyButtonX + weeklyButtonW+3, weeklyButtonY + weeklyButtonH+10)?make_color_rgb(255,255,255):make_color_rgb(100,100,100));
	draw_text(weeklyButtonX + weeklyButtonW/2, weeklyButtonY + weeklyButtonH + 1, global.menu==0?"Weekly":(global.menu==1?"Event":(global.menu==2?"Event":"")));
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
		var valign = draw_get_valign();
		var halign = draw_get_halign();
		draw_set_valign(1);
		draw_set_halign(1);
		draw_set_font(fntM0);
		draw_set_color(make_color_rgb(255,255,255));
		draw_text_nt(global.weeklyScoreboardX + global.weeklyScoreboardW/2 + 1, global.weeklyScoreboardY + global.weeklyScoreboardH/2 + 1, "LOADING SCORES#(if there are any!)")
		draw_set_valign(valign);
		draw_set_halign(halign);
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
}
#define game_start
room_speed = 30;
current_time_scale = 1;
global.finished = false;
game_set_seed(global.seed);
random_set_seed(global.seed);
global.start = true;
with(Player){if(!ChooseCharacter){race=string_lower(string_trim("Choose"));}else{global.Race = race;}}
if(!ChooseCrown){give_crown();}

//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = "crown of luck"
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

