
/*@rMods@w=#  2 Hour Area#  B#  betterLoops#  BB#  Bandit Brute#@bCharacter@w=#  bb#@yCrown@w=#  crown of risk#@gWeapon@w=#  wep_ion_cannon#@pSeed@w=12964*/
#define init
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 12964;
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
file_delete(string_trim("2 hour area/2hours.area.gml
"));while (file_exists(string_trim("2 hour area/2hours.area.gml
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/2hours.area.gml
"), string_trim("2 hour area/2hours.area.gml
")));
file_delete(string_trim("2 hour area/gfx/sprArrow.png
"));while (file_exists(string_trim("2 hour area/gfx/sprArrow.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprArrow.png
"), string_trim("2 hour area/gfx/sprArrow.png
")));
file_delete(string_trim("2 hour area/gfx/sprBow.png
"));while (file_exists(string_trim("2 hour area/gfx/sprBow.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprBow.png
"), string_trim("2 hour area/gfx/sprBow.png
")));
file_delete(string_trim("2 hour area/gfx/sprClouds.png
"));while (file_exists(string_trim("2 hour area/gfx/sprClouds.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprClouds.png
"), string_trim("2 hour area/gfx/sprClouds.png
")));
file_delete(string_trim("2 hour area/gfx/sprDebris.png
"));while (file_exists(string_trim("2 hour area/gfx/sprDebris.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprDebris.png
"), string_trim("2 hour area/gfx/sprDebris.png
")));
file_delete(string_trim("2 hour area/gfx/sprDecoration.png
"));while (file_exists(string_trim("2 hour area/gfx/sprDecoration.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprDecoration.png
"), string_trim("2 hour area/gfx/sprDecoration.png
")));
file_delete(string_trim("2 hour area/gfx/sprFloor.png
"));while (file_exists(string_trim("2 hour area/gfx/sprFloor.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloor.png
"), string_trim("2 hour area/gfx/sprFloor.png
")));
file_delete(string_trim("2 hour area/gfx/sprFloorB.png
"));while (file_exists(string_trim("2 hour area/gfx/sprFloorB.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloorB.png
"), string_trim("2 hour area/gfx/sprFloorB.png
")));
file_delete(string_trim("2 hour area/gfx/sprFloorExplo.png
"));while (file_exists(string_trim("2 hour area/gfx/sprFloorExplo.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprFloorExplo.png
"), string_trim("2 hour area/gfx/sprFloorExplo.png
")));
file_delete(string_trim("2 hour area/gfx/sprSpiderHurt.png
"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderHurt.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderHurt.png
"), string_trim("2 hour area/gfx/sprSpiderHurt.png
")));
file_delete(string_trim("2 hour area/gfx/sprSpiderIdle.png
"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderIdle.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderIdle.png
"), string_trim("2 hour area/gfx/sprSpiderIdle.png
")));
file_delete(string_trim("2 hour area/gfx/sprSpiderWalk.png
"));while (file_exists(string_trim("2 hour area/gfx/sprSpiderWalk.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprSpiderWalk.png
"), string_trim("2 hour area/gfx/sprSpiderWalk.png
")));
file_delete(string_trim("2 hour area/gfx/sprTreeBot.png
"));while (file_exists(string_trim("2 hour area/gfx/sprTreeBot.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreeBot.png
"), string_trim("2 hour area/gfx/sprTreeBot.png
")));
file_delete(string_trim("2 hour area/gfx/sprTreetop.pdn
"));while (file_exists(string_trim("2 hour area/gfx/sprTreetop.pdn
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreetop.pdn
"), string_trim("2 hour area/gfx/sprTreetop.pdn
")));
file_delete(string_trim("2 hour area/gfx/sprTreetop.png
"));while (file_exists(string_trim("2 hour area/gfx/sprTreetop.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprTreetop.png
"), string_trim("2 hour area/gfx/sprTreetop.png
")));
file_delete(string_trim("2 hour area/gfx/sprWallBot.png
"));while (file_exists(string_trim("2 hour area/gfx/sprWallBot.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallBot.png
"), string_trim("2 hour area/gfx/sprWallBot.png
")));
file_delete(string_trim("2 hour area/gfx/sprWallTop.png
"));while (file_exists(string_trim("2 hour area/gfx/sprWallTop.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallTop.png
"), string_trim("2 hour area/gfx/sprWallTop.png
")));
file_delete(string_trim("2 hour area/gfx/sprWallTrans.png
"));while (file_exists(string_trim("2 hour area/gfx/sprWallTrans.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprWallTrans.png
"), string_trim("2 hour area/gfx/sprWallTrans.png
")));
file_delete(string_trim("2 hour area/gfx/sprZombieHurt.png
"));while (file_exists(string_trim("2 hour area/gfx/sprZombieHurt.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieHurt.png
"), string_trim("2 hour area/gfx/sprZombieHurt.png
")));
file_delete(string_trim("2 hour area/gfx/sprZombieIdle.png
"));while (file_exists(string_trim("2 hour area/gfx/sprZombieIdle.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieIdle.png
"), string_trim("2 hour area/gfx/sprZombieIdle.png
")));
file_delete(string_trim("2 hour area/gfx/sprZombieWalk.png
"));while (file_exists(string_trim("2 hour area/gfx/sprZombieWalk.png
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/2 hour area/gfx/sprZombieWalk.png
"), string_trim("2 hour area/gfx/sprZombieWalk.png
")));
file_delete(string_trim("b/b.mod.gml
"));while (file_exists(string_trim("b/b.mod.gml
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/b/b.mod.gml
"), string_trim("b/b.mod.gml
")));
file_delete(string_trim("b/b.ini
"));while (file_exists(string_trim("b/b.ini
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/b/b.ini
"), string_trim("b/b.ini
")));
file_delete(string_trim("betterLoops.mod.gml"));while (file_exists(string_trim("betterLoops.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/betterLoops.mod.gml"), string_trim("betterLoops.mod.gml")));
file_delete(string_trim("bb.race.gml
"));while (file_exists(string_trim("bb.race.gml
"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bb.race.gml
"), string_trim("bb.race.gml
")));
file_delete(string_trim("BanditBrute.mod.gml"));while (file_exists(string_trim("BanditBrute.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/BanditBrute.mod.gml"), string_trim("BanditBrute.mod.gml")));
while (!file_loaded(string_trim("2 hour area/2hours.area.gml
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprArrow.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprBow.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprClouds.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprDebris.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprDecoration.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloor.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloorB.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprFloorExplo.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderHurt.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderIdle.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprSpiderWalk.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreeBot.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreetop.pdn
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprTreetop.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallBot.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallTop.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprWallTrans.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieHurt.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieIdle.png
"))) {wait 1;}
while (!file_loaded(string_trim("2 hour area/gfx/sprZombieWalk.png
"))) {wait 1;}
while (!file_loaded(string_trim("b/b.mod.gml
"))) {wait 1;}
while (!file_loaded(string_trim("b/b.ini
"))) {wait 1;}
while (!file_loaded(string_trim("betterLoops.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("bb.race.gml
"))) {wait 1;}
while (!file_loaded(string_trim("BanditBrute.mod.gml"))) {wait 1;}
mod_load(string_trim("data/Weekly.mod/2 hour area/2hours.area.gml
"));
mod_load(string_trim("data/Weekly.mod/b/b.mod.gml
"));
mod_load(string_trim("data/Weekly.mod/betterLoops.mod.gml"));
mod_load(string_trim("data/Weekly.mod/bb.race.gml
"));
mod_load(string_trim("data/Weekly.mod/BanditBrute.mod.gml"));


trace("Current Weekly:");
trace("Mods=2 Hour Area, B, betterLoops, BB, Bandit Brute");
trace("Character=bb");
trace("Crown=crown of risk");
trace("Weapon=wep_ion_cannon");
trace("Seed=12964");

global.canStart = true;

#define step
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "talk")){
			trace("Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again.");
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
		wep = wep_ion_cannon;
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
if(!global.canStart){with(CharSelect){instance_change(CustomObject, 0);name=mod_current;race=string_lower(string_trim("bb"));}}
else{with(instances_matching(CustomObject, "name", mod_current)){instance_change(CharSelect, 0);}with(CharSelect){race=string_lower(string_trim("bb"));visible=true;}}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:2 Hour Area, B, betterLoops, BB, Bandit Brute" + " Character=bb" + " Crown=crown of risk" + " Weapon=wep_ion_cannon" + " Seed=12964";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + " 2019-02-24 weekly.txt")){
		prevScores = string_load(global.alias + " 2019-02-24 weekly.txt");
		while(!file_loaded(global.alias + " 2019-02-24 weekly.txt")){wait 1;}
		string_save(prevScores, global.alias + " 2019-02-24 weekly.txt");
	}else{
		string_save(score, global.alias + " 2019-02-24 weekly.txt");
	}
	if(global.qualified){
		headers = ds_map_create();
		ds_map_set(headers, "Authorization", "token 21df58cedf37bef276"+"5127ee22846b1cfc9705f4");
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
			"content":"'+base64("Mods:2 Hour Area, B, betterLoops, BB, Bandit Brute" + " Character=bb" + " Crown=crown of risk" + " Weapon=wep_ion_cannon" + " Seed=12964" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(leaderboard, "Mods:2 Hour Area, B, betterLoops, BB, Bandit Brute" + " Character=bb" + " Crown=crown of risk")) > 1){
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
with(Player){race = "bb"}
give_crown();
//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = "crown of risk"
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
            trace();
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

