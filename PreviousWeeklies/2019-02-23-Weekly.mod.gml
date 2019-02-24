
//@rMods@w=#  Bear#  Balls#  Auto Bullet Shotgun#  Area Health#  Ash#@bCharacter@w=#  char_robot#@yCrown@w=#  crwn_none#@gWeapon@w=#  wep_sticky_launcher#@pSeed@w=12290
#define init
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 12290;
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
file_delete(string_trim("bear/bear.race.gml"));while (file_exists(string_trim("bear/bear.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear/bear.race.gml"), string_trim("bear/bear.race.gml")));
file_delete(string_trim("bear/beargun.wep.gml"));while (file_exists(string_trim("bear/beargun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear/beargun.wep.gml"), string_trim("bear/beargun.wep.gml")));
file_delete(string_trim("a fucking gun.png"));while (file_exists(string_trim("a fucking gun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/a fucking gun.png"), string_trim("a fucking gun.png")));
file_delete(string_trim("bear (1).png"));while (file_exists(string_trim("bear (1).png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear (1).png"), string_trim("bear (1).png")));
file_delete(string_trim("bearhurt.png"));while (file_exists(string_trim("bearhurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bearhurt.png"), string_trim("bearhurt.png")));
file_delete(string_trim("bearidle.png"));while (file_exists(string_trim("bearidle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bearidle.png"), string_trim("bearidle.png")));
file_delete(string_trim("balls/balls.mod.gml"));while (file_exists(string_trim("balls/balls.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/balls.mod.gml"), string_trim("balls/balls.mod.gml")));
file_delete(string_trim("balls/laserwrench.wep.gml"));while (file_exists(string_trim("balls/laserwrench.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/laserwrench.wep.gml"), string_trim("balls/laserwrench.wep.gml")));
file_delete(string_trim("balls/ball1.ogg"));while (file_exists(string_trim("balls/ball1.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball1.ogg"), string_trim("balls/ball1.ogg")));
file_delete(string_trim("balls/ball2.ogg"));while (file_exists(string_trim("balls/ball2.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball2.ogg"), string_trim("balls/ball2.ogg")));
file_delete(string_trim("balls/ball3.ogg"));while (file_exists(string_trim("balls/ball3.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball3.ogg"), string_trim("balls/ball3.ogg")));
file_delete(string_trim("balls/ball4.ogg"));while (file_exists(string_trim("balls/ball4.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/balls/ball4.ogg"), string_trim("balls/ball4.ogg")));
file_delete(string_trim("Auto_Bullet_Shotgun.wep.gml"));while (file_exists(string_trim("Auto_Bullet_Shotgun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Auto_Bullet_Shotgun.wep.gml"), string_trim("Auto_Bullet_Shotgun.wep.gml")));
file_delete(string_trim("area_health.mod.gml"));while (file_exists(string_trim("area_health.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/area_health.mod.gml"), string_trim("area_health.mod.gml")));
file_delete(string_trim("ash/ash.race.gml"));while (file_exists(string_trim("ash/ash.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/ash.race.gml"), string_trim("ash/ash.race.gml")));
file_delete(string_trim("ash/ashgosit.png"));while (file_exists(string_trim("ash/ashgosit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/ashgosit.png"), string_trim("ash/ashgosit.png")));
file_delete(string_trim("ash/ashidle_b.png"));while (file_exists(string_trim("ash/ashidle_b.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/ashidle_b.png"), string_trim("ash/ashidle_b.png")));
file_delete(string_trim("ash/AshUltraA.ogg"));while (file_exists(string_trim("ash/AshUltraA.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/AshUltraA.ogg"), string_trim("ash/AshUltraA.ogg")));
file_delete(string_trim("ash/AshUltraB.ogg"));while (file_exists(string_trim("ash/AshUltraB.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/AshUltraB.ogg"), string_trim("ash/AshUltraB.ogg")));
file_delete(string_trim("ash/Chest.ogg"));while (file_exists(string_trim("ash/Chest.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Chest.ogg"), string_trim("ash/Chest.ogg")));
file_delete(string_trim("ash/Damage.ogg"));while (file_exists(string_trim("ash/Damage.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Damage.ogg"), string_trim("ash/Damage.ogg")));
file_delete(string_trim("ash/Death.ogg"));while (file_exists(string_trim("ash/Death.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Death.ogg"), string_trim("ash/Death.ogg")));
file_delete(string_trim("ash/IDPD.ogg"));while (file_exists(string_trim("ash/IDPD.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/IDPD.ogg"), string_trim("ash/IDPD.ogg")));
file_delete(string_trim("ash/Lowammo.ogg"));while (file_exists(string_trim("ash/Lowammo.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Lowammo.ogg"), string_trim("ash/Lowammo.ogg")));
file_delete(string_trim("ash/LowHealth.ogg"));while (file_exists(string_trim("ash/LowHealth.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/LowHealth.ogg"), string_trim("ash/LowHealth.ogg")));
file_delete(string_trim("ash/menuash.png"));while (file_exists(string_trim("ash/menuash.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/menuash.png"), string_trim("ash/menuash.png")));
file_delete(string_trim("ash/nothing.ogg"));while (file_exists(string_trim("ash/nothing.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/nothing.ogg"), string_trim("ash/nothing.ogg")));
file_delete(string_trim("ash/Select.ogg"));while (file_exists(string_trim("ash/Select.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Select.ogg"), string_trim("ash/Select.ogg")));
file_delete(string_trim("ash/Speech.ogg"));while (file_exists(string_trim("ash/Speech.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Speech.ogg"), string_trim("ash/Speech.ogg")));
file_delete(string_trim("ash/sprAshDead.png"));while (file_exists(string_trim("ash/sprAshDead.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprAshDead.png"), string_trim("ash/sprAshDead.png")));
file_delete(string_trim("ash/sprAshHurt.png"));while (file_exists(string_trim("ash/sprAshHurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprAshHurt.png"), string_trim("ash/sprAshHurt.png")));
file_delete(string_trim("ash/sprAshIdle.png"));while (file_exists(string_trim("ash/sprAshIdle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprAshIdle.png"), string_trim("ash/sprAshIdle.png")));
file_delete(string_trim("ash/SprAshSit.png"));while (file_exists(string_trim("ash/SprAshSit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/SprAshSit.png"), string_trim("ash/SprAshSit.png")));
file_delete(string_trim("ash/SprAshWalk.png"));while (file_exists(string_trim("ash/SprAshWalk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/SprAshWalk.png"), string_trim("ash/SprAshWalk.png")));
file_delete(string_trim("ash/sprBigPortrait.png"));while (file_exists(string_trim("ash/sprBigPortrait.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprBigPortrait.png"), string_trim("ash/sprBigPortrait.png")));
file_delete(string_trim("ash/sprEGIconHUDA.png"));while (file_exists(string_trim("ash/sprEGIconHUDA.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprEGIconHUDA.png"), string_trim("ash/sprEGIconHUDA.png")));
file_delete(string_trim("ash/sprEGIconHUDB.png"));while (file_exists(string_trim("ash/sprEGIconHUDB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprEGIconHUDB.png"), string_trim("ash/sprEGIconHUDB.png")));
file_delete(string_trim("ash/sprEGSkillIcon.png"));while (file_exists(string_trim("ash/sprEGSkillIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprEGSkillIcon.png"), string_trim("ash/sprEGSkillIcon.png")));
file_delete(string_trim("ash/sprLoadoutSkin.png"));while (file_exists(string_trim("ash/sprLoadoutSkin.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprLoadoutSkin.png"), string_trim("ash/sprLoadoutSkin.png")));
file_delete(string_trim("ash/sprMapIcon.png"));while (file_exists(string_trim("ash/sprMapIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMapIcon.png"), string_trim("ash/sprMapIcon.png")));
file_delete(string_trim("ash/sprMutant1Dead.png"));while (file_exists(string_trim("ash/sprMutant1Dead.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1Dead.png"), string_trim("ash/sprMutant1Dead.png")));
file_delete(string_trim("ash/sprMutant1GoSit.png"));while (file_exists(string_trim("ash/sprMutant1GoSit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1GoSit.png"), string_trim("ash/sprMutant1GoSit.png")));
file_delete(string_trim("ash/sprMutant1Hurt.png"));while (file_exists(string_trim("ash/sprMutant1Hurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1Hurt.png"), string_trim("ash/sprMutant1Hurt.png")));
file_delete(string_trim("ash/sprMutant1Idle.png"));while (file_exists(string_trim("ash/sprMutant1Idle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1Idle.png"), string_trim("ash/sprMutant1Idle.png")));
file_delete(string_trim("ash/sprMutant1Sit.png"));while (file_exists(string_trim("ash/sprMutant1Sit.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1Sit.png"), string_trim("ash/sprMutant1Sit.png")));
file_delete(string_trim("ash/sprMutant1Walk.png"));while (file_exists(string_trim("ash/sprMutant1Walk.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/sprMutant1Walk.png"), string_trim("ash/sprMutant1Walk.png")));
file_delete(string_trim("ash/Tumor.ogg"));while (file_exists(string_trim("ash/Tumor.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/Tumor.ogg"), string_trim("ash/Tumor.ogg")));
file_delete(string_trim("ash/tumour.png"));while (file_exists(string_trim("ash/tumour.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/tumour.png"), string_trim("ash/tumour.png")));
file_delete(string_trim("ash/tumourcounter.png"));while (file_exists(string_trim("ash/tumourcounter.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/ash/tumourcounter.png"), string_trim("ash/tumourcounter.png")));
while (!file_loaded(string_trim("bear/bear.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("bear/beargun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("a fucking gun.png"))) {wait 1;}
while (!file_loaded(string_trim("bear (1).png"))) {wait 1;}
while (!file_loaded(string_trim("bearhurt.png"))) {wait 1;}
while (!file_loaded(string_trim("bearidle.png"))) {wait 1;}
while (!file_loaded(string_trim("balls/balls.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("balls/laserwrench.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball1.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball2.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball3.ogg"))) {wait 1;}
while (!file_loaded(string_trim("balls/ball4.ogg"))) {wait 1;}
while (!file_loaded(string_trim("Auto_Bullet_Shotgun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("area_health.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("ash/ash.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("ash/ashgosit.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/ashidle_b.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/AshUltraA.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/AshUltraB.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Chest.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Damage.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Death.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/IDPD.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Lowammo.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/LowHealth.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/menuash.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/nothing.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Select.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/Speech.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprAshDead.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprAshHurt.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprAshIdle.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/SprAshSit.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/SprAshWalk.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprBigPortrait.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprEGIconHUDA.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprEGIconHUDB.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprEGSkillIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprLoadoutSkin.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMapIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1Dead.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1GoSit.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1Hurt.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1Idle.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1Sit.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/sprMutant1Walk.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/Tumor.ogg"))) {wait 1;}
while (!file_loaded(string_trim("ash/tumour.png"))) {wait 1;}
while (!file_loaded(string_trim("ash/tumourcounter.png"))) {wait 1;}
mod_load(string_trim("data/Weekly.mod/bear/bear.race.gml"));
mod_load(string_trim("data/Weekly.mod/bear/beargun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/balls/balls.mod.gml"));
mod_load(string_trim("data/Weekly.mod/balls/laserwrench.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Auto_Bullet_Shotgun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/area_health.mod.gml"));
mod_load(string_trim("data/Weekly.mod/ash/ash.race.gml"));


trace("Current Weekly:");
trace("Mods=Bear, Balls, Auto Bullet Shotgun, Area Health, Ash");
trace("Character=char_robot");
trace("Crown=crwn_none");
trace("Weapon=wep_sticky_launcher");
trace("Seed=12290");

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
		wep = wep_sticky_launcher;
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
else{with(instances_matching(CustomObject, "name", mod_current)){instance_change(CharSelect, 0);}with(CharSelect){race=char_robot;visible=true;}}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:Bear, Balls, Auto Bullet Shotgun, Area Health, Ash" + " Character=char_robot" + " Crown=crwn_none" + " Weapon=wep_sticky_launcher" + " Seed=12290";
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
			"content":"'+base64("Mods:Bear, Balls, Auto Bullet Shotgun, Area Health, Ash" + " Character=char_robot" + " Crown=crwn_none" + " Weapon=wep_sticky_launcher" + " Seed=12290" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(leaderboard, "Mods:Bear, Balls, Auto Bullet Shotgun, Area Health, Ash" + " Character=char_robot" + " Crown=crwn_none")) > 1){
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
	crown = crwn_none;
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

