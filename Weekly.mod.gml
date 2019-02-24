
//@rMods@w=#  Big Dog#  Big Bandit#  Afterburn#  !ARMAGGEDNN#  Auto Revolver#@bCharacter@w=#  char_chicken#@yCrown@w=#  crwn_haste#@gWeapon@w=#  wep_plasma_minigun#@pSeed@w=7849
#define init
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 7849;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
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
file_delete(string_trim("bigdog.mod.gml"));while (file_exists(string_trim("bigdog.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bigdog.mod.gml"), string_trim("bigdog.mod.gml")));
file_delete(string_trim("Big Bandit/bigbandit.race.gml"));while (file_exists(string_trim("Big Bandit/bigbandit.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/bigbandit.race.gml"), string_trim("Big Bandit/bigbandit.race.gml")));
file_delete(string_trim("Big Bandit/bigrifle.wep.gml"));while (file_exists(string_trim("Big Bandit/bigrifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/bigrifle.wep.gml"), string_trim("Big Bandit/bigrifle.wep.gml")));
file_delete(string_trim("Big Bandit/BigBanditA.png"));while (file_exists(string_trim("Big Bandit/BigBanditA.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditA.png"), string_trim("Big Bandit/BigBanditA.png")));
file_delete(string_trim("Big Bandit/BigBanditB.png"));while (file_exists(string_trim("Big Bandit/BigBanditB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditB.png"), string_trim("Big Bandit/BigBanditB.png")));
file_delete(string_trim("Big Bandit/BigBanditGun.png"));while (file_exists(string_trim("Big Bandit/BigBanditGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditGun.png"), string_trim("Big Bandit/BigBanditGun.png")));
file_delete(string_trim("Big Bandit/BigBanditIcon.png"));while (file_exists(string_trim("Big Bandit/BigBanditIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIcon.png"), string_trim("Big Bandit/BigBanditIcon.png")));
file_delete(string_trim("Big Bandit/BigBanditIconA.png"));while (file_exists(string_trim("Big Bandit/BigBanditIconA.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIconA.png"), string_trim("Big Bandit/BigBanditIconA.png")));
file_delete(string_trim("Big Bandit/BigBanditIconB.png"));while (file_exists(string_trim("Big Bandit/BigBanditIconB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIconB.png"), string_trim("Big Bandit/BigBanditIconB.png")));
file_delete(string_trim("Big Bandit/BigBanditMap.png"));while (file_exists(string_trim("Big Bandit/BigBanditMap.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditMap.png"), string_trim("Big Bandit/BigBanditMap.png")));
file_delete(string_trim("Big Bandit/BigBanditPortrait.png"));while (file_exists(string_trim("Big Bandit/BigBanditPortrait.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditPortrait.png"), string_trim("Big Bandit/BigBanditPortrait.png")));
file_delete(string_trim("afterburn.mod.gml"));while (file_exists(string_trim("afterburn.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/afterburn.mod.gml"), string_trim("afterburn.mod.gml")));
file_delete(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"));while (file_exists(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/crimson.area.gml"), string_trim("!ARMAGGEDNN/areas/crimson.area.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/autoSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/axeFire.wep.gml"), string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/blodSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/boltednightmare.wep.gml"), string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml")));
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
file_delete(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/Porzygun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/SCR.mod.gml"), string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/shd.skin.gml"), string_trim("!ARMAGGEDNN/weapons/shd.skin.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/spctr.skin.gml"), string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"), string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/ultrascrew.wep.gml"), string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/usnk.wep.gml"), string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/vamSh.weapon.gml"), string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml"), string_trim("!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/F1"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/F1"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/F1"), string_trim("!ARMAGGEDNN/areas/spr/F1")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/F1E"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/F1E"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/F1E"), string_trim("!ARMAGGEDNN/areas/spr/F1E")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/sprGrave1"), string_trim("!ARMAGGEDNN/areas/spr/sprGrave1")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/sprGrave2"), string_trim("!ARMAGGEDNN/areas/spr/sprGrave2")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1B"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1B"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1B"), string_trim("!ARMAGGEDNN/areas/spr/W1B")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1O"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1O"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1O"), string_trim("!ARMAGGEDNN/areas/spr/W1O")));
file_delete(string_trim("!ARMAGGEDNN/areas/spr/W1T"));while (file_exists(string_trim("!ARMAGGEDNN/areas/spr/W1T"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/areas/spr/W1T"), string_trim("!ARMAGGEDNN/areas/spr/W1T")));
file_delete(string_trim("!ARMAGGEDNN/spr/boltm.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/boltm.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/boltm.png"), string_trim("!ARMAGGEDNN/spr/boltm.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/fireaxe.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/fireaxe.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/fireaxe.png"), string_trim("!ARMAGGEDNN/spr/fireaxe.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/flail.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/flail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/flail.png"), string_trim("!ARMAGGEDNN/spr/flail.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/grabli.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/grabli.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/grabli.png"), string_trim("!ARMAGGEDNN/spr/grabli.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/olDuspc.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/olDuspc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/olDuspc.png"), string_trim("!ARMAGGEDNN/spr/olDuspc.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/shild.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/shild.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/shild.png"), string_trim("!ARMAGGEDNN/spr/shild.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprASH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprASH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprASH.png"), string_trim("!ARMAGGEDNN/spr/sprASH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprBSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprBSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprBSH.png"), string_trim("!ARMAGGEDNN/spr/sprBSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprESH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprESH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprESH.png"), string_trim("!ARMAGGEDNN/spr/sprESH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprExSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprExSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprExSH.png"), string_trim("!ARMAGGEDNN/spr/sprExSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprForce100OfNature.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprForce100OfNature.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprForce100OfNature.png"), string_trim("!ARMAGGEDNN/spr/sprForce100OfNature.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprFSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprFSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprFSH.png"), string_trim("!ARMAGGEDNN/spr/sprFSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprGSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprGSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprGSH.png"), string_trim("!ARMAGGEDNN/spr/sprGSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprHSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprHSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprHSH.png"), string_trim("!ARMAGGEDNN/spr/sprHSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprISH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprISH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprISH.png"), string_trim("!ARMAGGEDNN/spr/sprISH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprLSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprLSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprLSH.png"), string_trim("!ARMAGGEDNN/spr/sprLSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/sprVSH.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/sprVSH.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/sprVSH.png"), string_trim("!ARMAGGEDNN/spr/sprVSH.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/swipe_flail.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/swipe_flail.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/swipe_flail.png"), string_trim("!ARMAGGEDNN/spr/swipe_flail.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/ucaber.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/ucaber.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/ucaber.png"), string_trim("!ARMAGGEDNN/spr/ucaber.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/ultradriver.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/ultradriver.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/ultradriver.png"), string_trim("!ARMAGGEDNN/spr/ultradriver.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/ushank.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/ushank.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/ushank.png"), string_trim("!ARMAGGEDNN/spr/ushank.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/usnk.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/usnk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/usnk.png"), string_trim("!ARMAGGEDNN/spr/usnk.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/uspc.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/uspc.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/uspc.png"), string_trim("!ARMAGGEDNN/spr/uspc.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/zExplosiveSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/zExplosiveSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/zExplosiveSlash.png"), string_trim("!ARMAGGEDNN/spr/zExplosiveSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/zFlameSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/zFlameSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/zFlameSlash.png"), string_trim("!ARMAGGEDNN/spr/zFlameSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/zGoldSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/zGoldSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/zGoldSlash.png"), string_trim("!ARMAGGEDNN/spr/zGoldSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/spr/zVampirSlash.png"));while (file_exists(string_trim("!ARMAGGEDNN/spr/zVampirSlash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/spr/zVampirSlash.png"), string_trim("!ARMAGGEDNN/spr/zVampirSlash.png")));
file_delete(string_trim("!ARMAGGEDNN/snd/FHONshot.ogg"));while (file_exists(string_trim("!ARMAGGEDNN/snd/FHONshot.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/snd/FHONshot.ogg"), string_trim("!ARMAGGEDNN/snd/FHONshot.ogg")));
file_delete(string_trim("!ARMAGGEDNN/snd/uspcShot.ogg"));while (file_exists(string_trim("!ARMAGGEDNN/snd/uspcShot.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/snd/uspcShot.ogg"), string_trim("!ARMAGGEDNN/snd/uspcShot.ogg")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/dubstep.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/dubstep.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/dubstep.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/dubstep.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapas.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapas.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/lyapas.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapas.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasGun.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/lyapasGun.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasGun.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasP.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasP.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/lyapasP.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasP.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/M16.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/M16.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/M16.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/M16.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/Shovel.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/Shovel.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/Shovel.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/Shovel.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ukatana.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ukatana.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/ukatana.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/ukatana.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ULTRA_M16.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ULTRA_M16.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.4/spr/ULTRA_M16.png"), string_trim("!ARMAGGEDNN/weapons/1.4/spr/ULTRA_M16.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.5/spr/GraveGun.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.5/spr/GraveGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.5/spr/GraveGun.png"), string_trim("!ARMAGGEDNN/weapons/1.5/spr/GraveGun.png")));
file_delete(string_trim("!ARMAGGEDNN/weapons/1.5/spr/sprLaserGauss.png"));while (file_exists(string_trim("!ARMAGGEDNN/weapons/1.5/spr/sprLaserGauss.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/!ARMAGGEDNN/weapons/1.5/spr/sprLaserGauss.png"), string_trim("!ARMAGGEDNN/weapons/1.5/spr/sprLaserGauss.png")));
file_delete(string_trim("autorevolver.wep.gml"));while (file_exists(string_trim("autorevolver.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/autorevolver.wep.gml"), string_trim("autorevolver.wep.gml")));
while (!file_loaded(string_trim("bigdog.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/bigbandit.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/bigrifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditA.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditB.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditGun.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIconA.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIconB.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditMap.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditPortrait.png"))) {wait 1;}
while (!file_loaded(string_trim("afterburn.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/crimson.area.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/autoSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/axeFire.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/blodSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/boltednightmare.wep.gml"))) {wait 1;}
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
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/Porzygun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/SCR.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/shd.skin.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/spctr.skin.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/ultrascrew.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/usnk.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/vamSh.weapon.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/F1"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/F1E"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/sprGrave1"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/sprGrave2"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1B"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1O"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/areas/spr/W1T"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/boltm.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/fireaxe.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/flail.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/grabli.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/olDuspc.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/shild.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprASH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprBSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprESH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprExSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprForce100OfNature.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprFSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprGSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprHSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprISH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprLSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/sprVSH.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/swipe_flail.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/ucaber.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/ultradriver.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/ushank.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/usnk.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/uspc.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/zExplosiveSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/zFlameSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/zGoldSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/spr/zVampirSlash.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/snd/FHONshot.ogg"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/snd/uspcShot.ogg"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/dubstep.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapas.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasGun.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/lyapasP.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/M16.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/Shovel.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ukatana.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.4/spr/ULTRA_M16.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.5/spr/GraveGun.png"))) {wait 1;}
while (!file_loaded(string_trim("!ARMAGGEDNN/weapons/1.5/spr/sprLaserGauss.png"))) {wait 1;}
while (!file_loaded(string_trim("autorevolver.wep.gml"))) {wait 1;}
mod_load(string_trim("data/Weekly.mod/bigdog.mod.gml"));
mod_load(string_trim("data/Weekly.mod/Big Bandit/bigbandit.race.gml"));
mod_load(string_trim("data/Weekly.mod/Big Bandit/bigrifle.wep.gml"));
mod_load(string_trim("data/Weekly.mod/afterburn.mod.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/areas/crimson.area.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/autoSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/axeFire.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/blodSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/boltednightmare.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/EGruntRifle.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/EGruntRocket.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/EInspectorSword.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/enrgSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/EShielderMinigun.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/expllSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/fireeSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/Force100OfNature.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/gldnSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/grabli.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/grnt.skin.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/heavSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/InspectorSlugger.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/lightSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/mcrfSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/plasmaCannonMinigun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/Porzygun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/SCR.mod.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/shd.skin.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/ShielderHeavyGun.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/spctr.skin.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/superultraplasmacannon.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/ullapollcaber.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/ultrascrew.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/usnk.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/vamSh.weapon.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.4/dubstepGun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.4/LyapasGun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.4/M16Rifle.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.4/ultraKatana.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.4/UltraM16.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.5/GaussHellYeah.wep.gml"));
mod_load(string_trim("data/Weekly.mod/!ARMAGGEDNN/weapons/1.5/GraveGun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/autorevolver.wep.gml"));


trace("Current Weekly:");
trace("Mods=Big Dog, Big Bandit, Afterburn, !ARMAGGEDNN, Auto Revolver");
trace("Character=char_chicken");
trace("Crown=crwn_haste");
trace("Weapon=wep_plasma_minigun");
trace("Seed=7849");

global.canStart = true;

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
		wep = wep_plasma_minigun;
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
if(!global.canStart){with(CharSelect){instance_change(CustomObject, 0);name=mod_current;}}
else{with(instances_matching(CustomObject, "name", mod_current)){instance_change(CharSelect, 0);}with(CharSelect){race=char_chicken;visible=true;}}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:Big Dog, Big Bandit, Afterburn, !ARMAGGEDNN, Auto Revolver" + " Character=char_chicken" + " Crown=crwn_haste" + " Weapon=wep_plasma_minigun" + " Seed=7849";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-23 weekly.txt")){
		prevScores = string_load(global.alias + " 2019-02-23 weekly.txt");
		while(!file_loaded(global.alias + " 2019-02-23 weekly.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-23 weekly.txt");
	}else{
		string_save(score, global.alias + " 2019-02-23 weekly.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 332d41ff727ad978568"+"da5708b685138ac544244");
		ds_map_set(headers, "Cache-Control", "no-cache");
		ds_map_set(headers, "Accept", "application/vnd.github.full+json");	
		file_delete("dl.txt");
		while (file_exists("dl.txt")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/weekly.txt'
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
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/weekly.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64("Mods:Big Dog, Big Bandit, Afterburn, !ARMAGGEDNN, Auto Revolver" + " Character=char_chicken" + " Crown=crwn_haste" + " Weapon=wep_plasma_minigun" + " Seed=7849" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(leaderboard, "Mods:Big Dog, Big Bandit, Afterburn, !ARMAGGEDNN, Auto Revolver" + " Character=char_chicken" + " Crown=crwn_haste")) > 1){
			file_delete("sha.txt");
			while (file_exists("sha.txt")) {wait 1;}
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/weekly.txt'
			, "GET", headers,
			''
			, "sha.txt");
			while (!file_loaded("sha.txt")) {wait 1;}
			wait file_load("sha.txt");
			sha = string_split(string_split(string_load("sha.txt"), '"sha":"')[1], '"')[0];
			file_unload("sha.txt");
			http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/weekly.txt'
			, "PUT", headers,
			'{
			"message":"Leaderboard Update",
			"content":"'+base64(leaderboard+"|"+string_split(score, "Mods:")[0])+'",
			"sha":"'+sha+'"
			}'
			, "out.txt");
		}else{
			trace("You are playing on an older modded weekly, so your scores were not uploaded. If this is incorrect, contact Golden Epsilon on discord through the Nuclear Throne discord: https://www.discord.gg/nt");
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
	crown = crwn_haste;
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

