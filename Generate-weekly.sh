#!/bin/sh
cd D:/Documents/NTT-Weekly
DATE=`date +%Y-%m-%d`
cd D:/Documents/NTT-Weekly/WeeklyModDecider
RAND=$(shuf -en 1 *)
cd D:/Documents/NTT-Weekly
MOD1=$RAND
MOD2=$RAND
MOD3=$RAND
MOD4=$RAND
MOD5=$RAND
while [ "$MOD1" = "$MOD2" ] 
do
	cd D:/Documents/NTT-Weekly/WeeklyModDecider
	RAND=$(shuf -en 1 *)
	cd D:/Documents/NTT-Weekly
	MOD2=$RAND
done
while [ "$MOD1" = "$MOD3" ] || [ "$MOD2" = "$MOD3" ]
do
	cd D:/Documents/NTT-Weekly/WeeklyModDecider
	RAND=$(shuf -en 1 *)
	cd D:/Documents/NTT-Weekly
	MOD3=$RAND
done
while [ "$MOD1" = "$MOD4" ] || [ "$MOD2" = "$MOD4" ] || [ "$MOD3" = "$MOD4" ]
do
	cd D:/Documents/NTT-Weekly/WeeklyModDecider
	RAND=$(shuf -en 1 *)
	cd D:/Documents/NTT-Weekly
	MOD4=$RAND
done
while [ "$MOD1" = "$MOD5" ] || [ "$MOD2" = "$MOD5" ] || [ "$MOD3" = "$MOD5" ] || [ "$MOD4" = "$MOD5" ]
do
	cd D:/Documents/NTT-Weekly/WeeklyModDecider
	RAND=$(shuf -en 1 *)
	cd D:/Documents/NTT-Weekly
	MOD5=$RAND
done
CHARACTERS=("char_random" "char_fish" "char_crystal" "char_eyes" "char_melting" "char_plant" "char_venuz" "char_steroids" "char_robot" "char_chicken" "char_rebel" "char_horror" "char_rogue" "char_skeleton" "char_frog")
CROWNS=("crwn_random" "crwn_none" "crwn_death" "crwn_life" "crwn_haste" "crwn_guns" "crwn_hatred" "crwn_blood" "crwn_destiny" "crwn_love" "crwn_luck" "crwn_curses" "crwn_risk" "crwn_protection")
WEAPONS=("wep_none" "wep_revolver" "wep_triple_machinegun" "wep_wrench" "wep_machinegun" "wep_shotgun" "wep_crossbow" "wep_grenade_launcher" "wep_double_shotgun" "wep_minigun" "wep_auto_shotgun" "wep_auto_crossbow" "wep_super_crossbow" "wep_shovel" "wep_bazooka" "wep_sticky_launcher" "wep_smg" "wep_assault_rifle" "wep_disc_gun" "wep_laser_pistol" "wep_laser_rifle" "wep_slugger" "wep_gatling_slugger" "wep_assault_slugger" "wep_energy_sword" "wep_super_slugger" "wep_hyper_rifle" "wep_screwdriver" "wep_laser_minigun" "wep_blood_launcher" "wep_splinter_gun" "wep_toxic_bow" "wep_sentry_gun" "wep_wave_gun" "wep_plasma_gun" "wep_plasma_cannon" "wep_energy_hammer" "wep_jackhammer" "wep_flak_cannon" "wep_golden_revolver" "wep_golden_wrench" "wep_golden_machinegun" "wep_golden_shotgun" "wep_golden_crossbow" "wep_golden_grenade_launcher" "wep_golden_laser_pistol" "wep_chicken_sword" "wep_nuke_launcher" "wep_ion_cannon" "wep_quadruple_machinegun" "wep_flamethrower" "wep_dragon" "wep_flare_gun" "wep_energy_screwdriver" "wep_hyper_launcher" "wep_laser_cannon" "wep_rusty_revolver" "wep_lightning_pistol" "wep_lightning_rifle" "wep_lightning_shotgun" "wep_super_flak_cannon" "wep_sawed_off_shotgun" "wep_splinter_pistol" "wep_super_splinter_gun" "wep_lightning_smg" "wep_smart_gun" "wep_heavy_crossbow" "wep_blood_hammer" "wep_lightning_cannon" "wep_pop_gun" "wep_plasma_rifle" "wep_pop_rifle" "wep_toxic_launcher" "wep_flame_cannon" "wep_lightning_hammer" "wep_flame_shotgun" "wep_double_flame_shotgun" "wep_auto_flame_shotgun" "wep_cluster_launcher" "wep_grenade_shotgun" "wep_grenade_rifle" "wep_rogue_rifle" "wep_party_gun" "wep_double_minigun" "wep_gatling_bazooka" "wep_auto_grenade_shotgun" "wep_ultra_revolver" "wep_ultra_laser_pistol" "wep_sledgehammer" "wep_heavy_revolver" "wep_heavy_machinegun" "wep_heavy_slugger" "wep_ultra_shovel" "wep_ultra_shotgun" "wep_ultra_crossbow" "wep_ultra_grenade_launcher" "wep_plasma_minigun" "wep_devastator" "wep_golden_plasma_gun" "wep_golden_slugger" "wep_golden_splinter_gun" "wep_golden_screwdriver" "wep_golden_bazooka" "wep_golden_assault_rifle" "wep_super_disc_gun" "wep_heavy_auto_crossbow" "wep_heavy_assault_rifle" "wep_blood_cannon" "wep_dog_spin_attack" "wep_dog_missile" "wep_incinerator" "wep_super_plasma_cannon" "wep_seeker_pistol" "wep_seeker_shotgun" "wep_eraser" "wep_guitar" "wep_bouncer_smg" "wep_bouncer_shotgun" "wep_hyper_slugger" "wep_super_bazooka" "wep_frog_pistol" "wep_black_sword" "wep_golden_nuke_launcher" "wep_golden_disc_gun" "wep_heavy_grenade_launcher" "wep_gun_gun" "wep_eggplant" "wep_golden_frog_pistol")
SEED=$RANDOM
DOWNLOADS=()
MODS=()
FILES=()
DWL=""
cd D:/Documents/NTT-Weekly/WeeklyModDecider
IFS=$'\n'
for line in $(< $MOD1) $(< $MOD2) $(< $MOD3) $(< $MOD4) $(< $MOD5);do
	if [ ${line:0:1} = "|" ]
	then
		DOWNLOADS+=("${line:1:${#line}-1}")
		MODS+=("${line:1:${#line}-1}")
	fi
	if [ ${line:0:1} = "/" ]
	then
		CHARACTERS+=("${line:1:${#line}-1}")
	fi
	if [ ${line:0:1} = '"' ]
	then
		CROWNS+=("${line:1:${#line}-1}")
	fi
	if [ ${line:0:1} = "*" ]
	then
		WEAPONS+=("${line:1:${#line}-1}")
	fi
	if [ ${line:0:1} = ":" ]
	then
		DOWNLOADS+=("${line:1:${#line}-1}")
	fi
