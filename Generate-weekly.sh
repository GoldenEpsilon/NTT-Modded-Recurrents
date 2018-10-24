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
CHARACTERS=("char_random" "char_fish" "char_crystal" "char_eyes" "char_melting" "char_plant" "char_venuz" "char_steroids" "char_robot" "char_chicken" "char_rebel" "char_horror" "char_rogue" "char_bigdog" "char_skeleton" "char_frog")
CROWNS=("crwn_random" "crwn_none" "crwn_death" "crwn_life" "crwn_haste" "crwn_guns" "crwn_hatred" "crwn_blood" "crwn_destiny" "crwn_love" "crwn_luck" "crwn_curses" "crwn_risk" "crwn_protection")
WEAPONS=("wep_none" "wep_revolver" "wep_triple_machinegun" "wep_wrench" "wep_machinegun" "wep_shotgun" "wep_crossbow" "wep_grenade_launcher" "wep_double_shotgun" "wep_minigun" "wep_auto_shotgun" "wep_auto_crossbow" "wep_super_crossbow" "wep_shovel" "wep_bazooka" "wep_sticky_launcher" "wep_smg" "wep_assault_rifle" "wep_disc_gun" "wep_laser_pistol" "wep_laser_rifle" "wep_slugger" "wep_gatling_slugger" "wep_assault_slugger" "wep_energy_sword" "wep_super_slugger" "wep_hyper_rifle" "wep_screwdriver" "wep_laser_minigun" "wep_blood_launcher" "wep_splinter_gun" "wep_toxic_bow" "wep_sentry_gun" "wep_wave_gun" "wep_plasma_gun" "wep_plasma_cannon" "wep_energy_hammer" "wep_jackhammer" "wep_flak_cannon" "wep_golden_revolver" "wep_golden_wrench" "wep_golden_machinegun" "wep_golden_shotgun" "wep_golden_crossbow" "wep_golden_grenade_launcher" "wep_golden_laser_pistol" "wep_chicken_sword" "wep_nuke_launcher" "wep_ion_cannon" "wep_quadruple_machinegun" "wep_flamethrower" "wep_dragon" "wep_flare_gun" "wep_energy_screwdriver" "wep_hyper_launcher" "wep_laser_cannon" "wep_rusty_revolver" "wep_lightning_pistol" "wep_lightning_rifle" "wep_lightning_shotgun" "wep_super_flak_cannon" "wep_sawed_off_shotgun" "wep_splinter_pistol" "wep_super_splinter_gun" "wep_lightning_smg" "wep_smart_gun" "wep_heavy_crossbow" "wep_blood_hammer" "wep_lightning_cannon" "wep_pop_gun" "wep_plasma_rifle" "wep_pop_rifle" "wep_toxic_launcher" "wep_flame_cannon" "wep_lightning_hammer" "wep_flame_shotgun" "wep_double_flame_shotgun" "wep_auto_flame_shotgun" "wep_cluster_launcher" "wep_grenade_shotgun" "wep_grenade_rifle" "wep_rogue_rifle" "wep_party_gun" "wep_double_minigun" "wep_gatling_bazooka" "wep_auto_grenade_shotgun" "wep_ultra_revolver" "wep_ultra_laser_pistol" "wep_sledgehammer" "wep_heavy_revolver" "wep_heavy_machinegun" "wep_heavy_slugger" "wep_ultra_shovel" "wep_ultra_shotgun" "wep_ultra_crossbow" "wep_ultra_grenade_launcher" "wep_plasma_minigun" "wep_devastator" "wep_golden_plasma_gun" "wep_golden_slugger" "wep_golden_splinter_gun" "wep_golden_screwdriver" "wep_golden_bazooka" "wep_golden_assault_rifle" "wep_super_disc_gun" "wep_heavy_auto_crossbow" "wep_heavy_assault_rifle" "wep_blood_cannon" "wep_dog_spin_attack" "wep_dog_missile" "wep_incinerator" "wep_super_plasma_cannon" "wep_seeker_pistol" "wep_seeker_shotgun" "wep_eraser" "wep_guitar" "wep_bouncer_smg" "wep_bouncer_shotgun" "wep_hyper_slugger" "wep_super_bazooka" "wep_frog_pistol" "wep_black_sword" "wep_golden_nuke_launcher" "wep_golden_disc_gun" "wep_heavy_grenade_launcher" "wep_gun_gun" "wep_eggplant" "wep_golden_frog_pistol")
SEED=$RANDOM
DOWNLOADS=()
MODS=()
FILES=()
DWL=""
cd D:/Documents/NTT-Weekly/WeeklyModDecider
IFS=$'\n'
for line in $(< $MOD1);do
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
	DWL+="file_download(string_trim("'"'"https://raw.githubusercontent.com/GoldenEpsilon/NTT-Modded-Recurrents/master/WeeklyMods/"$i'"'"), string_trim("'"'$i'"'"));"$'\n'
done
for i in ${DOWNLOADS[@]}
do
	DWL+="while (!file_loaded(string_trim("'"'$i'"'"))) {wait 1;}"$'\n'
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
trace("'"'"
Current Weekly:
Mods=$MOD1, $MOD2, $MOD3, $MOD4, $MOD5
Character=${CHARACTERS[$CHR]}
Crown=${CROWNS[$CRW]}
Weapon=${WEAPONS[$WEP]}
Seed=$SEED"'"'");
global.qualified = false;
global.alias = "'"'""'"'";
global.seed = $SEED;
global.start = true;
global.finished = false;
while(!mod_sideload()){wait 1;}
global.qualified = true;
global.alias = "'"'""'"'";
if(global.qualified == true){
	with(Player){
		instance_destroy();
		global.qualified = false;
		trace("'"'"DON'T MAKE ME TURN ANTI-CHEAT ON"'"'");
	}
	with(Revive){
		instance_destroy();
		global.qualified = false;
		trace("'"'"DON'T MAKE ME TURN ANTI-CHEAT ON"'"'");
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
	repeat(4){
		if(button_check(i, "'"'"talk"'"'")){
			global.qualified = false;
			trace("'"'"DON'T MAKE ME TURN ANTI-CHEAT ON"'"'");
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
with(CharSelect){race="'"'"${CHARACTERS[$CHR]}"'"'";}
if(!global.finished && !instance_exists(Player) && !instance_exists(Menu)){
	var score = "'"'""'"'";
	with(GameCont){
		score = global.alias + "'"'": Area "'"'" + string(area) + "'"'"-"'"'" + string(subarea) + "'"'" L"'"'" + string(loops) + "'"'" Kills: "'"'" + string(kills);
	}
	trace(score);
	global.finished = true;
	string_save(score, global.alias + "'"'" "'"'" + $DATE + "'"'" weekly.txt"'"'");
}
#define draw_pause
//Anti-Cheat
var i = 0;
if(global.qualified == true){
	repeat(4){
		if(button_check(i, "'"'"talk"'"'")){
			global.qualified = false;
			trace("'"'"DON'T MAKE ME TURN ANTI-CHEAT ON"'"'");
		}
		i++
	}
}
#define game_start
global.finished = false;
game_set_seed(global.seed);
global.start = true;
with(GameCont){
	crown = ${CROWNS[$CRW]};
}
" > Weekly.mod.gml
git add Weekly.mod.gml
git commit -am "Updated The Weekly"
git push
echo Press Enter...
read