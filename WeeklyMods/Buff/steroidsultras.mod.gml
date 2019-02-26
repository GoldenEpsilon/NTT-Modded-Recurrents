global.steroidultraa = 0
#define game_start
global.steroidultraa = 0
#define step
with instances_matching(EGSkillIcon, "name", "AMBIDEXTROUS"){
		
		name = "@wOVERCLOCKING@s";
		text = "@rFIRE FASTER@w THE MORE @yAMMO@w YOU HAVE#@rFIRE SLOWER@w THE LESS @yAMMO@w YOU HAVE@s"
	}
with instances_matching(EGSkillIcon, "name", "GET LOADED"){
		
		name = "@wGET LOADED@s";
		text = "@yAMMO CHESTS@s CONTAIN ALL @yAMMO TYPES#@sTRIPLE @rWEAPON CHESTS@s"
	}

with instances_matching(Player, "race", "steroids"){
	if(ultra_get(7,1)){
		ultra_set(7,1,0)
		global.steroidultraa = 1
		}
	if global.steroidultraa = 1{
		if reload > 1 and weapon_get_type(wep) > 0
			reload -= (((ammo[weapon_get_type(wep)]*2)/typ_amax[weapon_get_type(wep)])*2)-2
		if breload > 1 and weapon_get_type(bwep) > 0
			breload -= (((ammo[weapon_get_type(bwep)]*2)/typ_amax[weapon_get_type(bwep)])*2)-2
		}
	}
	if(ultra_get(7,2)){
		with WeaponChest if instance_exists(Wall){
			instance_create(x,y,BigWeaponChest)
			instance_change(Wind,0)
			instance_destroy()
			}
		}