done
cd D:/Documents/NTT-Weekly
for i in ${DOWNLOADS[@]}
do
	DWL+="file_delete(string_trim("'"'$i'"'"));while (file_exists(string_trim("'"'$i'"'"))) {wait 1;}file_download(string_trim("'"'"https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/"$i'"'"), string_trim("'"'$i'"'"));"$'\n'
done
DWL+="wait(5);"$'\n'
for i in ${DOWNLOADS[@]}
do
	DWL+="wait(file_load(string_trim("'"'$i'"'")));"$'\n'
done
for i in ${MODS[@]}
do
	DWL+="mod_load(string_trim("'"'"data/Weekly.mod/"$i'"'"));"$'\n'
done
CHR=$[$RANDOM % ${#CHARACTERS[@]}]
CRW=$[$RANDOM % ${#CROWNS[@]}]
WEP=$[$RANDOM % ${#WEAPONS[@]}]
echo -e "
#define init
global.qualified = false;
global.alias = "'"'""'"'";
global.seed = $SEED;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
trace("'"'"Current Weekly:"'"'");
trace("'"'"Mods=$MOD1, $MOD2, $MOD3, $MOD4, $MOD5"'"'");
trace("'"'"Character=${CHARACTERS[$CHR]}"'"'");
trace("'"'"Crown=${CROWNS[$CRW]}"'"'");
trace("'"'"Weapon=${WEAPONS[$WEP]}"'"'");
trace("'"'"Seed=$SEED"'"'");
global.qualified = true;
global.alias = "'"'""'"'";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("'"'"Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again."'"'");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("'"'"Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again."'"'");
	}
}
var i = 0;
for(i = 0; array_length(mod_get_names("'"'"mod"'"'")) > 1; i=i){
	if(mod_get_names("'"'"mod"'"'")[i] != mod_current){mod_unload(mod_get_names("'"'"mod"'"'")[i]);}
}
for(i = 0; array_length(mod_get_names("'"'"weapon"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"weapon"'"'")[i]);
}
for(i = 0; array_length(mod_get_names("'"'"area"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"area"'"'")[i]);
}
for(i = 0; array_length(mod_get_names("'"'"crown"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"crown"'"'")[i]);
}
for(i = 0; array_length(mod_get_names("'"'"race"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"race"'"'")[i]);
}
for(i = 0; array_length(mod_get_names("'"'"skill"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"skill"'"'")[i]);
}
for(i = 0; array_length(mod_get_names("'"'"skin"'"'")) > 0; i=i){
	mod_unload(mod_get_names("'"'"skin"'"'")[i]);
}
$DWL

#define step
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "'"'"talk"'"'")){
			global.qualified = false;
			trace("'"'"Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again."'"'");
		}
		i++
	}
}
if(global.start){
	global.alias = "'"'""'"'";
	with(Player){
		wep = ${WEAPONS[$WEP]};
		ammo[0] = 0;
		ammo[1] = 0;
		ammo[2] = 0;
		ammo[3] = 0;
		ammo[4] = 0;
		ammo[5] = 0;
		if(fork()){while(instance_exists(GenCont)){wait 1;}repeat(3){instance_create(x,y,AmmoPickup)}exit;}
		if(global.alias != "'"'""'"'"){
			global.alias += "'"'", "'"'"
		}
		global.alias += alias;
	}
	global.start = false;
}
with(CharSelect){race=${CHARACTERS[$CHR]};}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "'"'""'"'";
	with(GameCont){
		score = global.alias + "'"'": Area "'"'" + string(area) + "'"'"-"'"'" + string(subarea) + "'"'" L"'"'" + string(loops) + "'"'" Kills: "'"'" + string(kills) + "'"'" Mods:$MOD1, $MOD2, $MOD3, $MOD4, $MOD5"'"'" + "'"'" Character=${CHARACTERS[$CHR]}"'"'" + "'"'" Crown=${CROWNS[$CRW]}"'"'" + "'"'" Weapon=${WEAPONS[$WEP]}"'"'" + "'"'" Seed=$SEED"'"'";
	}
	trace(score);
	global.finished = true;
	if(file_exists(global.alias + "'"'" $DATE weekly.txt"'"'")){
		prevScores = string_load(global.alias + "'"'" $DATE weekly.txt"'"'");
		while(!file_loaded(global.alias + "'"'" $DATE weekly.txt"'"'")){wait 1;}
		string_save(prevScores, global.alias + "'"'" $DATE weekly.txt"'"'");
	}else{
		string_save(score, global.alias + "'"'" $DATE weekly.txt"'"'");
	}
	if(global.qualified){
		file_delete("'"'"dl.txt"'"'");
		while (file_exists("'"'"dl.txt"'"'")) {wait 1;}
		file_download("'"'"https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/leaderboards/$DATE weekly.txt"'"'", "'"'"dl.txt"'"'");
		while (!file_loaded("'"'"dl.txt"'"'")) {wait 1;}
		leaderboard = string_load("'"'"dl.txt"'"'");
		headers = ds_map_create();
		ds_map_set(headers, "'"'"Authorization"'"'", "'"'"bearer 45d0595699dedb51962a5ae92048e6a077df85f6"'"'");
		ds_map_set(headers, "'"'"Accept"'"'", "'"'"application/vnd.github.full+json"'"'");	
		if(string_copy(leaderboard, 0, 4) == "'"'"404:"'"'"){
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/$DATE weekly.txt'
		, "'"'"PUT"'"'", headers,
		'{
		"'"'"message"'"'":"'"'"Leaderboard Update"'"'",
		"'"'"content"'"'":"'"'"'+base64(string_split(score, "'"'"Mods:"'"'")[0])+'"'"'"
		}'
		, "'"'"out.txt"'"'");
	}else{
		file_delete("'"'"sha.txt"'"'");
		while (file_exists("'"'"sha.txt"'"'")) {wait 1;}
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/$DATE weekly.txt'
		, "'"'"GET"'"'", headers,
		''
		, "'"'"sha.txt"'"'");
		while (!file_loaded("'"'"sha.txt"'"'")) {wait 1;}
		sha = string_split(string_split(string_load("'"'"sha.txt"'"'"), '"'"'"sha"'"'":"'"'"')[1], '"'"'"')[0];
		http_request('https://api.github.com/repos/GoldenEpsilon/NTT-Modded-Recurrents/contents/leaderboards/$DATE weekly.txt'
		, "'"'"PUT"'"'", headers,
		'{
		"'"'"message"'"'":"'"'"Leaderboard Update"'"'",
		"'"'"content"'"'":"'"'"'+base64(leaderboard+"'"'"|"'"'"+string_split(score, "'"'"Mods:"'"'")[0])+'"'"'",
		"'"'"sha"'"'":"'"'"'+sha+'"'"'"
		}'
		, "'"'"out.txt"'"'");
	}
	}
}
#define draw_pause
//Anti-Cheat
if(global.qualified == true){
	var i = 0;
	repeat(4){
		if(button_check(i, "'"'"talk"'"'")){
			global.qualified = false;
			trace("'"'"Disqualified for uploading results. reload the weekly mod from the character select screen to qualify again."'"'");
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
	crown = ${CROWNS[$CRW]};
}
#define base64(str)
var retVal = "'"'""'"'";
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
		retVal += string(char1)+string(char2)+string(char3)+"'"'"="'"'";
	}else if(string_length(str) - i*3 == 1){
		ord1 = string_ord_at(str, i*3+1);
		char1 = base64Char((ord1&252)/4);
		char2 = base64Char((ord1&3)*16);
		retVal += string(char1)+string(char2)+"'"'"=="'"'";
	}
}
return retVal;
#define base64Char(num)
var retVal = "'"'"="'"'";
switch(num){
	case 0:retVal = "'"'"A"'"'";break;
	case 1:retVal = "'"'"B"'"'";break;
	case 2:retVal = "'"'"C"'"'";break;
	case 3:retVal = "'"'"D"'"'";break;
	case 4:retVal = "'"'"E"'"'";break;
	case 5:retVal = "'"'"F"'"'";break;
	case 6:retVal = "'"'"G"'"'";break;
	case 7:retVal = "'"'"H"'"'";break;
	case 8:retVal = "'"'"I"'"'";break;
	case 9:retVal = "'"'"J"'"'";break;
	case 10:retVal = "'"'"K"'"'";break;
	case 11:retVal = "'"'"L"'"'";break;
	case 12:retVal = "'"'"M"'"'";break;
	case 13:retVal = "'"'"N"'"'";break;
	case 14:retVal = "'"'"O"'"'";break;
	case 15:retVal = "'"'"P"'"'";break;
	case 16:retVal = "'"'"Q"'"'";break;
	case 17:retVal = "'"'"R"'"'";break;
	case 18:retVal = "'"'"S"'"'";break;
	case 19:retVal = "'"'"T"'"'";break;
	case 20:retVal = "'"'"U"'"'";break;
	case 21:retVal = "'"'"V"'"'";break;
	case 22:retVal = "'"'"W"'"'";break;
	case 23:retVal = "'"'"X"'"'";break;
	case 24:retVal = "'"'"Y"'"'";break;
	case 25:retVal = "'"'"Z"'"'";break;
	case 26:retVal = "'"'"a"'"'";break;
	case 27:retVal = "'"'"b"'"'";break;
	case 28:retVal = "'"'"c"'"'";break;
	case 29:retVal = "'"'"d"'"'";break;
	case 30:retVal = "'"'"e"'"'";break;
	case 31:retVal = "'"'"f"'"'";break;
	case 32:retVal = "'"'"g"'"'";break;
	case 33:retVal = "'"'"h"'"'";break;
	case 34:retVal = "'"'"i"'"'";break;
	case 35:retVal = "'"'"j"'"'";break;
	case 36:retVal = "'"'"k"'"'";break;
	case 37:retVal = "'"'"l"'"'";break;
	case 38:retVal = "'"'"m"'"'";break;
	case 39:retVal = "'"'"n"'"'";break;
	case 40:retVal = "'"'"o"'"'";break;
	case 41:retVal = "'"'"p"'"'";break;
	case 42:retVal = "'"'"q"'"'";break;
	case 43:retVal = "'"'"r"'"'";break;
	case 44:retVal = "'"'"s"'"'";break;
	case 45:retVal = "'"'"t"'"'";break;
	case 46:retVal = "'"'"u"'"'";break;
	case 47:retVal = "'"'"v"'"'";break;
	case 48:retVal = "'"'"w"'"'";break;
	case 49:retVal = "'"'"x"'"'";break;
	case 50:retVal = "'"'"y"'"'";break;
	case 51:retVal = "'"'"z"'"'";break;
	case 52:retVal = "'"'"0"'"'";break;
	case 53:retVal = "'"'"1"'"'";break;
	case 54:retVal = "'"'"2"'"'";break;
	case 55:retVal = "'"'"3"'"'";break;
	case 56:retVal = "'"'"4"'"'";break;
	case 57:retVal = "'"'"5"'"'";break;
	case 58:retVal = "'"'"6"'"'";break;
	case 59:retVal = "'"'"7"'"'";break;
	case 60:retVal = "'"'"8"'"'";break;
	case 61:retVal = "'"'"9"'"'";break;
	case 62:retVal = "'"'"+"'"'";break;
	case 63:retVal = "'"'"/"'"'";break;
}
return retVal;
" | tee Weekly.mod.gml PreviousWeeklies/${DATE}-Weekly.mod.gml
git add Weekly.mod.gml
git add PreviousWeeklies/${DATE}-Weekly.mod.gml
git add Generate-weekly.sh
git commit -am "Automatically Updated The Weekly on "$DATE
git push