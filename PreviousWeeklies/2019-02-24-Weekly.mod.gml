
/*@rMods@w=#  Afterburn#  Big Bandit#  Bear#  Airhorn#  Baldi#@bCharacter@w=#  Big Bandit#@yCrown@w=#  #@gWeapon@w=#  wep_machinegun#@pSeed@w=13144*/
#define init
global.canStart = false;
global.qualified = false;
global.alias = "";
global.seed = 13144;
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
file_delete(string_trim("afterburn.mod.gml"));while (file_exists(string_trim("afterburn.mod.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/afterburn.mod.gml"), string_trim("afterburn.mod.gml")));
file_delete(string_trim("Big Bandit/bigbandit.race.gml"));while (file_exists(string_trim("Big Bandit/bigbandit.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/bigbandit.race.gml"), string_trim("Big Bandit/bigbandit.race.gml")));
file_delete(string_trim("Big Bandit/bigrifle.wep.gml"));while (file_exists(string_trim("Big Bandit/bigrifle.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/bigrifle.wep.gml"), string_trim("Big Bandit/bigrifle.wep.gml")));
file_delete(string_trim("Big Bandit/BigBanditA.png"));while (file_exists(string_trim("Big Bandit/BigBanditA.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditA.png"), string_trim("Big Bandit/BigBanditA.png")));
file_delete(string_trim("Big Bandit/BigBanditB.png"));while (file_exists(string_trim("Big Bandit/BigBanditB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditB.png"), string_trim("Big Bandit/BigBanditB.png")));
file_delete(string_trim("Big Bandit/BigBanditGun.png"));while (file_exists(string_trim("Big Bandit/BigBanditGun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditGun.png"), string_trim("Big Bandit/BigBanditGun.png")));
file_delete(string_trim("Big Bandit/BigBanditIcon.png"));while (file_exists(string_trim("Big Bandit/BigBanditIcon.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIcon.png"), string_trim("Big Bandit/BigBanditIcon.png")));
file_delete(string_trim("Big Bandit/BigBanditIconA.png"));while (file_exists(string_trim("Big Bandit/BigBanditIconA.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIconA.png"), string_trim("Big Bandit/BigBanditIconA.png")));
file_delete(string_trim("Big Bandit/BigBanditIconB.png"));while (file_exists(string_trim("Big Bandit/BigBanditIconB.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditIconB.png"), string_trim("Big Bandit/BigBanditIconB.png")));
file_delete(string_trim("Big Bandit/BigBanditMap.png"));while (file_exists(string_trim("Big Bandit/BigBanditMap.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditMap.png"), string_trim("Big Bandit/BigBanditMap.png")));
file_delete(string_trim("Big Bandit/BigBanditPortrait.png"));while (file_exists(string_trim("Big Bandit/BigBanditPortrait.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Big Bandit/BigBanditPortrait.png"), string_trim("Big Bandit/BigBanditPortrait.png")));
file_delete(string_trim("bear/bear.race.gml"));while (file_exists(string_trim("bear/bear.race.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear/bear.race.gml"), string_trim("bear/bear.race.gml")));
file_delete(string_trim("bear/beargun.wep.gml"));while (file_exists(string_trim("bear/beargun.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear/beargun.wep.gml"), string_trim("bear/beargun.wep.gml")));
file_delete(string_trim("a fucking gun.png"));while (file_exists(string_trim("a fucking gun.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/a fucking gun.png"), string_trim("a fucking gun.png")));
file_delete(string_trim("bear (1).png"));while (file_exists(string_trim("bear (1).png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bear (1).png"), string_trim("bear (1).png")));
file_delete(string_trim("bearhurt.png"));while (file_exists(string_trim("bearhurt.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bearhurt.png"), string_trim("bearhurt.png")));
file_delete(string_trim("bearidle.png"));while (file_exists(string_trim("bearidle.png"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/bearidle.png"), string_trim("bearidle.png")));
file_delete(string_trim("airhorn.wep.gml"));while (file_exists(string_trim("airhorn.wep.gml"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/airhorn.wep.gml"), string_trim("airhorn.wep.gml")));
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
file_delete(string_trim("Baldi/wow.ogg"));while (file_exists(string_trim("Baldi/wow.ogg"))) {wait 1;}wait(file_download(string_trim("https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/Baldi/wow.ogg"), string_trim("Baldi/wow.ogg")));
while (!file_loaded(string_trim("afterburn.mod.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/bigbandit.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/bigrifle.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditA.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditB.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditGun.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIcon.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIconA.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditIconB.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditMap.png"))) {wait 1;}
while (!file_loaded(string_trim("Big Bandit/BigBanditPortrait.png"))) {wait 1;}
while (!file_loaded(string_trim("bear/bear.race.gml"))) {wait 1;}
while (!file_loaded(string_trim("bear/beargun.wep.gml"))) {wait 1;}
while (!file_loaded(string_trim("a fucking gun.png"))) {wait 1;}
while (!file_loaded(string_trim("bear (1).png"))) {wait 1;}
while (!file_loaded(string_trim("bearhurt.png"))) {wait 1;}
while (!file_loaded(string_trim("bearidle.png"))) {wait 1;}
while (!file_loaded(string_trim("airhorn.wep.gml"))) {wait 1;}
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
while (!file_loaded(string_trim("Baldi/wow.ogg"))) {wait 1;}
mod_load(string_trim("data/Weekly.mod/afterburn.mod.gml"));
mod_load(string_trim("data/Weekly.mod/Big Bandit/bigbandit.race.gml"));
mod_load(string_trim("data/Weekly.mod/Big Bandit/bigrifle.wep.gml"));
mod_load(string_trim("data/Weekly.mod/bear/bear.race.gml"));
mod_load(string_trim("data/Weekly.mod/bear/beargun.wep.gml"));
mod_load(string_trim("data/Weekly.mod/airhorn.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Baldi/baldi.race.gml"));
mod_load(string_trim("data/Weekly.mod/Baldi/ruler.wep.gml"));
mod_load(string_trim("data/Weekly.mod/Baldi/ultraruler.wep.gml"));


trace("Current Weekly:");
trace("Mods=Afterburn, Big Bandit, Bear, Airhorn, Baldi");
trace("Character=Big Bandit");
trace("Crown=");
trace("Weapon=wep_machinegun");
trace("Seed=13144");

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
		wep = wep_machinegun;
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
if(!global.canStart){with(CharSelect){instance_change(CustomObject, 0);name=mod_current;race=string_lower(string_trim("Big Bandit"));}}
else{with(instances_matching(CustomObject, "name", mod_current)){instance_change(CharSelect, 0);}with(CharSelect){race=string_lower(string_trim("Big Bandit"));visible=true;}}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "";
	with(GameCont){
		score = global.alias + ": Area " + string(area) + "-" + string(subarea) + " L" + string(loops) + " Kills: " + string(kills) + " Mods:Afterburn, Big Bandit, Bear, Airhorn, Baldi" + " Character=Big Bandit" + " Crown=" + " Weapon=wep_machinegun" + " Seed=13144";
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
			"content":"'+base64("Mods:Afterburn, Big Bandit, Bear, Airhorn, Baldi" + " Character=Big Bandit" + " Crown=" + " Weapon=wep_machinegun" + " Seed=13144" + "|" + string_split(score, "Mods:")[0])+'"
			}'
			, "out.txt");
		}else if(array_length(string_split(leaderboard, "Mods:Afterburn, Big Bandit, Bear, Airhorn, Baldi" + " Character=Big Bandit" + " Crown=")) > 1){
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
give_crown();
//Stolen from YAL's debug mod.
#define give_crown
cmd_crown_names = [
    "random", "none", "death", "life", "haste", "guns", "hatred",
    "blood", "destiny", "love", "luck", "curses", "risk", "protection"
];
name = ""
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

